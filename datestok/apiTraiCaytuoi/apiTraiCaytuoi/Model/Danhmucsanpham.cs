﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace apiTraiCaytuoi.Model
{
    [Table("danhmucsanpham")]
    public class Danhmucsanpham : BaseModel
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
