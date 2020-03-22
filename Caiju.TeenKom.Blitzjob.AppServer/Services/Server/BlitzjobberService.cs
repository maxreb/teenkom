using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Shared;
using Caiju.TeenKom.Shared.Database;
using FirebaseAdmin.Messaging;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services.Server
{
	public class BlitzjobberService : TeenKonFCM.TeenKonFCMBase
	{
		//private readonly HttpClient _httpClient;

		//public BlitzjobberService(HttpClient h)
		//{
		//_httpClient = h;
		//}
		public override Task<DefaultRes> NewAssignmentRequest(DefaultReq request, ServerCallContext context)
			=> SendJobId(request, "Es gibt ein neuen Blitzjob für dich!");
		public override Task<DefaultRes> NewReviewRequest(DefaultReq request, ServerCallContext context)
			=> SendJobId(request, "Ein neues Review wartet auf dich!");


		private async Task<DefaultRes> SendJobId(DefaultReq request, string title, [CallerMemberName] string topic = "")
		{
			try
			{
				//Timer x = new Timer(async (n) =>
				//{
				//	var _context = new TeenKomContext();
				//	_context.Blitzjobs.Load();
				//	var t = await _context.Blitzjobs.FindAsync(n).ConfigureAwait(false);
				//	t.Status = Shared.Entities.Status.Accepted;
				//	_ = await _context.SaveChangesAsync().ConfigureAwait(false);
				//	await _context.DisposeAsync();
				//	_ = await _httpClient.GetAsync("https://tk3/refresh").ConfigureAwait(false);
				//}, request.Id, 1000, Timeout.Infinite);

				var res = await FirebaseMessaging.DefaultInstance.SendAsync(new Message
				{
					Notification = new Notification { Title = title },
					Topic = "WirVsVirus_" + topic,
					Data = new Dictionary<string, string>()
					{
						["click_action"] = "FLUTTER_NOTIFICATION_CLICK",
						["jobId"] = request.Id.ToString(CultureInfo.InvariantCulture),
						["topic"] = topic
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
