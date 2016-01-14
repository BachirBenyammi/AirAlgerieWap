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
	/// Summary description for agences.
	/// </summary>
	public class agences : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Command Command3;
		protected System.Web.UI.MobileControls.Label Label5;
		protected System.Web.UI.MobileControls.Form FrmVille;
		protected System.Web.UI.MobileControls.Command Command2;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Form FrmPays;
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.Label lab;
		protected System.Web.UI.MobileControls.Label Lab_Code;
		protected System.Web.UI.MobileControls.Label Lab_Intituler;
		protected System.Web.UI.MobileControls.Label Lab_Tel;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Label Lab_Adr;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.Form FrmDet;
		protected System.Web.UI.MobileControls.Form FrmAgence;
		protected System.Web.UI.MobileControls.Command Command4;
		protected System.Web.UI.MobileControls.SelectionList Agence_Type;
		protected System.Web.UI.MobileControls.SelectionList ListVille;
		protected System.Web.UI.MobileControls.SelectionList ListPays;
		protected System.Web.UI.MobileControls.SelectionList ListAgence;
		protected System.Web.UI.MobileControls.Label Lab_Ville;
		protected System.Web.UI.MobileControls.Label Label7;
		protected System.Web.UI.MobileControls.Command Command5;
		protected System.Web.UI.MobileControls.Label Label6;
		protected System.Web.UI.MobileControls.Form Frm_Prog;

		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
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
			this.Command3.Click += new System.EventHandler(this.Command3_Click);
			this.Command4.Click += new System.EventHandler(this.Command4_Click);
			this.Command5.Click += new System.EventHandler(this.Command5_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Command1_Click(object sender, System.EventArgs e)
		{
			if (Agence_Type.SelectedIndex == 0)
			{
				string sql0 = "Select Intituler, Code_Ville "+
					"From Ville Where Pays = 'DZ'";
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open ();	
				SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
				DataSet dsSrc = new DataSet();
				adapterSrc.Fill(dsSrc);
				ListVille.DataSource=dsSrc;
				ListVille.DataTextField="Intituler";
				ListVille.DataValueField="Code_Ville";
				ListVille.DataBind();
				connection.Close ();
				ActiveForm=FrmVille;
			}
			else
			{
				string sql0 = "SELECT Code_Pays, Intituler From Pays";
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open ();	
				SqlDataAdapter adapter = new SqlDataAdapter	(sql0, connection);										
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				ListPays.DataSource=ds;
				ListPays.DataTextField="Intituler";
				ListPays.DataValueField="Code_Pays";
				ListPays.DataBind();
				ActiveForm=FrmPays;
			}
		}

		private void Command2_Click(object sender, System.EventArgs e)
		{
			string Code_Src=ListPays.Items[ListPays.SelectedIndex].Value;

			string sql0 = "Select Intituler, Code_Ville "+
				"From Ville Where Pays = '" + Code_Src +"'";

			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
			DataSet dsSrc = new DataSet();
			adapterSrc.Fill(dsSrc);
			ListVille.DataSource=dsSrc;
			ListVille.DataTextField="Intituler";
			ListVille.DataValueField="Code_Ville";
			ListVille.DataBind();
			connection.Close ();
			ActiveForm=FrmVille;
		}

		private void Command3_Click(object sender, System.EventArgs e)
		{
			string Code_Src=ListVille.Items[ListVille.SelectedIndex].Value;

			string sql0 = "Select Intituler, Code_Agence "+
				"From Agence Where (Ville = '" + Code_Src + "')";

			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
			DataSet dsSrc = new DataSet();
			adapterSrc.Fill(dsSrc);
			ListAgence.DataSource=dsSrc;
			ListAgence.DataTextField="Intituler";
			ListAgence.DataValueField="Code_Agence";
			ListAgence.DataBind();
			ActiveForm=FrmAgence;
		}

		private void Command4_Click(object sender, System.EventArgs e)
		{
			string Code_Src=ListAgence.Items[ListAgence.SelectedIndex].Value;

			Lab_Code.Text = Code_Src;
			Lab_Ville.Text = ListVille.Items[ListVille.SelectedIndex].Text;
			string sql0 = "Select Intituler, Tel, Adresse "+
				"From Agence Where Code_Agence = " + Code_Src;

			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open();
			SqlCommand cmd = new SqlCommand	(sql0, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) 
			{
				Lab_Intituler.Text = readerdata[0].ToString();
				Lab_Tel.Text = readerdata[1].ToString();
				Lab_Adr.Text = readerdata[2].ToString();
			}
			connection.Close();
			ActiveForm=FrmDet;
		}

		private void Command5_Click(object sender, System.EventArgs e)
		{
			Lab_Intituler.Text = "";
			Lab_Tel.Text = "";
			Lab_Adr.Text = "";
			Lab_Code.Text = "";
			Lab_Ville.Text = "";
			ActiveForm = Frm_Prog;
		}
	}
}
