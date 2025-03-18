using Labeeb.Dto.Shared.Enum;

namespace Labeeb.Database.Model;

public class SubjectModel : BaseModel
{
    public string Title { get; set; }
    public GradeType Grade { get; set; }

    public ICollection<ExamModel> Exams { get; set; }
    public ICollection<LessonModel> Lessons { get; set; }
}
