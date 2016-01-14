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
cours de validit�. <BR>- Un billet en cours de validit�. <BR>- Un visa, si le 
pays d'accueil exige un visa d'entr�e ou de transit si necessaire dans le pays 
de correspondance. <BR>- Une r�servation ferme pour le retour, si exig�e par le 
pays d'accueil. <BR>- Une r�servation ferme pour toute continuation si exig�e. 
<BR>- Un certificat de r�sidence et une autorisation paternelle sont exig�s pour 
les personnes ag�es de moins de 19 ans voyageant seules ou avec des parents 
autres que le p�re ou le tuteur l�gal. - Un certificat de vaccination si requis. 
<BR>- Une assurance voyage. <BR>- En cas de non conformit�, le passager risque � 
la fois refoulement et pr�judice financier. Pensez � annuler toute r�servation 
que vous n'utiliserez pas.<BR>
<mobile:Link id="Link1" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form3" runat="server" Font-Size="Small">
		- Les b�b�s de 
moins de 2 ans n'occupant pas de si�ge individuel ne paient que 10% du tarif 
adulte. <BR>- Les enfants ag�s de 2 � moins de 12 ans b�n�ficient d'une 
r�duction de 33% sur le tarifs adulte. <BR>- D'autres r�ductions sont consenties 
sur nos lignes. Renseignez-vous aupr�s de nos points de ventes et agences 
agr��es.<BR>
<mobile:Link id="Link2" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form4" runat="server" Font-Size="Small">
		- Les passagers 
�premi�re classe� � destination de Paris sur les vols AH 1004 et AH 1008 peuvent 
choisir leur menu avant l'acc�s au salon. <BR>- Aussi, les passagers qui suivent 
un r�gime alimentaire particulier (diab�tiques, hypertendus....) doivent le 
signaler � la r�servation.<BR>
<mobile:Link id="Link3" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> 
	</mobile:Form>
	<mobile:Form id="Form5" runat="server" Font-Size="Small">
<mobile:Label id="Label3" Font-Bold="True" runat="server">* Enfants non accompagn&#233;s </mobile:Label><BR>- 
L'age minimum pour les enfants non accompagn�s est fix� � 4 ans. <BR>- Une 
autorisation paternelle est exig�e � la sortie du territoire Alg�rien pour les 
personnes ag�es de moins de 19 ans. <BR>- Tout enfant ag� de 4 � 12 ans devra 
pr�senter une d�charge de responsabilit� sign�e des parents pr�cisant le nom et 
adresse de la personne devant le prendre en charge � l'arriv�e. <BR>- Pour les 
enfants port�s sur le passeport de l'un des parents, le visa accord� sur ce 
passeport doit imp�rativement les concerner au meme titre que le parent. <BR>
<mobile:Label id="Label1" Font-Bold="True" runat="server">* Malades / Handicap&#233;s </mobile:Label><BR>- 
Toute assistance particuli�re pour les passagers malades ou handicap�s (civi�re, 
ambulance, fauteuil roulant, etc...)doit �tre signal�e d�s la r�servation. <BR>- 
Un dossier m�dical est exig� pour les malades ou handicap�s. ce dossier 
comprendra �ventuellement les �l�ments de prise en charge dans le pays 
d'accueil(hopital, accompagnateur, m�dicaments, etc...) <BR>
<mobile:Label id="Label2" Font-Bold="True" runat="server">* Femmes enceintes et nouveau - n&#233;s </mobile:Label><BR>- 
Sont acc�pt�es sur les lignes AIR ALGERIE, les femmes enceintes jusqu'au 8eme 
mois de grossesse et ce , sur pr�sentation d'un certificat m�dical d�livr� par 
un gyn�cologue attestant de la bonne sant� de la future maman. <BR>- Ce 
certificat, dat� au maximum de 7 jours avant la date du voyage, doit aussi 
pr�ciser qu'il ne s'agit pas d'une grossesse � risque.<BR>
<mobile:Link id="Link4" runat="server" NavigateUrl="#Frm_Guide" SoftkeyLabel="Ret.">Retour</mobile:Link> </mobile:Form>
</body>
