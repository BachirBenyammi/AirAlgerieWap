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

namespace Admin
{
	/// <summary>
	/// Summary description for programme.
	/// </summary>
	public class programme : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Command Command2;
		protected System.Web.UI.MobileControls.Form FrmPays;
		protected System.Web.UI.MobileControls.SelectionList ListPaysSrc;
		protected System.Web.UI.MobileControls.SelectionList ListPaysDest;
		protected System.Web.UI.MobileControls.Form FrmVille;
		protected System.Web.UI.MobileControls.SelectionList ListVilleDest;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.SelectionList ListVilleSrc;
		protected System.Web.UI.MobileControls.Label Label5;
		protected System.Web.UI.MobileControls.Command Command3;
		protected System.Web.UI.MobileControls.Form FrmAPT;
		protected System.Web.UI.MobileControls.Command Command4;
		protected System.Web.UI.MobileControls.SelectionList ListAPTDest;
		protected System.Web.UI.MobileControls.Label Label7;
		protected System.Web.UI.MobileControls.SelectionList ListAPTSrc;
		protected System.Web.UI.MobileControls.Label Label8;
		protected System.Web.UI.MobileControls.Label Label9;
		protected System.Web.UI.MobileControls.Label Label10;
		protected System.Web.UI.MobileControls.TextBox TextDtDebut;
		protected System.Web.UI.MobileControls.TextBox TextDtFin;
		protected System.Web.UI.MobileControls.Command Command5;
		protected System.Web.UI.MobileControls.Form FrmDate;
		protected System.Web.UI.MobileControls.Form FrmResult;
		protected System.Web.UI.MobileControls.Form Frm_Prog;
		protected System.Web.UI.MobileControls.SelectionList Vol_Type;
		protected System.Web.UI.MobileControls.Label Lab_Result;
		protected System.Web.UI.MobileControls.CompareValidator CompareValidator1;
		protected System.Web.UI.MobileControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.MobileControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.MobileControls.Command Command6;
		protected System.Web.UI.MobileControls.Form FrmDet;
		protected System.Web.UI.MobileControls.Label Label15;
		protected System.Web.UI.MobileControls.Label Label6;
		protected System.Web.UI.MobileControls.Label Label11;
		protected System.Web.UI.MobileControls.Label Label12;
		protected System.Web.UI.MobileControls.Label Label13;
		protected System.Web.UI.MobileControls.Label Lab_HD;
		protected System.Web.UI.MobileControls.Label Lab_HA;
		protected System.Web.UI.MobileControls.Label Lab_Avion;
		protected System.Web.UI.MobileControls.Label Lab_NuVol;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.SelectionList ListResult;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.Label Lab_Nbr;


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
			this.Command3.Click += new System.EventHandler(this.Command3_Click);
			this.Command4.Click += new System.EventHandler(this.Command4_Click);
			this.Command5.Click += new System.EventHandler(this.Command5_Click);
			this.Command6.Click += new System.EventHandler(this.Command6_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Command1_Click(object sender, System.EventArgs e)
		{
			if (Vol_Type.SelectedIndex == 0)
			{
				string sql0 = "Select DISTINCT Ville.Intituler, Code_Ville "+
					"From Aeroport, Ville , Trajet "+
					"Where	(APT_Src=APT"+
					"		and	Ville = Code_Ville"+
					"		and	Pays = 'DZ')";
				string sql1 = "Select DISTINCT Ville.Intituler, Code_Ville "+
					"From Aeroport, Ville , Trajet "+
					"Where	(APT_Dest=APT"+
					"		and	Ville = Code_Ville"+
					"		and	Pays = 'DZ')";
				SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
				connection.Open ();	
				SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
				DataSet dsSrc = new DataSet();
				adapterSrc.Fill(dsSrc);
				ListVilleSrc.DataSource=dsSrc;
				ListVilleSrc.DataTextField="Intituler";
				ListVilleSrc.DataValueField="Code_Ville";
				ListVilleSrc.DataBind();
				SqlDataAdapter adapterDest = new SqlDataAdapter	(sql1, connection);										
				DataSet dsDest = new DataSet();
				adapterDest.Fill(dsDest);
				ListVilleDest.DataSource=dsDest;
				ListVilleDest.DataTextField="Intituler";
				ListVilleDest.DataValueField="Code_Ville";
				ListVilleDest.DataBind();
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
				ListPaysSrc.DataSource=ds;
				ListPaysSrc.DataTextField="Intituler";
				ListPaysSrc.DataValueField="Code_Pays";
				ListPaysSrc.DataBind();
				ListPaysDest.DataSource=ds;
				ListPaysDest.DataTextField="Intituler";
				ListPaysDest.DataValueField="Code_Pays";
				ListPaysDest.DataBind();
				connection.Close ();
				ActiveForm=FrmPays;
			}
		}

		private void Command2_Click(object sender, System.EventArgs e)
		{
			string Code_Src=ListPaysSrc.Items[ListPaysSrc.SelectedIndex].Value;
			string Code_Dest=ListPaysDest.Items[ListPaysDest.SelectedIndex].Value;

			string sql0 = "Select DISTINCT Ville.Intituler, Code_Ville "+
				"From Aeroport, Ville , Trajet "+
				"Where	(APT_Src=APT"+
				"		and	Ville = Code_Ville"+
				"		and	Pays = '" + Code_Src + "')";

			string sql1 = "Select DISTINCT Ville.Intituler, Code_Ville "+
				"From Aeroport, Ville , Trajet "+
				"Where	(APT_Dest=APT"+
				"		and	Ville = Code_Ville"+
				"		and	Pays = '" + Code_Dest + "')";

			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
			DataSet dsSrc = new DataSet();
			adapterSrc.Fill(dsSrc);
			ListVilleSrc.DataSource=dsSrc;
			ListVilleSrc.DataTextField="Intituler";
			ListVilleSrc.DataValueField="Code_Ville";
			ListVilleSrc.DataBind();
			SqlDataAdapter adapterDest = new SqlDataAdapter	(sql1, connection);										
			DataSet dsDest = new DataSet();
			adapterDest.Fill(dsDest);
			ListVilleDest.DataSource=dsDest;
			ListVilleDest.DataTextField="Intituler";
			ListVilleDest.DataValueField="Code_Ville";
			ListVilleDest.DataBind();
			connection.Close ();
			ActiveForm=FrmVille;
		}

		private void Command3_Click(object sender, System.EventArgs e)
		{
			string Code_Src=ListVilleSrc.Items[ListVilleSrc.SelectedIndex].Value;
			string Code_Dest=ListVilleDest.Items[ListVilleDest.SelectedIndex].Value;

			string sql0 = "Select DISTINCT Intituler, APT "+
				"From Aeroport, Trajet "+
				"Where	(APT_Src=APT"+
				"		and	Ville = '" + Code_Src + "')";

			string sql1 = "Select DISTINCT Intituler, APT "+
				"From Aeroport, Trajet "+
				"Where	(APT_Dest=APT"+
				"		and	Ville = '" + Code_Dest + "')";

			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlDataAdapter adapterSrc = new SqlDataAdapter	(sql0, connection);										
			DataSet dsSrc = new DataSet();
			adapterSrc.Fill(dsSrc);
			ListAPTSrc.DataSource=dsSrc;
			ListAPTSrc.DataTextField="Intituler";
			ListAPTSrc.DataValueField="APT";
			ListAPTSrc.DataBind();
			SqlDataAdapter adapterDest = new SqlDataAdapter	(sql1, connection);										
			DataSet dsDest = new DataSet();
			adapterDest.Fill(dsDest);
			ListAPTDest.DataSource=dsDest;
			ListAPTDest.DataTextField="Intituler";
			ListAPTDest.DataValueField="APT";
			ListAPTDest.DataBind();
			connection.Close ();
			ActiveForm=FrmAPT;
		
		}

		private void Command4_Click(object sender, System.EventArgs e)
		{
			string APTSRC = ListAPTSrc.Items[ListAPTSrc.SelectedIndex].Value;
			string APTDEST = ListAPTDest.Items[ListAPTDest.SelectedIndex].Value;	
			string APT_SRC = ListAPTSrc.Items[ListAPTSrc.SelectedIndex].Text;
			string APT_DEST = ListAPTDest.Items[ListAPTDest.SelectedIndex].Text;
			int NuVol = 0;
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			try
			{
				connection.Open();
				SqlCommand command = new SqlCommand	("select Nu_Vol from Trajet where APT_Src = '" + APTSRC + "' and APT_Dest = '" + APTDEST + "'", connection);
				NuVol = (short) command.ExecuteScalar ();
			}
			catch
			{NuVol = 0;}
			finally
			{
				connection.Close ();
			}

			if (NuVol > 0 )
			{
				connection.Open ();	
				SqlDataAdapter adapter = new SqlDataAdapter	("select DISTINCT Jours From Programme ,Vol Where Vol=Ref_Vol and Nu_Vol=" + NuVol, connection);																
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				DataTable dtt = ds.Tables[0];
				ArrayList all = new ArrayList();
				foreach(DataRow row in dtt.Rows)
					all.Add(row[0].ToString());
				connection.Close ();
				if (all.Count <= 0)
				{
					Lab_Result.Text = "Pas de vols disponibles dans le trajet " + APT_SRC + " - " + APT_DEST;
					ListResult.Items.Clear();
					ActiveForm = FrmResult;
				}
				else
				{
					connection.Open ();	
					SqlCommand cmd  = new SqlCommand ("select DISTINCT Heure_Depart, Heure_Arrive, Avion From Vol Where Nu_Vol=" + NuVol, connection);																
					SqlDataReader readerdata = cmd.ExecuteReader ();
					while (readerdata.Read ()) 
					{
						Lab_Avion.Text = readerdata[2].ToString();
						Lab_HD.Text = readerdata.GetDateTime(0).ToString("hh:mm");
						Lab_HA.Text = readerdata.GetDateTime(1).ToString("hh:mm");
					}
					connection.Close ();

					//probléme de variable globale
					Lab_NuVol.Text = NuVol.ToString();
					ListResult.DataSource = all;
					ListResult.DataBind();	
					ActiveForm = FrmDate;
				}
			}
			else
			{
				Lab_Result.Text = "Pas de trajet disponible entre " + APT_SRC + " et " + APT_DEST;
				ListResult.Items.Clear();
				ActiveForm = FrmResult;
			}
		}

		private void Command5_Click(object sender, System.EventArgs e)
		{
			int NuVol = int.Parse(Lab_NuVol.Text); //Pro de variable globale

			//date debut et date fin
			DateTime Date_Debut = new DateTime();
			DateTime Date_Fin = new DateTime();
			DateTime dtd = new DateTime();
			DateTime dtf = new DateTime();
			DateTime dtDebut = new DateTime();
			DateTime dtFFin = new DateTime();
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Date_Debut, Date_Fin From Periode, Vol where Nu_Vol = " + NuVol + " and Periode=Nu_Periode", connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) 
			{
				Date_Debut = readerdata.GetDateTime(0);
				Date_Fin = readerdata.GetDateTime(1);
			}
			connection.Close ();

			if (TextDtDebut.Text.Length > 0 )
				dtDebut = DateTime.Parse(TextDtDebut.Text);
			else
				dtDebut = Date_Debut;
			if (TextDtFin.Text.Length > 0 )		
				dtFFin = DateTime.Parse(TextDtFin.Text);
			else
				dtFFin = Date_Fin;

			if (dtFFin > Date_Fin)
				dtFFin = Date_Fin;
			if (dtDebut < Date_Debut)
				dtDebut = Date_Debut;
			int dw=0;
			switch (dtDebut.DayOfWeek)
			{
				case DayOfWeek.Monday: dw = 1;break;
				case DayOfWeek.Tuesday: dw = 2;break;
				case DayOfWeek.Thursday: dw = 3;break;
				case DayOfWeek.Wednesday: dw = 4;break;
				case DayOfWeek.Friday: dw = 5;break;
				case DayOfWeek.Saturday: dw = 6;break;
				case DayOfWeek.Sunday: dw = 7;break;
			}

			ArrayList al = new ArrayList();
			ArrayList all = new ArrayList();
			for (int i=0; i <= ListResult.Items.Count-1; i++)
			{
				int Jour = int.Parse(ListResult.Items[i].ToString());
				if (Jour != dw)
				{
					dtd = dtDebut.AddDays(Jour + 7 - dw);
					dtf = dtFFin.AddDays(Jour - 7 + dw);
				}
				else
				{
					dtd = dtDebut;
					dtf = dtFFin;
				}
								
				while (dtd <= dtf)
				{
					al.Add(dtd.Date.ToString("dd-MM-yy"));
					dtd = dtd.AddDays(7);
				}
				all.AddRange(al);	
			}

			if (all.Count > 0)
			{
				all.Sort();
				for (int i=0; i <= all.Count-1; i++)
				{
					string jour="";
					DateTime dt = DateTime.Parse(all[i].ToString());
					switch (dt.DayOfWeek)
					{
						case DayOfWeek.Monday: jour = "Lun";break;
						case DayOfWeek.Tuesday: jour = "Mar";break;
						case DayOfWeek.Thursday: jour = "Mer";break;
						case DayOfWeek.Wednesday: jour = "Jeu";break;
						case DayOfWeek.Friday: jour = "Ven";break;
						case DayOfWeek.Saturday: jour = "Sam";break;
						case DayOfWeek.Sunday: jour = "Dim";break;
					}
					all[i] = jour + " " + all[i].ToString();
				}
				Lab_Nbr.Text = all.Count.ToString();
				ListResult.Items.Clear();
				for (int i=0; i<= all.Count-1; i++)
				{
					string dt = all[i].ToString();
					if (ListResult.Items.IndexOf(dt) == -1 )
						ListResult.Items.Add(dt);
				}
				Lab_Result.Text = "Dates:";
				ActiveForm = FrmDet;
			}
			else
			{
				Lab_Result.Text = "Pas de vols disponile";
				ListResult.Items.Clear();
				ActiveForm = FrmResult;
			}
		}

		private void Command6_Click(object sender, System.EventArgs e)
		{
				Lab_NuVol.Text = "";
				Lab_Nbr.Text = "";
				Lab_Avion.Text = "";
				Lab_HD.Text = "";
				Lab_HA.Text = "";
				TextDtDebut.Text = "";
				TextDtFin.Text = "";
				Lab_Result.Text= "";
				ListResult.Items.Clear();
				ActiveForm = Frm_Prog;
		}
		}
		
	}