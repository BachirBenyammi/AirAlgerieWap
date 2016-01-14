<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<html>
	<head>
		<title>Ajouter un nouveau utilisateur</title>
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
						<th align="center" colspan=2>Ajouter un nouveau utilisateur</th>
						<tr>
							<td width=10 rowspan="2"></td>
						</tr>						
						<tr>
							<td>
								<p><asp:Label ID="Output" Runat=server /></p>
								<p>
    							<table>
									<tr>
										<td><b>Nom: </b></td>
										<td><asp:TextBox id="Nom" MaxLength="20" Size="20" runat="server" /></td>			
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Nom"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />									
										</td>												
									</tr>  
									<tr>
										<td><b>Prénom: </b></td>
										<td><asp:TextBox id="Prenom" MaxLength="20" Size="20" runat="server" /></td>			
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Prenom"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
										</td>												
									</tr>  									  							
									<tr>
										<td><b>Compte: </b></td>
										<td><asp:TextBox id="Compte" MaxLength="20" Size="20" runat="server" /></td>							
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Compte"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
											<asp:RegularExpressionValidator
											ControlToValidate="Compte" 
											ValidationExpression="^\w+$"
											Display=Dynamic Runat=server
											ErrorMessage="Le nom du compte contient des caractères non valides" />												
										</td>
									</tr>
									<tr>
										<td><b>Mot de passe: </b></td>
										<td><asp:Textbox id="Mot_de_passe" MaxLength="20" Size="20"  TextMode="Password" runat="server" /></td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Mot_de_passe"
											ErrorMessage="*"
											Display="dynamic"
											runat="server"  />																							
										</td>
									</tr>
									<tr>
										<td><b>Confirmation: </b></td>
										<td><asp:Textbox id="Confirm" MaxLength="20" Size="20"  TextMode="Password" runat="server" /></td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Confirm"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />		  
											<asp:CompareValidator 
											ControlToValidate="Confirm" 
											ControlToCompare="Mot_de_passe" 
											ErrorMessage="Confirmation difére de mot de passe !!"
											runat="server" />						
										</td>
									</tr>							
									<td><b>Email: </b></td>
									<td><asp:TextBox id="Email" Size=20 MaxLength="20" runat="server" EnableViewState=False/></td>
									<td>
											<asp:RequiredFieldValidator
											ControlToValidate="Email"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
											<asp:RegularExpressionValidator 
											ControlToValidate="Email" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
											ErrorMessage="Email non valide" 
											Display="Dynamic" 
											Runat=server />
									</td>										
								</tr>		
								<tr>
									<td><b>Tél: </b></td>
									<td><asp:TextBox id="Tel" MaxLength="20" Size="20" runat="server" EnableViewState=False/></td>									
								</tr>
								<tr>
									<td valign="top"><b>Adresse: </b></td>
									<td>
											<asp:TextBox id="Adresse" MaxLength="50" TextMode="MultiLine" Columns="30" rows="4" runat="server" EnableViewState=False />
										<asp:RequiredFieldValidator
											ControlToValidate="Adresse"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
									</td>																							
								</tr>																							
									<tr>
										<td><b>Droit d'acces: </b></td>
										<td>
											<asp:DropDownList id="Droit" runat="server" />
										</td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Droit"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />									
										</td>
									</tr>
								</table>
								</p>
								<p>
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" runat="server" CausesValidation=False />
									<asp:Button CssClass="Button" ID="btnNewUser" Text="Ajouter" OnClick="New" runat="server" />
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
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		connection.Open();
		SqlDataAdapter adapter = new SqlDataAdapter("select Nu_Droit, Intituler From Droit where Intituler <>'Webmaster'", connection);
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		Droit.DataSource = ds;
		Droit.DataValueField = "Nu_Droit";
		Droit.DataTextField = "Intituler";		
		Droit.DataBind();
	}
}
bool ExistUser ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("select count (*) from [User] where Compte ='" + Compte.Text+ "'", connection);
		int count = (int) command.ExecuteScalar ();
		return (count > 0 );
		}
	finally {
		connection.Close ();
		}
}
void New (Object sender, EventArgs e)
{	
	if(!ExistUser()){
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		try {
			connection.Open();
			SqlCommand command = new SqlCommand	("NewUser", connection);
			command.CommandType = CommandType.StoredProcedure;
			command.Parameters.Add("@Compte",Compte.Text);
			command.Parameters.Add("@Nom",Nom.Text);
			command.Parameters.Add("@Prenom",Prenom.Text);
			command.Parameters.Add("@Email",Email.Text);			
			command.Parameters.Add("@Password",Mot_de_passe.Text);
			command.Parameters.Add("@Droit",int.Parse(Droit.Items[Droit.SelectedIndex].Value.ToString()));
			command.Parameters.Add("@DateHeure",DateTime.Today);
			command.Parameters.Add("@Adresse",Adresse.Text);
			command.Parameters.Add("@Tel",Tel.Text);	
			command.ExecuteNonQuery ();
			Response.Redirect("users.aspx");
			}
		finally {
			connection.Close ();
		}
	}
	else
		Output.Text = "Utilisateur déja enregistrer !!";
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("users.aspx");
}
</script>
