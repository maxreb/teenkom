using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace Caiju.TeenKom.Shared.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Blitzjobber",
                columns: table => new
                {
                    BlitzjobberID = table.Column<int>(nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    FirstName = table.Column<string>(nullable: false),
                    LastName = table.Column<string>(nullable: false),
                    Address = table.Column<string>(nullable: false),
                    FCMToken = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Blitzjobber", x => x.BlitzjobberID);
                });

            migrationBuilder.CreateTable(
                name: "Customer",
                columns: table => new
                {
                    CustomerID = table.Column<int>(nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    FirstName = table.Column<string>(nullable: false),
                    LastName = table.Column<string>(nullable: false),
                    Address = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customer", x => x.CustomerID);
                });

            migrationBuilder.CreateTable(
                name: "Blitzjobs",
                columns: table => new
                {
                    JobID = table.Column<int>(nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Place = table.Column<string>(nullable: true),
                    CustomerID = table.Column<int>(nullable: true),
                    Category = table.Column<int>(nullable: false),
                    Details = table.Column<string>(nullable: true),
                    StartDate = table.Column<DateTime>(nullable: false),
                    EndDate = table.Column<DateTime>(nullable: false),
                    HourlyRate = table.Column<float>(nullable: false),
                    Note = table.Column<string>(nullable: true),
                    Status = table.Column<int>(nullable: false),
                    Review = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Blitzjobs", x => x.JobID);
                    table.ForeignKey(
                        name: "FK_Blitzjobs_Customer_CustomerID",
                        column: x => x.CustomerID,
                        principalTable: "Customer",
                        principalColumn: "CustomerID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "JobBlitzjobberRelation",
                columns: table => new
                {
                    JobID = table.Column<int>(nullable: false),
                    BlitzjobberID = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JobBlitzjobberRelation", x => new { x.JobID, x.BlitzjobberID });
                    table.ForeignKey(
                        name: "FK_JobBlitzjobberRelation_Blitzjobs_BlitzjobberID",
                        column: x => x.BlitzjobberID,
                        principalTable: "Blitzjobs",
                        principalColumn: "JobID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_JobBlitzjobberRelation_Blitzjobber_JobID",
                        column: x => x.JobID,
                        principalTable: "Blitzjobber",
                        principalColumn: "BlitzjobberID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Blitzjobs_CustomerID",
                table: "Blitzjobs",
                column: "CustomerID");

            migrationBuilder.CreateIndex(
                name: "IX_JobBlitzjobberRelation_BlitzjobberID",
                table: "JobBlitzjobberRelation",
                column: "BlitzjobberID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "JobBlitzjobberRelation");

            migrationBuilder.DropTable(
                name: "Blitzjobs");

            migrationBuilder.DropTable(
                name: "Blitzjobber");

            migrationBuilder.DropTable(
                name: "Customer");
        }
    }
}
