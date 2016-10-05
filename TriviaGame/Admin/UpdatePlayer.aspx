<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UpdatePlayer.aspx.vb" Inherits="TriviaGame.UpdatePlayer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UpdatePlayer</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 101; LEFT: 11px; WIDTH: 138px; POSITION: absolute; TOP: 71px; HEIGHT: 28px" ms_positioning="FlowLayout">Update 
				Player:</DIV>
			<asp:requiredfieldvalidator id="RequiredFieldValidator2" style="Z-INDEX: 109; LEFT: 385px; POSITION: absolute; TOP: 226px" runat="server" ErrorMessage="You must enter a password" ControlToValidate="Password"></asp:requiredfieldvalidator><asp:textbox id="Password" style="Z-INDEX: 107; LEFT: 164px; POSITION: absolute; TOP: 224px" runat="server"></asp:textbox><asp:label id="idPlayer" style="Z-INDEX: 102; LEFT: 161px; POSITION: absolute; TOP: 128px" runat="server"></asp:label>
			<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 10px; WIDTH: 138px; POSITION: absolute; TOP: 128px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Player 
				ID:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 11px; WIDTH: 138px; POSITION: absolute; TOP: 176px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">User 
				Name:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 105; LEFT: 12px; WIDTH: 138px; POSITION: absolute; TOP: 224px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Password:</DIV>
			<asp:textbox id="PlayerName" style="Z-INDEX: 106; LEFT: 164px; POSITION: absolute; TOP: 176px" runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" style="Z-INDEX: 108; LEFT: 386px; POSITION: absolute; TOP: 181px" runat="server" ErrorMessage="You must enter a player name" ControlToValidate="PlayerName"></asp:requiredfieldvalidator><asp:button id="SubmitUpdatePlayer" style="Z-INDEX: 110; LEFT: 255px; POSITION: absolute; TOP: 280px" runat="server" Text="Update Player"></asp:button>
			<asp:LinkButton id="PlayerDelete" style="Z-INDEX: 113; LEFT: 190px; POSITION: absolute; TOP: 75px" runat="server">Delete Player</asp:LinkButton>
		</form>
	</body>
</HTML>
