using Labeeb.Dto.Dto;
using Labeeb.Dto.Dto.Subject;
using Labeeb.Dto.Shared;
using Labeeb.Dto.Shared.Enum;

namespace Labeeb.Service.Exam;

public interface IExamService
{
    Task AddExamAsync(string title, List<long> questionIds);
    Task AddManualExamAsync(string title, List<long> lessonIds, QuestionLevel level);
    Task AddQuestionAsync(QuestionFormDto dto);
    Task<List<SubjectDto>> GetAllSubjectExamAsync(GradeType grade);
    Task<List<QuestionDto>> GetExamAsync(long examId);
    Task<List<QuestionDto>> GetQuestionsAsync(List<long> lessonIds, QuestionLevel level);
}
