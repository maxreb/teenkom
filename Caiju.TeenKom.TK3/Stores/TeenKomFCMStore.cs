using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Shared;
using Caiju.TeenKom.Shared.Entities;
using Grpc.Net.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Caiju.TeenKom.TK3.Stores
{
	//TODO create base class 
	public class TeenKomFCMStore
	{
		private readonly TeenKonFCM.TeenKonFCMClient _client;

		public TeenKomFCMStore()
		{
			var httpClientHandler = new HttpClientHandler
			{
#warning Return `true` to allow certificates that are untrusted/invalid
				ServerCertificateCustomValidationCallback =
				HttpClientHandler.DangerousAcceptAnyServerCertificateValidator
			};

			var httpClient = new HttpClient(httpClientHandler);
			var channel = GrpcChannel.ForAddress("https://appserver:443",
				new GrpcChannelOptions { HttpClient = httpClient });
			_client = new TeenKonFCM.TeenKonFCMClient(channel);
		}


		public async Task<bool> NewAssignmentReq(Job job)
		{
			var reply = await _client.NewAssignmentRequestAsync(new DefaultReq { Id = job.JobID });
			return reply.Success;
		}

		public async Task<bool> NewReviewReq(Job job)
		{
			var reply = await _client.NewReviewRequestAsync(new DefaultReq { Id = job.JobID });
			return reply.Success;
		}





	}
}
