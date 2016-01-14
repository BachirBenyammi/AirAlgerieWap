using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Principal;
using System.Web;
using System.Web.SessionState;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;

namespace AirAlgerieSite
{
	public class Global : System.Web.HttpApplication
	{
		protected void Application_AuthenticateRequest (Object sender, EventArgs e)
		{		
			HttpApplication app = (HttpApplication) sender;
			if (app.Request.IsAuthenticated && app.User.Identity is FormsIdentity) 
			{
				FormsIdentity identity = (FormsIdentity) app.User.Identity;
				Functions fun = new Functions();
				string droit = fun.GetUserRole(identity.Name);
				Application["Droit"] = droit;
				if (droit != null)
					app.Context.User = new GenericPrincipal (identity, new string[] { droit });
			}
		}	
	}
}