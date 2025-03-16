using Labeeb.Dto.Dto;
using Labeeb.Dto.Shared;
using Labeeb.Service.Exam;
using Microsoft.AspNetCore.Mvc;

namespace Labeeb.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ExamController : ControllerBase
    {
        private readonly IExamService examService;

        public ExamController(IExamService examService)
        {
            this.examService = examService;
        }

        [HttpPost]
        public async Task<IActionResult> AddQuestion(QuestionFormDto dto)
        {
            await examService.AddQuestionAsync(dto);
            return Ok();
        }
        [HttpGet]
        public async Task<IActionResult> GetQuestionsByLessonIds([FromQuery] List<long> lessonIds, [FromQuery] QuestionLevel level)
        {
            var result = await examService.GetQuestionsAsync(lessonIds, level);
            return Ok(result);
        }
        [HttpPost]
        public async Task<IActionResult> AddManualExam(string title, List<long> lessonIds, QuestionLevel level)
        {
            await examService.AddManualExamAsync(title, lessonIds, level);
            return Ok();
        }
        [HttpPost]
        public async Task<IActionResult> AddExamAsync(string title, List<long> questionIds)

        {
            await examService.AddExamAsync(title, questionIds);
            return Ok();
        }
    }
}
