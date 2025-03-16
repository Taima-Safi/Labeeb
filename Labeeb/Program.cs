using Labeeb.Database.Context;
using Labeeb.Repository.Base;
using Labeeb.Service.Exam;
using Labeeb.Service.Subject;
using Microsoft.EntityFrameworkCore;
using Swashbuckle.AspNetCore.SwaggerUI;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


#region Database
var connectionString = builder.Configuration.GetConnectionString(builder.Environment.IsProduction() ? "SomeeServer" : "SomeeServer");
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
//if (app.Environment.IsDevelopment())
//{
//app.UseSwagger();
//app.UseSwaggerUI();
//}
app.UseCors(cors => cors
.AllowAnyMethod()
.AllowAnyHeader()
.SetIsOriginAllowed(origin => true)
.AllowCredentials());

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSwagger();

app.UseSwagger();
app.UseSwaggerUI(s =>
{
    s.DocExpansion(DocExpansion.None);
    s.DisplayRequestDuration();
    s.EnableTryItOutByDefault();
});
app.UseRouting();

app.UseSwaggerUI();
app.UseAuthorization();

app.MapControllers();

app.Run();
