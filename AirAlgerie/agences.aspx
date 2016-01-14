<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<%@ Page language="c#" Codebehind="agences.aspx.cs" Inherits="AirAlgerie.agences" AutoEventWireup="false" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm" dir="ltr">
	<P>
		<mobile:form id="Frm_Prog" runat="server">
			<mobile:Label id="Label1" runat="server" Font-Bold="True">S&#233;lectionner le territoire souhait&#233;</mobile:Label>
			<mobile:SelectionList id="Agence_Type" runat="server">
				<Item Value="0" Text="National"></Item>
				<Item Value="1" Text="International"></Item>
			</mobile:SelectionList>
			<mobile:Command id="Command1" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
		</mobile:form>
		<mobile:form id="FrmPays" runat="server">
			<mobile:Label id="Label2" runat="server" Font-Bold="True" DESIGNTIMEDRAGDROP="23">S&#233;l&#233;ctionnez le pays</mobile:Label>
			<mobile:SelectionList id="ListPays" runat="server"></mobile:SelectionList>
			<mobile:Command id="Command2" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
		</mobile:form>
		<mobile:form id="FrmVille" runat="server">
			<mobile:Label id="Label5" runat="server" Font-Bold="True">S&#233;l&#233;ctionnez la ville</mobile:Label>
			<mobile:SelectionList id="ListVille" runat="server"></mobile:SelectionList>
			<mobile:Command id="Command3" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
		</mobile:form>
		<mobile:Form id="FrmAgence" runat="server" DESIGNTIMEDRAGDROP="56">
			<mobile:Label id="Label6" runat="server" Font-Bold="True" DESIGNTIMEDRAGDROP="64">S&#233;l&#233;ctionnez l'agence</mobile:Label>
			<mobile:SelectionList id="ListAgence" runat="server"></mobile:SelectionList>
			<mobile:Command id="Command4" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
		</mobile:Form>
		<mobile:form id="FrmDet" runat="server">
			<mobile:Label id="Lab_Intituler" runat="server"></mobile:Label>
			<mobile:Label id="lab" runat="server" Font-Bold="True">Code Agence</mobile:Label>
			<mobile:Label id="Lab_Code" runat="server"></mobile:Label>
			<mobile:Label id="Label4" runat="server" Font-Bold="True">T&#233;l:</mobile:Label>
			<mobile:Label id="Lab_Tel" runat="server"></mobile:Label>
			<mobile:Label id="Label3" runat="server" Font-Bold="True">Adresse:</mobile:Label>
			<mobile:Label id="Lab_Adr" runat="server"></mobile:Label>
			<mobile:Label id="Label7" runat="server" Font-Bold="True">Ville:</mobile:Label>
			<mobile:Label id="Lab_Ville" runat="server"></mobile:Label>
			<mobile:Command id="Command5" runat="server" SoftkeyLabel="Ret." Format="Link">Retour</mobile:Command>
			<mobile:Link id="Link1" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
		</mobile:form>
	</P>
</body>
