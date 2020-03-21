namespace Caiju.TeenKom.Shared.Entities
{
	public enum Status
	{
		Error,			//Fehler
		NotReady,       //Warten auf Kundenbestätigung
		Ready,          //Kunde hat bestätigt, bereit für Assignment
		Assigned,       //Blitzjobber*innen zugewiesen
		Accepted,       //Blitzjob angenommen
		WaitForReview,  //Sende Blitzjobber Benachrichtigung und warte auf Anruf
		Done            //Alles erledigt		
	}
}
