using Caiju.TeenKom.Blitzjob.AppServer.Protos.Server;
using Caiju.TeenKom.Shared.Entities;
using Grpc.Net.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Caiju.TeenKom.TK3.Pages
{
	public partial class JobsPage
	{

		List<Job> jobs = new List<Job>{
		new Job{
			 HourlyRate = 7.6f,
			  Note = "Wegen Covid-19 bitte Handschue mitnehmen",
			 Review = "",
			Details = "Rasen Mähen",
			  Category = Category.Gardening,
			  Customer = new Customer
			  {
				  FirstName = "John",
				  LastName = "Smith",
				  Address = "Gardening Avenue, New York"

			  },
			   StartDate = new DateTime(2020,03,21,22,0,0),
			   EndDate = new DateTime(2020,03,21,23,30,0),
				Place = "Gardening Avenue, New York",
				 Status = Status.Ready,
				 BlitzjobbersAssigned = new List<Blitzjobber>()
	},
		new Job{
			 HourlyRate = 5.6f,
			 Note = "Wegen Covid-19 bitte keinen Kontakt",
			 Details = "32 Eier, 128 Packungen Klopapier, 0.64 Liter Milch",
			  Category = Category.Shopping,
			  Customer = new Customer
			  {
				  FirstName = "Oma",
				  LastName = "Irma",
				  Address = "Oranienstraße 37, Berlin"

			  },
			   StartDate = new DateTime(2020,03,22,15,0,0),
			   EndDate = new DateTime(2020,03,22,17,0,0),
				Place = "Kreuzberg, Berlin",
				 Status = Status.Assigned,
				 BlitzjobbersAssigned = new List<Blitzjobber>{
					 blitzjobber[0],
					 blitzjobber[1]
				 }
		}
	};

		static Blitzjobber[] blitzjobber = new Blitzjobber[] {
		new Blitzjobber { FirstName = "Adam", LastName = "Smith", Address = "Wrangelstraße 66, Wrangelkiez Berlin"},
		new Blitzjobber { FirstName = "Zoro", LastName = "Zurich", Address = "Eberswalderstr. 33, Prenzlau Berlin"},
		new Blitzjobber { FirstName = "Max", LastName = "Mustermann", Address = "Holtenauer Straße 33, Kiel"},
		new Blitzjobber { FirstName = "Erika", LastName = "Musterfrau", Address = "Lutherstraße 17, Kiel"},
		};

		bool dialogIsOpen = false;
		bool dialogNewJobIsOpen = false;
		string name = null;
		Blitzjobber animal = null;
		IList<Blitzjobber> currentBlitzjobberList = null;
		string dialogAnimal = null;


		Job newJob = null;




		void OpenDialog(IList<Blitzjobber> list)
		{
			currentBlitzjobberList = list;
			dialogAnimal = null;
			dialogIsOpen = true;
		}


		async Task SetAssigned(Job job)
		{


			var httpClientHandler = new HttpClientHandler();
			// Return `true` to allow certificates that are untrusted/invalid
			httpClientHandler.ServerCertificateCustomValidationCallback =
				HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
			var httpClient = new HttpClient(httpClientHandler);
			var channel = GrpcChannel.ForAddress("https://appserver:443",
				new GrpcChannelOptions { HttpClient = httpClient });
			var client = new TeenKonFCM.TeenKonFCMClient(channel);
			var reply = await client.NewAssignmentRequestAsync(new NewAssignmentReq { JobId = 3, UserId = 5 });
			if (reply.Success == true)
				job.Status = Status.Assigned;
			else
				job.Status = Status.Error;
		}

		void OkClick()
		{
			if (animal != null && !currentBlitzjobberList.Contains(animal))
				currentBlitzjobberList.Add(animal);
			dialogIsOpen = false;
		}

		void NewJobOkClick()
		{
			jobs.Add(newJob);
			dialogNewJobIsOpen = false;
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
				Status = Status.NotReady,
				BlitzjobbersAssigned = new List<Blitzjobber>()
			};
			dialogNewJobIsOpen = true;
		}
	}
}
