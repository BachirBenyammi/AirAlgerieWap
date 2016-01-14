<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Controls" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Controls" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Controls" TagName="User" src="user.ascx"%>

<html>
	<head>
		<title>Air Algérie - Actualités</title>
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
    						<th align=center colspan="2">Actualités</th>
						<tr>
							<td width=10 rowspan="2"></td>
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
								OnItemCommand="Delete"
								AllowPaging=True PageSize="10" 
								CellPadding="4" 
								CellSpacing="1" 
								Runat="server"  
								Width="100%"
								GridLines=None >
								    <Columns>
								 	 	<asp:BoundColumn DataField="Nu_Actualite" Visible=False/>
								 	 	<asp:TemplateColumn HeaderText="Intituler">
											<ItemTemplate>
													<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Intituler")%>' NavigateUrl='<%# String.Format("viewactualite.aspx?Nu_Actualite={0}", DataBinder.Eval(Container.DataItem, "Nu_Actualite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>	 
							 	  		<asp:BoundColumn HeaderText="Date" DataField="DateHeure" DataFormatString="{0:d}" /> 	 							 	  		   
							 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("viewactualite.aspx?Nu_Actualite={0}", DataBinder.Eval(Container.DataItem, "Nu_Actualite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:LinkButton ID="btnDelete" runat="server" Text="Supprimer" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Nu_Actualite") %>' />
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Actualite, Intituler, DateHeure from Actualite order by DateHeure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		NewsGrid.DataSource = ds;
		NewsGrid.DataBind ();
		connection.Close();
	   	foreach(DataGridItem dgItem in NewsGrid.Items){
	    	LinkButton btnDelete = (LinkButton )dgItem.FindControl("btnDelete");
	    	btnDelete.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sûr ?')");
		}	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	NewsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Actualite, Intituler, DateHeure from Actualite order by DateHeure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	NewsGrid.DataSource = ds;
	NewsGrid.DataBind ();	
}
void Delete ( Object sender, DataGridCommandEventArgs e)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand cmd = new SqlCommand ("delete from Actualite where Nu_Actualite= " + e.CommandArgument, connection);	
	cmd.ExecuteNonQuery();
	connection.Close();
	Response.Redirect("actualites.aspx");
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewNews ( Object sender, EventArgs e)
{
	Response.Redirect("newactualite.aspx");
}
</script>
