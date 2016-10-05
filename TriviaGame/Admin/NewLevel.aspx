<%@ Page Language="vb" AutoEventWireup="false" Codebehind="NewLevel.aspx.vb" Inherits="TriviaGame.NewLevel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>NewLevel</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 100; LEFT: 7px; WIDTH: 180px; POSITION: absolute; TOP: 69px; HEIGHT: 46px" ms_positioning="FlowLayout">New 
				Level:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 101; LEFT: 382px; POSITION: absolute; TOP: 135px" runat="server" ErrorMessage="You must enter a level name" ControlToValidate="LevelName"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 102; LEFT: 7px; WIDTH: 138px; POSITION: absolute; TOP: 133px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level&nbsp;Name:</DIV>
			<asp:TextBox id="LevelName" style="Z-INDEX: 103; LEFT: 160px; POSITION: absolute; TOP: 133px" runat="server"></asp:TextBox>
			<asp:Button id="SubmitNewLevel" style="Z-INDEX: 104; LEFT: 194px; POSITION: absolute; TOP: 299px" runat="server" Text="Add Level"></asp:Button>
			<asp:RequiredFieldValidator id="RequiredFieldValidator2" style="Z-INDEX: 105; LEFT: 382px; POSITION: absolute; TOP: 173px" runat="server" ErrorMessage="You must enter a level color" ControlToValidate="LevelName"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 106; LEFT: 7px; WIDTH: 138px; POSITION: absolute; TOP: 171px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level&nbsp;Color:</DIV>
			<asp:TextBox id="LevelColor" style="Z-INDEX: 107; LEFT: 160px; POSITION: absolute; TOP: 171px" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator3" style="Z-INDEX: 108; LEFT: 383px; POSITION: absolute; TOP: 215px" runat="server" ControlToValidate="LevelOrder" ErrorMessage="You must enter a level order"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 111; LEFT: 8px; WIDTH: 138px; POSITION: absolute; TOP: 213px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level&nbsp;Order:</DIV>
			<asp:TextBox id="LevelOrder" style="Z-INDEX: 112; LEFT: 161px; POSITION: absolute; TOP: 213px" runat="server"></asp:TextBox>

		<asp:RequiredFieldValidator id="RequiredFieldValidator4" style="Z-INDEX: 114; LEFT: 384px; POSITION: absolute; TOP: 257px" runat="server" ControlToValidate="QuestionPoints" ErrorMessage="You must enter the points to be awarded at this level."></asp:RequiredFieldValidator>
		<DIV style="DISPLAY: inline; Z-INDEX: 115; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 255px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Question 
			Points:</DIV>
		<asp:TextBox id="QuestionPoints" style="Z-INDEX: 116; LEFT: 162px; POSITION: absolute; TOP: 255px" runat="server"></asp:TextBox>
			</form>
	</body>
</HTML>
