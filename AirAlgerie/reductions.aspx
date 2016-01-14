<%@ Page language="c#" Codebehind="reductions.aspx.cs" Inherits="AirAlgerie.reductions" AutoEventWireup="false" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<P>
		<mobile:Form id="FrmRed" runat="server">
			<mobile:Label id="Label5" runat="server" DESIGNTIMEDRAGDROP="88" Font-Bold="True">S&#233;l&#233;ectionnez une cat&#233;gorie:</mobile:Label>
			<mobile:SelectionList id="ListReduc" runat="server"></mobile:SelectionList>
			<mobile:Command id="Command1" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
			<mobile:Link id="Link2" runat="server" NavigateUrl="default.aspx?form=menu" SoftkeyLabel="Somm.">Sommaire</mobile:Link>
		</mobile:Form>
		<mobile:Form id="FrmDet" runat="server">
			<mobile:Label id="Label1" runat="server" Font-Bold="True" BreakAfter="False">Cat&#233;gorie: </mobile:Label>
			<mobile:Label id="Lab_Cat" runat="server">Label</mobile:Label>
			<mobile:Label id="Label2" runat="server" Font-Bold="True" BreakAfter="False">Taux:</mobile:Label>
			<mobile:Label id="Lab_Taux" runat="server">Label</mobile:Label>
			<mobile:Label id="Label3" runat="server" Font-Bold="True" BreakAfter="False">Valitit&#233;:</mobile:Label>
			<mobile:Label id="Lab_Val" runat="server">Label</mobile:Label>
			<mobile:Label id="Label4" runat="server" Font-Bold="True" BreakAfter="False">Description:</mobile:Label>
			<mobile:TextView id="Text_Desc" runat="server">TextView</mobile:TextView>
			<mobile:Link id="Link1" runat="server" NavigateUrl="#FrmRed" SoftkeyLabel="Ret.">Retour</mobile:Link>
			<mobile:Link id="Link3" runat="server" NavigateUrl="default.aspx?form=menu" SoftkeyLabel="Somm.">Sommaire</mobile:Link>
		</mobile:Form>
	</P>
</body>
