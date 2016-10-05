<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UpdateQuestion.aspx.vb" Inherits="TriviaGame.UpdateQuestion" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UpdateQuestion</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<DIV style="Z-INDEX: 100; LEFT: 8px; WIDTH: 10px; POSITION: absolute; TOP: 8px; HEIGHT: 10px" ms_positioning="text2D">
			<FORM id="Form1" method="post" runat="server">
				<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 100; LEFT: 8px; WIDTH: 180px; POSITION: absolute; TOP: 70px; HEIGHT: 46px" ms_positioning="FlowLayout">Update&nbsp;Question:</DIV>
				<asp:RequiredFieldValidator id="RequiredFieldValidator2" style="Z-INDEX: 111; LEFT: 548px; POSITION: absolute; TOP: 261px" runat="server" Width="243px" ControlToValidate="Levels" ErrorMessage="You must select a level"></asp:RequiredFieldValidator>
				<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 102; LEFT: 540px; POSITION: absolute; TOP: 187px" runat="server" ControlToValidate="QuestionText" ErrorMessage="You must enter a question" Width="245px"></asp:RequiredFieldValidator>
				<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 8px; WIDTH: 177px; POSITION: absolute; TOP: 185px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Question:</DIV>
				<asp:TextBox id="QuestionText" style="Z-INDEX: 104; LEFT: 195px; POSITION: absolute; TOP: 185px" runat="server" Width="336px" TextMode="MultiLine"></asp:TextBox>
				<asp:Button id="SubmitUpdateQuestion" style="Z-INDEX: 105; LEFT: 229px; POSITION: absolute; TOP: 465px" runat="server" Text="Update Question"></asp:Button>
				<asp:RequiredFieldValidator id="RequiredFieldValidator3" style="Z-INDEX: 106; LEFT: 418px; POSITION: absolute; TOP: 312px" runat="server" ControlToValidate="DisplayOrderNumber" ErrorMessage="You must enter a level display order" Width="333px"></asp:RequiredFieldValidator>
				<DIV style="DISPLAY: inline; Z-INDEX: 107; LEFT: 9px; WIDTH: 177px; POSITION: absolute; TOP: 310px; HEIGHT: 44px" align="right" ms_positioning="FlowLayout">Level&nbsp;Display 
					Order:</DIV>
				<asp:TextBox id="DisplayOrderNumber" style="Z-INDEX: 108; LEFT: 196px; POSITION: absolute; TOP: 310px" runat="server"></asp:TextBox>
				<asp:DropDownList id="Levels" style="Z-INDEX: 109; LEFT: 199px; POSITION: absolute; TOP: 257px" runat="server" Width="334px"></asp:DropDownList>
				<DIV style="DISPLAY: inline; Z-INDEX: 110; LEFT: 6px; WIDTH: 177px; POSITION: absolute; TOP: 256px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Level:</DIV>
		</DIV>
		<asp:linkbutton id="DeleteQuestion" style="Z-INDEX: 111; LEFT: 239px; POSITION: absolute; TOP: 79px" runat="server">Delete Question</asp:linkbutton>
		<asp:label id="idQuestion" style="Z-INDEX: 102; LEFT: 209px; POSITION: absolute; TOP: 149px" runat="server"></asp:label>
		<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 58px; WIDTH: 138px; POSITION: absolute; TOP: 149px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Question 
			ID:</DIV>
		<asp:DropDownList id="Categories" style="Z-INDEX: 117; LEFT: 206px; POSITION: absolute; TOP: 381px" runat="server" Width="334px"></asp:DropDownList>
		<DIV style="DISPLAY: inline; Z-INDEX: 118; LEFT: 13px; WIDTH: 177px; POSITION: absolute; TOP: 380px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Category:</DIV>
		<asp:RequiredFieldValidator id="RequiredFieldValidator4" style="Z-INDEX: 119; LEFT: 555px; POSITION: absolute; TOP: 385px" runat="server" ErrorMessage="You must select a category" ControlToValidate="Categories" Width="243px"></asp:RequiredFieldValidator>
		</FORM>
	</body>
</HTML>
