<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<%@ Page language="c#" Codebehind="guide.aspx.cs" Inherits="AirAlgerie.guide" AutoEventWireup="false" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm" dir="ltr">
	<mobile:Form id="Frm_Guide" runat="server" Font-Bold="False">
		<mobile:Label id="Label4" Font-Bold="True" runat="server" Alignment="Center" Font-Size="Large">Guide de passager</mobile:Label>
		<mobile:SelectionList id="SelectionList1" runat="server">
			<Item Value="#Form2" Text="Documents de Voyage"></Item>
			<Item Value="#Form3" Text="Reductions Tarifaires"></Item>
			<Item Value="#Form4" Text="Choix du Menu"></Item>
			<Item Value="#Form5" Text="Passagers &#224; Particularit&#233;"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command1" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
		<mobile:Link id="Link5" runat="server" NavigateUrl="default.aspx?form=menu" SoftkeyLabel="Somm." DESIGNTIMEDRAGDROP="50">Sommaire</mobile:Link>
	</mobile:Form>
	<mobile:Form id="Form2" runat="server" Font-Size="Small">
		- Un passeport en 
cours de validité. <BR>- Un billet en cours de validité. <BR>- Un visa, si le 
pays d'accueil exige un visa d'entrée ou de transit si necessaire dans le pays 
de correspondance. <BR>- Une réservation ferme pour le retour, si exigée par le 
pays d'accueil. <BR>- Une réservation ferme pour toute continuation si exigée. 
<BR>- Un certificat de résidence et une autorisation paternelle sont exigés pour 
les personnes agées de moins de 19 ans voyageant seules ou avec des parents 
autres que le père ou le tuteur légal. - Un certificat de vaccination si requis. 
<BR>- Une assurance voyage. <BR>- En cas de non conformité, le passager risque à 
la fois refoulement et préjudice financier. Pensez à annuler toute réservation 
que vous n'utiliserez pas.<BR>
<mobile:Link id="Link1" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form3" runat="server" Font-Size="Small">
		- Les bébés de 
moins de 2 ans n'occupant pas de siège individuel ne paient que 10% du tarif 
adulte. <BR>- Les enfants agés de 2 à moins de 12 ans bénéficient d'une 
réduction de 33% sur le tarifs adulte. <BR>- D'autres réductions sont consenties 
sur nos lignes. Renseignez-vous auprés de nos points de ventes et agences 
agréées.<BR>
<mobile:Link id="Link2" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form4" runat="server" Font-Size="Small">
		- Les passagers 
«première classe» à destination de Paris sur les vols AH 1004 et AH 1008 peuvent 
choisir leur menu avant l'accès au salon. <BR>- Aussi, les passagers qui suivent 
un régime alimentaire particulier (diabétiques, hypertendus....) doivent le 
signaler à la réservation.<BR>
<mobile:Link id="Link3" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form5" runat="server" Font-Size="Small">
<mobile:Label id="Label3" Font-Bold="True" runat="server">* Enfants non accompagn&#233;s </mobile:Label><BR>- 
L'age minimum pour les enfants non accompagnés est fixé à 4 ans. <BR>- Une 
autorisation paternelle est exigée à la sortie du territoire Algérien pour les 
personnes agées de moins de 19 ans. <BR>- Tout enfant agé de 4 à 12 ans devra 
présenter une décharge de responsabilité signée des parents précisant le nom et 
adresse de la personne devant le prendre en charge à l'arrivée. <BR>- Pour les 
enfants portés sur le passeport de l'un des parents, le visa accordé sur ce 
passeport doit impérativement les concerner au meme titre que le parent. <BR>
<mobile:Label id="Label1" Font-Bold="True" runat="server">* Malades / Handicap&#233;s </mobile:Label><BR>- 
Toute assistance particulière pour les passagers malades ou handicapés (civière, 
ambulance, fauteuil roulant, etc...)doit être signalée dés la réservation. <BR>- 
Un dossier médical est exigé pour les malades ou handicapés. ce dossier 
comprendra éventuellement les éléments de prise en charge dans le pays 
d'accueil(hopital, accompagnateur, médicaments, etc...) <BR>
<mobile:Label id="Label2" Font-Bold="True" runat="server">* Femmes enceintes et nouveau - n&#233;s </mobile:Label><BR>- 
Sont accéptées sur les lignes AIR ALGERIE, les femmes enceintes jusqu'au 8eme 
mois de grossesse et ce , sur présentation d'un certificat médical délivré par 
un gynécologue attestant de la bonne santé de la future maman. <BR>- Ce 
certificat, daté au maximum de 7 jours avant la date du voyage, doit aussi 
préciser qu'il ne s'agit pas d'une grossesse à risque.<BR>
<mobile:Link id="Link4" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> </mobile:Form>
</body>
