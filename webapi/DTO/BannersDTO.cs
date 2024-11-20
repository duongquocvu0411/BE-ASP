using System.ComponentModel.DataAnnotations;

namespace webapi.DTO
{
    public class BannersDTO
    {
        public class BannerPostDTO
        {
            [Required]
            public string Tieude { get; set; } = string.Empty;

            [Required]
            public string Phude { get; set; } = string.Empty;

            public List<IFormFile>? Hinhanhs { get; set; } // Nhiều file hình ảnh
        }

        public class BannerPutDTO
        {
            public string? Tieude { get; set; }

            public string? Phude { get; set; }

            public List<IFormFile>? Hinhanhs { get; set; } // Nhiều file hình ảnh
        }
    }
}
