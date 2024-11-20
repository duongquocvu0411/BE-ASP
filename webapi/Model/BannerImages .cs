using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using webapi.Model;

namespace webapi.Model
{
    [Table("bannerimages")]
    public class BannerImages : BaseModel
    {
        [Key]
        public int id{ get; set; }
       
        public int BannerId { get; set; }

        public string ImagePath { get; set; }

        [ForeignKey("BannerId")]
       public Bannerts? Banner { get; set; }
    }
}
