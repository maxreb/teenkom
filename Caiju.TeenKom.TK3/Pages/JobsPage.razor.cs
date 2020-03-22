using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Caiju.TeenKom.Shared.Database;
using Caiju.TeenKom.Shared.Entities;
using Caiju.TeenKom.TK3.Stores;
using Grpc.Net.Client;
using Microsoft.AspNetCore.Components;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Caiju.TeenKom.TK3.Pages
{
	public partial class JobsPage
	{
		[Inject]
		TeenKomFCMStore FcmStore { get; set; }


		IEnumerable<Job> Jobs => _dbContext.Blitzjobs;

		IReadOnlyList<Blitzjobber> Blitzjobber => _dbContext.Blitzjobber.ToList();
		bool dialogIsOpen = false;
		bool dialogNewJobIsOpen = false;
		string name = null;
		Blitzjobber blitzjobber = null;
		Job currentJob = null;
		string dialogAnimal = null;


		Job newJob = null;


		protected override void OnInitialized()
		{
			//this is the stupiest thing I  every seen
			//we have to do this, otherwise JobBlitzjobberRelation wont me initalized
			//there must by another way, but not enough time while hackathon
			foreach (var t in _dbContext.JobBlitzjobberRelation)
			{

			}



			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Adam", LastName = "Smith", Address = "Wrangelstraße 66, Wrangelkiez Berlin" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Zoro", LastName = "Zurich", Address = "Eberswalderstr. 33, Prenzlau Berlin" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Max", LastName = "Mustermann", Address = "Holtenauer Straße 33, Kiel" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Erika", LastName = "Musterfrau", Address = "Lutherstraße 17, Kiel" });
			//_dbContext.SaveChanges();

		}

		void OpenDialog(Job job)
		{
			currentJob = job;
			dialogAnimal = null;
			dialogIsOpen = true;
		}


		async Task SetAssigned(Job job)
		{
			try
			{
				var reply = await FcmStore.NewAssignmentReq(job);
				if (reply == true)
					job.Status = Status.Assigned;
				else
					job.Status = Status.Error;
			}
			catch (Exception ex)
			{
				//TODO add serilog
				Console.WriteLine("ERROR\r\n" + ex.ToString());
				job.Status = Status.Error;
			}




		}


		Task SendReviewRequest(Job job)
		{
			//TODO
			//foreach (var u in job.BlitzjobbersAssigned)
			//{

			//}
			//Hackathon only one "user"
			return FcmStore.NewReviewReq(job);
		}

		void OkClick()
		{
			if ((blitzjobber != null) && !currentJob.BlitzjobbersAssigned.Any(x => x.BlitzjobberID == blitzjobber.BlitzjobberID))
				currentJob.BlitzjobbersAssigned.Add(new JobsBlitzjobbersRelation { Blitzjobber = blitzjobber, Job = currentJob });
			dialogIsOpen = false;
		}

		async Task NewJobOkClick()
		{
			await _dbContext.Blitzjobs.AddAsync(newJob).ConfigureAwait(false);

			dialogNewJobIsOpen = false;
		}

		protected override async Task OnAfterRenderAsync(bool firstRender)
		{
			if (!firstRender)
				await _dbContext.SaveChangesAsync();//super lazy~~
		}

		void NewJob()
		{
			newJob = new Job
			{
				HourlyRate = 5.6f,
				Note = "Wegen Covid-19 bitte keinen Kontakt",
				Details = "wen interessieren schon details?",
				Customer = new Customer
				{
					FirstName = "Adam",
					LastName = "Ries",
					Address = "Dorfstrasse, Bad Staffelstein"

				},
				StartDate = new DateTime(2020, 03, 21, 22, 0, 0),
				EndDate = new DateTime(2020, 03, 21, 23, 0, 0),
				Status = Status.NotReady
			};
			dialogNewJobIsOpen = true;
		}


	}
}
