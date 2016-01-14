using System.Data;
using System.Data.SqlClient;
using System;
using System.Configuration;

namespace AirAlgerieSite
{
	public class Functions
	{
		public string GetUserRole (string compte)
		{
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
			try{
				SqlCommand command = new SqlCommand("select Intituler from Droit, [User] where Droit.Nu_Droit = [User].Droit  and Compte = '" + compte + "'", connection);
				object role = command.ExecuteScalar ();
				if (role is DBNull)
					return null;
				return (string) role;
			}
			finally{
				connection.Close ();
			}
		}
	}
}