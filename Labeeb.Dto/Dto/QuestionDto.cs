using Labeeb.Dto.Shared;

namespace Labeeb.Dto.Dto;

public class QuestionDto
{
    public long Id { get; set; }
    public string Title { get; set; }
    public bool? IsTrue { get; set; } // if true false question
    public QuestionLevel Level { get; set; }

    public List<ChoiceDto> Choices { get; set; } = [];
}
