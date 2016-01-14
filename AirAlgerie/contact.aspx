<%@ Page language="c#" Codebehind="contact.aspx.cs" Inherits="AirAlgerie.contact" AutoEventWireup="false" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Frm_Contact" runat="server">
		<mobile:Label id="Label1" runat="server" Alignment="Center" Font-Bold="True">Contactez-nous</mobile:Label>
		<mobile:SelectionList id="SelectionList1" runat="server">
			<Item Value="Frm_Adr" Text="Par Adresse"></Item>
			<Item Value="Frm_Msg" Text="Par Message"></Item>
			<Item Value="Frm_Tel" Text="Par T&#233;l&#233;phone"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command1" runat="server" SoftkeyLabel="OK" Format="Link">Ok</mobile:Command>
	</mobile:Form>
	<mobile:Form id="Frm_Adr" runat="server">
		<P>
<mobile:Label id="Label2" runat="server" Font-Bold="True" BreakAfter="False">Siege Social :</mobile:Label><BR>01, 
Place Maurice Audin Alger Algerie<BR>
<mobile:Label id="Label3" runat="server" Font-Bold="True" BreakAfter="False">T&#233;l&#233;phone:</mobile:Label><BR>213 
(0) 21 65 33 40 - 65 33 80 - 65 33 89 - 74 24 28<BR>
<mobile:Label id="Label4" runat="server" Font-Bold="True" BreakAfter="False">Fax:</mobile:Label><BR>213 
(0) 21 74 44 25 - 50 94 21 - 61 05 53 </P>
		<mobile:Link id="Link1" runat="server" SoftkeyLabel="Ret." NavigateUrl="#Frm_Contact">Retour</mobile:Link>
		<mobile:Link id="Link6" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
	</mobile:Form>
	<mobile:Form id="Frm_Msg" runat="server">
		<mobile:Label id="Label5" runat="server">Email:</mobile:Label>
		<mobile:TextBox id="TextEmail" runat="server" MaxLength="50"></mobile:TextBox>
		<mobile:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextEmail" ErrorMessage="*"></mobile:RequiredFieldValidator>
		<mobile:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextEmail" ErrorMessage="Email non valide" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"></mobile:RegularExpressionValidator>
		<mobile:Label id="Label6" runat="server">Sujet:</mobile:Label>
		<mobile:TextBox id="TextSujet" runat="server" MaxLength="50"></mobile:TextBox>
		<mobile:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextSujet" ErrorMessage="*"></mobile:RequiredFieldValidator>
		<mobile:Label id="Label7" runat="server">Message:</mobile:Label>
		<mobile:TextBox id="TextMsg" runat="server"></mobile:TextBox>
		<mobile:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="TextMsg" ErrorMessage="*"></mobile:RequiredFieldValidator>
		<mobile:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ControlToValidate="TextMsg" ErrorMessage="Le messge  doit être compris entre10 et 200 caractére" ValidationExpression="^(.|\n){10,200}$"></mobile:RegularExpressionValidator>
		<mobile:Command id="Command2" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
	</mobile:Form>
	<mobile:Form id="Frm_Tel" runat="server">
		<mobile:PhoneCall id="PhoneCall1" runat="server" PhoneNumber="021653340">Appelez</mobile:PhoneCall>
		<mobile:Link id="Link2" runat="server" SoftkeyLabel="Ret." NavigateUrl="#Frm_Contact">Retour</mobile:Link>
		<mobile:Link id="Link5" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
	</mobile:Form>
	<mobile:Form id="Frm_Fin" runat="server">
		<P>
			<mobile:Label id="Label8" runat="server">Merci d'avoir poser votre message</mobile:Label>
			<mobile:Link id="Link3" runat="server" SoftkeyLabel="Ret." NavigateUrl="#Frm_Contact">Retour</mobile:Link>
			<mobile:Link id="Link4" runat="server" SoftkeyLabel="Somm." NavigateUrl="default.aspx?form=menu">Sommaire</mobile:Link>
		</P>
	</mobile:Form>
</body>
