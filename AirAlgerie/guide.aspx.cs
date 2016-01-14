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
using System.Xml; 

namespace AirAlgerie
{
	/// <summary>
	/// Summary description for guide.
	/// </summary>
	public class guide : System.Web.UI.MobileControls.MobilePage
	{
		protected System.Web.UI.MobileControls.Form Form2;
		protected System.Web.UI.MobileControls.Form Form3;
		protected System.Web.UI.MobileControls.SelectionList SelectionList1;
		protected System.Web.UI.MobileControls.Form Form5;
		protected System.Web.UI.MobileControls.Command Command1;
		protected System.Web.UI.MobileControls.Form Frm_Guide;
		protected System.Web.UI.MobileControls.Link Link1;
		protected System.Web.UI.MobileControls.Link Link2;
		protected System.Web.UI.MobileControls.Link Link3;
		protected System.Web.UI.MobileControls.Link Link4;
		protected System.Web.UI.MobileControls.Label Label1;
		protected System.Web.UI.MobileControls.Label Label2;
		protected System.Web.UI.MobileControls.Label Label3;
		protected System.Web.UI.MobileControls.Label Label4;
		protected System.Web.UI.MobileControls.Link Link5;
		protected System.Web.UI.MobileControls.Form Form4;

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
		}
	}
}
