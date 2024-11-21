using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using webapi.DTO;
using webapi.Model;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanphamController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public SanphamController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        private string GetImageUrl(string relativePath)
        {
            var relativePathWithoutRoot = relativePath.Replace("wwwroot\\", "").Replace("wwwroot/", "");
            return $"{Request.Scheme}://{Request.Host}/{relativePathWithoutRoot.Replace("\\", "/")}";
        }

        /// <summary>
        /// Lấy danh sách sản phẩm
        /// </summary>
        /// <returns> Lấy danh sách sản phẩm </returns>

        // GET: api/Sanpham

        [HttpGet]
        public async Task<ActionResult<IEnumerable<object>>> GetSanphams()
        {
            var sanphams = await _context.Sanpham
                .Include(s => s.Danhmucsanpham)
                .Include(s => s.Images)
                .Include(s => s.ChiTiet)
                .Include(s => s.SanphamSales)
                .ToListAsync();

            // Cập nhật Hinhanh cho từng sản phẩm
            foreach (var sanpham in sanphams)
            {
                sanpham.Hinhanh = !string.IsNullOrEmpty(sanpham.Hinhanh) ? GetImageUrl(sanpham.Hinhanh) : string.Empty;
                foreach (var image in sanpham.Images)
                {
                    image.hinhanh = !string.IsNullOrEmpty(image.hinhanh) ? GetImageUrl(image.hinhanh) : string.Empty;
                }
            }

            return Ok(sanphams);
        }


        /// <summary>
        /// Lấy sản phẩm theo {id} xem chi tiết sản phẩm
        /// </summary>
        /// <returns> Lấy sản phẩm theo {id} xem chi tiết sản phẩm </returns>

        // GET: api/Sanpham/{id}

        [HttpGet("{id}")]
        public async Task<ActionResult> GetSanphamById(int id)
        {
            var sanpham = await _context.Sanpham
                .Include(s => s.ChiTiet)
                .Include(s => s.Images)
                .Include(s => s.Danhmucsanpham)
                .Include(s => s.Danhgiakhachhangs)
                .Include(s => s.SanphamSales)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (sanpham == null)
            {
                return NotFound(new { message = "Sản phẩm không tồn tại" });
            }

            // Cập nhật Hinhanh và các đường dẫn ảnh
            sanpham.Hinhanh = !string.IsNullOrEmpty(sanpham.Hinhanh) ? GetImageUrl(sanpham.Hinhanh) : string.Empty;
            foreach (var img in sanpham.Images)
            {
                img.hinhanh = !string.IsNullOrEmpty(img.hinhanh) ? GetImageUrl(img.hinhanh) : string.Empty;
            }

            return Ok(sanpham);
        }





        /// <summary>
        /// Thêm mới sản phẩm
        /// </summary>
        /// <returns>  Thêm mới sản phẩm</returns>

        // POST: api/Sanpham
        [HttpPost]
        public async Task<ActionResult<Sanpham>> PostSanpham([FromForm] SanphamDTO.SanphamCreateRequest request)
        {
            var sanpham = new Sanpham
            {
                Tieude = request.Tieude,
                Giatien = request.Giatien,
                Trangthai = request.Trangthai,
                don_vi_tinh = request.DonViTinh,
                danhmucsanpham_id = request.DanhmucsanphamId
            };

            // Lưu hình ảnh chính nếu có
            if (request.Hinhanh != null)
            {
                var imagePath = Path.Combine(_environment.WebRootPath, "image", request.Hinhanh.FileName);
                using (var stream = new FileStream(imagePath, FileMode.Create))
                {
                    await request.Hinhanh.CopyToAsync(stream);
                }
                sanpham.Hinhanh = Path.Combine("image", request.Hinhanh.FileName);
            }

            // Lưu chi tiết sản phẩm nếu có
            if (request.ChiTiet != null)
            {
                sanpham.ChiTiet = new ChiTiet
                {
                    mo_ta_chung = request.ChiTiet.MoTaChung,
                    hinh_dang = request.ChiTiet.HinhDang,
                    cong_dung = request.ChiTiet.CongDung,
                    xuat_xu = request.ChiTiet.XuatXu,
                    khoi_luong = request.ChiTiet.KhoiLuong,
                    bao_quan = request.ChiTiet.BaoQuan,
                    thanh_phan_dinh_duong = request.ChiTiet.ThanhPhanDinhDuong,
                    ngay_thu_hoach = request.ChiTiet.NgayThuHoach,
                    huong_vi = request.ChiTiet.HuongVi,
                    nong_do_duong = request.ChiTiet.NongDoDuong,
                    bai_viet = request.ChiTiet.BaiViet
                };
            }

            // Lưu hình ảnh phụ nếu có
            if (request.Images != null)
            {
                foreach (var image in request.Images)
                {
                    var imagePath = Path.Combine(_environment.WebRootPath, "hinhanhphu", image.FileName);
                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }
                    sanpham.Images.Add(new HinhAnhSanPham { hinhanh = Path.Combine("hinhanhphu", image.FileName) });
                }
            }

            _context.Sanpham.Add(sanpham);
            await _context.SaveChangesAsync();

            // Lưu thông tin Sale nếu có
            if (request.Sale != null)
            {
                var sale = new Sanphamsale
                {
                    sanpham_id = sanpham.Id,
                    //Giasale = request.Sale.Giasale ?? 0,
                    //Trangthai = request.Sale.Trangthai ?? "Không áp dụng",
                    giasale = request.Sale.Giasale, // Gán giá trị mặc định nếu không có Giasale
                    trangthai = request.Sale.Trangthai, // Mặc định trạng thái là 'inactive'
                    thoigianbatdau = request.Sale.Thoigianbatdau,
                    thoigianketthuc = request.Sale.Thoigianketthuc
                };
                _context.SanphamSales.Add(sale);
                await _context.SaveChangesAsync();
            }

            return CreatedAtAction(nameof(GetSanphams), new { id = sanpham.Id }, sanpham);
        }



        /// <summary>
        ///  Chỉnh sửa sản phẩm theo {id}
        /// </summary>
        /// <returns> Chỉnh sửa sản phẩm theo {id}  </returns>
        // PUT: api/Sanpham/{id} api put sản phẩm
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSanpham(int id, [FromForm] SanphamDTO.SanphamUpdateRequest request)
        {
            // Tìm sản phẩm trong cơ sở dữ liệu
            var sanpham = await _context.Sanpham
                .Include(s => s.ChiTiet)
                .Include(s => s.Images)
                .Include(s => s.SanphamSales) // Bao gồm cả thông tin sale
                .FirstOrDefaultAsync(s => s.Id == id);

            if (sanpham == null)
                return NotFound(new { message = "Sản phẩm không tồn tại" });

            // Cập nhật các trường thông tin sản phẩm
            if (!string.IsNullOrEmpty(request.Tieude)) sanpham.Tieude = request.Tieude;
            if (request.Giatien != 0) sanpham.Giatien = request.Giatien;
            if (!string.IsNullOrEmpty(request.Trangthai)) sanpham.Trangthai = request.Trangthai;
            if (!string.IsNullOrEmpty(request.DonViTinh)) sanpham.don_vi_tinh = request.DonViTinh;
            if (request.DanhmucsanphamId != 0) sanpham.danhmucsanpham_id = request.DanhmucsanphamId;

            // Cập nhật hình ảnh chính
            if (request.Hinhanh != null)
            {
                var imagePath = Path.Combine(_environment.WebRootPath, "image", request.Hinhanh.FileName);
                using (var stream = new FileStream(imagePath, FileMode.Create))
                {
                    await request.Hinhanh.CopyToAsync(stream);
                }
                sanpham.Hinhanh = Path.Combine("image", request.Hinhanh.FileName);
            }

            // Cập nhật chi tiết sản phẩm
            if (request.ChiTiet != null)
            {
                if (sanpham.ChiTiet == null)
                {
                    sanpham.ChiTiet = new ChiTiet();
                    _context.ChiTiets.Add(sanpham.ChiTiet);
                }
                sanpham.ChiTiet.mo_ta_chung = request.ChiTiet.MoTaChung;
                sanpham.ChiTiet.hinh_dang = request.ChiTiet.HinhDang;
                sanpham.ChiTiet.cong_dung = request.ChiTiet.CongDung;
                sanpham.ChiTiet.xuat_xu = request.ChiTiet.XuatXu;
                sanpham.ChiTiet.khoi_luong = request.ChiTiet.KhoiLuong;
                sanpham.ChiTiet.bao_quan = request.ChiTiet.BaoQuan;
                sanpham.ChiTiet.thanh_phan_dinh_duong = request.ChiTiet.ThanhPhanDinhDuong;
                sanpham.ChiTiet.ngay_thu_hoach = request.ChiTiet.NgayThuHoach;
                sanpham.ChiTiet.huong_vi = request.ChiTiet.HuongVi;
                sanpham.ChiTiet.nong_do_duong = request.ChiTiet.NongDoDuong;
                sanpham.ChiTiet.bai_viet = request.ChiTiet.BaiViet;
            }

            // Xóa ảnh phụ cũ và thêm ảnh mới nếu có
            if (sanpham.Images.Any() && request.Images != null)
            {
                _context.HinhAnhSanPhams.RemoveRange(sanpham.Images);
            }
            if (request.Images != null)
            {
                foreach (var image in request.Images)
                {
                    var imagePath = Path.Combine(_environment.WebRootPath, "hinhanhphu", image.FileName);
                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }
                    sanpham.Images.Add(new HinhAnhSanPham { hinhanh = Path.Combine("hinhanhphu", image.FileName) });
                }
            }

            // Xử lý thông tin khuyến mãi
            if (request.Sale != null)
            {
                // Xóa bản ghi khuyến mãi cũ
                if (sanpham.SanphamSales.Any())
                {
                    _context.SanphamSales.RemoveRange(sanpham.SanphamSales);
                }

                // Thêm bản ghi khuyến mãi mới
                var sale = new Sanphamsale
                {
                    sanpham_id = sanpham.Id,
                    //Giasale = request.Sale.Giasale ?? 0,
                    //Trangthai = request.Sale.Trangthai ?? "Không áp dụng",
                    giasale = request.Sale.Giasale,
                    trangthai = request.Sale.Trangthai,
                    thoigianbatdau = request.Sale.Thoigianbatdau,
                    thoigianketthuc = request.Sale.Thoigianketthuc
                };
                _context.SanphamSales.Add(sale);
            }

            // Lưu thay đổi vào cơ sở dữ liệu
            await _context.SaveChangesAsync();

            return Ok(new
            {
                message = "Sản phẩm đã được cập nhật thành công.",
                sanpham
            });
        }




        /// <summary>
        ///  Xóa sản phẩm theo {id}
        /// </summary>
        /// <returns> Xóa sản phẩm theo {id}  </returns>

        // DELETE: api/Sanpham/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSanpham(int id)
        {
            var sanpham = await _context.Sanpham
                .Include(s => s.Images)
                .Include(s => s.ChiTiet)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (sanpham == null)
            {
                return NotFound(new { message = "Sản phẩm không tồn tại" });
            }

            // Xóa ảnh chính
            if (!string.IsNullOrEmpty(sanpham.Hinhanh))
            {
                var mainImagePath = Path.Combine(_environment.WebRootPath, sanpham.Hinhanh);
                if (System.IO.File.Exists(mainImagePath))
                {
                    System.IO.File.Delete(mainImagePath);
                }
            }

            // Xóa ảnh phụ
            if (sanpham.Images.Any())
            {
                foreach (var image in sanpham.Images)
                {
                    var imagePath = Path.Combine(_environment.WebRootPath, image.hinhanh);
                    if (System.IO.File.Exists(imagePath))
                    {
                        System.IO.File.Delete(imagePath);
                    }
                }
            }

            // Xóa chi tiết sản phẩm
            if (sanpham.ChiTiet != null)
            {
                _context.ChiTiets.Remove(sanpham.ChiTiet);
            }

            _context.Sanpham.Remove(sanpham);
            await _context.SaveChangesAsync();

            return NoContent();
        }



        /// <summary>
        ///  Xóa hình ảnh phụ của sản phẩm
        /// </summary>
        /// <returns> Xóa hình ảnh phụ của sản phẩm  </returns>

        // DELETE: api/Sanpham/images/{imageId} api xóa hinhanhphu
        [HttpDelete("images/{imageId}")]
        public async Task<IActionResult> DeleteImage(int imageId)
        {
            // Tìm ảnh phụ theo ID
            var image = await _context.HinhAnhSanPhams.FindAsync(imageId);
            if (image == null)
            {
                return NotFound(new { message = "Ảnh phụ không tồn tại" });
            }

            // Xóa ảnh khỏi thư mục vật lý nếu tồn tại
            var imagePath = Path.Combine(_environment.WebRootPath, image.hinhanh);
            if (System.IO.File.Exists(imagePath))
            {
                System.IO.File.Delete(imagePath);
            }

            // Xóa ảnh khỏi cơ sở dữ liệu
            _context.HinhAnhSanPhams.Remove(image);
            await _context.SaveChangesAsync();

            return NoContent();
        }



        /// <summary>
        /// Lấy sản phẩm theo danh mục {danhmucid} nhưng không bao gồm sản phẩm có sale "Đang áp dụng"
        /// </summary>
        /// <returns>Danh sách sản phẩm theo danh mục nhưng không có sale "Đang áp dụng"</returns>
        [HttpGet("danhmuc-no-active-sale/{danhmucId}")]
        public async Task<ActionResult<IEnumerable<object>>> GetSanphamsByDanhMucWithoutActiveSale(int danhmucId)
        {
            var sanphams = await _context.Sanpham
                .Where(s => s.danhmucsanpham_id == danhmucId)
                .Include(s => s.Danhmucsanpham)
                .Include(s => s.SanphamSales)
                .ToListAsync();

            if (!sanphams.Any())
            {
                return NotFound(new { message = "Không có sản phẩm nào thuộc danh mục này." });
            }

            // Lọc sản phẩm theo các tiêu chí:
            // - Không có sale nào ("SanphamSales.Count == 0")
            // - Hoặc tất cả sale phải có trạng thái "Không áp dụng"
            var result = sanphams
                .Where(s => !s.SanphamSales.Any() || s.SanphamSales.All(sale => sale.trangthai == "Không áp dụng"))
                .Select(s => new
                {
                    s.Id,
                    s.Tieude,
                    s.Giatien,
                    Hinhanh = !string.IsNullOrEmpty(s.Hinhanh) ? GetImageUrl(s.Hinhanh) : string.Empty,
                    s.Trangthai,
                    s.don_vi_tinh,
                    s.danhmucsanpham_id,
                    DanhmucsanphamName = s.Danhmucsanpham?.Name,
                    SanphamSales = s.SanphamSales
                        .Where(sale => sale.trangthai == "Không áp dụng") // Chỉ giữ các sale "Không áp dụng"
                        .Select(sale => new
                        {
                            sale.Id,
                            sale.giasale,
                            sale.thoigianbatdau,
                            sale.thoigianketthuc,
                            sale.trangthai
                        })
                        .ToList()
                })
                .ToList();

            return Ok(result);
        }


        /// <summary>
        ///  lấy Tổng sản phẩm đang có trong bảng
        /// </summary>
        /// <returns> lấy Tổng sản phẩm đang có trong bảng  </returns>

        // GET: api/Sanpham/TongSanPham
        [HttpGet("TongSanPham")]
        public async Task<ActionResult<object>> GetTongSanPham()
        {
            var tongSanPham = await _context.Sanpham.CountAsync();
            return Ok(new { TongSanPham = tongSanPham });
        }


        /// <summary>
        /// thêm mới hình ảnh ở chitiet sản phẩm
        /// </summary>
        /// <returns> thêm mới hình ảnh ở chitiet sản phẩm </returns>

        // API uploadImage dành cho bài viết chi tiết
        [HttpPost("upload-image")]
        public async Task<IActionResult> UploadImage(IFormFile upload)
        {
            if (upload == null || upload.Length == 0)
            {
                return BadRequest(new { uploaded = false, error = new { message = "Không có tệp nào được tải lên" } });
            }

            try
            {
                // Lưu tệp vào thư mục wwwroot/upload
                var uploadPath = Path.Combine(_environment.WebRootPath, "upload");
                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }

                var fileName = $"{DateTime.Now.Ticks}_{upload.FileName}";
                var filePath = Path.Combine(uploadPath, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await upload.CopyToAsync(stream);
                }

                var url = $"{Request.Scheme}://{Request.Host}/upload/{fileName}";

                return Ok(new { uploaded = true, url });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { uploaded = false, error = new { message = "Lỗi khi tải lên tệp", details = ex.Message } });
            }
        }
        /// <summary>
        /// Lấy danh sách sản phẩm và sale không áp dụng hoặc không có sale
        /// </summary>
        /// <returns>Danh sách sản phẩm và sale không áp dụng hoặc không có sale</returns>
        [HttpGet("spkhongsale")]
        public async Task<ActionResult<IEnumerable<object>>> GetSanphamkhongsal()
        {
            // Lấy danh sách sản phẩm và thông tin sale
            var sanphams = await _context.Sanpham
                .Include(s => s.Danhmucsanpham)
                .Include(s => s.SanphamSales) // Include thông tin sale
                .ToListAsync();

            // Lọc và tạo danh sách kết quả
            var result = sanphams.Select(s => new
            {
                s.Id,
                s.Tieude,
                s.Giatien,
                Hinhanh = !string.IsNullOrEmpty(s.Hinhanh) ? GetImageUrl(s.Hinhanh) : string.Empty,
                s.Trangthai,
                s.don_vi_tinh,
                DanhmucsanphamName = s.Danhmucsanpham?.Name,
                SanphamSales = s.SanphamSales
                    .Where(sale => sale.trangthai == "Không áp dụng") // Chỉ giữ các sale "Không áp dụng"
                    .Select(sale => new
                    {
                        sale.Id,
                        sale.giasale,
                        sale.thoigianbatdau,
                        sale.thoigianketthuc,
                        sale.trangthai
                    })
                    .ToList()
            }).ToList();

            // Lọc các sản phẩm:
            // - Hoặc có ít nhất một sale "Không áp dụng"
            // - Hoặc không có sale nào (SanphamSales.Count == 0)
            var filteredResult = result
                .Where(r => r.SanphamSales.Count > 0 || !sanphams.FirstOrDefault(s => s.Id == r.Id)?.SanphamSales.Any() == true)
                .ToList();

            // Trả về kết quả
            return Ok(filteredResult);
        }

        /// <summary>
        /// Lấy danh sách sản phẩm có sale "Đang áp dụng"
        /// </summary>
        /// <returns>Danh sách sản phẩm và sale "Đang áp dụng"</returns>
        [HttpGet("spcosale")]
        public async Task<ActionResult<IEnumerable<object>>> GetsanphamSale()
        {
            // Lấy danh sách sản phẩm và thông tin sale
            var sanphams = await _context.Sanpham
                .Include(s => s.Danhmucsanpham)
                .Include(s => s.SanphamSales) // Include thông tin sale
                .ToListAsync();

            // Lọc và tạo danh sách kết quả
            var result = sanphams
                .Where(s => s.SanphamSales.Any(sale => sale.trangthai == "Đang áp dụng")) // Chỉ giữ sản phẩm có ít nhất một sale "Đang áp dụng"
                .Select(s => new
                {
                    s.Id,
                    s.Tieude,
                    s.Giatien,
                    Hinhanh = !string.IsNullOrEmpty(s.Hinhanh) ? GetImageUrl(s.Hinhanh) : string.Empty,
                    s.Trangthai,
                    s.don_vi_tinh,
                    DanhmucsanphamName = s.Danhmucsanpham?.Name,
                    SanphamSales = s.SanphamSales
                        .Where(sale => sale.trangthai == "Đang áp dụng") // Chỉ giữ các sale "Đang áp dụng"
                        .Select(sale => new
                        {
                            sale.Id,
                            sale.giasale,
                            sale.thoigianbatdau,
                            sale.thoigianketthuc,
                            sale.trangthai
                        })
                        .ToList()
                })
                .ToList();

            // Trả về kết quả
            return Ok(result);
        }

    }

}
