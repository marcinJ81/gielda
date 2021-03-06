USE [StockExchange]
GO
/****** Object:  StoredProcedure [dbo].[pBuyStock]    Script Date: 2018-10-15 11:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- kupno akcji/ sprzedaz akcji
-- =============================================
ALTER PROCEDURE [dbo].[pBuyStock]
(
@stockName varchar(10),
 @user_id int ,
 @stockCountBuy int ,
 @mark_id int  
) 
AS
BEGIN
	--pomocnicze
declare @numberOfStock int
declare @stockPrice money
declare @stockCountMax int
--potrzebuje
declare @wall_id int
declare @stock_id int
declare @stockN_id int

--portfel
select @wall_id = wal_id from UserTable where usr_id = @user_id  
print 'portfel - ' + CAST(@wall_id as varchar(1))
--akcje danej firmy
select @stockN_id = stockN_id from StockName where stockN_Name = @stockName
select @stock_id = stock_id from Stock where  stockN_id = @stockN_id
print 'akcja nr - ' + CAST(@stock_id as varchar(1))
--akcje ktore sanarynku
select @stockPrice = mark_sharePriceSell from MarketSquare where stock_id = @stock_id and bs_id = 3
select @numberOfStock = sum(mark_numberOfShares) from MarketSquare where stock_id = @stock_id and bs_id = 3 or bs_id = 4
print 'ilosc akcji na rynku - ' + CAST(@numberOfStock as varchar(5))
if(@stockCountBuy <= @numberOfStock)
begin
	declare @sumStocksUser int
		--robie petle lub kursor 
       declare @id_markCursor int
	   declare @iloscAkcji int
	   declare @wynikodejmowania int
	   declare @statusTransakcji int
	   declare @priceOfStock money
	   declare @walletToPayForStock int
		Declare c1 Cursor For
             select mark_id,mark_numberOfShares,bs_id,mark_sharePriceSell,wal_id
             from MarketSquare 
             where  stock_id = @stock_id and mark_numberOfShares > 0 and bs_id = 3 or bs_id = 4
       Open c1; --> Otwarcie
       Fetch Next From c1 Into @id_markCursor,@iloscakcji,@statusTransakcji,@priceOfStock,@walletToPayForStock; -- Pobranie z wiersza cursora do zmiennej
       While @@FETCH_STATUS = 0 -- test końca kursora
       Begin	
	   --ilosc akcji sie zmniejsza a wartosc transakcji rosnie	
			if(@iloscAkcji <= @stockCountBuy)
			begin
				declare @result int
				set @result = @iloscAkcji - @stockCountBuy
				print 'result ' + Cast(@result as varchar) 
				if(@result <= 0)
				begin 
					update MarketSquare
						set
							mark_numberOfShares = 0 ,
							bs_id = 1,
							mark_TransactionPrice = @iloscAkcji *  @priceOfStock
						 where
							mark_id = @id_markCursor;
						set @stockCountBuy = @stockCountBuy - @iloscAkcji
						print 'pozostala ilosc akcji w zleceniu =>' + Cast(@stockCountBuy as varchar) 
						print 'kwota po sprzedaniu akcji =>' + Cast( (@iloscAkcji *  @priceOfStock) as varchar) 
					--przekazuje kase do portfela i koncze transakcje sprzedazy
					if(@statusTransakcji = 3)
					begin
						declare @walletUserSellMoneyLimit money
						declare @resultWalletUserSellMoneyLimit money
						select @walletUserSellMoneyLimit =  wal_MoneyLimit from Wallet where wal_id = @walletToPayForStock
						set @resultWalletUserSellMoneyLimit = @walletUserSellMoneyLimit + (@iloscAkcji *  @priceOfStock)
						update Wallet set
							wal_MoneyLimit = @resultWalletUserSellMoneyLimit
						where
							wal_id =  @walletToPayForStock
							print 'moeny limit in wallet heigh to => ' + CAST(@resultWalletUserSellMoneyLimit as varchar)	
					end
					else
					begin
						print 'emisja akcji, na razie bez zarabiania na nich czyli kasa w proznie'
					end
				end
			end
			else
			begin 
				if(@stockCountBuy > 0)
				begin
				--ilosc akcji nie zostala wyzerowana, jakies zostaly
				--zerujemy kase za akcje, teraz jest ich mniejsza ilosc
				-- nie zmieniamy statusu
				--czy tu nie bedzie jajkiegos bledu?????????
				declare @countStockPozostalychInTransaction int
				set @countStockPozostalychInTransaction = @iloscAkcji - @stockCountBuy
					update MarketSquare
					set
						mark_numberOfShares = @countStockPozostalychInTransaction,
						mark_TransactionPrice = 0,
						bs_id = @statusTransakcji
					 where
						mark_id = @id_markCursor;
					set @stockCountBuy = 0
					if(@statusTransakcji = 3)
					begin
						-- nie wszystkie zostaly sprzedane do portfela trafiaja srodki
						-- ze sprzedazy a to co zostalo dlaej jest na sprzedaz
						-- nie zmieniam statusu
						declare @walletUserSellMoneyLimitRestOfMoney money
						declare @resultWalletUserSellMoneyLimitRestOfMoney money
						
						select @walletUserSellMoneyLimitRestOfMoney =  wal_MoneyLimit		
						 from Wallet where wal_id = @walletToPayForStock
						set @resultWalletUserSellMoneyLimit = @walletUserSellMoneyLimit + (@iloscAkcji *  @priceOfStock)
						
						update Wallet set
							wal_MoneyLimit = @resultWalletUserSellMoneyLimit
						where
							wal_id =  @walletToPayForStock
							print 'money limit in wallet heigh to => ' + CAST(@resultWalletUserSellMoneyLimit as varchar)	
					end
					else
					begin
						print 'emisja akcji, na razie bez zarabiania na nich czyli kasa w proznie, a ilosc jeszcze nie wiem, testy wykaza.'
					end
				end
			end
			
             Fetch Next From c1 Into @id_markCursor,@iloscakcji,@statusTransakcji,@priceOfStock,@walletToPayForStock; --kolejne czytani
       End
       Close c1; -- zamknięcie ( do tej chwili kursor może być obracany )
       DeAllocate c1; -- zwolnienie cursora !!!

	   declare @ofertaKupna_id int
	   --update portfela kupujacego, dopisanie ceny transakcji kupna ilosc * cena
	   declare @countNumberStockInTransaction int
		declare @priceStocks money
		declare @TransactionPriceBuy money
		select @countNumberStockInTransaction = mark_numberOfShares, @priceStocks = mark_sharePriceBuy from MarketSquare where mark_id = @mark_id 
		set @TransactionPriceBuy = @countNumberStockInTransaction * @priceStocks
	   update MarketSquare 
	   set
			bs_id = 1,
			mark_dataEnd = GETDATE(),
			mark_TransactionPrice = @TransactionPriceBuy
		where
			mark_id = @mark_id
		
		--aktualizacjia ilosc akcji w portfelu
		declare @allStackCountPerUser int
		declare @allMoneyCountPerUser money
		select @allStackCountPerUser = wal_numberOfShares, @allMoneyCountPerUser = wal_MoneyLimit from Wallet where wal_id = @wall_id

		declare @roznicaresult money
		set @roznicaresult = @allMoneyCountPerUser - (@TransactionPriceBuy)
		declare @sumaStack int
		set @sumaStack = @allStackCountPerUser + @countNumberStockInTransaction

		update Wallet
		set
			wal_numberOfShares = @sumaStack,
			wal_MoneyLimit = @roznicaresult
		where
			wal_id = @wall_id

	
end
else
begin
	print 'niewystraczajac ilosc akcji na rynku user musi zmienic ilosc akcji do kupienia '
end
END

print 'niewystraczajac ilosc akcji na rynku user musi zmienic ilosc akcji do kupienia '
end
END

