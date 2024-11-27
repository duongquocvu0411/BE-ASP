﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using apiTraiCaytuoi.Model;
using static apiTraiCaytuoi.DTO.TenFooterDTO;

namespace apiTraiCaytuoi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TenFooterController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public TenFooterController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        // GET: api/TenFooters
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TenFooters>>> GetTenFooters()
        {
            return await _context.TenFooters
                .Include(tf => tf.FooterIMG)
                .ToListAsync();
        }

        // GET: api/TenFooters/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TenFooters>> GetTenFooter(int id)
        {
            var tenFooter = await _context.TenFooters
                .Include(tf => tf.FooterIMG)
                .FirstOrDefaultAsync(tf => tf.Id == id);

            if (tenFooter == null)
            {
                return NotFound();
            }

            return tenFooter;
        }

        // POST: api/TenFooters
        [HttpPost]
        public async Task<IActionResult> PostTenFooter([FromForm] TenFooterPostDto dto)
        {
            var tenFooter = new TenFooters
            {
                tieude = dto.Tieude,
                phude = dto.Phude
            };

            if (dto.Images != null && dto.Images.Count > 0)
            {
                for (int i = 0; i < dto.Images.Count; i++)
                {
                    var image = dto.Images[i];
                    var link = dto.Links != null && dto.Links.Count > i ? dto.Links[i] : null;

                    // Lấy phần mở rộng của tệp ảnh gốc (ví dụ: .jpg, .png, v.v.)
                    var fileExtension = Path.GetExtension(image.FileName);

                    // Tạo một chuỗi duy nhất bằng GUID và kết hợp với phần mở rộng của tệp
                    var uniqueFileName = Guid.NewGuid().ToString("N") + fileExtension;

                    var filePath = Path.Combine(_environment.WebRootPath, "footer", uniqueFileName);
                    Directory.CreateDirectory(Path.GetDirectoryName(filePath));

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    tenFooter.FooterIMG.Add(new FooterImgs
                    {
                        ImagePath = $"/footer/{uniqueFileName}",
                        link = link
                    });
                }
            }



            _context.TenFooters.Add(tenFooter);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTenFooter", new { id = tenFooter.Id }, tenFooter);
        }


        // PUT: api/TenFooters/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTenFooter(int id, [FromForm] TenFooterPuttDto dto)
        {
            var existingTenFooter = await _context.TenFooters
                .Include(tf => tf.FooterIMG)
                .FirstOrDefaultAsync(tf => tf.Id == id);

            if (existingTenFooter == null)
            {
                return NotFound();
            }

            // Update basic fields (nếu DTO có giá trị)
            if (!string.IsNullOrWhiteSpace(dto.Tieude))
            {
                existingTenFooter.tieude = dto.Tieude;
            }
            if (!string.IsNullOrWhiteSpace(dto.Phude))
            {
                existingTenFooter.phude = dto.Phude;
            }

            // Handle images
            if (dto.Images != null && dto.Images.Count > 0)
            {
                for (int i = 0; i < dto.Images.Count; i++)
                {
                    var image = dto.Images[i];
                    var link = dto.Links != null && dto.Links.Count > i ? dto.Links[i] : null;

                    // Lấy phần mở rộng của tệp ảnh gốc (ví dụ: .jpg, .png, v.v.)
                    var fileExtension = Path.GetExtension(image.FileName);

                    // Tạo một chuỗi duy nhất bằng GUID và kết hợp với phần mở rộng của tệp
                    var uniqueFileName = Guid.NewGuid().ToString("N") + fileExtension;

                    var filePath = Path.Combine(_environment.WebRootPath, "footer", uniqueFileName);
                    Directory.CreateDirectory(Path.GetDirectoryName(filePath));

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    // Cập nhật thông tin hình ảnh vào đối tượng
                    existingTenFooter.FooterIMG.Add(new FooterImgs
                    {
                        ImagePath = $"/footer/{uniqueFileName}",
                        link = link
                    });
                }
            }

            _context.Entry(existingTenFooter).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TenFooterExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }


        // DELETE: api/TenFooters/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTenFooter(int id)
        {
            var tenFooter = await _context.TenFooters
                .Include(tf => tf.FooterIMG)
                .FirstOrDefaultAsync(tf => tf.Id == id);

            if (tenFooter == null)
            {
                return NotFound();
            }

            // Delete images
            foreach (var img in tenFooter.FooterIMG)
            {
                var filePath = Path.Combine(_environment.WebRootPath, img.ImagePath.TrimStart('/'));
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
            }

            _context.TenFooters.Remove(tenFooter);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        [HttpDelete("DeleteImage/{imageId}")]
        public async Task<IActionResult> DeleteImage(int imageId)
        {
            // Tìm hình ảnh theo ID
            var image = await _context.FooterImgs.FindAsync(imageId);

            if (image == null)
            {
                return NotFound("Hình ảnh không tồn tại.");
            }

            // Xóa file hình ảnh khỏi thư mục `wwwroot/footer`
            var filePath = Path.Combine(_environment.WebRootPath, image.ImagePath.TrimStart('/'));
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }

            // Xóa bản ghi trong cơ sở dữ liệu
            _context.FooterImgs.Remove(image);
            await _context.SaveChangesAsync();

            return Ok("Xóa hình ảnh thành công.");
        }

        private bool TenFooterExists(int id)
        {
            return _context.TenFooters.Any(e => e.Id == id);
        }
    }
}
