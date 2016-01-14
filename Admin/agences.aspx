<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>

<html>
	<head>
		<title>Air Algérie - Agences</title>
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
    						<th align=center colspan="2">Agences</th>
						<tr>
							<td width=10 rowspan="2"></td>
						<td>
							<br>
							<p>
								 <asp:Button CssClass="Button" Text="Nouveau" OnClick="New" Runat="server" Width="60" />&nbsp;
								 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />
							</p>							
							&nbsp;<asp:DataGrid ID="NewsGrid"  
							    HeaderStyle-CssClass="Th"
							    ItemStyle-CssClass="Td"
								AutoGenerateColumns="False" 
								PagerStyle-Mode="NumericPages" 
								OnPageIndexChanged="NewPage" 
								AllowPaging=True PageSize="10" 
								CellPadding="4" 
								CellSpacing="1" 
								Runat="server"  
								Width="100%"
								GridLines=None >
								    <Columns>
								 	 	<asp:BoundColumn DataField="Code_Agence" Visible=False/>
								 	 	<asp:TemplateColumn HeaderText="Agence">
											<ItemTemplate>
													<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Agence")%>' NavigateUrl='<%# String.Format("ViewAgence.aspx?Code_Agence={0}", DataBinder.Eval(Container.DataItem, "Code_Agence")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>	 
											<asp:BoundColumn DataField="Ville" HeaderText="Ville"/>
											<asp:BoundColumn DataField="Pays" HeaderText="Pays"/>
							 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewAgence.aspx?Code_Agence={0}", DataBinder.Eval(Container.DataItem, "Code_Agence")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
							 	  			<asp:TemplateColumn HeaderText="Modifier" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Modifier" NavigateUrl='<%# String.Format("ModifAgence.aspx?Code_Agence={0}", DataBinder.Eval(Container.DataItem, "Code_Agence")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteAgence.aspx?Code_Agence={0}", DataBinder.Eval(Container.DataItem, "Code_Agence")) %>' />
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Code_Agence, Agence.Intituler as Agence, Ville.Intituler as Ville, Pays.Intituler as Pays from Agence, Ville, Pays where Ville=Code_Ville and Pays = Code_Pays order by Pays.Intituler DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		NewsGrid.DataSource = ds;
		NewsGrid.DataBind ();
		connection.Close();
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	NewsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Code_Agence, Agence.Intituler as Agence, Ville.Intituler as Ville, Pays.Intituler as Pays from Agence, Ville, Pays where Ville=Code_Ville and Pays = Code_Pays order by Pays.Intituler DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	NewsGrid.DataSource = ds;
	NewsGrid.DataBind ();	
}

void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void New ( Object sender, EventArgs e)
{
	Response.Redirect("newagence.aspx");
}
</script>
