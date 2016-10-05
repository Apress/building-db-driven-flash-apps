<%@ Page Language="vb" AutoEventWireup="false" Codebehind="NewAnswer.aspx.vb" Inherits="TriviaGame.NewAnswer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>NewAnswer</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 117; LEFT: 8px; WIDTH: 180px; POSITION: absolute; TOP: 84px; HEIGHT: 46px" ms_positioning="FlowLayout">New 
				Answer:</DIV>
			<asp:CheckBox id="Correct" style="Z-INDEX: 122; LEFT: 88px; POSITION: absolute; TOP: 250px" runat="server" Text="Correct:      " TextAlign="Left"></asp:CheckBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 118; LEFT: 554px; POSITION: absolute; TOP: 162px" runat="server" ErrorMessage="You must enter an answer" ControlToValidate="AnswerText"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 119; LEFT: 8px; WIDTH: 138px; POSITION: absolute; TOP: 148px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Answer:</DIV>
			<asp:TextBox id="AnswerText" style="Z-INDEX: 120; LEFT: 161px; POSITION: absolute; TOP: 148px" runat="server" TextMode="MultiLine" Width="379px" Height="70px"></asp:TextBox>
			<asp:Button id="SubmitNewAnswer" style="Z-INDEX: 121; LEFT: 267px; POSITION: absolute; TOP: 302px" runat="server" Text="Add Answer"></asp:Button>
		</form>
	</body>
</HTML>
