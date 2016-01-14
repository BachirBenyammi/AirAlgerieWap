<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>
<html>
	<head>
		<title>Air Algérie - Voir un contact</title>
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
    						<th align="center" colspan="2">Voir un Contact</th>
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
										<td><b>Email:</b></td>
										<td><asp:label id="Email" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Date:</b></td>
										<td><asp:label id="Date_Access" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Heure:</b></td>
										<td><asp:label id="Heure_Access" runat="server" /></td>
									</tr>	
									<tr>
										<td><b>Sujet:</b></td>
										<td><asp:label id="Sujet" runat="server" /></td>
									</tr>
									<tr><td valign="top"><b>Message:</b></td></tr>
									<tr>
										<td colspan="2"><span class="Details"><asp:Literal ID="Message" Runat=server /></span></td>
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
		int Nu_Contact = int.Parse(Request.Params["Nu_Contact"]);
		if (CheckNu(Nu_Contact)) {
			btnDelete.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sûr ?')");		
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select DateHeure, Email, Sujet, Message from Contacte where Nu_Contact = " + Nu_Contact , connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Date_Access.Text = readerdata.GetDateTime(0).ToString ("d");
				Heure_Access.Text = readerdata.GetDateTime(0).ToString ("hh:mm");
				Sujet.Text = readerdata["Sujet"].ToString ();		
				Email.Text = readerdata["Email"].ToString ();					
				Message.Text = readerdata["Message"].ToString ();
			}
			connection.Close ();
		}
	}
}
void Delete ( Object sender, EventArgs e)
{
	int Nu_Contact= int.Parse(Request.Params["Nu_Contact"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Contacte where Nu_Contact=" + Nu_Contact, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("contacts.aspx");
		}
	finally {
		connection.Close ();
	}
}
bool CheckNu(int Nu_Contact)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Contacte where Nu_Contact = " + Nu_Contact, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("contacts.aspx");
}
</script>