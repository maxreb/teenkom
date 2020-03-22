
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Shared;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Client;
using Google.Protobuf.Collections;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services.Client
{
	public class PeopleService : People.PeopleBase
	{

		public static CoachRes DefaultCouch { get; }
		public static CustomerRes DefaultCustomer { get; }

		static PeopleService()
		{
			var ppl = new PeopleBase
			{
				FirstName = "Frank",
				LastName = "Baumgartner",
				Id = 666
			};
			ppl.Phones.Add(new PeopleBase.Types.PhoneNumber { Number = "0800 555 666 777", Type = PeopleBase.Types.PhoneType.Mobile });
			DefaultCouch = new CoachRes
			{
				PeopleBase = ppl,
				CoachTimeReachableFrom = Timestamp.FromDateTime(DateTime.Now.ToUniversalTime()),
				CoachTimeReachableTo = Timestamp.FromDateTime(DateTime.Now.AddHours(3).ToUniversalTime())
			};

			ppl = new PeopleBase
			{
				FirstName = "Tim",
				LastName = "Walter",
				Id = 42
			};
			ppl.Phones.Add(new PeopleBase.Types.PhoneNumber { Number = "+49 134 4534234", Type = PeopleBase.Types.PhoneType.Mobile });
			DefaultCustomer = new CustomerRes { PeopleBase = ppl };
		}
		public override Task<GetCoachRes> GetCoach(DefaultReq request, ServerCallContext context)
		{
			return Task.FromResult(new GetCoachRes { Coach = DefaultCouch });
		}

		public override Task<GetCustomerRes> GetCustomer(DefaultReq request, ServerCallContext context)
		{

			return Task.FromResult(new GetCustomerRes
			{
				Customer = DefaultCustomer
			});
		}
	}
}
