using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace webapi.Migrations
{
    /// <inheritdoc />
    public partial class AddDatbase : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "admins",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Username = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Password = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_admins", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "banners",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tieude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Phude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Trangthai = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_banners", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Dactrungs",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Icon = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Tieude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Phude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Thutuhienthi = table.Column<int>(type: "int", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dactrungs", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "danhmucsanpham",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_danhmucsanpham", x => x.ID);
                });

            migrationBuilder.CreateTable(
                name: "diachichitiets",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Diachi = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Sdt = table.Column<string>(type: "nvarchar(11)", maxLength: 11, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_diachichitiets", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "khachhangs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ten = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Ho = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DiaChiCuThe = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    tinhthanhquanhuyen = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ThanhPho = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    tenThanhpho = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Sdt = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    EmailDiaChi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    GhiChu = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_khachhangs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "lien_hes",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ten = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    sdt = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ghichu = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_lien_hes", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "menu",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Thutuhien = table.Column<int>(type: "int", nullable: false),
                    Url = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_menu", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "tencuahang",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Trangthai = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tencuahang", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TenFooter",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    tieude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    phude = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TenFooter", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "bannerimages",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BannerId = table.Column<int>(type: "int", nullable: false),
                    ImagePath = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_bannerimages", x => x.id);
                    table.ForeignKey(
                        name: "FK_bannerimages_banners_BannerId",
                        column: x => x.BannerId,
                        principalTable: "banners",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "sanphams",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tieude = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Giatien = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Hinhanh = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Trangthai = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    don_vi_tinh = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    danhmucsanpham_id = table.Column<int>(type: "int", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sanphams", x => x.Id);
                    table.ForeignKey(
                        name: "FK_sanphams_danhmucsanpham_danhmucsanpham_id",
                        column: x => x.danhmucsanpham_id,
                        principalTable: "danhmucsanpham",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "hoadons",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    khachhang_id = table.Column<int>(type: "int", nullable: false),
                    total_price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    order_code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_hoadons", x => x.Id);
                    table.ForeignKey(
                        name: "FK_hoadons_khachhangs_khachhang_id",
                        column: x => x.khachhang_id,
                        principalTable: "khachhangs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FooterImg",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Footer_ID = table.Column<int>(type: "int", nullable: false),
                    ImagePath = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    link = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FooterImg", x => x.Id);
                    table.ForeignKey(
                        name: "FK_FooterImg_TenFooter_Footer_ID",
                        column: x => x.Footer_ID,
                        principalTable: "TenFooter",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "chitiets",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sanphams_id = table.Column<int>(type: "int", nullable: false),
                    mo_ta_chung = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    hinh_dang = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    cong_dung = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    xuat_xu = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    khoi_luong = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    bao_quan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    thanh_phan_dinh_duong = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ngay_thu_hoach = table.Column<DateTime>(type: "datetime2", nullable: true),
                    huong_vi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    nong_do_duong = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    bai_viet = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_chitiets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_chitiets_sanphams_sanphams_id",
                        column: x => x.sanphams_id,
                        principalTable: "sanphams",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "danhgiakhachhangs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sanphams_id = table.Column<int>(type: "int", nullable: false),
                    ho_ten = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    tieude = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    so_sao = table.Column<int>(type: "int", nullable: false),
                    noi_dung = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_danhgiakhachhangs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_danhgiakhachhangs_sanphams_sanphams_id",
                        column: x => x.sanphams_id,
                        principalTable: "sanphams",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "hinhanh_sanpham",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sanphams_id = table.Column<int>(type: "int", nullable: false),
                    hinhanh = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_hinhanh_sanpham", x => x.Id);
                    table.ForeignKey(
                        name: "FK_hinhanh_sanpham_sanphams_sanphams_id",
                        column: x => x.sanphams_id,
                        principalTable: "sanphams",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "sanphamsale",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    sanpham_id = table.Column<int>(type: "int", nullable: false),
                    trangthai = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    giasale = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    thoigianbatdau = table.Column<DateTime>(type: "datetime2", nullable: true),
                    thoigianketthuc = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sanphamsale", x => x.Id);
                    table.ForeignKey(
                        name: "FK_sanphamsale_sanphams_sanpham_id",
                        column: x => x.sanpham_id,
                        principalTable: "sanphams",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "hoadonchitiets",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    bill_id = table.Column<int>(type: "int", nullable: false),
                    sanpham_ids = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    quantity = table.Column<int>(type: "int", nullable: false),
                    Created_at = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updated_at = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_hoadonchitiets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_hoadonchitiets_hoadons_bill_id",
                        column: x => x.bill_id,
                        principalTable: "hoadons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_bannerimages_BannerId",
                table: "bannerimages",
                column: "BannerId");

            migrationBuilder.CreateIndex(
                name: "IX_chitiets_sanphams_id",
                table: "chitiets",
                column: "sanphams_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_danhgiakhachhangs_sanphams_id",
                table: "danhgiakhachhangs",
                column: "sanphams_id");

            migrationBuilder.CreateIndex(
                name: "IX_FooterImg_Footer_ID",
                table: "FooterImg",
                column: "Footer_ID");

            migrationBuilder.CreateIndex(
                name: "IX_hinhanh_sanpham_sanphams_id",
                table: "hinhanh_sanpham",
                column: "sanphams_id");

            migrationBuilder.CreateIndex(
                name: "IX_hoadonchitiets_bill_id",
                table: "hoadonchitiets",
                column: "bill_id");

            migrationBuilder.CreateIndex(
                name: "IX_hoadons_khachhang_id",
                table: "hoadons",
                column: "khachhang_id");

            migrationBuilder.CreateIndex(
                name: "IX_sanphams_danhmucsanpham_id",
                table: "sanphams",
                column: "danhmucsanpham_id");

            migrationBuilder.CreateIndex(
                name: "IX_sanphamsale_sanpham_id",
                table: "sanphamsale",
                column: "sanpham_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "admins");

            migrationBuilder.DropTable(
                name: "bannerimages");

            migrationBuilder.DropTable(
                name: "chitiets");

            migrationBuilder.DropTable(
                name: "Dactrungs");

            migrationBuilder.DropTable(
                name: "danhgiakhachhangs");

            migrationBuilder.DropTable(
                name: "diachichitiets");

            migrationBuilder.DropTable(
                name: "FooterImg");

            migrationBuilder.DropTable(
                name: "hinhanh_sanpham");

            migrationBuilder.DropTable(
                name: "hoadonchitiets");

            migrationBuilder.DropTable(
                name: "lien_hes");

            migrationBuilder.DropTable(
                name: "menu");

            migrationBuilder.DropTable(
                name: "sanphamsale");

            migrationBuilder.DropTable(
                name: "tencuahang");

            migrationBuilder.DropTable(
                name: "banners");

            migrationBuilder.DropTable(
                name: "TenFooter");

            migrationBuilder.DropTable(
                name: "hoadons");

            migrationBuilder.DropTable(
                name: "sanphams");

            migrationBuilder.DropTable(
                name: "khachhangs");

            migrationBuilder.DropTable(
                name: "danhmucsanpham");
        }
    }
}
