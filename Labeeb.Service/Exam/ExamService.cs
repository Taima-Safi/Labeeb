using Labeeb.Database.Model;
using Labeeb.Dto.Dto;
using Labeeb.Dto.Shared.Exception;
using Labeeb.Repository.Base;

namespace Labeeb.Service.Exam;

public class ExamService : IExamService
{
    private readonly IBaseRepo<QuestionModel> questionBaseRepo;
    private readonly IBaseRepo<ChoiceModel> choiceBaseRepo;
    private readonly IBaseRepo<LessonModel> lessonBaseRepo;

    public ExamService(IBaseRepo<QuestionModel> questionBaseRepo, IBaseRepo<ChoiceModel> choiceBaseRepo, IBaseRepo<LessonModel> lessonBaseRepo)
    {
        this.questionBaseRepo = questionBaseRepo;
        this.choiceBaseRepo = choiceBaseRepo;
        this.lessonBaseRepo = lessonBaseRepo;
    }

    #region Question  
    public async Task AddQuestionAsync(QuestionFormDto dto)
    {
        if (!await lessonBaseRepo.CheckIfExistAsync(x => x.Id == dto.LessonId))
            throw new NotFoundException("Lesson not found..");


    }
    #endregion
}
