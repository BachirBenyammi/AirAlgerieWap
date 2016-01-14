using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.Mobile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace AirAlgerie
{
	/// <summary>
	/// Summary description for actualites.
	/// </summary>
	public class actualites : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.TextView Text_Desc;
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.Form FrmDet;
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.SelectionList ListNews;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Label Lab_Date;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.Link Link3;
		protected System.Web.UI.MobileControls.Form FrmActualite;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
				string sql = "SELECT Nu_Actualite, Intituler, Description from Actualite order by DateHeure";
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open ();	
				SqlDataAdapter adapter = new SqlDataAdapter	(sql, connection);										
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				ListNews.DataSource=ds;
				ListNews.DataTextField="Intituler";
				ListNews.DataValueField="Nu_Actualite";
				ListNews.DataBind();
				connection.Close ();
			}
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Command1_Click(object sender, System.EventArgs e)
		{
			byte NuNews = byte.Parse(ListNews.Items[ListNews.SelectedIndex].Value.ToString());
			string sql = "SELECT Description, DateHeure from Actualite where Nu_Actualite=" + NuNews;
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	(sql, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) 
			{
				DateTime dt = DateTime.Parse(readerdata[1].ToString()); 
				Lab_Date.Text = dt.Date.ToString("dd-MM-yy");
				Text_Desc.Text = readerdata[0].ToString();
			}
			connection.Close ();
			ActiveForm = FrmDet;
		}
	}
}
