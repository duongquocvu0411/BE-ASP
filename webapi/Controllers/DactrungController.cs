using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using webapi.Model;
using System.IO;
using static webapi.DTO.DactrungDTO;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DactrungController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public DactrungController(AppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        // GET: api/Dactrung
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Dactrung>>> GetDactrungs()
        {
            return await _context.Dactrungs.ToListAsync();
        }

        // GET: api/Dactrung/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Dactrung>> GetDactrung(int id)
        {
            var dactrung = await _context.Dactrungs.FindAsync(id);

            if (dactrung == null)
            {
                return NotFound();
            }

            return dactrung;
        }

        // POST: api/Dactrung
        [HttpPost]
        public async Task<ActionResult<Dactrung>> PostDactrung([FromForm] DactrungCreateDTO dto)
        {
            var dactrung = new Dactrung
            {
                Tieude = dto.Tieude,
                Phude = dto.Phude,
                Thutuhienthi = dto.Thutuhienthi,
                Icon = dto.Icon // Gán tên icon thủ công nếu có
            };

            // Xử lý file icon
            if (dto.IconFile != null)
            {
                dactrung.Icon = await SaveIconFileAsync(dto.IconFile);
            }

            _context.Dactrungs.Add(dactrung);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDactrung", new { id = dactrung.ID }, dactrung);
        }
        // PUT: api/Dactrung/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDactrung(int id, [FromForm] DactrungUpdateDTO dto)
        {
            var dactrung = await _context.Dactrungs.FindAsync(id);
            if (dactrung == null)
            {
                return NotFound();
            }

            // Cập nhật các trường từ DTO
            if (!string.IsNullOrEmpty(dto.Tieude))
            {
                dactrung.Tieude = dto.Tieude;
            }
            if (!string.IsNullOrEmpty(dto.Phude))
            {
                dactrung.Phude = dto.Phude;
            }
            if (dto.Thutuhienthi.HasValue && dto.Thutuhienthi > 0)
            {
                dactrung.Thutuhienthi = dto.Thutuhienthi.Value; // Sử dụng `.Value` để lấy giá trị thực của int?
            }
            if (!string.IsNullOrEmpty(dto.Icon))
            {
                dactrung.Icon = dto.Icon; // Cập nhật tên icon thủ công nếu có
            }

            // Xử lý file icon mới (nếu có)
            if (dto.IconFile != null)
            {
                // Xóa icon cũ nếu tồn tại
                if (!string.IsNullOrEmpty(dactrung.Icon))
                {
                    var oldFilePath = Path.Combine(_environment.WebRootPath, dactrung.Icon);
                    if (System.IO.File.Exists(oldFilePath))
                    {
                        System.IO.File.Delete(oldFilePath);
                    }
                }

                dactrung.Icon = await SaveIconFileAsync(dto.IconFile);
            }

            dactrung.Updated_at = DateTime.UtcNow;

            _context.Entry(dactrung).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DactrungExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(dactrung);
        }


        // DELETE: api/Dactrung/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDactrung(int id)
        {
            var dactrung = await _context.Dactrungs.FindAsync(id);
            if (dactrung == null)
            {
                return NotFound();
            }

            // Xóa tệp tin icon nếu có
            if (!string.IsNullOrEmpty(dactrung.Icon))
            {
                var filePath = Path.Combine(_environment.WebRootPath, dactrung.Icon);
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
            }

            _context.Dactrungs.Remove(dactrung);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DactrungExists(int id)
        {
            return _context.Dactrungs.Any(e => e.ID == id);
        }

        // Hàm lưu trữ tệp tin icon vào thư mục wwwroot/icon
        private async Task<string> SaveIconFileAsync(IFormFile iconFile)
        {
            var folderPath = Path.Combine(_environment.WebRootPath, "icon");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            var fileName = $"{Guid.NewGuid()}_{iconFile.FileName}";
            var filePath = Path.Combine(folderPath, fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await iconFile.CopyToAsync(stream);
            }

            return Path.Combine("icon", fileName).Replace("\\", "/");
        }
    }
}
