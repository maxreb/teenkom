using Caiju.TeenKom.Blitzjob.AppServer.Client;
using Caiju.TeenKom.Blitzjob.AppServer.Protos.Client;
using Grpc.Net.Client;
using System;
using System.Threading.Tasks;

namespace Caiju.TeenKom.Blitzjob.TestClient
{
	class Program
	{
		static async Task Main(string[] args)
		{
			using var channel = GrpcChannel.ForAddress("https://localhost:5001");
			var client = new Jobs.JobsClient(channel);
			var reply = await client.ListAsync(new Google.Protobuf.WellKnownTypes.Empty());
			Console.WriteLine("Press any key to exit...");
			Console.ReadKey();
		}
	}
}
