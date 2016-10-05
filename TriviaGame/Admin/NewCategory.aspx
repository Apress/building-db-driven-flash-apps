<%@ Page Language="vb" AutoEventWireup="false" Codebehind="NewCategory.aspx.vb" Inherits="TriviaGame.NewCategory" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>NewCategory</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->	
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 109; LEFT: 9px; WIDTH: 180px; POSITION: absolute; TOP: 63px; HEIGHT: 46px" ms_positioning="FlowLayout">New 
				Category:</DIV>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 116; LEFT: 384px; POSITION: absolute; TOP: 129px" runat="server" ErrorMessage="You must enter a category name" ControlToValidate="CategoryName"></asp:RequiredFieldValidator>
			<DIV style="DISPLAY: inline; Z-INDEX: 112; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 127px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Category&nbsp;Name:</DIV>
			<asp:TextBox id="CategoryName" style="Z-INDEX: 113; LEFT: 162px; POSITION: absolute; TOP: 127px" runat="server"></asp:TextBox>
			<asp:Button id="SubmitNewCategory" style="Z-INDEX: 115; LEFT: 126px; POSITION: absolute; TOP: 191px" runat="server" Text="Add Category"></asp:Button>
		</form>
	</body>
</HTML>
