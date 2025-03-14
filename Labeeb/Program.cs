using Labeeb.Database.Context;
using Labeeb.Repository.Base;
using Labeeb.Service.Exam;
using Labeeb.Service.Subject;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


#region Database
var connectionString = builder.Configuration.GetConnectionString(builder.Environment.IsProduction() ? "Server" : "Server");
builder.Services.AddDbContext<LabeebDbContext>(options =>
{
    options.UseSqlServer(connectionString);
});
#endregion


#region Repository
builder.Services.AddScoped(typeof(IBaseRepo<>), typeof(BaseRepo<>));
#endregion

#region Service
builder.Services.AddScoped<ISubjectService, SubjectService>();
builder.Services.AddScoped<IExamService, ExamService>();
#endregion

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
