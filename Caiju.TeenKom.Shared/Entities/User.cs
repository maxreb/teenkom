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

	}

	public class Blitzjobber : BaseUser
	{
		public string FCMToken { get; set; }
	}


}
