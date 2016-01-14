<%@ Page%> 
<%@ Register Tagprefix="Ctrlrols" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Ctrlrols" TagName="User" src="user.ascx"%>
<%@ Register Tagprefix="Ctrlrols" TagName="Left" src="left.ascx"%>
<html>

<head>
	<title>Air Algérie - Accueil</title>
	<script language="Javascript" src="script/js.js"></script>
	<link type=text/css href="style/style.css" rel=stylesheet>
</head>

<body onload="debuteDate();debuteTemps()" onunload="clearTimeout(ddate);clearTimeout(ttime)">

<form id="Form1" method="post" runat="server">
	<Ctrlrols:Top id="Top" runat="server" />
	<Ctrlrols:User id="User" runat="server" />

	<table align="center" cellspacing="0" width="760" cellpadding="0">
		<tr>
			<td width="140" valign="top">			
			<p>
			<Ctrlrols:Left id="Left" runat="server" /></p>
			</td>
			<td width="620" valign="top">
			<table width="100%">
				<th align=center colspan="2">Accueil</th>
				<tr>
					<td width=10 rowspan="2"></td>
					<td></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
