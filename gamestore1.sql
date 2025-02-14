

CREATE TABLE [dbo].[ChiTietDonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maDH] [nvarchar](255) NOT NULL,
	[maSP] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[tongTien] [int] NOT NULL,
 CONSTRAINT [PK__ChiTietD__3213E83F512C506B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maGioHang] [int] NULL,
	[soLuongSP] [int] NULL,
	[maSP] [int] NULL,
	[tongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[maDM] [int] IDENTITY(1,1) NOT NULL,
	[tenDM] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDH] [nvarchar](255) NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[diachi] [nvarchar](700) NOT NULL,
	[tongTien] [float] NOT NULL,
	[soLuong] [int] NOT NULL,
	[trangThai] [nvarchar](700) NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[maDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[maGioHang] [int] IDENTITY(1,1) NOT NULL,
	[maNguoiDung] [int] NULL,
	[soLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urlHinh] [nvarchar](2000) NOT NULL,
	[maSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[username] [nvarchar](200) NOT NULL,
	[hoTen] [nvarchar](200) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[sdt] [nvarchar](200) NOT NULL,
	[matkhau] [nvarchar](200) NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK__NguoiDun__446439EA6D6BD344] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [int] IDENTITY(1,1) NOT NULL,
	[tenSP] [nvarchar](700) NOT NULL,
	[giaTien] [float] NOT NULL,
	[chitietSP] [nvarchar](1000) NULL,
	[maDM] [int] NOT NULL,
	[soLuong] [int] NULL,
	[hinhAnh1] [nvarchar](700) NULL,
	[hinhAnh2] [nvarchar](700) NULL,
	[hinhAnh3] [nvarchar](700) NULL,
	[hinhAnh4] [nvarchar](700) NULL,
 CONSTRAINT [PK__SanPham__7A227A7ACDCC857C] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_createdat]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_updatedAt]  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([maDH])
REFERENCES [dbo].[DonHang] ([maDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [fk_dh_sp] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [fk_dh_sp]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [fk_ctgh] FOREIGN KEY([maGioHang])
REFERENCES [dbo].[GioHang] ([maGioHang])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [fk_ctgh]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [fk_ctgh_sp] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [fk_ctgh_sp]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY([username])
REFERENCES [dbo].[NguoiDung] ([username])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [fk_hinhanh_sp] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [fk_hinhanh_sp]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [fk_nguoidung_role] FOREIGN KEY([roleID])
REFERENCES [dbo].[PhanQuyen] ([roleID])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [fk_nguoidung_role]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_sanpham_danhmuc] FOREIGN KEY([maDM])
REFERENCES [dbo].[DanhMuc] ([maDM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_sanpham_danhmuc]
GO
USE [master]
GO
ALTER DATABASE [GameStore] SET  READ_WRITE 
GO
