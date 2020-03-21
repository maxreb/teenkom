using System;
using System.Collections.Generic;

namespace Caiju.TeenKom.Shared
{
	public class Class1
	{
	}


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

	}

	public class Blitzjobber : BaseUser
	{
	}

	public enum Category
	{
		Gardening,
		Shopping,
		CleanCar
	}

	public enum Status
	{
		NotReady, //Warten auf Kundenbestätigung
		Ready, //Kunde hat bestätigt, bereit für Assignment
		Assigned, //Blitzjobber*innen zugewiesen
		Accepted, //Blitzjob angenommen
		WaitForReview, //Sende Blitzjobber Benachrichtigung und warte auf Anruf
		Done //Alles erledigt
	}


}
