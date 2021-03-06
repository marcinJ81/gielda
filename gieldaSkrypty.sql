USE [Gielda]
GO
/****** Object:  StoredProcedure [dbo].[pIsssueOfShares]    Script Date: 2018-10-12 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE procedure [dbo].[pIsssueOfShares](
@id_stock int,
@setNumberStocks int
) as 
begin
declare @emission int
select  @emission = COUNT(stock_id) from MarketSquare where stock_id = @id_stock
if(@emission = 0)
	begin
		declare @getnumberOfStocks int
		declare @stocksPrice money
		select @getnumberOfStocks = stock_count from Stock where stock_id = @id_stock 
		if(@getnumberOfStocks >= @setNumberStocks)
		begin
			--pobranie danych o akcjach
			select @stocksPrice = stock_pricie from Stock where stock_id = @id_stock and stock_aktywny = 1
			--rozpoczecie emisji
			INSERT INTO [dbo].[MarketSquare]
				 ([stock_id],[wal_id],[mark_numberOfShares],[mark_aktywny]
				,[mark_sharePriceBuy],[bs_id],[mark_sharePriceSell])
			 VALUES
				 (@id_stock,null,@setNumberStocks,1,0,2,@stocksPrice)
			 
			Update Stock set
			stock_count = @getnumberOfStocks - @setNumberStocks,
			stock_date = GETDATE()
			where
				stock_id = @id_stock
		end
		else
		begin
			select @stocksPrice = stock_pricie from Stock where stock_id = @id_stock and stock_aktywny = 1
			--rozpoczecie emisji
			INSERT INTO [dbo].[MarketSquare]
				 ([stock_id],[wal_id],[mark_numberOfShares],[mark_aktywny]
				,[mark_sharePriceBuy],[bs_id],[mark_sharePriceSell])
			 VALUES
				 (@id_stock,null,@setNumberStocks,1,0,2,@stocksPrice)
			 
			Update Stock set
			stock_count = @getnumberOfStocks,
			stock_date = GETDATE()
			where
				stock_id = @id_stock
		end
		
	end
else
	begin
		declare
		@komunikat varchar(50) = 'brak pomyslow'
	end
end
GO
/****** Object:  Table [dbo].[BuyingSelling]    Script Date: 2018-10-12 13:53:34 ******/
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
/****** Object:  Table [dbo].[MarketSquare]    Script Date: 2018-10-12 13:53:34 ******/
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
 CONSTRAINT [PK_MarketSquare] PRIMARY KEY CLUSTERED 
(
	[mark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2018-10-12 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockName]    Script Date: 2018-10-12 13:53:34 ******/
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
 CONSTRAINT [PK_StockName] PRIMARY KEY CLUSTERED 
(
	[stockN_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2018-10-12 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_sname] [varchar](50) NULL,
	[uer_login] [varchar](50) NULL,
	[user_pass] [varchar](200) NULL,
	[user_date] [datetime] NULL,
	[user_aktywny] [bit] NULL,
	[wal_id] [int] NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 2018-10-12 13:53:34 ******/
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
