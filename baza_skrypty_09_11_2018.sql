USE [StockExchange]
GO
/****** Object:  UserDefinedFunction [dbo].[fDateDiff]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[fDateDiff]
(
   @interval int,
   @dateEnd datetime
)
RETURNS int
AS
 BEGIN
  DECLARE @result int
  if(@interval = 1)
  begin
      SELECT @result = DATEDIFF(minute, GetDAte(),@dateEnd)
   end
  if(@interval = 2)
  begin
     SELECT @result = DATEDIFF(HOUR, GetDAte(),@dateEnd)
  end
  if(@interval = 3)
  begin
    SELECT @result = DATEDIFF(DAY, GetDAte(),@dateEnd)
  end
RETURN @result
END
GO
/****** Object:  Table [dbo].[BuyingSelling]    Script Date: 2018-11-09 11:41:09 ******/
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
/****** Object:  Table [dbo].[log_transactions]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_transactions](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log_transaction] [varchar](20) NULL,
	[log_user] [varchar](50) NULL,
	[log_data] [datetime] NULL,
	[log_description] [varchar](100) NULL,
 CONSTRAINT [PK_log_transactions] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MarketSquare]    Script Date: 2018-11-09 11:41:09 ******/
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
	[priceStatus_id] [int] NULL,
 CONSTRAINT [PK_MarketSquare] PRIMARY KEY CLUSTERED 
