<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Login.aspx.vb" Inherits="TriviaGame.Login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; Z-INDEX: 100; LEFT: 63px; WIDTH: 405px; POSITION: absolute; TOP: 88px; HEIGHT: 39px" ms_positioning="FlowLayout">Enter 
				in your username and password to log in:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator2" style="Z-INDEX: 108; LEFT: 404px; POSITION: absolute; TOP: 218px" runat="server" Width="232px" ErrorMessage="You must enter a password." Height="25px" ControlToValidate="Password"></asp:RequiredFieldValidator>
			<asp:TextBox id="Password" style="Z-INDEX: 102; LEFT: 190px; POSITION: absolute; TOP: 212px" runat="server" TextMode="Password" Width="204px"></asp:TextBox>
			<asp:TextBox id="UserName" style="Z-INDEX: 101; LEFT: 189px; POSITION: absolute; TOP: 177px" runat="server"></asp:TextBox>
			<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 65px; WIDTH: 112px; POSITION: absolute; TOP: 176px; HEIGHT: 26px; TEXT-ALIGN: right" ms_positioning="FlowLayout">User 
				Name:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 66px; WIDTH: 112px; POSITION: absolute; TOP: 217px; HEIGHT: 26px; TEXT-ALIGN: right" ms_positioning="FlowLayout">Password:</DIV>
			<asp:Button id="SubmitLogin" style="Z-INDEX: 105; LEFT: 248px; POSITION: absolute; TOP: 269px" runat="server" Text="Log In"></asp:Button>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 107; LEFT: 403px; POSITION: absolute; TOP: 181px" runat="server" Width="232px" ErrorMessage="You must enter a user name." Height="25px" ControlToValidate="UserName"></asp:RequiredFieldValidator>
		</form>
	</body>
</HTML>
