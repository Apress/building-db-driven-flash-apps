<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ManageCategories.aspx.vb" Inherits="TriviaGame.ManageCategories" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ManageCategories</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; Z-INDEX: 102; LEFT: 8px; WIDTH: 162px; POSITION: absolute; TOP: 72px; HEIGHT: 31px" ms_positioning="FlowLayout">Manage 
				Categories:</DIV>
			<asp:DataGrid id="dgCategories" style="Z-INDEX: 101; LEFT: 9px; POSITION: absolute; TOP: 130px" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2" AllowSorting="True">
				<Columns>
					<asp:BoundColumn DataField="idCategory" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Category ID"></asp:BoundColumn>
					<asp:BoundColumn DataField="CategoryName" HeaderText="Category Name"></asp:BoundColumn>
					<asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
				</Columns>
			</asp:DataGrid>
			<asp:LinkButton id="NewCategory" style="Z-INDEX: 103; LEFT: 271px; POSITION: absolute; TOP: 71px" runat="server">New Category</asp:LinkButton>
		</form>
	</body>
</HTML>
