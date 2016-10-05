<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UpdateCategory.aspx.vb" Inherits="TriviaGame.UpdateCategory" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>UpdateCategory</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 101; LEFT: 9px; WIDTH: 180px; POSITION: absolute; TOP: 58px; HEIGHT: 46px" ms_positioning="FlowLayout">Update 
				Category:</DIV>
			<asp:Label id="idCategory" style="Z-INDEX: 102; LEFT: 159px; POSITION: absolute; TOP: 131px" runat="server"></asp:Label>
			<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 8px; WIDTH: 138px; POSITION: absolute; TOP: 131px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Category&nbsp;ID:</DIV>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 9px; WIDTH: 138px; POSITION: absolute; TOP: 179px; HEIGHT: 28px" align="right" ms_positioning="FlowLayout">Category&nbsp;Name:</DIV>
			<asp:TextBox id="CategoryName" style="Z-INDEX: 105; LEFT: 162px; POSITION: absolute; TOP: 179px" runat="server" Width="294px"></asp:TextBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 106; LEFT: 478px; POSITION: absolute; TOP: 181px" runat="server" ControlToValidate="CategoryName" ErrorMessage="You must enter a category name"></asp:RequiredFieldValidator>
			<asp:LinkButton id="DeleteCategory" style="Z-INDEX: 107; LEFT: 271px; POSITION: absolute; TOP: 61px" runat="server">Delete Category</asp:LinkButton>
			<asp:Button id="SubmitUpdateCategory" style="Z-INDEX: 108; LEFT: 260px; POSITION: absolute; TOP: 266px" runat="server" Text="Update Category"></asp:Button>
		</form>
	</body>
</HTML>
