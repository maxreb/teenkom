using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Grpc.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services.Server
{
	public class BlitzjobberService : TeenKonFCM.TeenKonFCMBase
	{

		public override Task<DefaultRes> NewAssignmentRequest(NewAssignmentReq request, ServerCallContext context)
		{
			return Task.FromResult(new DefaultRes
			{
				Success = true
			});
		}
		public override Task<DefaultRes> NewReviewRequest(NewAssignmentReq request, ServerCallContext context)
		{
			return Task.FromResult(new DefaultRes
			{
				Success = true
			});
		}
	}
}
