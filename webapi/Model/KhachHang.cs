using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using webapi.Model;

namespace WebApi.Model
{
    [Table("khachhangs")]
    public class KhachHang :BaseModel
    {
        public int Id { get; set; }

        [Required]
      
        public string Ten { get; set; }

        
        public string Ho { get; set; }
      
        public string DiaChiCuThe { get; set; }
       
        public string ThanhPho { get; set; }
       
        public string Sdt { get; set; }
      
        public string EmailDiaChi { get; set; }
     
        public string GhiChu { get; set; }
    
       
        // Định nghĩa quan hệ một-nhiều với Hóa Đơn (HoaDon)
        public ICollection<HoaDon>? HoaDons { get; set; }
    }
}
