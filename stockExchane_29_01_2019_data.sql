USE [StockExchange]
GO
SET IDENTITY_INSERT [dbo].[StockName] ON 

INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (1, 1, N'Future Processing')
INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (2, 1, N'FP Lab')
INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (3, 1, N'Progress Bar')
INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (4, 1, N'FP Coin')
INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (5, 1, N'FP Adventure')
INSERT [dbo].[StockName] ([stockN_id], [stockN_aktywny], [stockN_fullName]) VALUES (6, 1, N'Deadline 24')
SET IDENTITY_INSERT [dbo].[StockName] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (1, 1, 100, 0, 60, 1, 12.5600, CAST(N'2018-10-26 07:44:25.580' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (2, 2, 100, 0, 80, 1, 4.7800, CAST(N'2018-10-26 07:44:30.983' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (3, 3, 100, 0, 60, 1, 7.2100, CAST(N'2018-10-26 07:44:35.227' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (4, 4, 100, 0, 60, 1, 3.8900, CAST(N'2018-10-26 07:44:37.833' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (5, 5, 100, 0, 80, 1, 16.4500, CAST(N'2018-10-26 07:44:42.940' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Stock] ([stock_id], [stockN_id], [stock_maxCount], [stock_minCount], [stock_count], [stock_aktywny], [stock_pricie], [stock_date], [stock_priceOne], [stock_seria], [stock_priceBuy], [stock_pricaeSell]) VALUES (6, 6, 100, 0, 100, 1, 9.0100, CAST(N'2018-10-26 07:44:46.153' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Stock] OFF
SET IDENTITY_INSERT [dbo].[Price_Status] ON 

INSERT [dbo].[Price_Status] ([priceStatus_id], [priceStatus_description], [priceStatus_fulldescription]) VALUES (1, N'kCU', N'kupuj cena ustalona')
INSERT [dbo].[Price_Status] ([priceStatus_id], [priceStatus_description], [priceStatus_fulldescription]) VALUES (2, N'sCU', N'sprzedaj cena ustalona')
INSERT [dbo].[Price_Status] ([priceStatus_id], [priceStatus_description], [priceStatus_fulldescription]) VALUES (3, N'kPKC', N'kupuj po każdej cenie')
INSERT [dbo].[Price_Status] ([priceStatus_id], [priceStatus_description], [priceStatus_fulldescription]) VALUES (4, N'sPKC', N'sprzedaj po każdej cenie')
SET IDENTITY_INSERT [dbo].[Price_Status] OFF
