﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using webapi.Model;
using WebApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    // Định nghĩa các DbSet cho các bảng trong cơ sở dữ liệu
    public DbSet<Danhmucsanpham> Danhmucsanpham { get; set; }
    public DbSet<Diachichitiet> Diachichitiets { get; set; }
    public DbSet<Admin> Admins { get; set; }
    public DbSet<Lienhe> Lienhes { get; set; }
    public DbSet<Sanpham> Sanpham { get; set; }
    public DbSet<ChiTiet> ChiTiets { get; set; }
    public DbSet<HinhAnhSanPham> HinhAnhSanPhams { get; set; }
    public DbSet<DanhGiaKhachHang> DanhGiaKhachHang { get; set; }
    public DbSet<KhachHang> KhachHangs { get; set; }
    public DbSet<HoaDon> HoaDons { get; set; }
    public DbSet<HoaDonChiTiet> HoaDonChiTiets { get; set; }
    public DbSet<Sanphamsale> SanphamSales { get; set; }
    public DbSet<Dactrung> Dactrungs { get; set; }
    public DbSet<Bannerts> Banners { get; set; }
    public DbSet<BannerImages> BannerImages { get; set; }
    public DbSet<Menu> Menus { get; set; }

    public DbSet<Tencuahang> Tencuahangs { get; set; }
    // Cấu hình mối quan hệ và chuyển đổi dữ liệu
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Quan hệ 1-nhiều giữa Banners và BannerImages
        modelBuilder.Entity<BannerImages>()
            .HasOne(bi => bi.Banner) // BannerImages có một Banner
            .WithMany(b => b.BannerImages) // Banner có nhiều BannerImages
            .HasForeignKey(bi => bi.BannerId) // Khóa ngoại từ BannerImages đến Banners
            .OnDelete(DeleteBehavior.Cascade); // Xóa Cascade: Xóa Banner thì xóa BannerImages

        // Quan hệ giữa Sanphamsale và Sanpham
        modelBuilder.Entity<Sanphamsale>()
            .HasOne(sale => sale.Sanpham)
            .WithMany(s => s.SanphamSales)
            .HasForeignKey(sale => sale.sanpham_id)
            .OnDelete(DeleteBehavior.Cascade);


        // Quan hệ KhachHang - HoaDon (một-nhiều)
        modelBuilder.Entity<HoaDon>()
            .HasOne(hd => hd.KhachHang)
            .WithMany(kh => kh.HoaDons)
            .HasForeignKey(hd => hd.khachhang_id)
            .OnDelete(DeleteBehavior.Cascade);

        // Quan hệ HoaDon - HoaDonChiTiet (một-nhiều)
        modelBuilder.Entity<HoaDonChiTiet>()
            .HasOne(hdt => hdt.HoaDon)
            .WithMany(hd => hd.HoaDonChiTiets)
            .HasForeignKey(hdt => hdt.bill_id)
            .OnDelete(DeleteBehavior.Cascade);


        modelBuilder.Entity<Sanpham>()
            .HasOne(s => s.Danhmucsanpham)
            .WithMany()
            .HasForeignKey(s => s.danhmucsanpham_id);

        modelBuilder.Entity<Sanpham>()
            .HasOne(s => s.ChiTiet)
            .WithOne(c => c.Sanpham)
            .HasForeignKey<ChiTiet>(c => c.sanphams_id)
            .OnDelete(DeleteBehavior.Cascade);

        // Quan hệ một-nhiều giữa Sanpham và DanhGiaKhachHang với cascade delete
        modelBuilder.Entity<Sanpham>()
            .HasMany(s => s.Danhgiakhachhangs)
            .WithOne(dg => dg.Sanpham)
            .HasForeignKey(dg => dg.sanphams_id)
            .OnDelete(DeleteBehavior.Cascade);

        base.OnModelCreating(modelBuilder);
    }
}
