using Labeeb.Database.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace Labeeb.Database.Context;

public class LabeebDbContext : DbContext
{
    public LabeebDbContext(DbContextOptions<LabeebDbContext> options) : base(options)
    {
    }
    public DbSet<LessonModel> Lesson { get; set; }
    public DbSet<ChoiceModel> Choice { get; set; }
    public DbSet<SubjectModel> Subject { get; set; }
    public DbSet<QuestionModel> Question { get; set; }
    public DbSet<ExamModel> Exam { get; set; }
    public DbSet<ExamQuestionModel> ExamQuestion { get; set; }
    protected override void OnModelCreating(ModelBuilder builder) // for relations
    {
        base.OnModelCreating(builder);
        builder.Entity<ExamModel>()
            .HasOne(e => e.Subject)
            .WithMany(s => s.Exams)
            .HasForeignKey(e => e.SubjectId)
            .OnDelete(DeleteBehavior.Restrict); // Disable cascade delete

        // Configure ExamQuestion -> Exam relationship
        builder.Entity<ExamQuestionModel>()
            .HasOne(eq => eq.Exam)
            .WithMany(e => e.ExamQuestions)
            .HasForeignKey(eq => eq.ExamId)
            .OnDelete(DeleteBehavior.Cascade); // Allow cascade delete

        // Configure ExamQuestion -> Question relationship
        builder.Entity<ExamQuestionModel>()
            .HasOne(eq => eq.Question)
            .WithMany(q => q.ExamQuestions)
            .HasForeignKey(eq => eq.QuestionId)
            .OnDelete(DeleteBehavior.Restrict); // Disable cascade delete

        // Configure Question -> Lesson relationship
        builder.Entity<QuestionModel>()
            .HasOne(q => q.Lesson)
            .WithMany()
            .HasForeignKey(q => q.LessonId)
            .OnDelete(DeleteBehavior.Restrict);
    }
    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        BeforeSaving();
        return base.SaveChangesAsync(cancellationToken);
    }
    protected void BeforeSaving()
    {
        IEnumerable<EntityEntry> entityEntries = ChangeTracker.Entries();
        DateTime utcNow = DateTime.UtcNow;
        foreach (var entityEntry in entityEntries)
        {
            if (entityEntry.Entity is BaseModel entity)
            {
                switch (entityEntry.State)
                {
                    case EntityState.Modified:
                        entity.UpdateDate = utcNow;
                        break;
                    case EntityState.Added:
                        entity.CreateDate = utcNow;
                        break;
                }
            }
        }
    }
}
