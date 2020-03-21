using System;
using System.Collections.Generic;

namespace Caiju.TeenKom.Shared.Entities
{
	public class Job
	{
		public string Place { get; set; }
		public Customer Customer { get; set; }
		public Category Category { get; set; }
		public string Details { get; set; }
		public DateTime StartDate { get; set; }
		public DateTime EndDate { get; set; }
		public float HourlyRate { get; set; }
		public string Note { get; set; }
		public Status Status { get; set; }
		public IList<Blitzjobber> BlitzjobbersAssigned { get; set; }
		public string Review { get; set; }
	}


}
