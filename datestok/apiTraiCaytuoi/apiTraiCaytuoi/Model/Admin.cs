using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace apiTraiCaytuoi.Model
{
    [Table("admins")]
    public class Admin : BaseModel
    {
        [Key]
        public int Id { get; set; }

        public string? hoten { get; set; }

        [Required]
       
        public string Username { get; set; }
        [Required]
    
        public string Password { get; set; } // Lưu mật khẩu đã mã hóa
    }
}
