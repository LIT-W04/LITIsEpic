USE [LITIsEpic]
GO
/****** Object:  Table [dbo].[Visits]    Script Date: 6/21/2017 8:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[GetFiveMostFrequentIPs]    Script Date: 6/21/2017 8:55:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetFiveMostFrequentIPs]
as
begin
	SELECT TOP 5 IPAddress, COUNT(*) as Visits FROM Visits
GROUP BY IPAddress
ORDER BY COUNT(*) DESC
end
GO
