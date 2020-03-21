using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Caiju.TeenKom.Blitzjob.AppServer.Services.Client;
using Caiju.TeenKom.Blitzjob.AppServer.Services.Server;
using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Caiju.TeenKom.Blitzjob.AppServer
{
	public class Startup
	{
		// This method gets called by the runtime. Use this method to add services to the container.
		// For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddGrpc();
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}



			var t = FirebaseApp.Create(new AppOptions()
			{
				Credential = GoogleCredential.FromFile("Credentials/teenkom-84e22-firebase-adminsdk-2rnyg-17a38cad8d.json")
			});


			var res = FirebaseMessaging.DefaultInstance.SendAsync(new Message
			{
				Notification = new Notification { Title = "Test", Body = "hallo" },
				Topic = "NetCoreTest",
				Data = new Dictionary<string, string>()
				{
					{"click_action","FLUTTER_NOTIFICATION_CLICK" }
				}
			}).GetAwaiter().GetResult();

			app.UseRouting();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapGrpcService<GreeterService>();
				endpoints.MapGrpcService<BlitzjobberService>();

				endpoints.MapGet("/", async context =>
				{
					await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909").ConfigureAwait(false);
				});
			});
		}
	}
}
