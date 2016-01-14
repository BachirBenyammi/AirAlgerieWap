<%@ Page language="c#" Codebehind="programme.aspx.cs" Inherits="Admin.programme" AutoEventWireup="false" debug="False" enableViewState="True"%>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
<meta content="C#" name="CODE_LANGUAGE">
<meta content="http://schemas.microsoft.com/Mobile/Page" name="vs_targetSchema">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:form id="Frm_Prog" runat="server">
		<mobile:Label id="Label1" runat="server">S&#233;lectionner le vol souhait&#233;</mobile:Label>
		<mobile:SelectionList id="Vol_Type" runat="server">
			<Item Value="0" Text="National"></Item>
			<Item Value="1" Text="International"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command1" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
	</mobile:form>
	<mobile:form id="FrmPays" runat="server">
		<mobile:Label id="Label2" runat="server" DESIGNTIMEDRAGDROP="23" Font-Bold="True">Pays source:</mobile:Label>
		<mobile:SelectionList id="ListPaysSrc" runat="server"></mobile:SelectionList>
		<mobile:Label id="Label3" runat="server" Font-Bold="True">Pays destination:</mobile:Label>
		<mobile:SelectionList id="ListPaysDest" runat="server"></mobile:SelectionList>
		<mobile:Command id="Command2" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
	</mobile:form>
	<mobile:form id="FrmVille" runat="server">
		<mobile:Label id="Label5" runat="server" Font-Bold="True">Ville source:</mobile:Label>
		<mobile:SelectionList id="ListVilleSrc" runat="server"></mobile:SelectionList>
		<mobile:Label id="Label4" runat="server" Font-Bold="True">Ville destination:</mobile:Label>
		<mobile:SelectionList id="ListVilleDest" runat="server"></mobile:SelectionList>
		<mobile:Command id="Command3" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
	</mobile:form>
	<mobile:form id="FrmAPT" runat="server">
		<mobile:Label id="Label8" runat="server" Font-Bold="True">A&#233;roport source:</mobile:Label>
		<mobile:SelectionList id="ListAPTSrc" runat="server"></mobile:SelectionList>
		<mobile:Label id="Label7" runat="server" Font-Bold="True">A&#233;roport destination:</mobile:Label>
		<mobile:SelectionList id="ListAPTDest" runat="server"></mobile:SelectionList>
		<mobile:Command id="Command4" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
	</mobile:form>
	<mobile:form id="FrmDate" runat="server">
		<mobile:Label id="Label9" runat="server" Font-Bold="True">Date d&#233;but: (jj-mm-aa)</mobile:Label>
		<mobile:TextBox id="TextDtDebut" runat="server"></mobile:TextBox>
		<mobile:Label id="Label10" runat="server" Font-Bold="True">Date fin: (jj-mm-aa)</mobile:Label>
		<mobile:TextBox id="TextDtFin" runat="server"></mobile:TextBox>
		<mobile:Command id="Command5" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
		<mobile:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextDtDebut">*</mobile:RequiredFieldValidator>
		<mobile:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextDtFin">*</mobile:RequiredFieldValidator>
		<mobile:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TextDtFin" Type="Date" ControlToCompare="TextDtDebut" Operator="LessThan">Donn&#233;s erron&#233;es, Essayer a nouveau </mobile:CompareValidator>
	</mobile:form>
	<mobile:Form id="FrmDet" runat="server">
		<mobile:Label id="Label13" runat="server" Font-Bold="True">Nbr vol(s) disp.(s):</mobile:Label>
		<mobile:Label id="Lab_Nbr" runat="server"></mobile:Label>
		<mobile:Label id="Label15" runat="server" Font-Bold="True">Nu Vol:</mobile:Label>
		<mobile:Label id="Lab_NuVol" runat="server"></mobile:Label>
		<mobile:Label id="Label6" runat="server" Font-Bold="True">Heure d&#233;part:</mobile:Label>
		<mobile:Label id="Lab_HD" runat="server"></mobile:Label>
		<mobile:Label id="Label11" runat="server" Font-Bold="True">Heure arriv&#233;e:</mobile:Label>
		<mobile:Label id="Lab_HA" runat="server"></mobile:Label>
		<mobile:Label id="Label12" runat="server" Font-Bold="True">Avion:</mobile:Label>
		<mobile:Label id="Lab_Avion" runat="server"></mobile:Label>
		<mobile:Link id="Link1" runat="server" NavigateUrl="#FrmResult" SoftkeyLabel="Suite">Suite</mobile:Link>
	</mobile:Form>
	<mobile:form id="FrmResult" runat="server">
		<mobile:Label id="Lab_Result" runat="server"></mobile:Label>
		<mobile:SelectionList id="ListResult" runat="server" Rows="1"></mobile:SelectionList>
		<mobile:Command id="Command6" runat="server" Format="Link" SoftkeyLabel="Ret.">Retour</mobile:Command>
		<mobile:Link id="Link2" runat="server" NavigateUrl="default.aspx?form=menu" SoftkeyLabel="Somm.">Sommaire</mobile:Link>
	</mobile:form>
</body>
