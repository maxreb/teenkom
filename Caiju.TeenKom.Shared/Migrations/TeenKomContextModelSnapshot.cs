﻿// <auto-generated />
using System;
using Caiju.TeenKom.Shared.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace Caiju.TeenKom.Shared.Migrations
{
    [DbContext(typeof(TeenKomContext))]
    partial class TeenKomContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn)
                .HasAnnotation("ProductVersion", "3.1.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.Blitzjobber", b =>
                {
                    b.Property<int>("BlitzjobberID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("FCMToken")
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("BlitzjobberID");

                    b.ToTable("Blitzjobber");
                });

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.Customer", b =>
                {
                    b.Property<int>("CustomerID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("CustomerID");

                    b.ToTable("Customer");
                });

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.Job", b =>
                {
                    b.Property<int>("JobID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<int>("Category")
                        .HasColumnType("integer");

                    b.Property<int?>("CustomerID")
                        .HasColumnType("integer");

                    b.Property<string>("Details")
                        .HasColumnType("text");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<float>("HourlyRate")
                        .HasColumnType("real");

                    b.Property<string>("Note")
                        .HasColumnType("text");

                    b.Property<string>("Place")
                        .HasColumnType("text");

                    b.Property<string>("Review")
                        .HasColumnType("text");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<int>("Status")
                        .HasColumnType("integer");

                    b.HasKey("JobID");

                    b.HasIndex("CustomerID");

                    b.ToTable("Blitzjobs");
                });

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.JobsBlitzjobbersRelation", b =>
                {
                    b.Property<int>("JobID")
                        .HasColumnType("integer");

                    b.Property<int>("BlitzjobberID")
                        .HasColumnType("integer");

                    b.HasKey("JobID", "BlitzjobberID");

                    b.HasIndex("BlitzjobberID");

                    b.ToTable("JobBlitzjobberRelation");
                });

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.Job", b =>
                {
                    b.HasOne("Caiju.TeenKom.Shared.Entities.Customer", "Customer")
                        .WithMany()
                        .HasForeignKey("CustomerID");
                });

            modelBuilder.Entity("Caiju.TeenKom.Shared.Entities.JobsBlitzjobbersRelation", b =>
                {
                    b.HasOne("Caiju.TeenKom.Shared.Entities.Job", "Job")
                        .WithMany("BlitzjobbersAssigned")
                        .HasForeignKey("BlitzjobberID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Caiju.TeenKom.Shared.Entities.Blitzjobber", "Blitzjobber")
                        .WithMany("Jobs")
                        .HasForeignKey("JobID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
