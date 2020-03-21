using Caiju.TeenKom.Shared.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Caiju.TeenKom.Shared.Extensions
{
	public static class EnumerationExtensions
	{
		public static string ToFriendlyString(this Status status)
					=> status switch
					{
						Status.NotReady => "Nicht bereit",
						Status.Ready => "Bereit",
						Status.Assigned => "Angenommen",
						Status.Accepted => "Aktzeptiert",
						Status.WaitForReview => "Warte auf Review",
						Status.Done => "Erledigt",
						_ => "Fehler"
					};

	}
}
