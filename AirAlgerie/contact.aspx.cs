using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.Mobile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

namespace AirAlgerie
{
	/// <summary>
	/// Summary description for contact.
	/// </summary>
	public class contact : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.SelectionList SelectionList1;
		protected System.Web.UI.MobileControls.Form Frm_Adr;
		protected System.Web.UI.MobileControls.Form Frm_Msg;
		protected System.Web.UI.MobileControls.Form Frm_Tel;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.PhoneCall PhoneCall1;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.Label Label5;
		protected System.Web.UI.MobileControls.Label Label6;
		protected System.Web.UI.MobileControls.Label Label7;
		protected System.Web.UI.MobileControls.TextBox TextEmail;
		protected System.Web.UI.MobileControls.TextBox TextSujet;
		protected System.Web.UI.MobileControls.TextBox TextMsg;
		protected System.Web.UI.MobileControls.Command Command2;
		protected System.Web.UI.MobileControls.RegularExpressionValidator RegularExpressionValidator1;
		protected System.Web.UI.MobileControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.MobileControls.RegularExpressionValidator RegularExpressionValidator2;
		protected System.Web.UI.MobileControls.Form Frm_Fin;
		protected System.Web.UI.MobileControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.MobileControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.MobileControls.Form Frm_Contact;
		protected System.Web.UI.MobileControls.Link Link3;
		protected System.Web.UI.MobileControls.Link Link4;
		protected System.Web.UI.MobileControls.Link Link6;
		protected System.Web.UI.MobileControls.Link Link5;
		protected System.Web.UI.MobileControls.Label Label8;
		protected System.Web.UI.MobileControls.Command Command1;

		private void Page_Load(object sender, System.EventArgs e)
		{
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Command1.Click += new System.EventHandler(this.Command1_Click);
			this.Command2.Click += new System.EventHandler(this.Command2_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Command1_Click(object sender, System.EventArgs e)
		{
			ActiveForm = GetForm(SelectionList1.Selection.Value.ToString());			
		}

		private void Command2_Click(object sender, System.EventArgs e)
		{
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			try 
			{
				connection.Open();
				SqlCommand command = new SqlCommand	("AjouterContact", connection);
				command.CommandType = CommandType.StoredProcedure;	
				command.Parameters.Add("@Sujet",TextSujet.Text);
				command.Parameters.Add("@Message",TextMsg.Text);	
				command.Parameters.Add("@Email",TextEmail.Text);	
				command.Parameters.Add("@DateHeure",DateTime.Now);		
				command.ExecuteNonQuery ();
				ActiveForm = Frm_Fin;
			}
			finally 
			{
				connection.Close ();
			}
			TextEmail.Text = "";
			TextMsg.Text = "";
			TextSujet.Text = "";
		}
		}
	}
