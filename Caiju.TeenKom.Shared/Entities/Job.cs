using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Caiju.TeenKom.Shared.Entities
{
	public class Job
	{

		public Job()
		{
			BlitzjobbersAssigned = new List<JobsBlitzjobbersRelation>();
		}
		[Key]
		public int JobID { get; set; }
		public string? Place { get; set; }
		public Customer? Customer { get; set; }
		public Category Category { get; set; }
		public string? Details { get; set; }
		public DateTime StartDate { get; set; }
		public DateTime EndDate { get; set; }
		public float HourlyRate { get; set; }
		public string? Note { get; set; }
		public Status Status { get; set; }
		public ICollection<JobsBlitzjobbersRelation> BlitzjobbersAssigned { get; set; }
		public string? Review { get; set; }
	}

	public class JobsBlitzjobbersRelation
	{
		public int JobID { get; set; }
		public Job Job { get; set; }
		public int BlitzjobberID { get; set; }
		public Blitzjobber Blitzjobber { get; set; }
	}


}
