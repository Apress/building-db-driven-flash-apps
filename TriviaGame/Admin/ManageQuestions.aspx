<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ManageQuestions.aspx.vb" Inherits="TriviaGame.ManageQuestions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ManageQuestions</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; Z-INDEX: 105; LEFT: 8px; WIDTH: 162px; POSITION: absolute; TOP: 72px; HEIGHT: 31px" ms_positioning="FlowLayout">Manage 
				Questions:</DIV>
			<asp:DataGrid id="dgQuestions" style="Z-INDEX: 102; LEFT: 9px; POSITION: absolute; TOP: 131px" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2" AllowSorting="True">
				<Columns>
					<asp:BoundColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="center" DataField="idQuestion" HeaderText="Question ID"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="QuestionText" HeaderText="Question"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="LevelName" HeaderText="Level"></asp:BoundColumn>
					<asp:BoundColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="center" DataField="DisplayOrderNumber" HeaderText="Level<BR>Display Order"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="CategoryName" HeaderText="Category"></asp:BoundColumn>
					<asp:ButtonColumn Text="Update Question" CommandName="Update"></asp:ButtonColumn>
					<asp:ButtonColumn Text="Manage Answers" CommandName="Answers"></asp:ButtonColumn>
				</Columns>
			</asp:DataGrid>
			<asp:LinkButton id="NewQuestion" style="Z-INDEX: 104; LEFT: 271px; POSITION: absolute; TOP: 72px" runat="server">New Question</asp:LinkButton>
		</form>
	</body>
</HTML>
