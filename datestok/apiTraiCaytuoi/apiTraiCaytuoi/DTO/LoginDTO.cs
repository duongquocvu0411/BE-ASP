namespace apiTraiCaytuoi.DTO
{
    public class LoginDTO
    {
        public class LoginRequest
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }
        public class AddRequest
        {
            public string hoten { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
        }
    }
}
