<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ManageLevels.aspx.vb" Inherits="TriviaGame.ManageLevels" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ManageLevels</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 8px; WIDTH: 162px; POSITION: absolute; TOP: 67px; HEIGHT: 31px" ms_positioning="FlowLayout">Manage 
				Levels:</DIV>
			<asp:DataGrid id="dgLevels" style="Z-INDEX: 102; LEFT: 9px; POSITION: absolute; TOP: 125px" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2" AllowSorting="True">
				<Columns>
					<asp:BoundColumn DataField="idLevel" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Level ID"></asp:BoundColumn>
					<asp:BoundColumn DataField="LevelName" HeaderStyle-HorizontalAlign="Center" HeaderText="Level Name"></asp:BoundColumn>
					<asp:BoundColumn DataField="LevelColor" HeaderStyle-HorizontalAlign="Center" HeaderText="Level Color"></asp:BoundColumn>
					<asp:BoundColumn DataField="LevelOrder" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Level Order"></asp:BoundColumn>
					<asp:BoundColumn DataField="QuestionPoints" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Question<BR>Points"></asp:BoundColumn>
					<asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
				</Columns>
			</asp:DataGrid>
			<asp:LinkButton id="NewLevel" style="Z-INDEX: 103; LEFT: 271px; POSITION: absolute; TOP: 66px" runat="server">New Level</asp:LinkButton>
		</form>
	</body>
</HTML>
