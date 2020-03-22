using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using FirebaseAdmin.Messaging;
using Grpc.Core;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services.Server
{
	public class BlitzjobberService : TeenKonFCM.TeenKonFCMBase
	{

		public override Task<DefaultRes> NewAssignmentRequest(DefaultReq request, ServerCallContext context)
			=> SendJobId(request, "Es gibt ein neuen Blitzjob für dich!");
		public override Task<DefaultRes> NewReviewRequest(DefaultReq request, ServerCallContext context)
			=> SendJobId(request, "Ein neues Review wartet auf dich!");


		private async Task<DefaultRes> SendJobId(DefaultReq request, string title, [CallerMemberName] string topic = "")
		{
			try
			{
				var res = await FirebaseMessaging.DefaultInstance.SendAsync(new Message
				{
					Notification = new Notification { Title = title },
					Topic = "WirVsVirus_" + topic,
					Data = new Dictionary<string, string>()
					{
						["click_action"] = "FLUTTER_NOTIFICATION_CLICK",
						["jobId"] = request.JobId.ToString(CultureInfo.InvariantCulture)
					}
				}).ConfigureAwait(false);
				return new DefaultRes { Success = true };
			}
			catch (Exception ex)
			{
				//TODO use serilog
				Console.WriteLine("ERROR\r\n" + ex.ToString());
				return new DefaultRes { Success = false };
			}
		}
	}
}
