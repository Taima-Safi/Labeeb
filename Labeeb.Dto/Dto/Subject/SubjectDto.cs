using Labeeb.Dto.Shared.Enum;

namespace Labeeb.Dto.Dto.Subject;

public class SubjectDto
{
    public long Id { get; set; }
    public string Title { get; set; }
    public GradeType Grade { get; set; }
    public List<ExamDto> Exams { get; set; } = [];

    //public List<LessonDto> Lessons { get; set; } = [];
}
