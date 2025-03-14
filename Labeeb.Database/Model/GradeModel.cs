using Labeeb.Dto.Shared.Enum;

namespace Labeeb.Database.Model;

public class GradeModel : BaseModel
{
    public GradeType Grade { get; set; }
}
