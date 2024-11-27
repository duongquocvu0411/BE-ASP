using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace apiTraiCaytuoi.Model
{
    [Table("chitiets")]
    public class ChiTiet: BaseModel
    {
        [Key]
        public int Id { get; set; }

        //[ForeignKey("sanphams")] 

        public int sanphams_id { get; set; }

   
        public string? mo_ta_chung { get; set; }
       
        public string? hinh_dang { get; set; }

        public string? cong_dung { get; set; }

        public string? xuat_xu { get; set; }

        public string? khoi_luong { get; set; }

        public string? bao_quan { get; set; }

        public string? thanh_phan_dinh_duong { get; set; }

        public DateTime? ngay_thu_hoach { get; set; }


        public string? huong_vi { get; set; }

        public string? nong_do_duong { get; set; }

        public string? bai_viet { get; set; }

        [ForeignKey("sanphams_id")]
        // Quan hệ ngược với Sanpham
        public virtual Sanpham Sanpham { get; set; }
    }
}

