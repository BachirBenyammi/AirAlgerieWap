<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>
<html>
	<head>
		<title>Air Algérie - Voir un utilisateur</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

	<form runat="server">
    	<Controls:Top id="top" runat="server" />
    	<Controls:User id="User" runat="server" /> 
    	
    	<table align="center" cellspacing="0" width="760" cellpadding="0" >
			<tr>
    			<td width="140" valign=top>
    				<p><Controls:Left id="Left" runat="server" /></p>
				</td>
				<td width="620" valign=top>
    				<table width="100%">
    						<th align="center" colspan="2">Voir un utilisateur</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button ID="btnDelete" CssClass="Button" Text="Supprimer" OnClick="Delete" Runat="server" Width="70" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />	
								</p>
								<br>
								<table>
									<tr>
										<td><b>Nom:</b></td>
										<td><asp:label id="Nom" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Prénom:</b></td>
										<td><asp:label id="Prenom" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Compte:</b></td>
										<td><asp:label id="Compte" runat="server" /></td>
									</tr>																		
									<tr>
										<td><b>Email:</b></td>
										<td><asp:label id="Email" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Date d'inscription:</b></td>
										<td><asp:label id="DateHeure" runat="server" /></td>
									</tr>	
									<tr>
										<td><b>Tél:</b></td>
										<td><asp:label id="Tel" runat="server" /></td>
									</tr>
									<tr>
										<td valign="top"><b>Adresse:</b></td>
										<td colspan="2"><span class="Details"><asp:Literal ID="Adresse" Runat=server /></span></td>
									</tr>		
									<tr>
										<td><b>Etat:</b></td>
										<td><asp:CheckBox Runat=server ID="Etat" OnCheckedChanged="Changer" AutoPostBack=True></asp:CheckBox>
									</tr>		
									<tr>
										<td><b>Droit d'acces: </b></td>
										<td>
												<asp:DropDownList id="Droit" runat="server" OnSelectedIndexChanged="ChangerDroit" AutoPostBack=True />
										</td>
									</tr>																
								</table>														
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_User = int.Parse(Request.Params["Nu_User"]);
		if (CheckNu(Nu_User)) {
			string droit = "";
			btnDelete.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sûr ?')");		
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open();
				SqlDataAdapter adapter = new SqlDataAdapter("select Nu_Droit, Intituler From Droit where Intituler <>'Webmaster'", connection);
			DataSet ds = new DataSet();
			adapter.Fill(ds);
			Droit.DataSource = ds;
			Droit.DataValueField = "Nu_Droit";
			Droit.DataTextField = "Intituler";		
			Droit.DataBind();
			connection.Close();		
		
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Nom, Prenom, Compte, DateHeure, Email, Tel, Adresse, Etat, Intituler from [User], Droit where  Droit = Nu_Droit and Nu_User = " + Nu_User , connection);	
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				DateHeure.Text = readerdata.GetDateTime(3).ToString ("d");
				Nom.Text = readerdata["Nom"].ToString ();					
				Prenom.Text = readerdata["Prenom"].ToString ();					
				Compte.Text = readerdata["Compte"].ToString ();					
				Email.Text = readerdata["Email"].ToString ();						
				Tel.Text = readerdata["Tel"].ToString ();		
				Adresse.Text = readerdata["Adresse"].ToString ();					
				Etat.Checked = readerdata.GetBoolean(7);					
				Etat.Text = String.Format("{0}", Etat.Checked ? "Déactiver" : "Activer");
				droit = readerdata["Intituler"].ToString ();	
			}
			connection.Close ();

			Droit.Items.FindByText(droit).Selected = true;
		}
		else
			Response.Redirect ("users.aspx");
	}
}
void Delete ( Object sender, EventArgs e)
{
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from [User] where Nu_User =" + Nu_User, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("users.aspx");
		}
	finally {
		connection.Close ();
	}
}
void Changer ( Object sender, EventArgs e)
{
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	int Value = (Etat.Checked ? 1 : 0);
	
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("update [User] set Etat =" + Value + " where Nu_User =" + Nu_User, connection);
		command.ExecuteNonQuery ();
		}
	finally {
		connection.Close ();
	}
	Etat.Text = String.Format("{0}", Etat.Checked ? "Déactiver" : "Activer");
}
void ChangerDroit ( Object sender, EventArgs e)
{
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("update [User] set Droit = " + Droit.Items[Droit.SelectedIndex].Value + " where Nu_User = " + Nu_User, connection);
	command.ExecuteNonQuery ();
	connection.Close ();
}
bool CheckNu(int Nu_User)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from [User] where Nu_User = " + Nu_User, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("users.aspx");
}
</script>