using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Caiju.TeenKom.TK3.Services
{
	public class RefreshDBService
	{
		public event EventHandler OnRefreshRequest;

		public void Refresh()
		{
			OnRefreshRequest?.Invoke(this, null);
		}


	}
}
