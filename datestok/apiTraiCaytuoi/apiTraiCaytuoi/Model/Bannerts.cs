using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace apiTraiCaytuoi.Model
{
    [Table("banners")]
    public class Bannerts:BaseModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Tieude { get; set; } = string.Empty;

        [Required]
        public string Phude { get; set; } = string.Empty;

        public string Trangthai { get; set; } = "không sử dụng"; // Giá trị mặc định


        public ICollection<BannerImages> BannerImages { get; set; } = new List<BannerImages>();

    }
}
