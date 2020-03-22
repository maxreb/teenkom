using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Client;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Shared;
using Caiju.TeenKom.Shared.Database;
using Caiju.TeenKom.Shared.Entities;
using Caiju.TeenKom.Shared.Extensions;
using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.EntityFrameworkCore;

namespace Caiju.TeenKom.Blitzjob.AppServer.Services.Client
{
	public class JobsService : Jobs.JobsBase
	{
		private readonly TeenKomContext _dbContext;

		public JobsService(TeenKomContext db)
		{
			_dbContext = db;
		}
		public override async Task<AcceptJobRes> AcceptJobReq(DefaultReq request, ServerCallContext context)
		{
			var j = await _dbContext.Blitzjobs.FindAsync(request.Id).ConfigureAwait(false);
			if (j?.Customer == null)
				return new AcceptJobRes { Success = false };
			else
			{

				j.Status = Shared.Entities.Status.Accepted;
				await _dbContext.SaveChangesAsync().ConfigureAwait(false);

				var ppl = new PeopleBase
				{
					Id = j.Customer.CustomerID,
					LastName = j.Customer.LastName,
					FirstName = j.Customer.FirstName
				};
				ppl.Phones.Add(new PeopleBase.Types.PhoneNumber { Number = "+49 134 4534234", Type = PeopleBase.Types.PhoneType.Mobile });
				return new AcceptJobRes
				{
					Success = true,
					Customer = new CustomerRes
					{
						PeopleBase = ppl
					},
					Coach = PeopleService.DefaultCouch
				};



			}
		}
		public override async Task<BlitzjobRes> Get(DefaultReq request, ServerCallContext context)
		{

			var j = await _dbContext.Blitzjobs.FindAsync(request.Id);
			if (j == null)
				return new BlitzjobRes { Success = false };
			else
				return JobToRes(j);
		}
		public override async Task<BlitzjobListRes> List(Empty request, ServerCallContext context)
		{
			var res = new BlitzjobListRes();
			res.Blitzjobs.AddRange((await _dbContext.Blitzjobs.ToListAsync().ConfigureAwait(false)).Select(x => JobToRes(x)));
			return res;
		}

		private BlitzjobRes JobToRes(Job j)
		=> new BlitzjobRes
		{
			Success = true,
			CustomerId = j.Customer?.CustomerID ?? 0,
			Descripton = j.Details,
			StartDate = Timestamp.FromDateTime(j.StartDate),
			EndDate = Timestamp.FromDateTime(j.EndDate),
			HourlyRate = j.HourlyRate,
			Location = j.Place,
			Note = j.Note,
			Review = j.Review,
			Status = j.Status.ToFriendlyString(),
			Title = j.Category.ToFriendlyString()
		};


	}
}
