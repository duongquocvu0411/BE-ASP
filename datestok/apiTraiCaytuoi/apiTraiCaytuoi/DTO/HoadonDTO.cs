namespace apiTraiCaytuoi.DTO
{
    public class HoadonDTO
    {
        public class HoaDonDto
        {
            public int KhachHangId { get; set; }
            public List<int> SanphamIds { get; set; }
            public List<int> Quantities { get; set; }
        }
        public class UpdateStatusDto
        {
            public string Status { get; set; }
        }
    }
}
