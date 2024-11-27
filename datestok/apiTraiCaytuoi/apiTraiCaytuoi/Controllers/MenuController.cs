using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using apiTraiCaytuoi.Model;
using static apiTraiCaytuoi.DTO.MenuDTO;

namespace apiTraiCaytuoi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MenuController : ControllerBase
    {
        private readonly AppDbContext _context;
        public MenuController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Menu
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Menu>>> GetMenus()
        {
            return await _context.Menus.OrderBy(m => m.Thutuhien).ToListAsync();
        }

        // GET: api/Menu/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Menu>> GetMenu(int id)
        {
            var menu = await _context.Menus.FindAsync(id);

            if (menu == null)
            {
                return NotFound();
            }

            return menu;
        }

       
        // POST: api/Menu
        [HttpPost]
        [Authorize]
        public async Task<ActionResult<Menu>> CreateMenu(MenuCreateDTO menuDTO)
        {
            var menu = new Menu
            {
                Name = menuDTO.Name,
                Thutuhien = menuDTO.Thutuhien,
                Url = menuDTO.Url
            };

            _context.Menus.Add(menu);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetMenu), new { id = menu.Id }, menu);
        }

        // PUT: api/Menu/{id}
        [HttpPut("{id}")]
        [Authorize]
        public async Task<IActionResult> UpdateMenu(int id, MenuUpdateDTO menuDTO)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var existingMenu = await _context.Menus.FindAsync(id);
            if (existingMenu == null)
            {
                return NotFound();
            }

            // Chỉ cập nhật các trường không null trong DTO
            if (!string.IsNullOrEmpty(menuDTO.Name))
            {
                existingMenu.Name = menuDTO.Name;
            }
            if (menuDTO.Thutuhien.HasValue)
            {
                existingMenu.Thutuhien = menuDTO.Thutuhien.Value;
            }
            if (!string.IsNullOrEmpty(menuDTO.Url))
            {
                existingMenu.Url = menuDTO.Url;
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MenuExists(id))
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



        // DELETE: api/Menu/{id}
        [HttpDelete("{id}")]
        [Authorize]
        public async Task<IActionResult> DeleteMenu(int id)
        {
            var menu = await _context.Menus.FindAsync(id);
            if (menu == null)
            {
                return NotFound();
            }

            _context.Menus.Remove(menu);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MenuExists(int id)
        {
            return _context.Menus.Any(e => e.Id == id);
        }
    }
}
