<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<html>
	<head>
		<title>Ajouter une nouvelle actualité</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form id="frm" runat="server">
    	<Controls:Top id="top" runat="server" />
		<Controls:User id="User" runat="server" />     	
    	<table align="center" cellspacing="0" width="760" cellpadding="0">
			<tr>
    			<td width="140" valign=top>
    				<p><Controls:Left id="Left" runat="server" /></p>
				</td>			
				<td width="620" valign=top>
					<table width="100%">
						<th align="center" colspan=2>Ajouter une nouvelle actualité</th>
						<tr>
							<td width=10 rowspan="2"></td>
						</tr>						
						<tr>
							<td>
								<p><asp:Label ID="Output" Runat=server /></p>
								<p>
    							<table>
									<tr>
										<td><b>Intituler: </b></td>
										<td><asp:TextBox id="Intituler" MaxLength="20" Size="20" runat="server" /></td>			
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Intituler"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />									
										</td>												
									</tr>  						
									<tr>
										<td valign="top"><b>Description: </b></td>
										<td>
												<asp:TextBox id="Description" MaxLength="50" TextMode="MultiLine" Columns="30" rows="4" runat="server" EnableViewState=False />
											<asp:RequiredFieldValidator
												ControlToValidate="Description"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
										</td>																							
									</tr>																							
								</table>
								</p>
								<p>
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" runat="server" CausesValidation=False />
									<asp:Button CssClass="Button" ID="btnNew" Text="Ajouter" OnClick="New" runat="server" />
							</td>
						</tr>
    				</table>
    			</td>
    		</tr>
    	</table>
    </form>
</body>
</html>

<script runat="server">
void New (Object sender, EventArgs e)
{	
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("NewActualite", connection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@Intituler",Intituler.Text);
		command.Parameters.Add("@Description",Description.Text);
		command.Parameters.Add("@DateHeure",DateTime.Today);
		command.ExecuteNonQuery ();
		Response.Redirect("actualites.aspx");
	}
	finally {
		connection.Close ();
	}
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("actualites.aspx");
}
</script>
