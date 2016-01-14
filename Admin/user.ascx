	<table align="center" cellspacing="0" width="760" cellpadding="0">
		<tr>
			<td><span id="jour"></span>&nbsp;<span id="heure"></span></td>
			<td align=right>
				<% Response.Write("Bienvenue Mr. " + Context.User.Identity.Name);%>
				<a href="logout.aspx" class="Menu">[Déconnexion]</a>
			</td>
		</tr>
	</table>
	<HR width="760" color="red" SIZE="5" align=center>