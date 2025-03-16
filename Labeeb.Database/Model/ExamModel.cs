namespace Labeeb.Database.Model;

public class ExamModel : BaseModel
{
    public string Title { get; set; }
    public ICollection<QuestionModel> Questions { get; set; }
}
