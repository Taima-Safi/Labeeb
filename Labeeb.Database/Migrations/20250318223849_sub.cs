using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Labeeb.Database.Migrations
{
    /// <inheritdoc />
    public partial class sub : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestion_Question_QuestionId",
                table: "ExamQuestion");

            migrationBuilder.DropForeignKey(
                name: "FK_Question_Exam_ExamModelId",
                table: "Question");

            migrationBuilder.DropForeignKey(
                name: "FK_Question_Lesson_LessonId",
                table: "Question");

            migrationBuilder.DropIndex(
                name: "IX_Question_ExamModelId",
                table: "Question");

            migrationBuilder.DropColumn(
                name: "ExamModelId",
                table: "Question");

            migrationBuilder.AddColumn<long>(
                name: "SubjectId",
                table: "Exam",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.CreateIndex(
                name: "IX_Exam_SubjectId",
                table: "Exam",
                column: "SubjectId");

            migrationBuilder.AddForeignKey(
                name: "FK_Exam_Subject_SubjectId",
                table: "Exam",
                column: "SubjectId",
                principalTable: "Subject",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestion_Question_QuestionId",
                table: "ExamQuestion",
                column: "QuestionId",
                principalTable: "Question",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Question_Lesson_LessonId",
                table: "Question",
                column: "LessonId",
                principalTable: "Lesson",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Exam_Subject_SubjectId",
                table: "Exam");

            migrationBuilder.DropForeignKey(
                name: "FK_ExamQuestion_Question_QuestionId",
                table: "ExamQuestion");

            migrationBuilder.DropForeignKey(
                name: "FK_Question_Lesson_LessonId",
                table: "Question");

            migrationBuilder.DropIndex(
                name: "IX_Exam_SubjectId",
                table: "Exam");

            migrationBuilder.DropColumn(
                name: "SubjectId",
                table: "Exam");

            migrationBuilder.AddColumn<long>(
                name: "ExamModelId",
                table: "Question",
                type: "bigint",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Question_ExamModelId",
                table: "Question",
                column: "ExamModelId");

            migrationBuilder.AddForeignKey(
                name: "FK_ExamQuestion_Question_QuestionId",
                table: "ExamQuestion",
                column: "QuestionId",
                principalTable: "Question",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Question_Exam_ExamModelId",
                table: "Question",
                column: "ExamModelId",
                principalTable: "Exam",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Question_Lesson_LessonId",
                table: "Question",
                column: "LessonId",
                principalTable: "Lesson",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
