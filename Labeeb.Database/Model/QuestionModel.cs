using Labeeb.Dto.Shared;

namespace Labeeb.Database.Model;

public class QuestionModel : BaseModel
{
    public string Title { get; set; }
    public bool? IsTrue { get; set; } // if true false question
    public QuestionLevel Level { get; set; }

    public long LessonId { get; set; }
    public LessonModel Lesson { get; set; }
    public ICollection<ChoiceModel> Choices { get; set; }
}
