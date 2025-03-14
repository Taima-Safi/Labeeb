using Labeeb.Database.Model;
using Labeeb.Dto.Dto.Lesson;
using Labeeb.Dto.Dto.Subject;
using Labeeb.Dto.Shared.Enum;
using Labeeb.Dto.Shared.Exception;
using Labeeb.Repository.Base;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Labeeb.Service.Subject;

public class SubjectService : ISubjectService
{
    private readonly IBaseRepo<GradeModel> gradeBaseRepo;
    private readonly IBaseRepo<SubjectModel> subjectBaseRepo;
    private readonly IBaseRepo<LessonModel> lessonBaseRepo;

    public SubjectService(IBaseRepo<SubjectModel> subjectBaseRepo, IBaseRepo<GradeModel> gradeBaseRepo, IBaseRepo<LessonModel> lessonBaseRepo)
    {
        this.subjectBaseRepo = subjectBaseRepo;
        this.gradeBaseRepo = gradeBaseRepo;
        this.lessonBaseRepo = lessonBaseRepo;
    }

    #region Subject
    public async Task AddSubjectAsync(string title, GradeType grade)
        => await subjectBaseRepo.AddAsync(new SubjectModel { Title = title, Grade = grade });

    public async Task<List<SubjectDto>> GetAllSubjectAsync(string title, GradeType grade)
    {
        Expression<Func<SubjectModel, bool>> expression = s => s.Grade == grade
        && (string.IsNullOrEmpty(title) || s.Title.Contains(title))
        && s.IsValid;

        var subjects = await subjectBaseRepo.GetAllAsync(expression);

        return subjects.Select(s => new SubjectDto
        {
            Id = s.Id,
            Title = s.Title,
            Grade = s.Grade,
        }).ToList();
    }

    #endregion

    #region Lesson
    public async Task AddLessonAsync(long subjectId, string title, string description)
        => await lessonBaseRepo.AddAsync(new LessonModel { SubjectId = subjectId, Title = title, Description = description });

    public async Task<List<LessonDto>> GetAllLessonAsync(long subjectId, string title, string description)
    {
        if (!await subjectBaseRepo.CheckIfExistAsync(s => s.Id == subjectId))
            throw new NotFoundException("Subject not found.. ");

        Expression<Func<LessonModel, bool>> expression = l => l.SubjectId == subjectId
        && (string.IsNullOrEmpty(description) || l.Description.Contains(description))
        && (string.IsNullOrEmpty(title) || l.Title.Contains(title))
        && l.IsValid;

        var lessons = await lessonBaseRepo.GetAllAsync(expression, x => x.Include(x => x.Subject));

        return lessons.Select(s => new LessonDto
        {
            Id = s.Id,
            Title = s.Title,
            Description = s.Description,
            SubjectTitle = s.Subject.Title,
        }).ToList();
    }
    #endregion
}
