using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using webapi.Model;

namespace webapi.Services
{
    public class SanphamSaleService
    {
        private readonly AppDbContext _dbContext;

        public SanphamSaleService(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task UpdateSalesStatus()
        {
            var expiredSales = await _dbContext.SanphamSales
                .Where(sale => sale.trangthai == "Đang áp dụng" && sale.thoigianketthuc < DateTime.Now)
                .ToListAsync();

            foreach (var sale in expiredSales)
            {
                sale.trangthai = "Không áp dụng";
            }

            if (expiredSales.Any())
            {
                await _dbContext.SaveChangesAsync();
            }
        }
    }
}
