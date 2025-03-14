using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Labeeb.Database.Migrations
{
    /// <inheritdoc />
    public partial class gradeModel : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "GradeId",
                table: "Subject",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.CreateTable(
                name: "Grade",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Grade = table.Column<int>(type: "int", nullable: false),
                    IsValid = table.Column<bool>(type: "bit", nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Grade", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Subject_GradeId",
                table: "Subject",
                column: "GradeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Subject_Grade_GradeId",
                table: "Subject",
                column: "GradeId",
                principalTable: "Grade",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Subject_Grade_GradeId",
                table: "Subject");

            migrationBuilder.DropTable(
                name: "Grade");

            migrationBuilder.DropIndex(
                name: "IX_Subject_GradeId",
                table: "Subject");

            migrationBuilder.DropColumn(
                name: "GradeId",
                table: "Subject");
        }
    }
}
