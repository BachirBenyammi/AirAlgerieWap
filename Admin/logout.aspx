<%@ Page%> 
<%@ Import NameSpace="System.Data.SqlClient"%> 
<%@ Register Tagprefix="Ctrlrols" TagName="Top" src="top.ascx"%>

<html>
	<head>
		<title>Déconnexion</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="style/style.css" rel=stylesheet>
	</head>
<body onload="debuteDate();debuteTemps()" onunload="clearTimeout(ddate);clearTimeout(ttime)">
	<form runat=server>
		<Ctrlrols:Top id="Top" runat="server" />
	<table width="80%" height="80%">
		<tr>
			<td valign="center" align="center">
				<table cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<br>
							<h3>Vouz avez déconnecter !!</h3>
							<hr>
							<p>Pour retourner, visiter <a href="login.aspx">La page de connexion</a> </p>
							<hr>
						</td>
					</tr>
				</table>				
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<script language="c#" runat="server">
void Page_Load (Object sender, EventArgs e)
{
	FormsAuthentication.SignOut ();
	Application["Droit"]="";
}
</script>
