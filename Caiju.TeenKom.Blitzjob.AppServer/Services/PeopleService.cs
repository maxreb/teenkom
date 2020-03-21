using Caiju.TeenKom.Blitzjob.AppServer.Protos;
using Google.Protobuf.Collections;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services
{
	public class PeopleService : People.PeopleBase
	{


		public override Task<GetCoachRes> GetCoach(GetCoachReq request, ServerCallContext context)
		{

			var ppl = new PeopleBase
			{
				FirstName = "Test",
				LastName = "LastName",
				Id = request.Id
			};
			ppl.Phones.Add(new PeopleBase.Types.PhoneNumber { Number = "+49 1234 56789", Type = PeopleBase.Types.PhoneType.Mobile });

			return Task.FromResult(new GetCoachRes
			{
				Coach = new Coach
				{
					PeopleBase = ppl,
					CoachTimeReachableFrom = Timestamp.FromDateTime(DateTime.Now),
					CoachTimeReachableTo = Timestamp.FromDateTime(DateTime.Now.AddHours(3))

				}
			});
		}
	}
}
