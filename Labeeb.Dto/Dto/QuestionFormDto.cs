namespace Labeeb.Dto.Dto;

public class QuestionFormDto
{
    public string Title { get; set; }
    public bool? IsTrue { get; set; } // if true false question

    public long LessonId { get; set; }
    public List<long> ChoiceIds { get; set; } = [];
}
