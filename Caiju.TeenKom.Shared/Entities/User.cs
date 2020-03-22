using System.Collections.Generic;

namespace Caiju.TeenKom.Shared.Entities
{
	public abstract class BaseUser
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Address { get; set; }
		public override string ToString()
		{
			return FirstName + " " + LastName;
		}

	}
	public class Customer : BaseUser
	{
		public uint CustomerID { get; set; }

	}

	public class Blitzjobber : BaseUser
	{
		public Blitzjobber()
		{
			Jobs = new List<JobsBlitzjobbersRelation>();
		}
		public int BlitzjobberID { get; set; }
		public string? FCMToken { get; set; }
		public ICollection<JobsBlitzjobbersRelation> Jobs { get; set; }
	}


}
