namespace Labeeb.Database.Model;

public class ExamQuestionModel : BaseModel
{
    public long ExamId { get; set; }
    public ExamModel Exam { get; set; }

    public long QuestionId { get; set; }
    public QuestionModel Question { get; set; }
}
