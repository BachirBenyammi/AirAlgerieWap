<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>

<html>
	<head>
		<title>Air Alg�rie - Utilisateurs</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form runat="server">
    	<Controls:Top id="top" runat="server" />
    	<Controls:User id="User" runat="server" /> 
    	<table align="center" cellspacing="0" width="760" cellpadding="0">
			<tr>
    			<td width="140" valign=top>
    				<p><Controls:Left id="Left" runat="server" /></p>
				</td>
				
				<td width="620" valign=top>
    				<table width="100%">
    						<th align=center colspan="2">Utilisateurs</th>
						<tr>
							<td width=10 rowspan="2"></td>
						</tr>
						<tr>
							<td>
								<br>
								<p>
									 <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewNews" Runat="server" Width="60" />&nbsp;
									 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />
								</p>							
								&nbsp;<asp:DataGrid ID="NewsGrid"  
							    HeaderStyle-CssClass="Th"
							    ItemStyle-CssClass="Td"
								AutoGenerateColumns="False" 
								PagerStyle-Mode="NumericPages" 
								OnPageIndexChanged="NewPage" 
								OnItemCommand="ItemCommand"
								AllowPaging=True PageSize="10"
								CellPadding="4" 
								CellSpacing="1" 
								Runat="server"  
								Width="100%"
								GridLines=None >
								    <Columns>
								 	 	<asp:BoundColumn DataField="Nu_User" Visible=False />
								 	 	<asp:TemplateColumn HeaderText="Compte">
											<ItemTemplate>
												<asp:HyperLink runat="server" 
													Text='<%# DataBinder.Eval(Container.DataItem, "Compte")%>' 
														NavigateUrl='<%# String.Format("ViewUser.aspx?Nu_User={0}", DataBinder.Eval(Container.DataItem, "Nu_User")) %>'  />
											</ItemTemplate>
										</asp:TemplateColumn>									 	 	
										<asp:BoundColumn HeaderText="Droit d'acc�s" DataField="Intituler" /> 		 
								 	 	<asp:TemplateColumn HeaderText="Activer">
											<ItemTemplate>
													<asp:LinkButton Runat=server Text='<%# String.Format("{0}", ((bool)DataBinder.Eval(Container.DataItem, "Etat")) ? "Activer" : "D�activer") %>' CommandName="Active" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nu_User")%>' />
											</ItemTemplate>
										</asp:TemplateColumn>									 	 	
										
							 	  		<asp:BoundColumn HeaderText="Date d'inscription" DataField="DateHeure" DataFormatString="{0:d}" /> 	 							 	  		   
							 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewUser.aspx?Nu_User={0}", DataBinder.Eval(Container.DataItem, "Nu_User")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:LinkButton ID="btnDelete" runat="server" Text="Supprimer" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nu_User") %>' />
											</ItemTemplate>
										</asp:TemplateColumn>																					
	  								</Columns>
								</asp:DataGrid></tr>	
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_User, Compte, Etat, Intituler, DateHeure from [User], Droit where Droit=Nu_Droit and Intituler <>'Webmaster' order by DateHeure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		NewsGrid.DataSource = ds;
		NewsGrid.DataBind ();
		connection.Close();		
	   	foreach(DataGridItem dgItem in NewsGrid.Items){
	    	LinkButton btnDelete = (LinkButton )dgItem.FindControl("btnDelete");
	    	btnDelete.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre s�r ?')");
		}			
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	NewsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_User, Compte, Etat, Intituler, DateHeure from [User], Droit where Droit=Nu_Droit Intituler <>'Webmaster' order by DateHeure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	NewsGrid.DataSource = ds;
	NewsGrid.DataBind ();	
}
void ItemCommand ( Object sender, DataGridCommandEventArgs e)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	if (e.CommandName == "Delete")
	{
		connection.Open();
		SqlCommand cmd = new SqlCommand ("delete from [User] where Nu_User= " + e.CommandArgument, connection);	
		cmd.ExecuteNonQuery();
		connection.Close();
	}
	else if (e.CommandName == "Active")
	{
		connection.Open();
		int State = GetUserState(int.Parse(e.CommandArgument.ToString()));
		SqlCommand cmd = new SqlCommand ("update [User] set Etat = " + State + " where Nu_User= " + e.CommandArgument, connection);	
		cmd.ExecuteNonQuery();
		connection.Close();
	}
	Response.Redirect("users.aspx");
}
public int GetUserState (int Nu_User)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand command = new SqlCommand("select Etat from [User] where Nu_User = " + Nu_User, connection);
	bool State = (bool) command.ExecuteScalar ();
	if (State)
		return 0;
	else
		return 1;	
	connection.Close ();
}
		
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewNews ( Object sender, EventArgs e)
{
	Response.Redirect("NewUser.aspx");
}
</script>
