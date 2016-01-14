using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
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
	/// Summary description for MobileWebForm1.
	/// </summary>
	public class accueil : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Image Image1;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Image Image2;
		protected System.Web.UI.MobileControls.SelectionList SelectionList1;
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.SelectionList SelectionList2;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Form Frm_Accueil;
		protected System.Web.UI.MobileControls.Form Frm_Menu;
		protected System.Web.UI.MobileControls.Form Frm_Compagnie;
		protected System.Web.UI.MobileControls.Link Link5;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.Command Command2;
		protected System.Web.UI.MobileControls.Calendar Calendar1;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.Form Frm_Calendar;

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
			string lien = SelectionList1.Selection.Value.ToString();	
			if (lien.StartsWith("#"))
			{			
				ActiveForm = GetForm(lien.Remove(0,1));		
			}
			else
			{
				RedirectToMobilePage(lien);
			}
		}

		private void Command2_Click(object sender, System.EventArgs e)
		{
			string lien = SelectionList2.Selection.Value.ToString();	
			if (lien.StartsWith("#"))
			{
				ActiveForm = GetForm(lien.Remove(0,1));			
			}
			else
			{
				RedirectToMobilePage(lien);
			}
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (Request.Params["form"] == "menu")
			{
				ActiveForm= Frm_Menu;
			}
			
		}
	}
}
