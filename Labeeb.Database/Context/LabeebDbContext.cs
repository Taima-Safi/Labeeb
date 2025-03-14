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
    protected override void OnModelCreating(ModelBuilder builder) // for relations
    {
        base.OnModelCreating(builder);
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
