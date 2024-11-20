namespace webapi.Model
{
    public class BaseModel
    {
        public DateTime Created_at { get; set; } = DateTime.UtcNow;
        public DateTime Updated_at { get; set; } = DateTime.UtcNow;
    }
}
