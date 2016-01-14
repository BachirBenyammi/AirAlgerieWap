<%@ Page language="c#" Codebehind="default.aspx.cs" Inherits="AirAlgerie.accueil" AutoEventWireup="false" enableViewState="False" debug="True"%>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
<meta content="C#" name="CODE_LANGUAGE">
<meta content="http://schemas.microsoft.com/Mobile/Page" name="vs_targetSchema">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:form id="Frm_Accueil" runat="server">
		<mobile:Label id="Label4" runat="server" Font-Size="Small">Bienvenue &#224;</mobile:Label>
		<mobile:Label id="Label3" runat="server" Font-Bold="True" Alignment="Center">Air Alg&#233;rie On WAP</mobile:Label>
		<mobile:Image id="Image2" Alignment="Center" AlternateText="Image" ImageUrl="/airalgerie/images/logo000.bmp" Runat="server"></mobile:Image>
		<mobile:Image id="Image1" Alignment="Center" AlternateText="Image" ImageUrl="/airalgerie/images/logoA.bmp" Runat="server"></mobile:Image>
		<mobile:Link id="Link1" runat="server" SoftkeyLabel="Somm." NavigateUrl="#Frm_Menu">Sommaire</mobile:Link>
	</mobile:form>
	<mobile:Form id="Frm_Menu" runat="server">
		<mobile:Label id="Label1" runat="server" Font-Size="Large" Alignment="Center">Sommaire</mobile:Label>
		<mobile:SelectionList id="SelectionList1" runat="server">
			<Item Value="#Frm_Compagnie" Text="Notre compagnie"></Item>
			<Item Value="programme.aspx" Text="Prog. de vols "></Item>
			<Item Value="reservation.aspx" Text="Reservation"></Item>
			<Item Value="Reductions.aspx" Text="R&#233;ductions"></Item>
			<Item Value="guide.aspx" Text="Guide du passager"></Item>
			<Item Value="#Frm_Calendar" Text="Calendrier"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command1" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
	</mobile:Form>
	<mobile:Form id="Frm_Compagnie" runat="server">
		<mobile:Label id="Label2" runat="server" Font-Size="Large" Alignment="Center">Notre Compagnie</mobile:Label>
		<mobile:SelectionList id="SelectionList2" runat="server">
			<Item Value="actualites.aspx" Text="Actualit&#233;s"></Item>
			<Item Value="presentation.aspx" Text="Pr&#233;sentation"></Item>
			<Item Value="agences.aspx" Text="Nos Agences"></Item>
			<Item Value="contact.aspx" Text="Contactez-nous"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command2" runat="server" SoftkeyLabel="OK" Format="Link">OK</mobile:Command>
		<mobile:Link id="Link2" runat="server" SoftkeyLabel="Somm." NavigateUrl="#Frm_Menu">Sommaire</mobile:Link>
	</mobile:Form>
	<mobile:Form id="Frm_Calendar" runat="server">
		<mobile:Calendar id="Calendar1" runat="server" CalendarEntryText="Voir la calendrier"></mobile:Calendar>
		<mobile:Link id="Link5" runat="server" SoftkeyLabel="Somm." NavigateUrl="#Frm_Menu">Sommaire</mobile:Link>
	</mobile:Form>
</body>
