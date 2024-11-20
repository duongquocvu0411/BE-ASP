-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2024 lúc 05:47 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `api`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$AYhAKNWu5GreXLZADcX9R.DYvzJ8SMeOoStWsGRuncGNu7tn4Ab6m', '2024-10-07 03:11:49', '2024-10-07 03:11:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bannerimages`
--

CREATE TABLE `bannerimages` (
  `Id` int(11) NOT NULL,
  `BannerId` int(11) NOT NULL,
  `ImagePath` varchar(255) NOT NULL,
  `Created_at` timestamp NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bannerimages`
--

INSERT INTO `bannerimages` (`Id`, `BannerId`, `ImagePath`, `Created_at`, `Updated_at`) VALUES
(31, 11, 'banners/ebb972ed-9d2e-4ee8-971e-a5103c2b36cf_best-product-3.jpg', '2024-11-19 20:07:12', '2024-11-19 20:07:12'),
(32, 11, 'banners/a8ccf5c6-9051-4ee1-b146-3b035c7c3182_best-product-1.jpg', '2024-11-19 20:07:38', '2024-11-19 20:07:38'),
(33, 11, 'banners/7a291924-526b-4f24-8984-c30a33bad373_best-product-5.jpg', '2024-11-19 20:08:08', '2024-11-19 20:08:08'),
(34, 11, 'banners/bcd16ec1-f858-40c5-b35b-80e29916c28f_best-product-2.jpg', '2024-11-19 20:08:08', '2024-11-19 20:08:08'),
(35, 11, 'banners/0f2e5b92-b5fb-4143-be0d-914832d4670c_baner-1.png', '2024-11-19 20:08:08', '2024-11-19 20:08:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `phude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `tieude`, `phude`, `created_at`, `updated_at`) VALUES
(11, 'Trái cây tươi  2345', 'Cam kết 100% trái cây tươi & sạch', '2024-11-19 19:56:42', '2024-11-19 21:15:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiets`
--

CREATE TABLE `chitiets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sanphams_id` bigint(20) UNSIGNED NOT NULL,
  `mo_ta_chung` text DEFAULT NULL,
  `hinh_dang` text DEFAULT NULL,
  `cong_dung` text DEFAULT NULL,
  `xuat_xu` text DEFAULT NULL,
  `khoi_luong` text DEFAULT NULL,
  `bao_quan` text DEFAULT NULL,
  `thanh_phan_dinh_duong` text DEFAULT NULL,
  `ngay_thu_hoach` text DEFAULT NULL,
  `huong_vi` text DEFAULT NULL,
  `nong_do_duong` text DEFAULT NULL,
  `bai_viet` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiets`
--

INSERT INTO `chitiets` (`id`, `sanphams_id`, `mo_ta_chung`, `hinh_dang`, `cong_dung`, `xuat_xu`, `khoi_luong`, `bao_quan`, `thanh_phan_dinh_duong`, `ngay_thu_hoach`, `huong_vi`, `nong_do_duong`, `bai_viet`, `created_at`, `updated_at`) VALUES
(87, 136, 'asda', 'sdas', 'dasd', 'asd', 'asd', 'asdas', 'dasd', '2024-11-20 00:00:00.000000', 'asdas', 'dasd', '<p><strong>sadasdasdasd</strong></p><figure class=\"image\"><img style=\"aspect-ratio:500/400;\" src=\"https://localhost:7297/upload/638677426847410164_featur-2.jpg\" width=\"500\" height=\"400\"></figure>', '2024-11-20 09:38:07', '2024-11-20 09:38:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dactrungs`
--

CREATE TABLE `dactrungs` (
  `Id` int(11) NOT NULL,
  `Icon` varchar(255) NOT NULL,
  `Tieude` varchar(255) NOT NULL,
  `Phude` varchar(255) NOT NULL,
  `Thutuhienthi` int(11) NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `Updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dactrungs`
--

INSERT INTO `dactrungs` (`Id`, `Icon`, `Tieude`, `Phude`, `Thutuhienthi`, `Created_at`, `Updated_at`) VALUES
(18, 'icon/927b3f31-2014-4e55-bf2e-983af953841e_050430a4-aa09-4343-8455-90089a2b990f.webp', 'Miễn Phí Vận Chuyển - Nhận Ngay Hôm Nay!', 'Đặt hàng ngay hôm nay và tận hưởng dịch vụ vận chuyển miễn phí cho mọi đơn hàng. Tiết kiệm thời gian, chi phí, và trải nghiệm mua sắm thuận tiện nhất!', 1, '2024-11-18 16:18:33', '2024-11-20 03:20:44'),
(19, 'icon/1c768f3c-b5fd-4980-b618-f402e54e3079_0f8865dc-a9b9-4519-b52e-d666e186f11c.webp', 'Cam Kết Hoàn Trả Dễ Dàng', 'Nếu sản phẩm không đạt yêu cầu, chúng tôi cam kết hoàn trả hoặc đổi mới trong vòng 7 ngày. Sản phẩm trái cây luôn tươi mới, hài lòng 100%!', 2, '2024-11-18 16:29:46', '2024-11-20 03:20:50'),
(20, 'icon/7fd67fb5-c3e6-4caf-9bd3-550742591148_0a287c55-8129-4909-9621-acd7a9b7979b.webp', 'Trái Cây Tươi Mới, Chất Lượng Đảm Bảo', 'Chúng tôi cam kết cung cấp trái cây tươi ngon, chọn lọc kỹ càng từ các vườn trái cây uy tín. Sản phẩm luôn giữ được độ tươi mới, mang lại hương vị tự nhiên nhất cho bạn!', 2, '2024-11-18 16:29:58', '2024-11-20 03:20:37'),
(21, 'icon/a32973fb-6595-46d4-bc57-aa3756d5dca0_th.jpg', 'Trái Cây Tươi Sạch, Không Sử Dụng Hóa Chất', 'Chúng tôi cam kết cung cấp trái cây hoàn toàn tự nhiên, không sử dụng hóa chất bảo quản, mang đến sản phẩm an toàn cho sức khỏe. Bạn hoàn toàn yên tâm khi lựa chọn trái cây từ chúng tôi! ', 4, '2024-11-20 03:25:02', '2024-11-20 03:25:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgiakhachhangs`
--

CREATE TABLE `danhgiakhachhangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sanphams_id` bigint(20) UNSIGNED NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `tieude` varchar(255) DEFAULT NULL,
  `so_sao` int(11) NOT NULL DEFAULT 5,
  `noi_dung` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgiakhachhangs`
--

INSERT INTO `danhgiakhachhangs` (`id`, `sanphams_id`, `ho_ten`, `tieude`, `so_sao`, `noi_dung`, `created_at`, `updated_at`) VALUES
(62, 136, 'asd', 'asd', 5, 'asd', '2024-11-20 09:43:28', '2024-11-20 09:43:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucsanpham`
--

CREATE TABLE `danhmucsanpham` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucsanpham`
--

INSERT INTO `danhmucsanpham` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Trái cây tươi', '2024-10-01 03:39:08', '2024-10-19 01:03:46'),
(2, 'rau củ', '2024-10-01 03:39:13', '2024-10-01 03:39:13'),
(3, 'Combo rau ', '2024-10-02 02:23:32', '2024-10-02 02:23:32'),
(5, 'Combo Trái Cây Tươi', '2024-10-04 04:05:16', '2024-10-06 02:48:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diachichitiets`
--

CREATE TABLE `diachichitiets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `diachi` varchar(255) NOT NULL DEFAULT 'No address provided',
  `email` varchar(255) NOT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT 'không sử dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diachichitiets`
--

INSERT INTO `diachichitiets` (`id`, `diachi`, `email`, `sdt`, `created_at`, `updated_at`, `status`) VALUES
(3, 'Hóc môn', 'adminhocmon@gmail.com', '0778719281', '2024-10-14 23:57:27', '2024-10-18 04:57:07', 'đang sử dụng'),
(26, 'Củ Chi,Thành phố Hồ Chí Minh ', 'admin@gmail.com', '0778719281', '2024-11-19 20:28:30', '2024-11-19 20:28:30', 'không sử dụng'),
(27, 'string', 'user@example.com', 'string', '2024-11-20 01:45:45', '2024-11-20 01:45:45', 'string'),
(30, 'string', 'use2r@example.com', 'string', '2024-11-20 01:45:45', '2024-11-20 01:45:45', 'không sử dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh_sanpham`
--

CREATE TABLE `hinhanh_sanpham` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sanphams_id` bigint(20) UNSIGNED NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanh_sanpham`
--

INSERT INTO `hinhanh_sanpham` (`id`, `sanphams_id`, `hinhanh`, `created_at`, `updated_at`) VALUES
(138, 136, 'hinhanhphu\\featur-2.jpg', '2024-11-20 09:38:07', '2024-11-20 09:38:07'),
(139, 136, 'hinhanhphu\\featur-2.jpg', '2024-11-20 09:38:07', '2024-11-20 09:38:07'),
(140, 137, 'hinhanhphu\\best-product-1.jpg', '2024-11-20 09:38:53', '2024-11-20 09:38:53'),
(141, 137, 'hinhanhphu\\best-product-1.jpg', '2024-11-20 09:38:53', '2024-11-20 09:38:53'),
(142, 137, 'hinhanhphu\\best-product-1.jpg', '2024-11-20 09:38:53', '2024-11-20 09:38:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonchitiets`
--

CREATE TABLE `hoadonchitiets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `sanpham_ids` text NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadonchitiets`
--

INSERT INTO `hoadonchitiets` (`id`, `bill_id`, `sanpham_ids`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(213, 117, '133', 1, 350.000, '2024-11-19 20:52:39', '2024-11-19 20:52:39'),
(214, 118, '133', 1, 350.000, '2024-11-20 08:42:57', '2024-11-20 08:42:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadons`
--

CREATE TABLE `hoadons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `khachhang_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(15,3) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Chờ xử lý',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadons`
--

INSERT INTO `hoadons` (`id`, `order_code`, `khachhang_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(117, 'EU2B1LZN', 116, 350.000, 'Chờ xử lý', '2024-11-19 20:52:39', '2024-11-19 20:52:39'),
(118, '8OUQCWYQ', 117, 350.000, 'Chờ xử lý', '2024-11-20 08:42:57', '2024-11-20 08:42:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhangs`
--

CREATE TABLE `khachhangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(255) NOT NULL,
  `ho` varchar(255) NOT NULL,
  `diachicuthe` varchar(255) NOT NULL,
  `thanhpho` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `Emaildiachi` varchar(255) NOT NULL,
  `ghichu` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhangs`
--

INSERT INTO `khachhangs` (`id`, `ten`, `ho`, `diachicuthe`, `thanhpho`, `sdt`, `Emaildiachi`, `ghichu`, `created_at`, `updated_at`) VALUES
(116, 'asd', 'asd', '1/3', 'Hà Nội', '0123456789', '123456789abc@gmail.com', '', '2024-11-19 20:52:39', '2024-11-19 20:52:39'),
(117, 'asd', 'asdasd', '123', 'Hà Nội', '12321321312', 'asdsadas@gmail.com', '', '2024-11-20 08:42:57', '2024-11-20 08:42:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_hes`
--

CREATE TABLE `lien_hes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ten` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `ghichu` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lien_hes`
--

INSERT INTO `lien_hes` (`id`, `ten`, `email`, `sdt`, `ghichu`, `created_at`, `updated_at`) VALUES
(30, 'usetr', 'e@gmail.com', '1234567891', 'asdddddddddddddddddddddddddddddddddddddddddddddd', '2024-11-19 20:28:54', '2024-11-19 20:28:54'),
(31, 'asdasd', 'asdsadas@gmail.com', '12321321312', 'as', '2024-11-20 08:49:11', '2024-11-20 08:49:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thutuhien` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `thutuhien`, `created_at`, `updated_at`) VALUES
(1, 'Trang chủ', '/', 1, '2024-11-20 02:39:50', '2024-11-20 09:59:43'),
(2, 'Cửa hàng', '/cuahang', 2, '2024-11-20 02:39:50', '2024-11-20 15:42:39'),
(3, 'Giỏ hàng', '/giohang', 3, '2024-11-20 02:39:50', '2024-11-20 15:42:30'),
(4, 'Giới thiệu', '/gioithieu', 4, '2024-11-20 02:39:50', '2024-11-20 02:39:50'),
(5, 'Liên hệ', '/lienhe', 5, '2024-11-20 02:39:50', '2024-11-20 02:39:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2024_09_20_113610_create_khachhangs_table', 2),
(8, '2024_09_23_081627_create_khach_hang_table', 3),
(9, '2024_09_23_082024_create_hoa_don_table', 3),
(10, '2024_09_23_082053_create_hoa_doan_chitiet_table', 3),
(20, '2014_10_12_000000_create_users_table', 4),
(21, '2014_10_12_100000_create_password_reset_tokens_table', 4),
(22, '2019_08_19_000000_create_failed_jobs_table', 4),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(24, '2024_09_19_122329_create_sanphams_table', 4),
(25, '2024_09_19_122421_create_danhsachsanpham_table', 4),
(26, '2024_10_01_090511_create_diachichitiets_table', 4),
(27, '2024_10_01_095838_create_lien_hes_table', 4),
(28, '2024_10_02_110351_create_khachhangs_table', 5),
(29, '2024_10_02_110352_create_hoadons_table', 6),
(30, '2024_10_02_110637_create_hoadonchitiets_table', 7),
(31, '2024_10_02_112632_create_hoadonchitiets_table', 8),
(32, '2024_10_03_101717_add_order_code_to_hoadons_table', 9),
(33, '2024_10_03_103320_add_order_code_to_hoadons_table', 10),
(34, '2024_10_03_110357_add_status_to_hoadons_table', 11),
(35, '2024_10_04_042712_add_quantity_to_hoadonchitiets_table', 12),
(36, '2024_10_04_051846_add_quantity_to_hoadonchitiets_table', 13),
(37, '2024_10_04_063144_add_quantity_to_hoadonchitiets_table', 14),
(38, '2024_10_04_090208_create_doanhthu_table', 15),
(39, '2024_10_04_092656_create_doanhthu_table', 16),
(40, '2024_10_04_094443_create_danhthus_table', 17),
(41, '2024_10_07_100634_create_admins_table', 18),
(42, '2024_10_08_030010_create_chitiets_table', 19),
(43, '2024_10_08_031208_create_chitiets_table', 20),
(44, '2024_10_10_003430_add_bai-viet_to_chitiets_table', 21),
(45, '2024_10_10_013414_create_danhgiakhachhangs_table', 22),
(46, '2024_10_12_144402_create_hinhanhs_sanphams_table', 23),
(47, '2024_10_12_151242_create_product_images_table', 24),
(48, '2024_10_18_094815_create_gioithieus_table', 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphams`
--

CREATE TABLE `sanphams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `giatien` decimal(8,3) NOT NULL,
  `don_vi_tinh` varchar(50) DEFAULT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `trangthai` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `danhmucsanpham_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphams`
--

INSERT INTO `sanphams` (`id`, `tieude`, `giatien`, `don_vi_tinh`, `hinhanh`, `trangthai`, `created_at`, `updated_at`, `danhmucsanpham_id`) VALUES
(136, 'Dâu Đà lạt', 350.000, 'kg', 'image\\featur-2.jpg', 'Còn hàng', '2024-11-20 09:38:07', '2024-11-20 09:38:07', 1),
(137, 'Cam', 250.000, 'kg', 'image\\best-product-1.jpg', 'Còn hàng', '2024-11-20 09:38:53', '2024-11-20 09:38:53', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphamsale`
--

CREATE TABLE `sanphamsale` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sanpham_id` bigint(20) UNSIGNED NOT NULL,
  `trangthai` varchar(255) NOT NULL,
  `giasale` decimal(10,2) NOT NULL,
  `thoigianbatdau` datetime DEFAULT NULL,
  `thoigianketthuc` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphamsale`
--

INSERT INTO `sanphamsale` (`id`, `sanpham_id`, `trangthai`, `giasale`, `thoigianbatdau`, `thoigianketthuc`, `created_at`, `updated_at`) VALUES
(54, 137, 'Đang áp dụng', 200.00, '2024-11-20 23:38:00', '2024-11-21 23:38:00', '2024-11-20 09:39:03', '2024-11-20 09:39:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tencuahang`
--

CREATE TABLE `tencuahang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `trangthai` varchar(50) NOT NULL DEFAULT 'không sử dụng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tencuahang`
--

INSERT INTO `tencuahang` (`id`, `name`, `trangthai`, `created_at`, `updated_at`) VALUES
(2, 'Trái cây tươi ', 'đang sử dụng', '2024-11-20 01:51:56', '2024-11-20 09:15:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Chỉ mục cho bảng `bannerimages`
--
ALTER TABLE `bannerimages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BannerId` (`BannerId`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitiets`
--
ALTER TABLE `chitiets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chitiets_sanphams_id_foreign` (`sanphams_id`);

--
-- Chỉ mục cho bảng `dactrungs`
--
ALTER TABLE `dactrungs`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `danhgiakhachhangs`
--
ALTER TABLE `danhgiakhachhangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danhgiakhachhangs_sanphams_id_foreign` (`sanphams_id`);

--
-- Chỉ mục cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `diachichitiets`
--
ALTER TABLE `diachichitiets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diachichitiets_email_unique` (`email`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `hinhanh_sanpham`
--
ALTER TABLE `hinhanh_sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_sanphams_id_foreign` (`sanphams_id`);

--
-- Chỉ mục cho bảng `hoadonchitiets`
--
ALTER TABLE `hoadonchitiets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoadonchitiets_bill_id_foreign` (`bill_id`);

--
-- Chỉ mục cho bảng `hoadons`
--
ALTER TABLE `hoadons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoadons_khachhang_id_foreign` (`khachhang_id`);

--
-- Chỉ mục cho bảng `khachhangs`
--
ALTER TABLE `khachhangs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `sanphams`
--
ALTER TABLE `sanphams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanphams_danhsachsanpham_id_foreign` (`danhmucsanpham_id`);

--
-- Chỉ mục cho bảng `sanphamsale`
--
ALTER TABLE `sanphamsale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_id` (`sanpham_id`);

--
-- Chỉ mục cho bảng `tencuahang`
--
ALTER TABLE `tencuahang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bannerimages`
--
ALTER TABLE `bannerimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `chitiets`
--
ALTER TABLE `chitiets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `dactrungs`
--
ALTER TABLE `dactrungs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `danhgiakhachhangs`
--
ALTER TABLE `danhgiakhachhangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `diachichitiets`
--
ALTER TABLE `diachichitiets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hinhanh_sanpham`
--
ALTER TABLE `hinhanh_sanpham`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT cho bảng `hoadonchitiets`
--
ALTER TABLE `hoadonchitiets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT cho bảng `hoadons`
--
ALTER TABLE `hoadons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT cho bảng `khachhangs`
--
ALTER TABLE `khachhangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `lien_hes`
--
ALTER TABLE `lien_hes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT cho bảng `sanphams`
--
ALTER TABLE `sanphams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT cho bảng `sanphamsale`
--
ALTER TABLE `sanphamsale`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `tencuahang`
--
ALTER TABLE `tencuahang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bannerimages`
--
ALTER TABLE `bannerimages`
  ADD CONSTRAINT `bannerimages_ibfk_1` FOREIGN KEY (`BannerId`) REFERENCES `banners` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chitiets`
--
ALTER TABLE `chitiets`
  ADD CONSTRAINT `chitiets_sanphams_id_foreign` FOREIGN KEY (`sanphams_id`) REFERENCES `sanphams` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danhgiakhachhangs`
--
ALTER TABLE `danhgiakhachhangs`
  ADD CONSTRAINT `danhgiakhachhangs_sanphams_id_foreign` FOREIGN KEY (`sanphams_id`) REFERENCES `sanphams` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinhanh_sanpham`
--
ALTER TABLE `hinhanh_sanpham`
  ADD CONSTRAINT `product_images_sanphams_id_foreign` FOREIGN KEY (`sanphams_id`) REFERENCES `sanphams` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoadonchitiets`
--
ALTER TABLE `hoadonchitiets`
  ADD CONSTRAINT `hoadonchitiets_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `hoadons` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoadons`
--
ALTER TABLE `hoadons`
  ADD CONSTRAINT `hoadons_khachhang_id_foreign` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhangs` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `sanphams`
--
ALTER TABLE `sanphams`
  ADD CONSTRAINT `sanphams_danhsachsanpham_id_foreign` FOREIGN KEY (`danhmucsanpham_id`) REFERENCES `danhmucsanpham` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `sanphamsale`
--
ALTER TABLE `sanphamsale`
  ADD CONSTRAINT `sanphamsale_ibfk_1` FOREIGN KEY (`sanpham_id`) REFERENCES `sanphams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
