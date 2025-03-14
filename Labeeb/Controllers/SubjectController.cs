using Labeeb.Dto.Shared.Enum;
using Labeeb.Service.Subject;
using Microsoft.AspNetCore.Mvc;

namespace Labeeb.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SubjectController : ControllerBase
    {
        private readonly ISubjectService subjectService;

        public SubjectController(ISubjectService subjectService)
        {
            this.subjectService = subjectService;
        }


        #region Subject
        [HttpPost]
        public async Task<IActionResult> AddSubject(string title, GradeType grade)
        {
            await subjectService.AddSubjectAsync(title, grade);
            return Ok();
        }

        [HttpGet]
        public async Task<IActionResult> GetAllSubject(string title, GradeType grade)
        {
            var subjects = await subjectService.GetAllSubjectAsync(title, grade);
            return Ok(subjects);
        }
        #endregion

        #region Lesson
        [HttpPost]
        public async Task<IActionResult> AddLesson(long subjectId, string title, string description)
        {
            await subjectService.AddLessonAsync(subjectId, title, description);
            return Ok();
        }

        [HttpGet]
        public async Task<IActionResult> GetAllLesson(long subjectId, string title, string description)
        {
            var lessons = await subjectService.GetAllLessonAsync(subjectId, title, description);
            return Ok(lessons);
        }
        #endregion
    }
}
