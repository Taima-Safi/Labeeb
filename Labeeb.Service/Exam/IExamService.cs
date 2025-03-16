using Labeeb.Dto.Dto;
using Labeeb.Dto.Shared;

namespace Labeeb.Service.Exam;

public interface IExamService
{
    Task AddQuestionAsync(QuestionFormDto dto);
    Task<List<QuestionDto>> GetQuestionsAsync(List<long> lessonIds, QuestionLevel level);
}
