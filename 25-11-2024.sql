/****** Object:  Table [dbo].[admins]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bannerimages]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bannerimages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BannerId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_bannerimages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banners]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tieude] [nvarchar](max) NOT NULL,
	[Phude] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiets]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sanphams_id] [int] NOT NULL,
	[mo_ta_chung] [nvarchar](max) NULL,
	[hinh_dang] [nvarchar](max) NULL,
	[cong_dung] [nvarchar](max) NULL,
	[xuat_xu] [nvarchar](max) NULL,
	[khoi_luong] [nvarchar](max) NULL,
	[bao_quan] [nvarchar](max) NULL,
	[thanh_phan_dinh_duong] [nvarchar](max) NULL,
	[ngay_thu_hoach] [datetime2](7) NULL,
	[huong_vi] [nvarchar](max) NULL,
	[nong_do_duong] [nvarchar](max) NULL,
	[bai_viet] [nvarchar](max) NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_chitiets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dactrungs]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dactrungs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
	[Tieude] [nvarchar](max) NOT NULL,
	[Phude] [nvarchar](max) NOT NULL,
	[Thutuhienthi] [int] NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Dactrungs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhgiakhachhangs]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhgiakhachhangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sanphams_id] [int] NOT NULL,
	[ho_ten] [nvarchar](255) NOT NULL,
	[tieude] [nvarchar](255) NOT NULL,
	[so_sao] [int] NOT NULL,
	[noi_dung] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_danhgiakhachhangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danhmucsanpham]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhmucsanpham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_danhmucsanpham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diachichitiets]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diachichitiets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Diachi] [nvarchar](255) NOT NULL,
	[Sdt] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_diachichitiets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FooterImg]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FooterImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Footer_ID] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[link] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FooterImg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hinhanh_sanpham]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hinhanh_sanpham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sanphams_id] [int] NOT NULL,
	[hinhanh] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_hinhanh_sanpham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadonchitiets]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadonchitiets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[sanpham_ids] [nvarchar](max) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_hoadonchitiets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadons]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[khachhang_id] [int] NOT NULL,
	[total_price] [decimal](18, 2) NOT NULL,
	[order_code] [nvarchar](max) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_hoadons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhangs]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[Ho] [nvarchar](max) NOT NULL,
	[DiaChiCuThe] [nvarchar](max) NOT NULL,
	[ThanhPho] [nvarchar](max) NOT NULL,
	[Sdt] [nvarchar](max) NOT NULL,
	[EmailDiaChi] [nvarchar](max) NOT NULL,
	[GhiChu] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_khachhangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lien_hes]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lien_hes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[sdt] [nvarchar](max) NOT NULL,
	[ghichu] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_lien_hes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Thutuhien] [int] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanphams]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanphams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tieude] [nvarchar](max) NULL,
	[Giatien] [decimal](18, 2) NOT NULL,
	[Hinhanh] [nvarchar](max) NULL,
	[Trangthai] [nvarchar](max) NULL,
	[don_vi_tinh] [nvarchar](max) NULL,
	[danhmucsanpham_id] [int] NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_sanphams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanphamsale]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanphamsale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[trangthai] [nvarchar](max) NOT NULL,
	[giasale] [decimal](18, 2) NOT NULL,
	[thoigianbatdau] [datetime2](7) NULL,
	[thoigianketthuc] [datetime2](7) NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_sanphamsale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tencuahang]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tencuahang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Trangthai] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tencuahang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenFooter]    Script Date: 11/25/2024 8:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenFooter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](max) NOT NULL,
	[phude] [nvarchar](max) NOT NULL,
	[Created_at] [datetime2](7) NOT NULL,
	[Updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TenFooter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admins] ON 

INSERT [dbo].[admins] ([Id], [Username], [Password]) VALUES (1, N'admin', N'$2a$11$CT1VQMP3/lg5yqZE1PtL2uza8Y4/OPKe4zGe9In7XOJaEP.Ro.vZe')
SET IDENTITY_INSERT [dbo].[admins] OFF
GO
SET IDENTITY_INSERT [dbo].[bannerimages] ON 

INSERT [dbo].[bannerimages] ([id], [BannerId], [ImagePath], [Created_at], [Updated_at]) VALUES (1, 1, N'banners/339a4107-a9a4-4e63-bba7-a07f2343e2af_baner-1.png', CAST(N'2024-11-23T15:59:24.3704036' AS DateTime2), CAST(N'2024-11-23T15:59:24.3704042' AS DateTime2))
INSERT [dbo].[bannerimages] ([id], [BannerId], [ImagePath], [Created_at], [Updated_at]) VALUES (2, 1, N'banners/78c66417-b9db-4cac-9bdf-4e4fad029d53_best-product-6.jpg', CAST(N'2024-11-23T15:59:24.3714242' AS DateTime2), CAST(N'2024-11-23T15:59:24.3714247' AS DateTime2))
INSERT [dbo].[bannerimages] ([id], [BannerId], [ImagePath], [Created_at], [Updated_at]) VALUES (5, 1, N'banners/528adad0-66e5-4a13-99c4-cecf43ca8f2a_baner-1.png', CAST(N'2024-11-24T16:33:08.5048287' AS DateTime2), CAST(N'2024-11-24T16:33:08.5048289' AS DateTime2))
INSERT [dbo].[bannerimages] ([id], [BannerId], [ImagePath], [Created_at], [Updated_at]) VALUES (6, 1, N'banners/f1d1825f-596a-4661-a3fa-907231d24781_banner-fruits.jpg', CAST(N'2024-11-24T16:33:27.4907858' AS DateTime2), CAST(N'2024-11-24T16:33:27.4907860' AS DateTime2))
SET IDENTITY_INSERT [dbo].[bannerimages] OFF
GO
SET IDENTITY_INSERT [dbo].[banners] ON 

INSERT [dbo].[banners] ([Id], [Tieude], [Phude], [Created_at], [Updated_at]) VALUES (1, N'Trái Cây Tươi ', N'Cam kết 100% trái cây sạch và đã qua kiểm tra', CAST(N'2024-11-23T15:59:24.3665828' AS DateTime2), CAST(N'2024-11-24T16:33:27.4907877' AS DateTime2))
SET IDENTITY_INSERT [dbo].[banners] OFF
GO
SET IDENTITY_INSERT [dbo].[chitiets] ON 

INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (1, 1, N'Dâu tươi Đà Lạt chất lượng cao', N'Hình tròn, đỏ mọng', N'Tốt cho sức khỏe, giàu vitamin C', N'Đà Lạt, Việt Nam', N'500g/ hộp', N'Giữ lạnh ở 0-4°C', N'Giàu vitamin C, chất xơ', CAST(N'2024-11-23T00:00:00.0000000' AS DateTime2), N'Ngọt dịu, thơm má', N'8-10%', N'<h3><strong>Dâu tươi Đà Lạt - Tinh hoa từ cao nguyên</strong></h3><h4><strong>1. Giới thiệu sản phẩm</strong></h4><p>Dâu tươi Đà Lạt là một trong những đặc sản nổi tiếng của vùng cao nguyên Đà Lạt, Việt Nam. Với khí hậu mát mẻ quanh năm, đất đai màu mỡ và nguồn nước tự nhiên trong lành, những trái dâu tươi tại đây mang lại hương vị ngọt dịu, thanh mát mà khó nơi nào sánh được.</p><figure class="image"><img style="aspect-ratio:300/168;" src="https://localhost:7253/upload/638679992703894938_d5.jpg" width="300" height="168"></figure><h4><strong>2. Đặc điểm nổi bật của dâu tươi Đà Lạt</strong></h4><ul><li>Hình dáng: Trái dâu đỏ mọng, hình tròn hoặc trái tim, lớp vỏ mịn, căng bóng.</li><li>Hương vị: Ngọt dịu, thoảng chút chua nhẹ, kèm theo mùi thơm tự nhiên đặc trưng.</li><li>Nguồn gốc: Được trồng tại các nông trại đạt chuẩn GlobalGAP ở Đà Lạt, đảm bảo không sử dụng hóa chất độc hại.</li></ul><h4><strong>3. Giá trị dinh dưỡng</strong></h4><p>Dâu tươi Đà Lạt không chỉ là món quà thiên nhiên thơm ngon mà còn mang lại nhiều giá trị dinh dưỡng cho sức khỏe:</p><p>Thành phần dinh dưỡng:</p><ul><li>Vitamin C: Tăng cường hệ miễn dịch, chống oxy hóa, giúp da khỏe mạnh.</li><li>Chất xơ: Hỗ trợ tiêu hóa, giảm cholesterol, tốt cho tim mạch.</li><li>Chất chống oxy hóa (Anthocyanins): Ngăn ngừa lão hóa, giảm nguy cơ ung thư và các bệnh mãn tính.</li></ul><h4><strong>4. Cách bảo quản</strong></h4><p>Dâu tươi Đà Lạt rất nhạy cảm với nhiệt độ và ánh sáng, vì vậy bạn nên bảo quản đúng cách để giữ nguyên độ tươi ngon:</p><ul><li>Nhiệt độ: Giữ ở 0-4°C.</li><li>Thời gian sử dụng: Tốt nhất trong vòng 2-3 ngày sau khi mua.</li><li>Mẹo nhỏ: Rửa dâu nhẹ nhàng dưới vòi nước, không ngâm lâu và để ráo trước khi cất vào tủ lạnh.</li></ul><h4><strong>5. Công dụng của dâu tươi Đà Lạt</strong></h4><p>Dâu tươi không chỉ ngon miệng mà còn có nhiều công dụng hữu ích:</p><ul><li>Làm đẹp: Vitamin C và chất chống oxy hóa giúp da sáng mịn, giảm thâm nám, hỗ trợ quá trình tái tạo da.</li><li>Giảm cân: Lượng calo thấp và giàu chất xơ hỗ trợ chế độ ăn kiêng hiệu quả, đồng thời cung cấp năng lượng tự nhiên.</li><li>Tăng cường sức khỏe tim mạch: Chất xơ và chất chống oxy hóa giúp giảm nguy cơ mắc các bệnh về tim mạch.</li></ul><h4><strong>6. Món ăn hấp dẫn từ dâu tươi</strong></h4><p>Dâu tươi Đà Lạt có thể được sử dụng để chế biến nhiều món ăn hấp dẫn:</p><ul><li>Sinh tố dâu tươi: Xay nhuyễn dâu với sữa tươi và đá lạnh để tạo ra ly sinh tố mát lạnh, bổ dưỡng.</li><li>Salad trái cây: Kết hợp dâu với kiwi, táo, và sốt yogurt để tạo nên món ăn nhẹ thơm ngon, bổ dưỡng.</li><li>Mứt dâu: Nấu dâu với đường tạo thành mứt dâu thơm ngọt, thích hợp để phết lên bánh mì, làm bánh hoặc kem.</li></ul><h4><strong>7. Lời kết</strong></h4><p>Dâu tươi Đà Lạt là sự lựa chọn tuyệt vời cho những ai yêu thích trái cây tươi ngon, bổ dưỡng. Không chỉ mang đến hương vị thơm ngon, sản phẩm này còn giúp bạn chăm sóc sức khỏe và sắc đẹp một cách tự nhiên nhất. Hãy thử ngay và cảm nhận sự khác biệt từ dâu tươi Đà Lạt – món quà tinh hoa từ vùng cao nguyên Việt Nam.</p>', CAST(N'2024-11-23T15:48:09.5954851' AS DateTime2), CAST(N'2024-11-23T15:48:09.5954858' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (3, 4, N'Rau cải xanh tươi mát, thơm ngon và bổ dưỡng', N'Lá xanh mướt, bẹ to, thân mềm', N'Hỗ trợ tiêu hóa, tăng cường hệ miễn dịch, tốt cho sức khỏe tim mạch', N'Nông trại sạch Việt Nam', N'500g/ bó', N'Bảo quản ở 5-7°C, giữ ẩm bằng khăn hoặc giấy báo', N'Giàu vitamin A, C, K, chất xơ, canxi và kali', CAST(N'2024-11-23T00:00:00.0000000' AS DateTime2), N'Ngọt nhẹ, hơi cay đặc trưng', N'Không áp dụng', N'<p>&nbsp;</p><h3><strong>Rau Cải Xanh - Sự tươi mát từ thiên nhiên</strong></h3><h4><strong>1. Giới thiệu sản phẩm</strong></h4><p>Rau cải xanh là một loại rau phổ biến trong bữa ăn hàng ngày của người Việt, không chỉ vì hương vị thơm ngon mà còn bởi giá trị dinh dưỡng vượt trội. Được trồng chủ yếu tại các vùng nông nghiệp sạch, rau cải xanh mang đến sự tươi mát và nguồn năng lượng tự nhiên cho mọi gia đình.</p><figure class="image"><img style="aspect-ratio:236/214;" src="https://localhost:7253/upload/638680004429102742_r6.jpg" width="236" height="214"></figure><h4><strong>2. Đặc điểm nổi bật của rau cải xanh</strong></h4><ul><li><strong>Hình dáng:</strong> Lá xanh mướt, bẹ lá to, cuống dài và thân mềm.</li><li><strong>Hương vị:</strong> Có vị ngọt nhẹ, hơi cay đặc trưng, phù hợp cho nhiều món ăn.</li><li><strong>Nguồn gốc:</strong> Được trồng trong môi trường sạch, không sử dụng hóa chất độc hại, đảm bảo an toàn cho sức khỏe.</li></ul><h4><strong>3. Giá trị dinh dưỡng</strong></h4><p>Rau cải xanh là nguồn cung cấp dinh dưỡng dồi dào, đặc biệt phù hợp cho chế độ ăn uống lành mạnh:</p><ul><li><strong>Vitamin A:</strong> Giúp sáng mắt, tăng cường sức khỏe làn da.</li><li><strong>Vitamin C:</strong> Tăng cường hệ miễn dịch, bảo vệ cơ thể khỏi các tác nhân gây bệnh.</li><li><strong>Vitamin K:</strong> Tốt cho máu và sức khỏe xương.</li><li><strong>Chất xơ:</strong> Hỗ trợ tiêu hóa, giảm cholesterol.</li><li><strong>Canxi và Kali:</strong> Tăng cường sức khỏe tim mạch và hệ cơ xương.</li></ul><h4><strong>4. Cách bảo quản</strong></h4><p>Rau cải xanh rất dễ héo nếu không bảo quản đúng cách. Bạn có thể giữ rau tươi lâu hơn bằng các mẹo sau:</p><ul><li><strong>Nhiệt độ:</strong> Bảo quản rau trong ngăn mát tủ lạnh ở nhiệt độ 5-7°C.</li><li><strong>Thời gian:</strong> Dùng trong vòng 2-3 ngày để đảm bảo độ tươi ngon.</li><li><strong>Mẹo nhỏ:</strong> Quấn rau bằng giấy báo hoặc khăn ẩm trước khi cất vào tủ lạnh để giữ độ ẩm tự nhiên.</li></ul><h4><strong>5. Công dụng của rau cải xanh</strong></h4><p>Rau cải xanh không chỉ là một nguyên liệu thơm ngon mà còn có nhiều lợi ích cho sức khỏe:</p><ul><li><strong>Thanh lọc cơ thể:</strong> Hỗ trợ đào thải độc tố nhờ hàm lượng chất xơ và chất chống oxy hóa cao.</li><li><strong>Tăng cường sức khỏe tiêu hóa:</strong> Giảm nguy cơ táo bón và hỗ trợ hệ vi sinh đường ruột.</li><li><strong>Phòng ngừa bệnh tật:</strong> Chất chống oxy hóa trong rau giúp giảm nguy cơ mắc các bệnh mãn tính.</li><li><strong>Hỗ trợ giảm cân:</strong> Lượng calo thấp, nhiều chất xơ giúp bạn cảm thấy no lâu hơn mà không lo tăng cân.</li></ul><h4><strong>6. Các món ngon từ rau cải xanh</strong></h4><p>Rau cải xanh là nguyên liệu không thể thiếu trong các món ăn gia đình Việt Nam:</p><ul><li><strong>Cải xanh xào tỏi:</strong> Món ăn đơn giản nhưng đậm đà, giữ nguyên hương vị tươi ngon của rau.</li><li><strong>Canh cải xanh nấu tôm:</strong> Một món canh thanh mát, bổ dưỡng, dễ chế biến.</li><li><strong>Cải xanh luộc:</strong> Chấm với nước mắm hoặc xì dầu, giữ nguyên hương vị tự nhiên của rau.</li><li><strong>Cải xanh cuốn thịt:</strong> Lá rau cải được dùng để cuốn thịt, cá hoặc bún, tạo thành món cuốn hấp dẫn.</li></ul><h4><strong>7. Lời kết</strong></h4><p>Rau cải xanh là lựa chọn hoàn hảo cho những ai yêu thích bữa ăn lành mạnh và bổ dưỡng. Với hương vị thanh mát và giá trị dinh dưỡng cao, rau cải xanh không chỉ làm phong phú thêm thực đơn hàng ngày mà còn giúp bạn chăm sóc sức khỏe một cách tự nhiên.</p>', CAST(N'2024-11-23T16:14:05.6942774' AS DateTime2), CAST(N'2024-11-23T16:14:05.6942779' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (4, 3, N' Nho Mỹ xanh là loại nho nhập khẩu cao cấp, nổi bật với vị ngọt thanh mát và hương thơm đặc trưng. Đây là loại trái cây tươi được yêu thích bởi giá trị dinh dưỡng cao và chất lượng vượt trội.', N'Quả tròn nhỏ, vỏ xanh sáng bóng, không hạt.', N'Giúp bổ sung vitamin C, chất chống oxy hóa; tăng cường hệ miễn dịch; tốt cho tim mạch và làm đẹp da', N'Mỹ.', N'500g / hộp', N'Nhiệt độ từ 0-4°C, tránh ánh nắng trực tiếp.', N'Chứa vitamin C, vitamin K, kali và các chất chống oxy hóa như resveratrol.', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Ngọt thanh, hơi chua nhẹ, thơm dịu.', N'18-20 Brix.', N'<p><strong>Nho Mỹ Xanh – Món Quà Từ Thiên Nhiên Với Chất Lượng Tuyệt Hảo</strong></p><figure class="image"><img style="aspect-ratio:225/225;" src="https://localhost:7253/upload/638681392552434810_n3.jpg" width="225" height="225"></figure><p>Nho Mỹ xanh là một trong những loại trái cây nhập khẩu được ưa chuộng nhất trên thế giới. Với màu sắc xanh ngọc bắt mắt, hương vị ngọt dịu và giàu giá trị dinh dưỡng, nho Mỹ xanh đã trở thành lựa chọn hàng đầu của những người yêu thích thực phẩm tự nhiên, tốt cho sức khỏe.</p><h3><strong>Nguồn Gốc và Quy Trình Sản Xuất</strong></h3><p>Nho Mỹ xanh được trồng chủ yếu tại các vùng nho nổi tiếng của Hoa Kỳ như California – nơi có khí hậu lý tưởng và đất đai màu mỡ. Quy trình chăm sóc nho được kiểm soát chặt chẽ từ khâu chọn giống, gieo trồng, đến thu hoạch. Những quả nho được hái trực tiếp bằng tay vào đúng thời điểm chín mọng, đảm bảo giữ trọn vị tươi ngon và các chất dinh dưỡng cần thiết.</p><h3><strong>Đặc Điểm Nổi Bật</strong></h3><ul><li><strong>Hình dáng:</strong> Nho Mỹ xanh có kích thước nhỏ gọn, hình tròn hoặc bầu dục, vỏ mịn màng với sắc xanh tự nhiên. Loại nho này không có hạt, giúp thưởng thức dễ dàng hơn.</li><li><strong>Hương vị:</strong> Vị ngọt thanh, chua nhẹ đặc trưng cùng mùi thơm dịu mát mang lại cảm giác sảng khoái ngay từ miếng đầu tiên.</li><li><strong>Chất lượng:</strong> Nho Mỹ xanh không chỉ tươi ngon mà còn an toàn với sức khỏe nhờ quy trình sản xuất đạt tiêu chuẩn quốc tế.</li></ul><h3><strong>Giá Trị Dinh Dưỡng</strong></h3><p>Nho Mỹ xanh là nguồn cung cấp dồi dào các vitamin và khoáng chất thiết yếu:</p><ul><li><strong>Vitamin C:</strong> Tăng cường hệ miễn dịch, làm sáng da và hỗ trợ tái tạo tế bào.</li><li><strong>Vitamin K:</strong> Giúp xương chắc khỏe, ngăn ngừa các vấn đề về đông máu.</li><li><strong>Kali:</strong> Hỗ trợ tim mạch và điều hòa huyết áp.</li><li><strong>Chất chống oxy hóa (Resveratrol):</strong> Ngăn ngừa lão hóa, giảm nguy cơ mắc bệnh mãn tính như ung thư và tiểu đường.</li></ul><h3><strong>Công Dụng</strong></h3><ol><li><strong>Bổ sung năng lượng:</strong> Nho Mỹ xanh là món ăn nhẹ lý tưởng cho người bận rộn, cung cấp năng lượng tức thì mà không gây tăng cân.</li><li><strong>Tốt cho tim mạch:</strong> Chất chống oxy hóa trong nho giúp giảm cholesterol xấu, bảo vệ hệ tim mạch.</li><li><strong>Hỗ trợ tiêu hóa:</strong> Lượng chất xơ tự nhiên trong nho hỗ trợ quá trình tiêu hóa, giúp cơ thể hấp thụ dinh dưỡng tốt hơn.</li><li><strong>Làm đẹp da:</strong> Với hàm lượng vitamin C cao, nho Mỹ xanh giúp làm sáng da, ngăn ngừa sự hình thành nếp nhăn.</li></ol><h3><strong>Hướng Dẫn Sử Dụng và Bảo Quản</strong></h3><ul><li><strong>Cách dùng:</strong> Nho Mỹ xanh có thể được dùng trực tiếp như một món tráng miệng, chế biến thành các món salad, sinh tố, hoặc làm nguyên liệu trong các món bánh và món ăn nhẹ.</li><li><strong>Bảo quản:</strong> Để giữ nho tươi ngon lâu hơn, nên bảo quản trong ngăn mát tủ lạnh ở nhiệt độ từ 0-4°C. Tránh để nho ở nơi có ánh nắng trực tiếp hoặc nhiệt độ cao.</li></ul><h3><strong>Kết Luận</strong></h3><p>Nho Mỹ xanh không chỉ là một loại trái cây thơm ngon mà còn mang đến vô vàn lợi ích cho sức khỏe. Với chất lượng vượt trội, loại nho này xứng đáng xuất hiện trong mỗi bữa ăn gia đình. Hãy bổ sung nho Mỹ xanh vào thực đơn hàng ngày để tận hưởng trọn vẹn hương vị thiên nhiên cùng các giá trị dinh dưỡng quý giá!</p>', CAST(N'2024-11-25T06:47:38.3008377' AS DateTime2), CAST(N'2024-11-25T06:47:38.3008377' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (5, 12, N'Lê đường Trung Quốc - loại trái cây tươi ngon, ngọt mát, phù hợp để ăn trực tiếp hoặc làm các món tráng miệng.', N'Quả tròn, vỏ vàng nhẹ, bóng mịn.', N'Cung cấp nhiều vitamin và khoáng chất. Giải nhiệt, làm mát cơ thể. Hỗ trợ tiêu hóa.', N'Trung Quốc.', N'1kg (~3-5 quả).', N'Bảo quản nơi khô ráo thoáng mát, tốt nhất trong ngăn mát tủ lạnh.', N'Vitamin C: 7mg. Carbohydrate: 15g. Chất xơ: 3g. Lượng calo: 60kcal/quả.', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Ngọt thanh, giòn nhẹ.', N'12-14%.', N'<p>Lê đường là một loại trái cây bổ dưỡng và phổ biến trên bàn ăn của người Việt. Với hương vị ngọt thanh và kết cấu giòn nhẹ, lê đường không chỉ hấp dẫn mà còn mang lại nhiều lợi ích sức khỏe.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681599846002836_l5.jpg" width="1024" height="768"></figure><h3>Tại sao nên chọn lê đường?</h3><ul><li><strong>Giải nhiệt cơ thể:</strong> Lê đường có tính mát, giúp thanh nhiệt, đặc biệt phù hợp trong những ngày nóng bức.</li><li><strong>Tăng cường hệ miễn dịch:</strong> Chứa nhiều vitamin C, hỗ trợ cơ thể chống lại cảm lạnh và các bệnh thường gặp.</li><li><strong>Hỗ trợ tiêu hóa:</strong> Hàm lượng chất xơ cao giúp duy trì hệ tiêu hóa khỏe mạnh.</li></ul><h3>Cách bảo quản lê đường:</h3><p>Để giữ lê luôn tươi ngon, bạn nên:</p><ol><li>Đặt trong túi lưới hoặc túi giấy.</li><li>Lưu trữ ở nhiệt độ 4-8°C trong ngăn mát tủ lạnh.</li></ol>', CAST(N'2024-11-25T12:33:07.7983170' AS DateTime2), CAST(N'2024-11-25T12:33:07.7983171' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (6, 13, N'Dưa hấu tươi - loại trái cây giải khát tuyệt vời với hương vị ngọt ngào, mọng nước, giàu dinh dưỡng.', N'Quả hình tròn hoặc bầu dục, vỏ xanh sọc đậm, ruột đỏ mọng hoặc vàng.', N'Giải khát, làm mát cơ thể. Cung cấp nhiều vitamin và khoáng chất thiết yếu. Hỗ trợ cải thiện sức khỏe tim mạch và da.', N'Việt Nam.', N'1 quả (~3-5kg).', N'Bảo quản nơi khô ráo thoáng mát. Sau khi bổ ra, nên bọc kín và để trong tủ lạnh.', N'Vitamin C: 12mg. Vitamin A: 20µg. Carbohydrate: 8g/100g. Nước: 92%. Lượng calo: 30kcal/100g.', CAST(N'2024-11-26T00:00:00.0000000' AS DateTime2), N'Ngọt mát, mọng nước.', N'8-10%.', N'<p>Dưa hấu là loại trái cây không thể thiếu trong những ngày hè nóng bức. Với hàm lượng nước cao cùng vị ngọt mát, dưa hấu không chỉ làm dịu cơn khát mà còn mang lại nhiều giá trị dinh dưỡng.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681602620168070_dddddd.png" width="1024" height="768"></figure><h3>Lợi ích của dưa hấu:</h3><ul><li><strong>Giải khát và thanh nhiệt:</strong> Chứa hơn 90% nước, dưa hấu giúp cơ thể bù nước nhanh chóng.</li><li><strong>Tăng cường sức khỏe:</strong> Dưa hấu giàu vitamin C và A, hỗ trợ tăng cường miễn dịch và cải thiện làn da.</li><li><strong>Hỗ trợ tim mạch:</strong> Lycopene trong dưa hấu giúp giảm nguy cơ mắc các bệnh tim mạch.</li></ul><h3>Cách chọn dưa hấu ngon:</h3><ol><li>Vỏ xanh đậm, có vết đốm vàng đều.</li><li>Khi gõ vào quả, âm thanh vang và chắc.</li><li>Cuống tươi, không bị khô héo.</li></ol><h3>Lưu ý khi bảo quản:</h3><ul><li>Dưa hấu chưa bổ: Để nơi thoáng mát, tránh ánh nắng trực tiếp.</li><li>Dưa hấu đã bổ: Bọc kín bằng màng bọc thực phẩm, bảo quản trong tủ lạnh và dùng trong vòng 2-3 ngày.</li></ul>', CAST(N'2024-11-25T12:37:46.0990747' AS DateTime2), CAST(N'2024-11-25T12:37:46.0990751' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (7, 14, N'Rau mồng tơi - loại rau xanh quen thuộc với vị ngọt mát, giàu dinh dưỡng và rất tốt cho sức khỏe.', N'Lá rau màu xanh đậm, hình trái tim, bề mặt lá bóng mịn.', N'Giải nhiệt cơ thể, thanh lọc độc tố. Hỗ trợ nhuận tràng, tốt cho hệ tiêu hóa. Bổ sung vitamin và khoáng chất cần thiết.', N'Việt Nam.', N'1 bó (~300g).', N'Bảo quản nơi khô ráo thoáng mát, tốt nhất trong ngăn mát tủ lạnh và sử dụng trong vòng 2-3 ngày.', N'Vitamin C: 89mg. Sắt: 1.2mg. Canxi: 60mg. Lượng calo: 19kcal/100g.', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Ngọt nhẹ, thanh mát.', NULL, N'<p>Rau mồng tơi là loại rau xanh giàu dinh dưỡng, thường xuất hiện trong các bữa ăn hàng ngày của gia đình Việt. Với vị ngọt mát và tính chất giải nhiệt, rau mồng tơi không chỉ ngon mà còn rất tốt cho sức khỏe.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681604960409336_mmmmmm.jpg" width="1024" height="768"></figure><h3>Lợi ích của rau mồng tơi:</h3><ul><li><strong>Thanh nhiệt, giải độc:</strong> Rau mồng tơi có tính hàn, giúp cơ thể mát mẻ và đào thải độc tố.</li><li><strong>Tốt cho hệ tiêu hóa:</strong> Chất nhầy tự nhiên trong mồng tơi hỗ trợ nhuận tràng, giảm táo bón.</li><li><strong>Bổ sung dưỡng chất:</strong> Rau chứa nhiều vitamin A, C, sắt, và canxi giúp tăng cường sức đề kháng.</li></ul><h3>Các món ăn ngon từ rau mồng tơi:</h3><ul><li>Canh mồng tơi nấu tôm hoặc thịt bằm.</li><li>Rau mồng tơi xào tỏi.</li><li>Rau mồng tơi luộc chấm nước mắm.</li></ul><h3>Cách bảo quản rau mồng tơi:</h3><ul><li><strong>Rau tươi:</strong> Sau khi mua về, bạn nên rửa sạch, để ráo nước, bọc bằng khăn giấy hoặc túi nylon thoáng khí, và đặt trong ngăn mát tủ lạnh.</li><li><strong>Không rửa trước khi bảo quản:</strong> Điều này giúp rau không bị úng nước và giữ được độ tươi lâu hơn.</li></ul>', CAST(N'2024-11-25T12:41:38.5658125' AS DateTime2), CAST(N'2024-11-25T12:41:38.5658129' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (8, 15, N'Rau dền - loại rau phổ biến với vị ngọt thanh, dễ chế biến và giàu giá trị dinh dưỡng.', N'Lá rau mềm, có màu xanh hoặc đỏ tùy loại, thân mảnh và mềm.', N'Thanh nhiệt, làm mát cơ thể. Hỗ trợ cải thiện hệ tiêu hóa. Bổ sung chất sắt và khoáng chất, tốt cho máu.', N'Việt Nam.', N'1 bó (~300g).', N'Bảo quản nơi khô ráo thoáng mát, hoặc trong ngăn mát tủ lạnh để giữ tươi từ 1-2 ngày.', N'Vitamin C: 43mg. Sắt: 2.3mg. Canxi: 68mg. Lượng calo: 23kcal/100g', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Ngọt thanh, dễ ăn.', NULL, N'<p>Rau dền là loại rau quen thuộc, được yêu thích nhờ giá trị dinh dưỡng cao và tính dễ chế biến. Đây là loại thực phẩm lý tưởng để bổ sung vào thực đơn gia đình, đặc biệt trong những ngày thời tiết nóng bức.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681606356789631_rdddddd.jpg" width="1024" height="768"></figure><h3>Lợi ích của rau dền:</h3><ul><li><strong>Thanh nhiệt cơ thể:</strong> Rau dền có tính mát, giúp giải nhiệt hiệu quả.</li><li><strong>Cải thiện sức khỏe máu:</strong> Với hàm lượng sắt cao, rau dền giúp ngăn ngừa tình trạng thiếu máu, đặc biệt phù hợp cho người bị thiếu sắt.</li><li><strong>Bổ sung canxi:</strong> Rau dền giàu canxi, hỗ trợ tăng cường xương khớp.</li></ul><h3>Cách chế biến rau dền:</h3><ul><li>Canh rau dền nấu tôm hoặc thịt bằm.</li><li>Rau dền luộc chấm nước mắm.</li><li>Cháo rau dền dành cho trẻ em.</li></ul><h3>Lưu ý khi bảo quản:</h3><ul><li>Rau dền nên được rửa sạch, để ráo nước trước khi cất vào ngăn mát tủ lạnh.</li><li>Không để rau ở nơi quá ẩm hoặc nhiệt độ cao để tránh héo úa.</li><li>Sử dụng trong vòng 1-2 ngày sau khi mua để giữ được độ tươi ngon và giá trị dinh dưỡng.</li></ul>', CAST(N'2024-11-25T12:43:57.6155307' AS DateTime2), CAST(N'2024-11-25T12:43:57.6155310' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (9, 16, N'Khoai tây đông lạnh - sản phẩm tiện lợi, đã sơ chế, phù hợp để chế biến nhanh các món ăn ngon như khoai tây chiên, hầm, hoặc nướng.', N'Khoai tây được cắt thành các thanh dài (hoặc lát mỏng), đông lạnh ở nhiệt độ thấp để giữ độ tươi và chất lượng.', N'Tiện lợi cho việc nấu nướng nhanh chóng. Làm nguyên liệu cho các món ăn vặt hoặc bữa chính. Cung cấp năng lượng và dưỡng chất.', N'Hà Lan (hoặc nơi sản xuất cụ thể của sản phẩm).', N'500g hoặc 1kg (tùy loại đóng gói).', N'Bảo quản ở nhiệt độ -18°C hoặc trong ngăn đông tủ lạnh, tránh làm tan đông nhiều lần để giữ chất lượng tốt nhất.', N'Năng lượng: 150kcal. Carbohydrate: 28g. Protein: 2.5g. Chất béo: 4.5g.', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), NULL, N'Béo nhẹ, bùi, thơm ngon sau khi chế biến.', N'<p>Khoai tây đông lạnh là lựa chọn lý tưởng cho những người bận rộn, yêu thích sự tiện lợi mà vẫn muốn đảm bảo bữa ăn ngon và dinh dưỡng. Sản phẩm đã được sơ chế và đông lạnh, giúp bạn tiết kiệm thời gian chế biến.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681608511192379_eccccc.jpg" width="1024" height="768"></figure><h3>Lợi ích của khoai tây đông lạnh:</h3><ul><li><strong>Tiện lợi:</strong> Chỉ cần lấy ra khỏi tủ đông và chế biến ngay mà không cần gọt vỏ hay rửa sạch.</li><li><strong>Giữ nguyên độ tươi ngon:</strong> Quy trình đông lạnh hiện đại giúp bảo quản dưỡng chất và hương vị tốt nhất của khoai tây.</li><li><strong>Phù hợp nhiều món ăn:</strong> Khoai tây đông lạnh có thể chiên, nướng hoặc làm các món như khoai tây nghiền, salad.</li></ul><h3>Gợi ý chế biến:</h3><ol><li><strong>Khoai tây chiên giòn:</strong> Chiên ngập dầu ở nhiệt độ 180°C trong 3-5 phút cho đến khi vàng giòn.</li><li><strong>Khoai tây nướng:</strong> Phủ thêm chút bơ, gia vị, sau đó nướng ở nhiệt độ 200°C trong 15-20 phút.</li><li><strong>Khoai tây hầm:</strong> Thêm vào các món súp hoặc hầm với thịt, rau củ để tăng hương vị.</li></ol><h3>Lưu ý khi sử dụng:</h3><ul><li>Sản phẩm không cần rã đông trước khi chế biến.</li><li>Tránh để sản phẩm tan đông nhiều lần, vì sẽ làm mất đi độ tươi ngon và dễ bị oxy hóa.</li><li>Đậy kín bao bì sau khi sử dụng nếu chưa dùng hết.</li></ul>', CAST(N'2024-11-25T12:47:32.8084077' AS DateTime2), CAST(N'2024-11-25T12:47:32.8084082' AS DateTime2))
INSERT [dbo].[chitiets] ([Id], [sanphams_id], [mo_ta_chung], [hinh_dang], [cong_dung], [xuat_xu], [khoi_luong], [bao_quan], [thanh_phan_dinh_duong], [ngay_thu_hoach], [huong_vi], [nong_do_duong], [bai_viet], [Created_at], [Updated_at]) VALUES (10, 17, N'Táo Gala Mini Pháp - loại táo nhập khẩu nhỏ gọn, ngọt thanh, giòn và thơm, phù hợp để ăn tươi hoặc làm các món tráng miệng.', N'Quả nhỏ, hình tròn, vỏ màu đỏ sọc vàng nhẹ, bóng mịn.  ', N'Cung cấp năng lượng và chất xơ. Hỗ trợ hệ tiêu hóa và làm đẹp da. Giàu vitamin và khoáng chất, tăng cường sức đề kháng.', N'Pháp.', N'1kg (~8-12 quả).', N'Bảo quản nơi khô ráo thoáng mát, tốt nhất trong ngăn mát tủ lạnh.', N'Năng lượng: 52kcal. Carbohydrate: 14g. Chất xơ: 2.4g. Vitamin C: 6mg.', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Ngọt thanh, giòn và thơm nhẹ.', NULL, N'<p>Táo Gala Mini Pháp là sự lựa chọn hoàn hảo cho những người yêu thích trái cây nhập khẩu chất lượng cao. Với kích thước nhỏ gọn, vị ngọt dịu và hương thơm đặc trưng, táo Gala Mini không chỉ ngon miệng mà còn mang lại nhiều lợi ích sức khỏe.</p><figure class="image"><img style="aspect-ratio:1024/768;" src="https://localhost:7253/upload/638681610237737122_tttttt.jpeg" width="1024" height="768"></figure><h3>Lợi ích của táo Gala Mini:</h3><ul><li><strong>Cải thiện tiêu hóa:</strong> Táo giàu chất xơ, giúp hỗ trợ hệ tiêu hóa hoạt động hiệu quả.</li><li><strong>Giàu vitamin:</strong> Hàm lượng vitamin C trong táo giúp tăng cường hệ miễn dịch và làm sáng da.</li><li><strong>Thích hợp cho mọi lứa tuổi:</strong> Táo Gala Mini nhỏ gọn, dễ ăn, rất phù hợp cho trẻ em và người lớn.</li></ul><h3>Gợi ý thưởng thức:</h3><ol><li>Ăn trực tiếp để cảm nhận độ giòn ngọt tự nhiên.</li><li>Làm salad trái cây, kết hợp với sữa chua hoặc mật ong.</li><li>Ép nước táo để làm thức uống giải khát bổ dưỡng.</li></ol><h3>Lưu ý bảo quản:</h3><ul><li>Nên bảo quản táo ở ngăn mát tủ lạnh (4-8°C) để giữ độ giòn lâu hơn.</li><li>Rửa sạch trước khi ăn để loại bỏ bụi bẩn và lớp sáp tự nhiên.</li><li>Tránh để táo tiếp xúc trực tiếp với ánh nắng hoặc nơi có nhiệt độ cao.</li></ul>', CAST(N'2024-11-25T12:50:25.8976189' AS DateTime2), CAST(N'2024-11-25T12:50:25.8976198' AS DateTime2))
SET IDENTITY_INSERT [dbo].[chitiets] OFF
GO
SET IDENTITY_INSERT [dbo].[Dactrungs] ON 

INSERT [dbo].[Dactrungs] ([ID], [Icon], [Tieude], [Phude], [Thutuhienthi], [Created_at], [Updated_at]) VALUES (1, N'icon/bc64010d-1afc-4040-9db6-5f3c8e5778cd_freeship.png', N'Miễn phí vận chuyển toàn quốc', N'Nhận ngay ưu đãi giao hàng miễn phí cho mọi đơn hàng từ 200.000 VNĐ', 1, CAST(N'2024-11-23T16:16:38.7765625' AS DateTime2), CAST(N'2024-11-24T16:33:45.5016328' AS DateTime2))
INSERT [dbo].[Dactrungs] ([ID], [Icon], [Tieude], [Phude], [Thutuhienthi], [Created_at], [Updated_at]) VALUES (2, N'icon/5870dc64-7867-4931-ae09-2501aaa0382b_0f8865dc-a9b9-4519-b52e-d666e186f11c.webp', N'Đổi trả dễ dàng trong 7 ngày', N'Yên tâm mua sắm với chính sách đổi trả miễn phí trong 7 ngày đầu tiên', 2, CAST(N'2024-11-23T16:17:16.8498362' AS DateTime2), CAST(N'2024-11-23T16:20:15.4767865' AS DateTime2))
INSERT [dbo].[Dactrungs] ([ID], [Icon], [Tieude], [Phude], [Thutuhienthi], [Created_at], [Updated_at]) VALUES (3, N'icon/08b03b9f-6871-45e8-af5d-3c014dbbec35_sa.png', N'Siêu khuyến mãi - Giảm giá lên đến 50%', N'Mua sắm ngay hôm nay để nhận ưu đãi lớn trên tất cả các sản phẩm yêu thích của bạn', 3, CAST(N'2024-11-23T16:19:02.5422336' AS DateTime2), CAST(N'2024-11-23T16:19:02.5422342' AS DateTime2))
INSERT [dbo].[Dactrungs] ([ID], [Icon], [Tieude], [Phude], [Thutuhienthi], [Created_at], [Updated_at]) VALUES (4, N'icon/58259cb7-5704-4b26-86cf-4f133844d8ff_ct.png', N'Sản phẩm chất lượng - An toàn cho sức khỏe', N'Cam kết mang đến cho bạn những sản phẩm đạt chuẩn chất lượng, nguồn gốc rõ ràng', 4, CAST(N'2024-11-23T16:19:46.0235620' AS DateTime2), CAST(N'2024-11-23T16:19:46.0235621' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Dactrungs] OFF
GO
SET IDENTITY_INSERT [dbo].[danhgiakhachhangs] ON 

INSERT [dbo].[danhgiakhachhangs] ([Id], [sanphams_id], [ho_ten], [tieude], [so_sao], [noi_dung], [Created_at], [Updated_at]) VALUES (1, 1, N'quốc vũ', N'sản phẩm đúng như mô tả', 5, N'dâu tươi giao hàng nhanh đóng gói cẩn thận', CAST(N'2024-11-23T15:57:00.3849570' AS DateTime2), CAST(N'2024-11-23T15:57:00.3849572' AS DateTime2))
SET IDENTITY_INSERT [dbo].[danhgiakhachhangs] OFF
GO
SET IDENTITY_INSERT [dbo].[danhmucsanpham] ON 

INSERT [dbo].[danhmucsanpham] ([ID], [Name], [Created_at], [Updated_at]) VALUES (1, N'Trái cây tươi', CAST(N'2024-11-23T15:41:48.5484627' AS DateTime2), CAST(N'2024-11-23T15:41:48.5484629' AS DateTime2))
INSERT [dbo].[danhmucsanpham] ([ID], [Name], [Created_at], [Updated_at]) VALUES (2, N'Rau củ', CAST(N'2024-11-23T15:42:34.5048992' AS DateTime2), CAST(N'2024-11-23T15:42:34.5048993' AS DateTime2))
INSERT [dbo].[danhmucsanpham] ([ID], [Name], [Created_at], [Updated_at]) VALUES (16, N' Nấm các loại', CAST(N'2024-11-25T12:44:29.9103428' AS DateTime2), CAST(N'2024-11-25T12:44:29.9103429' AS DateTime2))
INSERT [dbo].[danhmucsanpham] ([ID], [Name], [Created_at], [Updated_at]) VALUES (17, N'Rau, củ đông lạnh', CAST(N'2024-11-25T12:45:09.3020314' AS DateTime2), CAST(N'2024-11-25T12:45:09.3020314' AS DateTime2))
SET IDENTITY_INSERT [dbo].[danhmucsanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[diachichitiets] ON 

INSERT [dbo].[diachichitiets] ([Id], [Diachi], [Sdt], [Email], [Status], [Created_at], [Updated_at]) VALUES (1, N'Xã Tân Thạnh Đông,Củ Chi,Thành phố Hồ Chí Minh ', N'0778719281', N'quocvu0411@gmail.com', N'đang sử dụng', CAST(N'2024-11-23T15:59:32.3498694' AS DateTime2), CAST(N'2024-11-23T15:59:32.3498696' AS DateTime2))
INSERT [dbo].[diachichitiets] ([Id], [Diachi], [Sdt], [Email], [Status], [Created_at], [Updated_at]) VALUES (2, N'Hóc môn', N'0778719281', N'admin@gmail.com', N'không sử dụng', CAST(N'2024-11-23T16:10:02.4494882' AS DateTime2), CAST(N'2024-11-23T16:10:02.4494883' AS DateTime2))
SET IDENTITY_INSERT [dbo].[diachichitiets] OFF
GO
SET IDENTITY_INSERT [dbo].[FooterImg] ON 

INSERT [dbo].[FooterImg] ([Id], [Footer_ID], [ImagePath], [link]) VALUES (16, 4, N'/footer/fb1.jpg', N'https://vi-vn.facebook.com/')
INSERT [dbo].[FooterImg] ([Id], [Footer_ID], [ImagePath], [link]) VALUES (17, 4, N'/footer/ig.jpg', N'https://www.instagram.com/')
INSERT [dbo].[FooterImg] ([Id], [Footer_ID], [ImagePath], [link]) VALUES (19, 4, N'/footer/yt.jpg', N'https://www.youtube.com/')
INSERT [dbo].[FooterImg] ([Id], [Footer_ID], [ImagePath], [link]) VALUES (21, 4, N'/footer/tw.jpg', N'https://x.com/')
SET IDENTITY_INSERT [dbo].[FooterImg] OFF
GO
SET IDENTITY_INSERT [dbo].[hinhanh_sanpham] ON 

INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (8, 3, N'hinhanhphu\n2.jpg', CAST(N'2024-11-23T16:06:01.8600805' AS DateTime2), CAST(N'2024-11-23T16:06:01.8600809' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (9, 3, N'hinhanhphu\n3.jpg', CAST(N'2024-11-23T16:06:01.8605607' AS DateTime2), CAST(N'2024-11-23T16:06:01.8605608' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (11, 3, N'hinhanhphu\n5.jpg', CAST(N'2024-11-23T16:06:01.8619326' AS DateTime2), CAST(N'2024-11-23T16:06:01.8619327' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (12, 4, N'hinhanhphu\r2.jpg', CAST(N'2024-11-23T16:14:05.6962765' AS DateTime2), CAST(N'2024-11-23T16:14:05.6962768' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (13, 4, N'hinhanhphu\r3.jpg', CAST(N'2024-11-23T16:14:05.6968451' AS DateTime2), CAST(N'2024-11-23T16:14:05.6968452' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (14, 4, N'hinhanhphu\r4.jpg', CAST(N'2024-11-23T16:14:05.6973749' AS DateTime2), CAST(N'2024-11-23T16:14:05.6973750' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (15, 4, N'hinhanhphu\r5.jpg', CAST(N'2024-11-23T16:14:05.6978671' AS DateTime2), CAST(N'2024-11-23T16:14:05.6978672' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (31, 1, N'hinhanhphu\d2.jpg', CAST(N'2024-11-24T16:08:29.5668540' AS DateTime2), CAST(N'2024-11-24T16:08:29.5668548' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (32, 1, N'hinhanhphu\d3.jpg', CAST(N'2024-11-24T16:08:29.5674159' AS DateTime2), CAST(N'2024-11-24T16:08:29.5674161' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (33, 1, N'hinhanhphu\d4.jpg', CAST(N'2024-11-24T16:08:29.5679021' AS DateTime2), CAST(N'2024-11-24T16:08:29.5679021' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (34, 1, N'hinhanhphu\d5.jpg', CAST(N'2024-11-24T16:08:29.5685604' AS DateTime2), CAST(N'2024-11-24T16:08:29.5685605' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (52, 3, N'hinhanhphu\n4.jpg', CAST(N'2024-11-25T06:43:07.2633856' AS DateTime2), CAST(N'2024-11-25T06:43:07.2633861' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (54, 12, N'hinhanhphu\l1.jpg', CAST(N'2024-11-25T12:30:55.4057482' AS DateTime2), CAST(N'2024-11-25T12:30:55.4057489' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (55, 12, N'hinhanhphu\l2.jpg', CAST(N'2024-11-25T12:30:55.4069652' AS DateTime2), CAST(N'2024-11-25T12:30:55.4069665' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (56, 12, N'hinhanhphu\l3.jpg', CAST(N'2024-11-25T12:30:55.4081844' AS DateTime2), CAST(N'2024-11-25T12:30:55.4081845' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (57, 13, N'hinhanhphu\dd.jpg', CAST(N'2024-11-25T12:37:46.1003136' AS DateTime2), CAST(N'2024-11-25T12:37:46.1003140' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (58, 13, N'hinhanhphu\ddd.jpg', CAST(N'2024-11-25T12:37:46.1019246' AS DateTime2), CAST(N'2024-11-25T12:37:46.1019250' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (59, 13, N'hinhanhphu\dddd.jpg', CAST(N'2024-11-25T12:37:46.1027968' AS DateTime2), CAST(N'2024-11-25T12:37:46.1027970' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (60, 13, N'hinhanhphu\ddddd.png', CAST(N'2024-11-25T12:37:46.1042436' AS DateTime2), CAST(N'2024-11-25T12:37:46.1042437' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (61, 14, N'hinhanhphu\mm.jpg', CAST(N'2024-11-25T12:41:38.5665543' AS DateTime2), CAST(N'2024-11-25T12:41:38.5665547' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (62, 14, N'hinhanhphu\mmm.jpg', CAST(N'2024-11-25T12:41:38.5674838' AS DateTime2), CAST(N'2024-11-25T12:41:38.5674840' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (63, 14, N'hinhanhphu\mmmm.jpg', CAST(N'2024-11-25T12:41:38.5683264' AS DateTime2), CAST(N'2024-11-25T12:41:38.5683266' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (64, 14, N'hinhanhphu\mmmmm.jpg', CAST(N'2024-11-25T12:41:38.5692221' AS DateTime2), CAST(N'2024-11-25T12:41:38.5692224' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (65, 15, N'hinhanhphu\rdd.jpg', CAST(N'2024-11-25T12:43:57.6167793' AS DateTime2), CAST(N'2024-11-25T12:43:57.6167795' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (66, 15, N'hinhanhphu\rddd.jpg', CAST(N'2024-11-25T12:43:57.6183186' AS DateTime2), CAST(N'2024-11-25T12:43:57.6183190' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (67, 15, N'hinhanhphu\rdddd.jpg', CAST(N'2024-11-25T12:43:57.6195607' AS DateTime2), CAST(N'2024-11-25T12:43:57.6195612' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (68, 15, N'hinhanhphu\rddddd.jpg', CAST(N'2024-11-25T12:43:57.6207040' AS DateTime2), CAST(N'2024-11-25T12:43:57.6207044' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (69, 16, N'hinhanhphu\ecc.png', CAST(N'2024-11-25T12:47:32.8092219' AS DateTime2), CAST(N'2024-11-25T12:47:32.8092221' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (70, 16, N'hinhanhphu\eccc.jpg', CAST(N'2024-11-25T12:47:32.8105443' AS DateTime2), CAST(N'2024-11-25T12:47:32.8105446' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (71, 16, N'hinhanhphu\ecccc.jpg', CAST(N'2024-11-25T12:47:32.8120186' AS DateTime2), CAST(N'2024-11-25T12:47:32.8120199' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (72, 16, N'hinhanhphu\eccccc.jpg', CAST(N'2024-11-25T12:47:32.8136655' AS DateTime2), CAST(N'2024-11-25T12:47:32.8136661' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (73, 17, N'hinhanhphu\tt.jpeg', CAST(N'2024-11-25T12:50:25.8996855' AS DateTime2), CAST(N'2024-11-25T12:50:25.8996861' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (74, 17, N'hinhanhphu\ttt.jpeg', CAST(N'2024-11-25T12:50:25.9013468' AS DateTime2), CAST(N'2024-11-25T12:50:25.9013475' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (75, 17, N'hinhanhphu\ttttt.jpeg', CAST(N'2024-11-25T12:50:25.9028204' AS DateTime2), CAST(N'2024-11-25T12:50:25.9028210' AS DateTime2))
INSERT [dbo].[hinhanh_sanpham] ([Id], [sanphams_id], [hinhanh], [Created_at], [Updated_at]) VALUES (76, 17, N'hinhanhphu\tttttt.jpeg', CAST(N'2024-11-25T12:50:25.9045285' AS DateTime2), CAST(N'2024-11-25T12:50:25.9045293' AS DateTime2))
SET IDENTITY_INSERT [dbo].[hinhanh_sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[hoadonchitiets] ON 

INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (1, 1, N'2', CAST(360.00 AS Decimal(18, 2)), 2, CAST(N'2024-11-23T16:08:39.7209746' AS DateTime2), CAST(N'2024-11-23T16:08:39.7209746' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (2, 1, N'3', CAST(1500.00 AS Decimal(18, 2)), 5, CAST(N'2024-11-23T16:08:39.7347650' AS DateTime2), CAST(N'2024-11-23T16:08:39.7347651' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (5, 4, N'1', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2024-11-25T12:54:08.9295075' AS DateTime2), CAST(N'2024-11-25T12:54:08.9295076' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (6, 4, N'3', CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-11-25T12:54:08.9411108' AS DateTime2), CAST(N'2024-11-25T12:54:08.9411108' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (7, 4, N'12', CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2024-11-25T12:54:08.9434457' AS DateTime2), CAST(N'2024-11-25T12:54:08.9434458' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (8, 4, N'13', CAST(60.00 AS Decimal(18, 2)), 1, CAST(N'2024-11-25T12:54:08.9460727' AS DateTime2), CAST(N'2024-11-25T12:54:08.9460727' AS DateTime2))
INSERT [dbo].[hoadonchitiets] ([Id], [bill_id], [sanpham_ids], [price], [quantity], [Created_at], [Updated_at]) VALUES (9, 4, N'17', CAST(200.00 AS Decimal(18, 2)), 1, CAST(N'2024-11-25T12:54:08.9481497' AS DateTime2), CAST(N'2024-11-25T12:54:08.9481497' AS DateTime2))
SET IDENTITY_INSERT [dbo].[hoadonchitiets] OFF
GO
SET IDENTITY_INSERT [dbo].[hoadons] ON 

INSERT [dbo].[hoadons] ([Id], [khachhang_id], [total_price], [order_code], [status], [Created_at], [Updated_at]) VALUES (1, 1, CAST(1860.00 AS Decimal(18, 2)), N'MCSXL087', N'Đã giao thành công', CAST(N'2024-11-23T16:08:39.6823386' AS DateTime2), CAST(N'2024-11-23T16:08:39.6823386' AS DateTime2))
INSERT [dbo].[hoadons] ([Id], [khachhang_id], [total_price], [order_code], [status], [Created_at], [Updated_at]) VALUES (4, 4, CAST(860.00 AS Decimal(18, 2)), N'E5FDDWTK', N'Đã giao thành công', CAST(N'2024-11-25T12:54:08.9084583' AS DateTime2), CAST(N'2024-11-25T12:54:08.9084583' AS DateTime2))
SET IDENTITY_INSERT [dbo].[hoadons] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhangs] ON 

INSERT [dbo].[khachhangs] ([Id], [Ten], [Ho], [DiaChiCuThe], [ThanhPho], [Sdt], [EmailDiaChi], [GhiChu], [Created_at], [Updated_at]) VALUES (1, N'Quốc Vũ', N'Dương', N'Xã Tân Thạnh Đông,Củ Chi,Thành phố Hồ Chí Minh ', N'Hồ Chí Minh', N'0778719281', N'quocvu0411@gmail.com', N'', CAST(N'2024-11-23T16:08:39.4866266' AS DateTime2), CAST(N'2024-11-23T16:08:39.4866269' AS DateTime2))
INSERT [dbo].[khachhangs] ([Id], [Ten], [Ho], [DiaChiCuThe], [ThanhPho], [Sdt], [EmailDiaChi], [GhiChu], [Created_at], [Updated_at]) VALUES (4, N'Vũ', N'Dương', N'1/3 đường 106 ấp 10 xã tân thạnh đông huyện củ chi', N'Hồ Chí Minh', N'0778719281', N'quocvu0411@gmail.com', N'', CAST(N'2024-11-25T12:54:08.8164931' AS DateTime2), CAST(N'2024-11-25T12:54:08.8164934' AS DateTime2))
SET IDENTITY_INSERT [dbo].[khachhangs] OFF
GO
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (1, N'Trang chủ', 1, N'/', CAST(N'2024-11-23T15:57:13.3022123' AS DateTime2), CAST(N'2024-11-23T15:57:13.3022125' AS DateTime2))
INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (2, N'Cửa hàng', 2, N'/cuahang', CAST(N'2024-11-23T15:57:23.0827309' AS DateTime2), CAST(N'2024-11-23T15:57:23.0827311' AS DateTime2))
INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (3, N'Giỏ hàng', 3, N'/giohang', CAST(N'2024-11-23T15:57:29.5024054' AS DateTime2), CAST(N'2024-11-23T15:57:29.5024055' AS DateTime2))
INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (4, N'Giới thiệu', 4, N'/gioithieu', CAST(N'2024-11-23T15:57:54.9389900' AS DateTime2), CAST(N'2024-11-23T15:57:54.9389901' AS DateTime2))
INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (5, N'Liên hệ', 5, N'/lienhe', CAST(N'2024-11-23T15:58:03.2519453' AS DateTime2), CAST(N'2024-11-23T15:58:03.2519453' AS DateTime2))
INSERT [dbo].[menu] ([Id], [Name], [Thutuhien], [Url], [Created_at], [Updated_at]) VALUES (6, N'Tra cứu đơn hàng', 6, N'/tracuu', CAST(N'2024-11-23T15:58:14.2768585' AS DateTime2), CAST(N'2024-11-23T15:58:14.2768586' AS DateTime2))
SET IDENTITY_INSERT [dbo].[menu] OFF
GO
SET IDENTITY_INSERT [dbo].[sanphams] ON 

INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (1, N'Dâu tươi Đà Lạt', CAST(250.00 AS Decimal(18, 2)), N'image\dau.jpg', N'Còn hàng', N'kg', 1, CAST(N'2024-11-23T15:48:09.5925981' AS DateTime2), CAST(N'2024-11-23T15:48:09.5925985' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (3, N'Nho Mỹ Xanh ', CAST(300.00 AS Decimal(18, 2)), N'image\n2.jpg', N'Còn hàng', N'kg', 1, CAST(N'2024-11-23T16:06:01.8577560' AS DateTime2), CAST(N'2024-11-23T16:06:01.8577562' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (4, N'Rau cải bẹ xanh', CAST(25.00 AS Decimal(18, 2)), N'image\r1.jpg', N'Còn hàng', N'gram', 2, CAST(N'2024-11-23T16:14:05.6912937' AS DateTime2), CAST(N'2024-11-23T16:14:05.6912943' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (12, N'Lê đường Trung Quốc', CAST(50.00 AS Decimal(18, 2)), N'image\l.jpg', N'Còn hàng', N'kg', 1, CAST(N'2024-11-25T12:30:55.3979452' AS DateTime2), CAST(N'2024-11-25T12:30:55.3979455' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (13, N'Dưa hấu đỏ', CAST(60.00 AS Decimal(18, 2)), N'image\d.jpg', N'Còn hàng', N'2kg', 1, CAST(N'2024-11-25T12:37:46.0975375' AS DateTime2), CAST(N'2024-11-25T12:37:46.0975382' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (14, N'Rau mồng tơi', CAST(15.00 AS Decimal(18, 2)), N'image\m.jpg', N'Còn hàng', N'bó', 2, CAST(N'2024-11-25T12:41:38.5646158' AS DateTime2), CAST(N'2024-11-25T12:41:38.5646161' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (15, N'Rau dền', CAST(14.00 AS Decimal(18, 2)), N'image\rd.jpg', N'Còn hàng', N'bó', 2, CAST(N'2024-11-25T12:43:57.6144394' AS DateTime2), CAST(N'2024-11-25T12:43:57.6144397' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (16, N'Khoai tây đông lạnh ', CAST(80.00 AS Decimal(18, 2)), N'image\ec.jpg', N'Còn hàng', N'phần', 17, CAST(N'2024-11-25T12:47:32.8066750' AS DateTime2), CAST(N'2024-11-25T12:47:32.8066753' AS DateTime2))
INSERT [dbo].[sanphams] ([Id], [Tieude], [Giatien], [Hinhanh], [Trangthai], [don_vi_tinh], [danhmucsanpham_id], [Created_at], [Updated_at]) VALUES (17, N'Táo Gala Mini Pháp ', CAST(200.00 AS Decimal(18, 2)), N'image\t.jpeg', N'Còn hàng', N'kg', 1, CAST(N'2024-11-25T12:50:25.8961012' AS DateTime2), CAST(N'2024-11-25T12:50:25.8961016' AS DateTime2))
SET IDENTITY_INSERT [dbo].[sanphams] OFF
GO
SET IDENTITY_INSERT [dbo].[sanphamsale] ON 

INSERT [dbo].[sanphamsale] ([Id], [sanpham_id], [trangthai], [giasale], [thoigianbatdau], [thoigianketthuc], [Created_at], [Updated_at]) VALUES (5, 4, N'Đang áp dụng', CAST(20.00 AS Decimal(18, 2)), CAST(N'2024-11-25T13:49:00.0000000' AS DateTime2), CAST(N'2024-11-26T13:49:00.0000000' AS DateTime2), CAST(N'2024-11-25T06:49:22.3304703' AS DateTime2), CAST(N'2024-11-25T06:49:22.3304704' AS DateTime2))
SET IDENTITY_INSERT [dbo].[sanphamsale] OFF
GO
SET IDENTITY_INSERT [dbo].[tencuahang] ON 

INSERT [dbo].[tencuahang] ([Id], [Name], [Trangthai], [Created_at], [Updated_at]) VALUES (1, N'Trái cây tươi ', N'đang sử dụng', CAST(N'2024-11-23T15:58:24.2072655' AS DateTime2), CAST(N'2024-11-23T15:58:24.2072658' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tencuahang] OFF
GO
SET IDENTITY_INSERT [dbo].[TenFooter] ON 

INSERT [dbo].[TenFooter] ([Id], [tieude], [phude], [Created_at], [Updated_at]) VALUES (4, N'Trái cây tươi', N'Cam kết 100% trái cây sạch và đã qua kiểm tra', CAST(N'2024-11-25T10:51:16.2103533' AS DateTime2), CAST(N'2024-11-25T10:51:16.2103535' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TenFooter] OFF
GO
ALTER TABLE [dbo].[bannerimages]  WITH CHECK ADD  CONSTRAINT [FK_bannerimages_banners_BannerId] FOREIGN KEY([BannerId])
REFERENCES [dbo].[banners] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bannerimages] CHECK CONSTRAINT [FK_bannerimages_banners_BannerId]
GO
ALTER TABLE [dbo].[chitiets]  WITH CHECK ADD  CONSTRAINT [FK_chitiets_sanphams_sanphams_id] FOREIGN KEY([sanphams_id])
REFERENCES [dbo].[sanphams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitiets] CHECK CONSTRAINT [FK_chitiets_sanphams_sanphams_id]
GO
ALTER TABLE [dbo].[danhgiakhachhangs]  WITH CHECK ADD  CONSTRAINT [FK_danhgiakhachhangs_sanphams_sanphams_id] FOREIGN KEY([sanphams_id])
REFERENCES [dbo].[sanphams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danhgiakhachhangs] CHECK CONSTRAINT [FK_danhgiakhachhangs_sanphams_sanphams_id]
GO
ALTER TABLE [dbo].[FooterImg]  WITH CHECK ADD  CONSTRAINT [FK_FooterImg_TenFooter_Footer_ID] FOREIGN KEY([Footer_ID])
REFERENCES [dbo].[TenFooter] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FooterImg] CHECK CONSTRAINT [FK_FooterImg_TenFooter_Footer_ID]
GO
ALTER TABLE [dbo].[hinhanh_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_hinhanh_sanpham_sanphams_sanphams_id] FOREIGN KEY([sanphams_id])
REFERENCES [dbo].[sanphams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hinhanh_sanpham] CHECK CONSTRAINT [FK_hinhanh_sanpham_sanphams_sanphams_id]
GO
ALTER TABLE [dbo].[hoadonchitiets]  WITH CHECK ADD  CONSTRAINT [FK_hoadonchitiets_hoadons_bill_id] FOREIGN KEY([bill_id])
REFERENCES [dbo].[hoadons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadonchitiets] CHECK CONSTRAINT [FK_hoadonchitiets_hoadons_bill_id]
GO
ALTER TABLE [dbo].[hoadons]  WITH CHECK ADD  CONSTRAINT [FK_hoadons_khachhangs_khachhang_id] FOREIGN KEY([khachhang_id])
REFERENCES [dbo].[khachhangs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadons] CHECK CONSTRAINT [FK_hoadons_khachhangs_khachhang_id]
GO
ALTER TABLE [dbo].[sanphams]  WITH CHECK ADD  CONSTRAINT [FK_sanphams_danhmucsanpham_danhmucsanpham_id] FOREIGN KEY([danhmucsanpham_id])
REFERENCES [dbo].[danhmucsanpham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sanphams] CHECK CONSTRAINT [FK_sanphams_danhmucsanpham_danhmucsanpham_id]
GO
ALTER TABLE [dbo].[sanphamsale]  WITH CHECK ADD  CONSTRAINT [FK_sanphamsale_sanphams_sanpham_id] FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanphams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sanphamsale] CHECK CONSTRAINT [FK_sanphamsale_sanphams_sanpham_id]
GO
