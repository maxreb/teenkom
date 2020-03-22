using Caiju.TeenKom.Shared.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Caiju.TeenKom.Shared.Database
{

	/* Update Migration
	 *		Add-Migration -StartupProject Caiju.TeenKom.TK3 -Project Caiju.TeenKom.Shared [name]
	 *		Update-Database -StartupProject Caiju.TeenKom.TK3 -Project Caiju.TeenKom.Shared 
	 */


	public class TeenKomContext : DbContext
	{
		public DbSet<Job> Blitzjobs { get; set; }
		public DbSet<Customer> Customer { get; set; }
		//public DbSet<Coach> Customer { get; set; } //TODO
		public DbSet<Blitzjobber> Blitzjobber { get; set; }
		public DbSet<JobsBlitzjobbersRelation> JobBlitzjobberRelation { get; set; }

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
#if DEBUG
			optionsBuilder.UseNpgsql(@"Host=localhost;Database=teenkom;Username=postgres;Password=EasyPwAsItsInternal");
#else
			optionsBuilder.UseNpgsql(@"Host=postgres;Database=teenkom;Username=postgres;Password=EasyPwAsItsInternal");
#endif
		}
		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			modelBuilder.Entity<JobsBlitzjobbersRelation>()
				.HasKey(j => new { j.JobID, j.BlitzjobberID });
			modelBuilder.Entity<JobsBlitzjobbersRelation>()
				.HasOne(j => j.Job)
				.WithMany(j => j.BlitzjobbersAssigned)
				.HasForeignKey(j => j.BlitzjobberID);
			modelBuilder.Entity<JobsBlitzjobbersRelation>()
				.HasOne(j => j.Blitzjobber)
				.WithMany(b => b.Jobs)
				.HasForeignKey(bc => bc.JobID);
		}
	}
}