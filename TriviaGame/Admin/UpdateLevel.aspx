<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UpdateLevel.aspx.vb" Inherits="TriviaGame.UpdateLevel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UpdateLevel</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 101; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 61px; HEIGHT: 28px" ms_positioning="FlowLayout">Update 
				Level:</DIV>
			<asp:requiredfieldvalidator id="RequiredFieldValidator2" style="Z-INDEX: 102; LEFT: 383px; POSITION: absolute; TOP: 232px" runat="server" ErrorMessage="You must enter a color" ControlToValidate="LevelColor"></asp:requiredfieldvalidator>
			<asp:textbox id="LevelColor" style="Z-INDEX: 103; LEFT: 162px; POSITION: absolute; TOP: 230px" runat="server"></asp:textbox>
			<asp:label id="idLevel" style="Z-INDEX: 104; LEFT: 159px; POSITION: absolute; TOP: 134px" runat="server"></asp:label>
			<DIV style="DISPLAY: inline; Z-INDEX: 105; LEFT: 8px; WIDTH: 138px; POSITION: absolute; TOP: 134px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level 
				ID:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 106; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 182px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">User 
				Name:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 107; LEFT: 10px; WIDTH: 138px; POSITION: absolute; TOP: 230px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Color:</DIV>
			<asp:textbox id="LevelName" style="Z-INDEX: 108; LEFT: 162px; POSITION: absolute; TOP: 182px" runat="server" Width="390px"></asp:textbox>
			<asp:requiredfieldvalidator id="RequiredFieldValidator1" style="Z-INDEX: 109; LEFT: 562px; POSITION: absolute; TOP: 186px" runat="server" ErrorMessage="You must enter a level name" ControlToValidate="LevelName"></asp:requiredfieldvalidator>
			<asp:button id="SubmitUpdateLevel" style="Z-INDEX: 110; LEFT: 220px; POSITION: absolute; TOP: 377px" runat="server" Text="Update Level"></asp:button>
			<asp:linkbutton id="DeleteLevel" style="Z-INDEX: 111; LEFT: 271px; POSITION: absolute; TOP: 64px" runat="server">Delete Level</asp:linkbutton>
			<asp:RequiredFieldValidator id="RequiredFieldValidator3" style="Z-INDEX: 112; LEFT: 384px; POSITION: absolute; TOP: 277px" runat="server" ControlToValidate="LevelOrder" ErrorMessage="You must enter a level order"></asp:RequiredFieldValidator>
			<asp:TextBox id="LevelOrder" style="Z-INDEX: 113; LEFT: 162px; POSITION: absolute; TOP: 275px" runat="server"></asp:TextBox>
			<DIV style="DISPLAY: inline; Z-INDEX: 114; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 275px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level&nbsp;Order:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator4" style="Z-INDEX: 115; LEFT: 384px; POSITION: absolute; TOP: 316px" runat="server" ControlToValidate="QuestionPoints" ErrorMessage="You must enter the points to be awarded at this level."></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 116; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 314px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Question 
				Points:</DIV>
			<asp:TextBox id="QuestionPoints" style="Z-INDEX: 117; LEFT: 162px; POSITION: absolute; TOP: 314px" runat="server"></asp:TextBox>
		</form>
	</body>
</HTML>
