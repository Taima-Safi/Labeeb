namespace Labeeb.Database.Model;

public class LessonModel : BaseModel
{
    public string Title { get; set; }
    public string Description { get; set; }

    public long SubjectId { get; set; }
    public SubjectModel Subject { get; set; }

    public ICollection<LessonModel> Lessons { get; set; }
}
