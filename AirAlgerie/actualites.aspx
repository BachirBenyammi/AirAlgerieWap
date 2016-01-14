<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<%@ Page language="c#" Codebehind="actualites.aspx.cs" Inherits="AirAlgerie.actualites" AutoEventWireup="false" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<P>
		<mobile:Form id="FrmActualite" runat="server">
			<mobile:SelectionList id="ListNews" runat="server"></mobile:SelectionList>
			<mobile:Command id="Command1" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
			<mobile:Link id="Link2" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
		</mobile:Form>
		<mobile:Form id="FrmDet" runat="server">
			<mobile:Label id="Label2" runat="server" Font-Bold="True">Date:</mobile:Label>
			<mobile:Label id="Lab_Date" runat="server"></mobile:Label>
			<mobile:Label id="Label1" runat="server" Font-Bold="True" BreakAfter="False">D&#233;tails:</mobile:Label>
			<mobile:TextView id="Text_Desc" runat="server">TextView</mobile:TextView>
			<mobile:Link id="Link1" runat="server" SoftkeyLabel="Ret." NavigateUrl="#FrmActualite">Retour</mobile:Link>
			<mobile:Link id="Link3" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
		</mobile:Form>
	</P>
</body>
