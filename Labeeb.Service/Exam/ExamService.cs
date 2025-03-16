using Labeeb.Database.Model;
using Labeeb.Dto.Dto;
using Labeeb.Dto.Shared;
using Labeeb.Dto.Shared.Exception;
using Labeeb.Repository.Base;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Labeeb.Service.Exam;

public class ExamService : IExamService
{
    private readonly IBaseRepo<QuestionModel> questionBaseRepo;
    private readonly IBaseRepo<ChoiceModel> choiceBaseRepo;
    private readonly IBaseRepo<ExamQuestionModel> examQuestionBaseRepo;
    private readonly IBaseRepo<ExamModel> examBaseRepo;
    private readonly IBaseRepo<LessonModel> lessonBaseRepo;

    public ExamService(IBaseRepo<QuestionModel> questionBaseRepo, IBaseRepo<ChoiceModel> choiceBaseRepo, IBaseRepo<LessonModel> lessonBaseRepo, IBaseRepo<ExamModel> examBaseRepo, IBaseRepo<ExamQuestionModel> examQuestionBaseRepo)
    {
        this.questionBaseRepo = questionBaseRepo;
        this.choiceBaseRepo = choiceBaseRepo;
        this.lessonBaseRepo = lessonBaseRepo;
        this.examBaseRepo = examBaseRepo;
        this.examQuestionBaseRepo = examQuestionBaseRepo;
    }

    #region Question  
    public async Task AddQuestionAsync(QuestionFormDto dto)
    {
        if (!await lessonBaseRepo.CheckIfExistAsync(x => x.Id == dto.LessonId))
            throw new NotFoundException("Lesson not found..");

        var questionModel = await questionBaseRepo.AddAsync(new QuestionModel
        {
            Title = dto.Title,
            Level = dto.Level,
            IsTrue = dto.IsTrue,
            LessonId = dto.LessonId,
        });

        if (dto.Choices.Any())
        {
            var choices = dto.Choices.Select(c => new ChoiceModel
            {
                Title = c.Title,
                IsTrue = c.IsTrue,
                QuestionId = questionModel.Id,
            }).ToList();

            await choiceBaseRepo.AddListAsync(choices);
        }
    }

    public async Task<List<QuestionDto>> GetQuestionsAsync(List<long> lessonIds, QuestionLevel level) // get just 5 questions
    {
        Expression<Func<QuestionModel, bool>> expression = q => lessonIds.Contains(q.LessonId) && q.Level == level && q.IsValid;

        var result = await questionBaseRepo.GetAllAsync(expression, x => x.Include(x => x.Choices));
        return result.Take(5).Select(r => new QuestionDto
        {
            Id = r.Id,
            Title = r.Title,
            IsTrue = r.IsTrue,
            Choices = r.Choices.Select(c => new ChoiceDto
            {
                Id = c.Id,
                Title = c.Title,
                IsTrue = c.IsTrue
            }).ToList()
        }).ToList();
    }
    #endregion

    #region Exam
    public async Task AddExamAsync(string title, List<long> questionIds)
    {
        var examModel = await examBaseRepo.AddAsync(new ExamModel
        {
            Title = title
        });

        if (questionIds.Any())
        {
            var examQuestions = questionIds.Select(c => new ExamQuestionModel
            {
                QuestionId = c,
                ExamId = examModel.Id
            }).ToList();

            await examQuestionBaseRepo.AddListAsync(examQuestions);
        }
    }
    public async Task AddManualExamAsync(string title, List<long> lessonIds, QuestionLevel level)
    {
        Expression<Func<QuestionModel, bool>> expression = q => lessonIds.Contains(q.LessonId) && q.Level == level && q.IsValid;
        var result = await questionBaseRepo.GetAllAsync(expression, x => x.Include(x => x.Choices));

        var examModel = await examBaseRepo.AddAsync(new ExamModel
        {
            Title = title
        });

        if (result.Any())
        {
            var examQuestions = result.Take(5).Select(c => new ExamQuestionModel
            {
                QuestionId = c.Id,
                ExamId = examModel.Id
            }).ToList();

            await examQuestionBaseRepo.AddListAsync(examQuestions);
        }
    }
    #endregion
}
