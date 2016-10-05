<%@ Page Language="vb" AutoEventWireup="false" Codebehind="NewQuestion.aspx.vb" Inherits="TriviaGame.NewQuestion" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>NewQuestion</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 100; LEFT: 8px; WIDTH: 180px; POSITION: absolute; TOP: 70px; HEIGHT: 46px" ms_positioning="FlowLayout">New 
				Question:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator2" style="Z-INDEX: 112; LEFT: 548px; POSITION: absolute; TOP: 210px" runat="server" ErrorMessage="You must select a level" ControlToValidate="Levels" Width="243px"></asp:RequiredFieldValidator>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 101; LEFT: 540px; POSITION: absolute; TOP: 136px" runat="server" ErrorMessage="You must enter a question" ControlToValidate="QuestionText"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 102; LEFT: 8px; WIDTH: 177px; POSITION: absolute; TOP: 134px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Question:</DIV>
			<asp:TextBox id="QuestionText" style="Z-INDEX: 103; LEFT: 195px; POSITION: absolute; TOP: 134px" runat="server" TextMode="MultiLine" Width="336px"></asp:TextBox>
			<asp:Button id="SubmitNewQuestion" style="Z-INDEX: 104; LEFT: 231px; POSITION: absolute; TOP: 401px" runat="server" Text="Add Question"></asp:Button>
			<asp:RequiredFieldValidator id="RequiredFieldValidator3" style="Z-INDEX: 105; LEFT: 418px; POSITION: absolute; TOP: 261px" runat="server" ErrorMessage="You must enter a level display order" ControlToValidate="DisplayOrderNumber"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 106; LEFT: 9px; WIDTH: 177px; POSITION: absolute; TOP: 259px; HEIGHT: 44px" align="right" ms_positioning="FlowLayout">Level&nbsp;Display 
				Order:</DIV>
			<asp:TextBox id="DisplayOrderNumber" style="Z-INDEX: 107; LEFT: 196px; POSITION: absolute; TOP: 259px" runat="server"></asp:TextBox>
			<asp:DropDownList id="Levels" style="Z-INDEX: 110; LEFT: 199px; POSITION: absolute; TOP: 206px" runat="server" Width="334px"></asp:DropDownList>
			<DIV style="DISPLAY: inline; Z-INDEX: 111; LEFT: 6px; WIDTH: 177px; POSITION: absolute; TOP: 205px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level:</DIV>
			<asp:DropDownList id="Categories" style="Z-INDEX: 114; LEFT: 195px; POSITION: absolute; TOP: 319px" runat="server" Width="334px"></asp:DropDownList>
			<DIV style="DISPLAY: inline; Z-INDEX: 115; LEFT: 2px; WIDTH: 177px; POSITION: absolute; TOP: 318px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Category:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator4" style="Z-INDEX: 116; LEFT: 544px; POSITION: absolute; TOP: 323px" runat="server" Width="243px" ControlToValidate="Categories" ErrorMessage="You must select a category"></asp:RequiredFieldValidator>
		</form>
	</body>
</HTML>
