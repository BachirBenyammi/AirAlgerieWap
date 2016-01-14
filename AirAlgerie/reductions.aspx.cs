using System;
using System.Collections;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
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
	/// Summary description for reductions.
	/// </summary>
	public class reductions : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.Label Lab_Cat;
		protected System.Web.UI.MobileControls.Label Lab_Taux;
		protected System.Web.UI.MobileControls.Label Lab_Val;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.Form FrmRed;
		protected System.Web.UI.MobileControls.Form FrmDet;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.SelectionList ListReduc;
		protected System.Web.UI.MobileControls.Label Label5;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.Link Link3;
		protected System.Web.UI.MobileControls.TextView Text_Desc;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
				string sql = "SELECT Nu_Red, Categorie from Reduction";
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open ();	
				SqlDataAdapter adapter = new SqlDataAdapter	(sql, connection);										
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				ListReduc.DataSource=ds;
				ListReduc.DataTextField="Categorie";
				ListReduc.DataValueField="Nu_Red";
				ListReduc.DataBind();
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
			byte NuRed = byte.Parse(ListReduc.Items[ListReduc.SelectedIndex].Value.ToString());
			string sql = "SELECT Categorie, Taux, Validite, Description from Reduction where Nu_Red=" + NuRed;
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	(sql, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) 
			{
				Lab_Cat.Text = readerdata[0].ToString();
				Lab_Taux.Text = readerdata[1].ToString();
				Lab_Val.Text = readerdata[2].ToString();
				Text_Desc.Text = readerdata[3].ToString();
			}
			connection.Close ();
			ActiveForm = FrmDet;
		}
	}
}
