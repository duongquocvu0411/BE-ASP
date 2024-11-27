using apiTraiCaytuoi.Model;

namespace apiTraiCaytuoi.DTO
{
    public class DactrungDTO 
    {
        public class DactrungCreateDTO
        {
            public string Tieude { get; set; }
            public string Phude { get; set; }
            public int Thutuhienthi { get; set; }
            public IFormFile IconFile { get; set; } // File icon upload
            //public string Icon { get; set; } // Tên icon (nếu cần điền thủ công)
        }
        public class DactrungUpdateDTO 
        {
            public string? Tieude { get; set; }
            public string? Phude { get; set; }
            public int? Thutuhienthi { get; set; }
            public IFormFile? IconFile { get; set; } // File icon upload
            //public string? Icon { get; set; } // Tên icon (nếu cần điền thủ công)
        }
    }
}
