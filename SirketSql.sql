USE [master]
GO
/****** Object:  Database [Sirket]    Script Date: 6.03.2022 22:50:31 ******/
CREATE DATABASE [Sirket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sirket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sirket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sirket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sirket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sirket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sirket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sirket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sirket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sirket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sirket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sirket] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sirket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sirket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sirket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sirket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sirket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sirket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sirket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sirket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sirket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sirket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sirket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sirket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sirket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sirket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sirket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sirket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sirket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sirket] SET RECOVERY FULL 
GO
ALTER DATABASE [Sirket] SET  MULTI_USER 
GO
ALTER DATABASE [Sirket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sirket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sirket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sirket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sirket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sirket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sirket', N'ON'
GO
ALTER DATABASE [Sirket] SET QUERY_STORE = OFF
GO
USE [Sirket]
GO
/****** Object:  Table [dbo].[Elemanlar]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elemanlar](
	[ElemanNo] [int] IDENTITY(1,1) NOT NULL,
	[ElemanAdi] [varchar](50) NULL,
	[ElemanPozisyon] [varchar](50) NULL,
	[ElemanMaas] [money] NULL,
	[ElemanStatu] [varchar](50) NULL,
	[GorevNo] [int] NULL,
 CONSTRAINT [PK_Elemanlar] PRIMARY KEY CLUSTERED 
(
	[ElemanNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gorevler]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gorevler](
	[GorevNo] [int] IDENTITY(1,1) NOT NULL,
	[GorevAdi] [varchar](50) NULL,
	[GorevTanimi] [varchar](50) NULL,
	[GorevFiyat] [money] NULL,
	[GorevSuresi] [int] NULL,
	[GorevDurumu] [varchar](50) NULL,
 CONSTRAINT [PK_Gorevler] PRIMARY KEY CLUSTERED 
(
	[GorevNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Elemanlar] ON 

INSERT [dbo].[Elemanlar] ([ElemanNo], [ElemanAdi], [ElemanPozisyon], [ElemanMaas], [ElemanStatu], [GorevNo]) VALUES (1, N'Hakan', N'Öğrenci', 1500.0000, N'İşsiz', 1)
INSERT [dbo].[Elemanlar] ([ElemanNo], [ElemanAdi], [ElemanPozisyon], [ElemanMaas], [ElemanStatu], [GorevNo]) VALUES (2, N'Tülay', N'Öğrenci', 1500.0000, N'İşi var', 1)
SET IDENTITY_INSERT [dbo].[Elemanlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Gorevler] ON 

INSERT [dbo].[Gorevler] ([GorevNo], [GorevAdi], [GorevTanimi], [GorevFiyat], [GorevSuresi], [GorevDurumu]) VALUES (1, N'Kitap Okuma', N'Tarih Araştırması', 200.0000, 12, N'Her Gün')
INSERT [dbo].[Gorevler] ([GorevNo], [GorevAdi], [GorevTanimi], [GorevFiyat], [GorevSuresi], [GorevDurumu]) VALUES (3, N'Gazete Okuma', N'Güldürü', 50.0000, 1, N'Karışık')
INSERT [dbo].[Gorevler] ([GorevNo], [GorevAdi], [GorevTanimi], [GorevFiyat], [GorevSuresi], [GorevDurumu]) VALUES (4, N'Dergi Okuma', N'Edebiyat', 25.0000, 3, N'Sarmaşık')
INSERT [dbo].[Gorevler] ([GorevNo], [GorevAdi], [GorevTanimi], [GorevFiyat], [GorevSuresi], [GorevDurumu]) VALUES (5, N'Okuma', N'Niyet', 125.0000, 4, N'Karışık')
SET IDENTITY_INSERT [dbo].[Gorevler] OFF
GO
ALTER TABLE [dbo].[Elemanlar]  WITH CHECK ADD  CONSTRAINT [FK_Elemanlar_Gorevler] FOREIGN KEY([GorevNo])
REFERENCES [dbo].[Gorevler] ([GorevNo])
GO
ALTER TABLE [dbo].[Elemanlar] CHECK CONSTRAINT [FK_Elemanlar_Gorevler]
GO
/****** Object:  StoredProcedure [dbo].[ElemanArama]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ElemanArama]
@AramaKelime varchar(50)
as begin
select * from Elemanlar where ElemanAdi like '%' + @AramaKelime  + '%' or ElemanPozisyon like '%' + @AramaKelime  + '%' or ElemanStatu like '%' + @AramaKelime  + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[ElemanEkle]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanEkle]
@ElemanAdi varchar(50),
@ElemanPozisyon varchar(50),
@ElemanMaas money,
@ElemanStatu varchar(50),
@GorevNo int
as begin
insert into Elemanlar(ElemanAdi,ElemanPozisyon,ElemanMaas,ElemanStatu,GorevNo)
values (@ElemanAdi,@ElemanPozisyon,@ElemanMaas,@ElemanStatu,@GorevNo)
end
GO
/****** Object:  StoredProcedure [dbo].[ElemanListele]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanListele]
as begin
select * from Elemanlar
end
GO
/****** Object:  StoredProcedure [dbo].[ElemanSil]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanSil] 
@ElemanNo int
as begin
delete Elemanlar where ElemanNo=@ElemanNo
end
GO
/****** Object:  StoredProcedure [dbo].[ElemanYenile]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanYenile]
@ElemanNo int,
@ElemanAdi varchar(50),
@ElemanPozisyon varchar(50),
@ElemanMaas money,
@ElemanStatu varchar(50),
@GorevNo int
as begin
update Elemanlar set ElemanAdi = @ElemanAdi , ElemanPozisyon = @ElemanPozisyon,ElemanMaas=@ElemanMaas,ElemanStatu = @ElemanStatu, GorevNo = @GorevNo
where ElemanNo =@ElemanNo 
end
GO
/****** Object:  StoredProcedure [dbo].[GorevArama]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GorevArama]
@AramaKelime varchar(50)
as begin
select * from Gorevler where GorevAdi like '%' + @AramaKelime  + '%' or GorevDurumu like '%' + @AramaKelime  + '%'or GorevTanimi like '%' + @AramaKelime  + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[GorevEkle]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevEkle]
@GorevAdi varchar(50),
@GorevTanimi	varchar(50),
@GorevFiyat money,
@GorevSuresi int,
@GorevDurumu varchar(50)
as begin
insert into Gorevler(GorevAdi,GorevTanimi,GorevFiyat,GorevSuresi,GorevDurumu)
values (@GorevAdi,@GorevTanimi,@GorevFiyat,@GorevSuresi,@GorevDurumu)
end
GO
/****** Object:  StoredProcedure [dbo].[GorevElemanBirleştirme]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevElemanBirleştirme]
as begin
select e.ElemanAdi,e.ElemanPozisyon,e.ElemanMaas,g.GorevAdi,g.GorevSuresi from Elemanlar as e join Gorevler as g on e.GorevNo = g.GorevNo  
end
GO
/****** Object:  StoredProcedure [dbo].[GorevListele]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevListele]
as begin
select * from Gorevler
end
GO
/****** Object:  StoredProcedure [dbo].[GorevSil]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevSil] 
@GorevNo int
as begin
delete Gorevler where GorevNo = @GorevNo
end
GO
/****** Object:  StoredProcedure [dbo].[GorevYenile]    Script Date: 6.03.2022 22:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevYenile]
@GorevNo int,
@GorevAdi varchar(50),
@GorevTanim varchar(50),
@GorevFiyat money,
@GorevSuresi int,
@GorevDurumu varchar(50)
as begin
update Gorevler set GorevAdi=@GorevAdi,GorevTanimi =@GorevTanim, GorevFiyat = @GorevFiyat, GorevSuresi= @GorevSuresi , GorevDurumu = @GorevDurumu
where GorevNo = @GorevNo
end
GO
USE [master]
GO
ALTER DATABASE [Sirket] SET  READ_WRITE 
GO
