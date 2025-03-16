namespace Labeeb.Database.Model;

public class ExamModel : BaseModel
{
    public string Title { get; set; }
    public long SubjectId { get; set; }
    public SubjectModel Subject { get; set; }
    public ICollection<ExamQuestionModel> ExamQuestions { get; set; }
}
