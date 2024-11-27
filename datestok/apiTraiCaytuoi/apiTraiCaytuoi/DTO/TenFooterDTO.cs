namespace apiTraiCaytuoi.DTO
{
    public class TenFooterDTO
    {
        public class TenFooterPostDto
        {
            public string Tieude { get; set; } // Bắt buộc
            public string Phude { get; set; } // Bắt buộc
           
            public List<IFormFile> Images { get; set; } // Danh sách hình ảnh
            public List<string> Links { get; set; } // Danh sách liên kết cho từng hình ảnh
        }

        public class TenFooterPuttDto
        {
            public string? Tieude { get; set; } 
            public string? Phude { get; set; }
   
            public List<IFormFile>? Images { get; set; }
            public List<string>? Links { get; set; } 
        }

    }
}
