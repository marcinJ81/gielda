USE [StockExchange]
GO
/****** Object:  Table [dbo].[BuyingSelling]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BuyingSelling](
	[bs_id] [int] IDENTITY(1,1) NOT NULL,
	[bs_action] [varchar](20) NULL,
 CONSTRAINT [PK_BuyingSelling] PRIMARY KEY CLUSTERED 
(
	[bs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MarketSquare]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketSquare](
	[mark_id] [int] IDENTITY(1,1) NOT NULL,
	[stock_id] [int] NULL,
	[wal_id] [int] NULL,
	[mark_numberOfShares] [int] NULL,
	[mark_aktywny] [bit] NULL,
	[mark_sharePriceBuy] [money] NULL,
	[bs_id] [int] NULL,
	[mark_sharePriceSell] [money] NULL,
	[mark_dataStart] [datetime] NULL,
	[mark_dataEnd] [datetime] NULL,
	[mark_TransactionPrice] [money] NULL,
 CONSTRAINT [PK_MarketSquare] PRIMARY KEY CLUSTERED 
(
	[mark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[stockN_id] [int] NULL,
	[stock_maxCount] [int] NULL,
	[stock_minCount] [int] NULL,
	[stock_count] [int] NULL,
	[stock_aktywny] [bit] NULL,
	[stock_pricie] [money] NULL,
	[stock_date] [datetime] NULL,
	[stock_priceOne] [money] NULL,
	[stock_seria] [varchar](50) NULL,
	[stock_priceBuy] [money] NULL,
	[stock_pricaeSell] [money] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockName]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockName](
	[stockN_id] [int] IDENTITY(1,1) NOT NULL,
	[stockN_name] [varchar](10) NULL,
	[stockN_aktywny] [bit] NULL,
	[stockN_fullName] [varchar](50) NULL,
 CONSTRAINT [PK_StockName] PRIMARY KEY CLUSTERED 
(
	[stockN_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[usr_id] [int] IDENTITY(1,1) NOT NULL,
	[usr_name] [varchar](50) NULL,
	[usr_sname] [varchar](50) NULL,
	[usr_login] [varchar](50) NULL,
	[usr_pass] [varchar](200) NULL,
	[usr_date] [datetime] NULL,
	[usr_aktywny] [bit] NULL,
	[wal_id] [int] NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[wal_id] [int] NOT NULL,
	[wal_aktywny] [bit] NULL,
	[wal_numberOfShares] [int] NULL,
	[wal_MoneyLimit] [money] NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[wal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MarketSquare]  WITH CHECK ADD  CONSTRAINT [FK_BuyingSelling] FOREIGN KEY([bs_id])
REFERENCES [dbo].[BuyingSelling] ([bs_id])
GO
ALTER TABLE [dbo].[MarketSquare] CHECK CONSTRAINT [FK_BuyingSelling]
GO
ALTER TABLE [dbo].[MarketSquare]  WITH CHECK ADD  CONSTRAINT [FK_Stock] FOREIGN KEY([stock_id])
REFERENCES [dbo].[Stock] ([stock_id])
GO
ALTER TABLE [dbo].[MarketSquare] CHECK CONSTRAINT [FK_Stock]
GO
ALTER TABLE [dbo].[MarketSquare]  WITH CHECK ADD  CONSTRAINT [FK_Wallet] FOREIGN KEY([wal_id])
REFERENCES [dbo].[Wallet] ([wal_id])
GO
ALTER TABLE [dbo].[MarketSquare] CHECK CONSTRAINT [FK_Wallet]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_StockName] FOREIGN KEY([stockN_id])
REFERENCES [dbo].[StockName] ([stockN_id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_StockName]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_User_Wallet] FOREIGN KEY([wal_id])
REFERENCES [dbo].[Wallet] ([wal_id])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_User_Wallet]
GO
/****** Object:  StoredProcedure [dbo].[pBuyStock]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- kupno akcji/ sprzedaz akcji
-- =============================================
CREATE PROCEDURE [dbo].[pBuyStock]
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


GO
/****** Object:  StoredProcedure [dbo].[pCreateBuyTransaction]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- buy transaction
-- zakladam ze moge wystawic zlecenie na dowolna ilosc akcji
-- granica jest ilosc kasy w portfelu
-- =============================================
CREATE PROCEDURE [dbo].[pCreateBuyTransaction]( 
@user_id  int,
@numberBuyStock int,
@stock_name varchar(10)
)
AS
BEGIN
--pomocnicze
declare @wallet_id int
declare @stock_id int
declare @stockN_id int
declare @stockPrice money
declare @walletMoneyLimit money
--wyszukanie portfela oraz akcji
select @wallet_id = wal_id from UserTable where usr_id =@user_id 
select @walletMoneyLimit = wal_MoneyLimit from Wallet where wal_id = @wallet_id
select @stockN_id = stockN_id from StockName where stockN_name = @stock_name
select @stock_id = stock_id, @stockPrice = stock_pricie from Stock where stockN_id = @stockN_id
-- sprawdzenie portfela
declare @result money
declare @PriceTransaction money
set @result = @numberBuyStock * @stockPrice
if(@result <= @walletMoneyLimit)
begin
--transakcja na rynek
	INSERT INTO [dbo].[MarketSquare]
           ([stock_id],[wal_id],[mark_numberOfShares]
           ,[mark_aktywny],[mark_sharePriceBuy]
           ,[bs_id],[mark_sharePriceSell]
           ,[mark_dataStart],[mark_TransactionPrice])
     VALUES
           (@stock_id,@wallet_id,@numberBuyStock,1,@stockPrice,2,0,GETDATE(),@result)
--sciagniecie kasy z portfela i dopisanie do transakcji
	set @PriceTransaction = @walletMoneyLimit - @result
	update Wallet set
		wal_MoneyLimit = @PriceTransaction
	where
		wal_id = @wallet_id

end
else
begin
	print 'zamałe srodki na zakup akcji, zmniejsz liczbe akcji'
end

END


GO
/****** Object:  StoredProcedure [dbo].[pCreateSellTransaction]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- sell transaction - uproszczona
-- =============================================
CREATE PROCEDURE [dbo].[pCreateSellTransaction]( 
@user_id  int,
@numberSellStock int,
@stock_name varchar(10)
)
AS
BEGIN
--pomocnicze
declare @wallet_id int
declare @stock_id int
declare @stockN_id int
declare @stockPrice money
--wyszukanie portfela oraz akcji
select @wallet_id = wal_id from UserTable where usr_id =@user_id 
select @stockN_id = stockN_id from StockName where stockN_name = @stock_name
select @stock_id = stock_id, @stockPrice = stock_pricie from Stock where stockN_id = @stockN_id
--wyuszukanie akcji uzytkownika, stan 'brak akcji' oraz ze zostaly zakupione mark_transaction = 0
declare @countStockInWallet int
declare @countStockInmarket int
select @countStockInmarket = sum(mark_numberOfShares) from MarketSquare where stock_id = @stock_id and wal_id = @wallet_id and bs_id = 1 and mark_TransactionPrice = 0
select @countStockInWallet = wal_numberOfShares from Wallet where wal_id = @wallet_id
if(@numberSellStock <= @countStockInmarket)
begin
	--transakcja na rynek
	INSERT INTO [dbo].[MarketSquare]
           ([stock_id],[wal_id],[mark_numberOfShares]
           ,[mark_aktywny],[mark_sharePriceBuy]
           ,[bs_id],[mark_sharePriceSell]
           ,[mark_dataStart],[mark_TransactionPrice])
     VALUES
           (@stock_id,@wallet_id,@numberSellStock,1,0,3,@stockPrice,GETDATE(),0)
	--update portfela zmniejszenie ilosc akcji
	declare @resultStock int
	set @resultStock = @countStockInWallet - @numberSellStock
	print 'ilosc akcji po wystawienu na sprzedaz => ' + CAST(@resultStock as varchar) 
	update Wallet set
		wal_numberOfShares = @resultStock
	where	
		wal_id = @wallet_id
end
else
begin
	print 'za mało akcjki w portfelu, zmniejsz liczbe'
end
END


GO
/****** Object:  StoredProcedure [dbo].[pStockEmission]    Script Date: 2018-10-15 13:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
--setStockPrice = 0 cenabrana z tabeli stock
CREATE procedure [dbo].[pStockEmission](
@id_stock int,
@setNumberStocks int,
@setStockPrice money
) as 
--begin Transaction
begin 
declare @getnumberOfStocks int
declare @stocksPrice money
declare @maxStockCount int
declare @TransactionPrice money
if(@setStockPrice > 0)
begin
	set @stocksPrice = @setStockPrice
 end
 else
 begin
	select @stocksPrice = stock_pricie from Stock where stock_id = @id_stock and stock_aktywny = 1
 end
		
		--ilosc akcji w rynku
		select @getnumberOfStocks = stock_count,@maxStockCount = stock_maxCount  from Stock where stock_id = @id_stock 
		if((@getnumberOfStocks + @setNumberStocks) <= @maxStockCount)
		begin	
			--kwota transakcji
			set @TransactionPrice = @setNumberStocks * @stocksPrice	
			--rozpoczecie emisji
			print 'insert'
			INSERT INTO [dbo].[MarketSquare]
				 ([stock_id],[wal_id],[mark_numberOfShares],[mark_aktywny]
				,[mark_sharePriceBuy],[bs_id],[mark_sharePriceSell],[mark_dataStart],[mark_dataEnd],[mark_TransactionPrice])
			 VALUES
				 (@id_stock,null,@setNumberStocks,1,0,4,@stocksPrice,GETDATE(),null,@TransactionPrice)
			 
			Update Stock set
			stock_count = @getnumberOfStocks + @setNumberStocks,
			stock_date = GETDATE()
			where
				stock_id = @id_stock
			print @getnumberOfStocks + @setNumberStocks
		end
		else
		begin
			print 'ilosc akcji do emisji za duża'
		end		
end


GO
O
