﻿using apiTraiCaytuoi.Model;

namespace apiTraiCaytuoi.Model
{
    public class HoaDonChiTiet_SanPham
    {
        public int HoaDonChiTietId { get; set; }
        public HoaDonChiTiet HoaDonChiTiet { get; set; }

        public int SanphamId { get; set; }
        public Sanpham Sanpham { get; set; }
    }
}
