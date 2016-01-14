<%@ Page language="c#" Codebehind="presentation.aspx.cs" Inherits="AirAlgerie.presentation" AutoEventWireup="false" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Frm_Presentation" runat="server">
		<mobile:Label id="Label4" runat="server" DESIGNTIMEDRAGDROP="26" Font-Size="Large" Alignment="Center" Font-Bold="True">Pr&#233;sentation</mobile:Label>
		<mobile:SelectionList id="SelectionList1" runat="server">
			<Item Value="#Form2" Text="Air Algerie"></Item>
			<Item Value="#Form3" Text="L'exp&#233;rience "></Item>
			<Item Value="#Form4" Text="Le partage"></Item>
			<Item Value="#Form5" Text="Les services Air Alg&#233;rie"></Item>
			<Item Value="#Form6" Text="Catering"></Item>
			<Item Value="#Form7" Text="Maintenance"></Item>
		</mobile:SelectionList>
		<mobile:Command id="Command1" runat="server" Format="Link" SoftkeyLabel="OK">OK</mobile:Command>
		<mobile:Link id="Link7" runat="server" NavigateUrl="default.aspx?form=menu" SoftkeyLabel="Somm.">Sommaire</mobile:Link>
	</mobile:Form>
	<mobile:Form id="Form2" runat="server" Font-Size="Small">La compagnie 
nationale porte-drapeau, Air Alg�rie, jouit d'une exp�rience enviable dans son 
domaine. Elle a consolid� ses parts de march� (trafic passagers) avec 78.4% sur 
le r�seau international, 100% sur le r�seau domestique, trafic passagers 
r�gulier en forte croissance (+ 17%) <BR>Air Alg�rie compte 37 escales 
internationales et 29 escales nationales et dispose d'un solide r�seau 
commercial, avec 43 agences ou d�l�gations � l'�tranger et 98 agences r�parties 
sur le territoire national. C'est dire sa dimension. <BR>Aussi, Air Alg�rie est 
reli�e � un r�seau de vente de plus de 3000 agences agr��es en Alg�rie et � 
l'�tranger.<BR>
<mobile:Link id="Link1" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> </mobile:Form>
	<mobile:Form id="Form3" runat="server" Font-Size="Small">Cr��e en 1947, 
Air Alg�rie est une prestigieuse entreprise mature en pleine expansion, alliant 
savoir-faire et exp�rience. C'est pour cela qu'elle inspire confiance, comme en 
t�moignent les 3.1 million de passagers qui ont choisi notre compagnie durant 
l'ann�e 2003 <BR>Air Alg�rie compte beaucoup sur l'exp�rience et le 
professionnalisme de son personnel dont la qualit� de l'accueil n'a d'�gale que 
le savoir-faire.<BR>
<mobile:Link id="Link2" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> 
</mobile:Form>
	<mobile:Form id="Form4" runat="server" Font-Size="Small">Air Alg�rie a 
accompagn� ses concitoyens et partag� avec eux tous les moments de gloire et 
d'�motion. Elle les a fait b�n�ficier de son savoir-faire et de son exp�rience 
acquis tout au long de son parcours d'entreprise mod�le. <BR>Entreprise 
citoyenne, son engagement et sa fid�lit� ne sont plus � d�montrer.<BR>
<mobile:Link id="Link3" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> 
</mobile:Form>
	<mobile:Form id="Form5" runat="server" Font-Size="Small">C'est une 
nouvelle �re qu'inaugure Air Alg�rie. Elle fait de la qualit� de ses services 
son coeur de m�tier. Tout est fait pour que notre passager se sente chez lui : 
enregistrement simplifi� et assist�, accueil souriant, prise en charge totale 
durant le vol. Tout pour faire de votre voyage un v�ritable plaisir. <BR>Pour 
votre confort, le renouvellement de notre flotte, entam� en 2000 avec 
l'acquisition de 12 Boeing 737-NG, sera total en 2005. Ce programme de 
modernisation vise la satisfaction maximale de nos passagers.<BR>
<mobile:Link id="Link4" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> 
</mobile:Form>
	<mobile:Form id="Form6" runat="server" Font-Size="Small">Incontestablement, Air Alg�rie dispose de l'un des meilleurs 
services catering au monde. Tous les passagers ont eu � constater la fraicheur 
de nos produits, leur saveur particuli�re et leur haut niveau d'hygi�ne. 
<BR>Tous cela fait qu'on ne choisit pas Air Alg�rie par hasard. On est chez 
soi.<BR>
<mobile:Link id="Link5" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> 
</mobile:Form>
	<mobile:Form id="Form7" runat="server" Font-Size="Small">La base de 
maintenance, nouvellement acquise par Air Alg�rie, constitue le joyau de 
l'entreprise et un pole continental tant par la qualification de ses 
techniciens, sa dimension que par ses �quipements de derni�re technologie. 
<BR>Cette structure permet d'assurer un niveau de maintenance hautement qualifi� 
avec une optimisation de l'aspect s�curitaire.<BR>
<mobile:Link id="Link6" runat="server" NavigateUrl="#Frm_Presentation" SoftkeyLabel="Ret.">Retour</mobile:Link> </mobile:Form>
</body>