(
	[mark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_Status]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Price_Status](
	[priceStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[priceStatus_description] [varchar](4) NULL,
	[priceStatus_fulldescription] [varchar](50) NULL,
 CONSTRAINT [PK_Price_Status] PRIMARY KEY CLUSTERED 
(
	[priceStatus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2018-11-09 11:41:09 ******/
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
/****** Object:  Table [dbo].[StockName]    Script Date: 2018-11-09 11:41:09 ******/
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
/****** Object:  Table [dbo].[UserTable]    Script Date: 2018-11-09 11:41:09 ******/
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
/****** Object:  Table [dbo].[Wallet]    Script Date: 2018-11-09 11:41:09 ******/
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
/****** Object:  View [dbo].[vMarketSquareWithoutWallet]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vMarketSquareWithoutWallet] as

select distinct 
		MS.mark_numberOfShares, MS.mark_sharePriceBuy,MS.mark_sharePriceSell,MS.mark_TransactionPrice,
		BS.bs_action
		 from MarketSquare MS
inner join Stock S on S.stock_id = MS.stock_id
inner join StockName SN on SN.stockN_id = S.stockN_id
inner join BuyingSelling BS on BS.bs_id = MS.bs_id




GO
/****** Object:  View [dbo].[vMarketSuare]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vMarketSuare] as

select distinct UT.usr_login,SN.stockN_name,
		MS.mark_numberOfShares, MS.mark_sharePriceBuy,MS.mark_sharePriceSell,MS.mark_TransactionPrice,
		BS.bs_action
		 from MarketSquare MS
inner join Stock S on S.stock_id = MS.stock_id
inner join StockName SN on SN.stockN_id = S.stockN_id
inner join Wallet W on W.wal_id = MS.wal_id
inner join UserTable UT on UT.wal_id = W.wal_id
inner join BuyingSelling BS on BS.bs_id = MS.bs_id


GO
/****** Object:  View [dbo].[vUserWallet]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vUserWallet] as

select UT.usr_login,
		W.wal_numberOfShares, w.wal_MoneyLimit
		 from MarketSquare MS
inner join Wallet W on W.wal_id = MS.wal_id
inner join UserTable UT on UT.wal_id = W.wal_id



GO
ALTER TABLE [dbo].[MarketSquare]  WITH CHECK ADD  CONSTRAINT [FK_BuyingSelling] FOREIGN KEY([bs_id])
REFERENCES [dbo].[BuyingSelling] ([bs_id])
GO
ALTER TABLE [dbo].[MarketSquare] CHECK CONSTRAINT [FK_BuyingSelling]
GO
ALTER TABLE [dbo].[MarketSquare]  WITH CHECK ADD  CONSTRAINT [FK_Price_Status] FOREIGN KEY([priceStatus_id])
REFERENCES [dbo].[Price_Status] ([priceStatus_id])
GO
ALTER TABLE [dbo].[MarketSquare] CHECK CONSTRAINT [FK_Price_Status]
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
/****** Object:  StoredProcedure [dbo].[pAddInfoToLog]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- add info from transaction to log
-- =============================================
CREATE Procedure [dbo].[pAddInfoToLog] 
(
	@bsAction varchar(20),
	@userLogin varchar(50),
	@description varchar(100) 
)
AS
BEGIN
	INSERT INTO [dbo].[log_transactions]
           ([log_transaction]
           ,[log_user]
           ,[log_data]
           ,[log_description])
     VALUES
           (@bsAction,@userLogin,GETDATE(),@description)
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[pBuySell_kCU]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 -- realizacja transakcji kupna w statusie kCU i sprzedazy sCU
CREATE PROCEDURE [dbo].[pBuySell_kCU](
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
declare @stockCountBuy int 
declare @transactionBuyPriceStock money
declare @transactionPricesStatus int
--zlecenie kupna
--zlecenia których termin wazonosci przeadły przestają byc aktywne
select 
		@wall_id = wal_id, @stock_id=stock_id , @stockCountBuy = mark_numberOfShares, 
		@transactionBuyPriceStock = mark_sharePriceBuy, @transactionPricesStatus = priceStatus_id    
from MarketSquare 
where
	 mark_id = @mark_id and DATEDIFF(hour,GETDATE(),mark_dataEnd) >= 0 and mark_aktywny = 1 and bs_id = 2


--akcje ktore sa na rynku, w tym ilosciowo
--cena akcji
--warunek kCU - kupuj cena ustalona, jezeli cena zakupu = cena sprzedazy
if(@transactionPricesStatus = 1)
begin
	--wyszukanie ofert sprzedazy gdzie stock_id = @stock_id, ilosc_akcji > 0, cena_akcji_jest = @transactionPriceStatus oraz zlecenie aktywne jest
	--tutaj kolejny cursor, niekoniecznie bo zapytanie te mozna podpiac pod juz istniejacy
	-- powyzsze zapytanie wrzucic do tymczasowj tabeli w ten sposob przygotuje sobie dane do kursora bez koniecznosci powtarzania zapytan
	-- jest tu uwaga nie tylko cena akcji w zakupu i sprzedazy musi byc rowna ale rowniez cena rynkowa akcji musi byc rowna,
	-- dlaczego bo moze zdarzy
	print 'to w kursorze bedzie'
end
--kupuj po kazdej cenie (kPKC)
if(@transactionPricesStatus = 3)
begin
	--analogicznie jak powyzej tylko szukam zlecen sprzedazy po kazdej cenie
	--sprawdze czy (upewnie sie) cena jest rowna zero 
	if(@transactionBuyPriceStock > 0)
	begin
		print 'blad nie wlasciwie utworzone zlecenie kPKC'
	end
	else
	begin
		print 'zlecenia sPKC'
		-- wyszukanie zlecen sprzedazy wrzucenie do tabeli z tym wyjatkiem
		-- ze cene akcji z zleceni sPKC biore z tabeli stock za kazym razem jak 
		-- moglbym zrobic dwie tabele zlecenia z cena ustalona bo ona sie nie zmienia
		-- wiec ptzy dokonaniu transakcji bede bral cene z rekodru zlecenia
		-- druga tabela zlecenia z cena zerowa czyli sPKC, wtedy biore cene z tabeli stock
		-- opcja druga to jedna tabela i po napotkaniu sPKC sciagniecie ceny z stock
		-- w przeciwnym razie cena z zlecenia
		-- w czasie wykonywania proceury transakcji, nie mozna wprowadzac zlecen kupna/sprzedazy
		-- dzieki temu zabezpiecze sie przed poajwianiem sie nowych zlecen kupna i bezproblemu moge wrzucic je
		-- do tabeli tymczasowej
		-- po wykonaniu kazdej transakcji cena akcji w tabeli stock zmienia się

	end
end
--select @stockPrice = mark_sharePriceSell from MarketSquare where stock_id = @stock_id and bs_id = 3
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
	   declare @stockId_buy_kCU money
		Declare c1 Cursor For
           
			select MS.mark_id,MS.mark_numberOfShares,MS.bs_id,MS.mark_sharePriceSell,MS.wal_id,MS.stock_id
			from MarketSquare MS
			where  stock_id = @stock_id and mark_numberOfShares > 0 and mark_sharePriceSell = @transactionBuyPriceStock and bs_id = 3 or bs_id = 4

       Open c1; --> Otwarcie
       Fetch Next From c1 Into @id_markCursor,@iloscakcji,@statusTransakcji,@priceOfStock,@walletToPayForStock,@stockId_buy_kCU; -- Pobranie z wiersza cursora do zmiennej
       While @@FETCH_STATUS = 0 -- test końca kursora
       Begin	
	   --sprwdzenie czy cena akcji w zleceniu kupna jest rowna cenie akcji w zleceniu sprzedazy
	   if(@priceOfStock = @transactionBuyPriceStock)
		   begin
		   --ilosc akcji sie zmniejsza a wartosc transakcji rosnie	
			if(@stockCountBuy <= @numberOfStock)																																																																													if(@iloscAkcji <= @stockCountBuy)
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
					--update ceny  sprzedazy w tabeli stock
					update Stock
						set
							stock_pricaeSell = @priceOfStock
						where
							stock_id = @stockId_buy_kCU
						 
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
							print 'money limit in wallet heigh to => ' + CAST(@resultWalletUserSellMoneyLimit as varchar)	
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
				declare @countStockPozostalychInTransaction int

				set @countStockPozostalychInTransaction = @iloscAkcji - @stockCountBuy
					update MarketSquare
					set
						mark_numberOfShares = @countStockPozostalychInTransaction,
						mark_TransactionPrice = 0,
						bs_id = @statusTransakcji
					 where
						mark_id = @id_markCursor;
					
					--update ceny  sprzedazy w tabeli stock
					update Stock
						set
							stock_pricaeSell = @priceOfStock
						where
							stock_id = @stockId_buy_kCU
					if(@statusTransakcji = 3)
					begin
						-- nie wszystkie zostaly sprzedane do portfela trafiaja srodki
						-- ze sprzedazy a to co zostalo dlaej jest na sprzedaz
						-- nie zmieniam statusu
						declare @walletUserSellMoneyLimitRestOfMoney money
						declare @resultWalletUserSellMoneyLimitRestOfMoney money
						
						select @walletUserSellMoneyLimitRestOfMoney =  wal_MoneyLimit		
						 from Wallet where wal_id = @walletToPayForStock
						set @resultWalletUserSellMoneyLimit = @walletUserSellMoneyLimitRestOfMoney + (@stockCountBuy *  @priceOfStock)
						
						update Wallet set
							wal_MoneyLimit = @resultWalletUserSellMoneyLimit
						where
							wal_id =  @walletToPayForStock
							print 'money limit in wallet heigh to => ' + CAST(@resultWalletUserSellMoneyLimit as varchar)	
					end
					else
					begin
						print 'emisja akcji, na razie bez zarabiania na nich czyli kasa w proznie.'
					end
				end
			end
			
				 Fetch Next From c1 Into @id_markCursor,@iloscakcji,@statusTransakcji,@priceOfStock,@walletToPayForStock; --kolejne czytani
			end
			else
			begin
				print 'cena kupna rozna od ceny sprzedazy'
			end
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
/****** Object:  StoredProcedure [dbo].[pBuyStock]    Script Date: 2018-11-09 11:41:09 ******/
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
--akcje ktore sa narynku
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
				declare @countStockPozostalychInTransaction int

				set @countStockPozostalychInTransaction = @iloscAkcji - @stockCountBuy
					update MarketSquare
					set
						mark_numberOfShares = @countStockPozostalychInTransaction,
						mark_TransactionPrice = 0,
						bs_id = @statusTransakcji
					 where
						mark_id = @id_markCursor;
					
					if(@statusTransakcji = 3)
					begin
						-- nie wszystkie zostaly sprzedane do portfela trafiaja srodki
						-- ze sprzedazy a to co zostalo dlaej jest na sprzedaz
						-- nie zmieniam statusu
						declare @walletUserSellMoneyLimitRestOfMoney money
						declare @resultWalletUserSellMoneyLimitRestOfMoney money
						
						select @walletUserSellMoneyLimitRestOfMoney =  wal_MoneyLimit		
						 from Wallet where wal_id = @walletToPayForStock
						set @resultWalletUserSellMoneyLimit = @walletUserSellMoneyLimitRestOfMoney + (@stockCountBuy *  @priceOfStock)
						
						update Wallet set
							wal_MoneyLimit = @resultWalletUserSellMoneyLimit
						where
							wal_id =  @walletToPayForStock
							print 'money limit in wallet heigh to => ' + CAST(@resultWalletUserSellMoneyLimit as varchar)	
					end
					else
					begin
						print 'emisja akcji, na razie bez zarabiania na nich czyli kasa w proznie.'
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
/****** Object:  StoredProcedure [dbo].[pCreateBuyTransaction]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- buy transaction
-- zakladam ze moge wystawic zlecenie na dowolna ilosc akcji
-- granica jest ilosc kasy w portfelu,
-- jezeli kupno PKC cena akcji = 0 
-- jezeli kupno CU cena akcji z parametru 
-- podanie daty waznosci zlecenia
-- =============================================
CREATE PROCEDURE [dbo].[pCreateBuyTransaction]( 
@user_id  int,
@numberBuyStock int,
@stock_name varchar(10),
@priceStatusId int,
@stockPrice money,
@dataEnd datetime
)
AS
BEGIN
--pomocnicze
declare @wallet_id int
declare @stock_id int
declare @stockN_id int
declare @walletMoneyLimit money
declare @userLogin varchar(50)
--wyszukanie portfela oraz akcji
select @wallet_id = wal_id from UserTable where usr_id =@user_id 
select @walletMoneyLimit = wal_MoneyLimit from Wallet where wal_id = @wallet_id
select @stockN_id = stockN_id from StockName where stockN_name = @stock_name
select @stock_id = stock_id from Stock where stockN_id = @stockN_id

	if (@priceStatusId = 1)
	begin
	-- sprawdzenie portfela
	declare @result money
	declare @PriceTransaction money
	set @result = @numberBuyStock * @stockPrice
	--transakcja na rynek
			if(@result <= @walletMoneyLimit)
			begin
				INSERT INTO [dbo].[MarketSquare]
					   ([stock_id],[wal_id],[mark_numberOfShares]
					   ,[mark_aktywny],[mark_sharePriceBuy]
					   ,[bs_id],[mark_sharePriceSell]
					   ,[mark_dataStart],[mark_dataEnd],[mark_TransactionPrice],[priceStatus_id])
				 VALUES
					   (@stock_id,@wallet_id,@numberBuyStock,1,@stockPrice,2,0,GETDATE(),@dataEnd,@result,@priceStatusId)
			--get money from wallet and set to transaction
				set @PriceTransaction = @walletMoneyLimit - @result
				update Wallet set
					wal_MoneyLimit = @PriceTransaction
				where
					wal_id = @wallet_id
			end
			else
			begin
				select @userLogin = usr_login from UserTable where usr_id = @user_id
				exec pAddInfoToLog 2,@userLogin,'zamałe srodki na zakup akcji, zmniejsz liczbe akcji, kCU'
			end
	end
	if(@priceStatusId = 3)
	begin
	declare @stockPriceFromStockTable money
	declare @priceInThisTime money
		--priceStatus = kPKC stockPrice = 0, get price of stock from Stock Table
		select @stockPriceFromStockTable = stock_priceBuy from Stock where stock_id = @stock_id
		set @priceInThisTime = @stockPriceFromStockTable * @numberBuyStock
			if(@result <= @walletMoneyLimit)
			begin
				INSERT INTO [dbo].[MarketSquare]
					   ([stock_id],[wal_id],[mark_numberOfShares]
					   ,[mark_aktywny],[mark_sharePriceBuy]
					   ,[bs_id],[mark_sharePriceSell]
					   ,[mark_dataStart],[mark_dataEnd],[mark_TransactionPrice],[priceStatus_id])
				 VALUES
					   (@stock_id,@wallet_id,@numberBuyStock,1,0e,2,0,GETDATE(),@dataEnd,@priceInThisTime,@priceStatusId)
			--get money from wallet and set to transaction
				set @PriceTransaction = @walletMoneyLimit - @result
				update Wallet set
					wal_MoneyLimit = @PriceTransaction
				where
					wal_id = @wallet_id
			end
			else
			begin
				select @userLogin = usr_login from UserTable where usr_id = @user_id
				exec pAddInfoToLog 2,@userLogin,'zamałe srodki na zakup akcji, zmniejsz liczbe akcji, kPKC'
			end
	end
end









GO
/****** Object:  StoredProcedure [dbo].[pCreateSellTransaction]    Script Date: 2018-11-09 11:41:09 ******/
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
@stock_name varchar(10),
@stockPrice money,
@dataEnd datetime
)
AS
BEGIN
--pomocnicze
declare @wallet_id int
declare @stock_id int
declare @stockN_id int
declare @userLogin varchar(50)
--wyszukanie portfela oraz akcji
select @wallet_id = wal_id from UserTable where usr_id =@user_id 
select @stockN_id = stockN_id from StockName where stockN_name = @stock_name
select @stock_id = stock_id from Stock where stockN_id = @stockN_id
--wyuszukanie akcji uzytkownika, stan 'brak akcji' oraz ze zostaly zakupione mark_transaction = 0
declare @countStockInWallet int
declare @countStockInmarket int
select @countStockInmarket = sum(mark_numberOfShares) from MarketSquare where stock_id = @stock_id and wal_id = @wallet_id and bs_id = 1 
select @countStockInWallet = wal_numberOfShares from Wallet where wal_id = @wallet_id
if(@numberSellStock <= @countStockInmarket)
begin
	--transakcja na rynek
	INSERT INTO [dbo].[MarketSquare]
           ([stock_id],[wal_id],[mark_numberOfShares]
           ,[mark_aktywny],[mark_sharePriceBuy]
           ,[bs_id],[mark_sharePriceSell]
           ,[mark_dataStart],[mark_dataEnd],[priceStatus_id],[mark_TransactionPrice])
     VALUES
           (@stock_id,@wallet_id,@numberSellStock,1,0,3,@stockPrice,GETDATE(),@dataEnd,@stockPrice,0)
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
	
	select @userLogin = usr_login from UserTable where usr_id = @user_id
	exec pAddInfoToLog 2,@userLogin,'zamałe srodki na zakup akcji, zmniejsz liczbe akcji'
end
END





GO
/****** Object:  StoredProcedure [dbo].[pOrderOverdue]    Script Date: 2018-11-09 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pOrderOverdue](
   @mark_id int,
   @interval int
)
AS
BEGIN
declare @dateEnd Datetime
declare @result int
declare @walId int
declare @info varchar(50)
--wallet state before order deactivate
declare @wallCountStocks int
declare @wallCountAllMoney decimal

--market square value
declare @marketSquareCountStocks int
declare @marketSquareCountMoney decimal
declare @marketSqureOrderStatusId int
--
declare @userLogin varchar(50) = 'baza-pOrderOverdue'
select @dateEnd = mark_dataEnd, @walId = wal_id,@marketSqureOrderStatusId = bs_id  from MarketSquare
where
mark_id = @mark_id
-- wazna uwaga zlecenia kupna roznia sie od zlecen sprzedazy
-- kupno daje pieniadze nie trace ilosci
-- sprzedaz trace ilosc pieniadze bez zmian

select @result = dbo.fDateDiff(1,@dateEnd)
	if(@result < 0)
	begin
		declare @userLoginWallet varchar(50)
		--get login from user table
		select @userLoginWallet = usr_login  from UserTable where wal_id = @walId

		update MarketSquare set
		mark_aktywny = 0
		where
		mark_id = @mark_id
		--get old value from wallet
		select @wallCountStocks = wal_numberOfShares, @wallCountAllMoney = wal_MoneyLimit from Wallet
		where
			wal_id = @walId
		--overdue transaction in status = 2
		--buy
		if(@marketSqureOrderStatusId = 2)
		begin
			declare @resultMoneyFromStock money 
			--get value from market square
			select @marketSquareCountMoney = mark_TransactionPrice from MarketSquare where mark_id = @mark_id
			set @resultMoneyFromStock = @marketSquareCountMoney + @wallCountAllMoney

			update Wallet set
				wal_MoneyLimit = @resultMoneyFromStock
			where
				wal_id = @walId

			set @info = 'kupno, zwrot pieniedzy = ' + CAST(@marketSquareCountMoney as varchar(10))
			exec pAddInfoToLog 2,@userLoginWallet, @info
		end
		--sell
		if(@marketSqureOrderStatusId = 3)
		begin
			declare @resultCountStock int
			--get how many stock i sell transaction in market square
			select @marketSquareCountStocks = mark_numberOfShares from MarketSquare where mark_id = @mark_id
			set @resultCountStock = @marketSquareCountStocks + @wallCountStocks	
			
			update Wallet set
				wal_numberOfShares = @resultCountStock
			where
				wal_id = @walId

			set @info = 'sprzedaz, zwrot akcji = ' + CAST(@marketSquareCountMoney as varchar(10))
			exec pAddInfoToLog 2,@userLoginWallet, @info
		end
		--emission
		if(@marketSqureOrderStatusId = 4)
		begin
				
				exec pAddInfoToLog 2,@userLogin,'emisja akcji'
		end
		--return
		if(@marketSqureOrderStatusId = 5)
		begin
				
				exec pAddInfoToLog 2,@userLogin,'skup akcji'
		end
  end
END
GO
/****** Object:  StoredProcedure [dbo].[pStockEmission]    Script Date: 2018-11-09 11:41:09 ******/
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
