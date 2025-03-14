using Labeeb.Dto.Dto.Lesson;
using Labeeb.Dto.Dto.Subject;
using Labeeb.Dto.Shared.Enum;

namespace Labeeb.Service.Subject;

public interface ISubjectService
{
    #region Subject
    Task AddSubjectAsync(string title, GradeType grade);
    #endregion

    #region Lesson
    Task AddLessonAsync(long subjectId, string title, string description);
    Task<List<LessonDto>> GetAllLessonAsync(long subjectId, string title, string description);
    Task<List<SubjectDto>> GetAllSubjectAsync(string title, GradeType grade);
    #endregion
}
