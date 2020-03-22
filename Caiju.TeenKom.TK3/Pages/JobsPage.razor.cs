using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Caiju.TeenKom.Shared.Database;
using Caiju.TeenKom.Shared.Entities;
using Caiju.TeenKom.TK3.Services;
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
	public partial class JobsPage : IDisposable
	{
		[Inject]
		TeenKomFCMStore FcmStore { get; set; }
		[Inject]
		RefreshDBService refreshDBService { get; set; }


		readonly object _lock = new object();

		IEnumerable<Job> Jobs
		{
			get
			{
				lock (_lock)
				{
					return _dbContext.Blitzjobs.ToList();
				}
			}
		}
		IReadOnlyList<Blitzjobber> Blitzjobber
		{
			get
			{
				lock (_lock)
				{
					return _dbContext.Blitzjobber.ToList();
				}
			}
		}
		bool dialogIsOpen = false;
		bool dialogNewJobIsOpen = false;
		string name = null;
		Blitzjobber blitzjobber = null;
		Job currentJob = null;

		string dialogAnimal = null;
		Job newJob = null;

		Job reviewJob = null;
		bool dialogReviewIsOpen;

		protected override void OnInitialized()
		{
			//this is the stupiest thing I  every seen
			//we have to do this, otherwise JobBlitzjobberRelation wont me initalized
			//there must by another way, but not enough time while hackathon
			_dbContext.JobBlitzjobberRelation.Load();

			refreshDBService.OnRefreshRequest += RefreshDBService_OnRefreshRequest;


			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Adam", LastName = "Smith", Address = "Wrangelstraße 66, Wrangelkiez Berlin" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Zoro", LastName = "Zurich", Address = "Eberswalderstr. 33, Prenzlau Berlin" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Max", LastName = "Mustermann", Address = "Holtenauer Straße 33, Kiel" });
			//_dbContext.Blitzjobber.Add(new Blitzjobber { FirstName = "Erika", LastName = "Musterfrau", Address = "Lutherstraße 17, Kiel" });
			//_dbContext.SaveChanges();

		}

		private async void RefreshDBService_OnRefreshRequest(object sender, EventArgs e)
		{
			lock (_lock)
			{
				//TODO find a more clean soulution
				var l = _dbContext.Blitzjobs.ToList();
				foreach (var t in l)
				{
					_dbContext.Entry(t).Reload();
				}
			}
			await InvokeAsync(() => StateHasChanged());
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
			job.Status = Status.WaitForReview;
			return FcmStore.NewReviewReq(job);
		}

		void OkClick()
		{
			if ((blitzjobber != null) && !currentJob.BlitzjobbersAssigned.Any(x => x.BlitzjobberID == blitzjobber.BlitzjobberID))
				currentJob.BlitzjobbersAssigned.Add(new JobsBlitzjobbersRelation { Blitzjobber = blitzjobber, Job = currentJob });
			dialogIsOpen = false;
		}


		void WriteReview(Job job)
		{
			reviewJob = job;
			dialogReviewIsOpen = true;
		}


		void NewJobOkClick()
		{
			lock (_lock)
			{
				_dbContext.Blitzjobs.Add(newJob);
			}
			newJob = null;
			dialogNewJobIsOpen = false;
		}


		void ReviewOkClick()
		{
			dialogReviewIsOpen = false;
			reviewJob.Status = Status.Done;
		}

		protected override void OnAfterRender(bool firstRender)
		{
			if (!firstRender)
			{

				lock (_lock)
				{
					_dbContext.SaveChanges();//super lazy~~
				}
			}

		}

		void NewJob()
		{
			var rnd = new Random();
			newJob = new Job
			{
				HourlyRate = rnd.Next(50, 100) / 10.0f,
				Note = "Wegen Covid-19 bitte keinen Kontakt",
				Details = "Rasenmähen, Laub harken",
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

		public void Dispose()
		{
			refreshDBService.OnRefreshRequest -= RefreshDBService_OnRefreshRequest;
		}
	}
}
