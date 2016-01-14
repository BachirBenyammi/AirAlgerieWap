<%@ Control%>
	<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="140" align=center>
	<th>Air Algérie</th>
	<TR><td class="Td"><a href="default.aspx">Accueil</a></td></tr>	
	<tr><td class="Td"><a href="actualites.aspx">Acualités</a></td></tr>
	<tr><td class="Td"><a href="agences.aspx">Agences</a></td></tr>
	<tr><td class="Td"><a href="reductions.aspx">Réductions</a></td></tr>
	<tr><td> &nbsp;</td></tr>
	<th>Progr. des vols</th>		
	<tr><td class="Td"><a href="vols.aspx">Vols</a></td></tr>

	<tr><td class="Td" align=center> -------------- </td></tr>
	<tr><td class="Td"><a href="apparails.aspx">Appareils</a></td></tr>	
	<tr><td class="Td"><a href="avions.aspx">Avions</a></td></tr>

	<tr><td class="Td" align=center> -------------- </td></tr>
	<tr><td class="Td"><a href="aeroports.aspx">Aéroports</a></td></tr>
	<tr><td class="Td"><a href="trajets.aspx">Trajets</a></td></tr>
	
	<tr><td class="Td" align=center> -------------- </td></tr>
	<tr><td class="Td"><a href="villes.aspx">Villes</a></td></tr>
	<tr><td class="Td"><a href="pays.aspx">Pays</a></td></tr>

</TABLE>
<br>
		<%if (!Application["Droit"].Equals("Secritaire"))
		{%>                             
<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="140" align=center>
	<th>Administration</th>
	<TR><td class="Td"><a href="users.aspx">Utilisateurs</a></td></tr>
	<tr><td class="Td"><a href="contacts.aspx">Contacts</a></td></tr>
</TABLE>
		<%}%>