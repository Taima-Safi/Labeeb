using Labeeb.Dto.Dto;
using Labeeb.Dto.Shared;

namespace Labeeb.Service.Exam;

public interface IExamService
{
    Task AddExamAsync(string title, List<long> questionIds);
    Task AddManualExamAsync(string title, List<long> lessonIds, QuestionLevel level);
    Task AddQuestionAsync(QuestionFormDto dto);
    Task<List<QuestionDto>> GetQuestionsAsync(List<long> lessonIds, QuestionLevel level);
}
