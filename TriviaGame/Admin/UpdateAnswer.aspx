<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UpdateAnswer.aspx.vb" Inherits="TriviaGame.UpdateAnswer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UpdateAnswer</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 101; LEFT: 18px; WIDTH: 180px; POSITION: absolute; TOP: 80px; HEIGHT: 46px" ms_positioning="FlowLayout">Update 
				Answer:</DIV>
			<asp:Label id="idAnswer" style="Z-INDEX: 102; LEFT: 168px; POSITION: absolute; TOP: 153px" runat="server"></asp:Label>
			<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 17px; WIDTH: 138px; POSITION: absolute; TOP: 153px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Answer&nbsp;ID:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 18px; WIDTH: 138px; POSITION: absolute; TOP: 201px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Answer:</DIV>
			<asp:TextBox id="AnswerText" style="Z-INDEX: 105; LEFT: 171px; POSITION: absolute; TOP: 201px" runat="server" TextMode="MultiLine" Width="328px"></asp:TextBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 106; LEFT: 513px; POSITION: absolute; TOP: 211px" runat="server" ControlToValidate="AnswerText" ErrorMessage="You must enter an answer"></asp:RequiredFieldValidator>
			<asp:LinkButton id="DeleteAnswer" style="Z-INDEX: 107; LEFT: 280px; POSITION: absolute; TOP: 83px" runat="server">Delete Answer</asp:LinkButton>
			<asp:Button id="SubmitUpdateAnswer" style="Z-INDEX: 108; LEFT: 270px; POSITION: absolute; TOP: 314px" runat="server" Text="Update Answer"></asp:Button>
			<asp:CheckBox id="Correct" style="Z-INDEX: 109; LEFT: 95px; POSITION: absolute; TOP: 264px" runat="server" Text="Correct:      " TextAlign="Left"></asp:CheckBox>
		</form>
	</body>
</HTML>
