using System.ComponentModel.DataAnnotations;

namespace Labeeb.Database.Model;

public class BaseModel
{
    [Key]
    public long Id { get; set; }
    public bool IsValid { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}
