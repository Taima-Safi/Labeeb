namespace Labeeb.Database.Model;

public class ChoiceModel : BaseModel
{
    public string Title { get; set; }
    public bool IsTrue { get; set; }

    public long QuestionId { get; set; }
    public QuestionModel Question { get; set; }
}
