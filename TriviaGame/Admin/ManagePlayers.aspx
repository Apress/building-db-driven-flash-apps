<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ManagePlayers.aspx.vb" Inherits="TriviaGame.ManagePlayers" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Manage Players</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; Z-INDEX: 102; LEFT: 16px; WIDTH: 162px; POSITION: absolute; TOP: 76px; HEIGHT: 31px" ms_positioning="FlowLayout">Manage 
				Players:</DIV>
			<asp:DataGrid id="dgPlayers" style="Z-INDEX: 101; LEFT: 14px; POSITION: absolute; TOP: 119px" runat="server" AllowSorting="True" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
				<Columns>
					<asp:BoundColumn DataField="idPlayer"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Player ID"></asp:BoundColumn>
					<asp:BoundColumn DataField="PlayerName"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Player Name"></asp:BoundColumn>
					<asp:BoundColumn DataField="LastQuestion"  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="Last Question"></asp:BoundColumn>
					<asp:ButtonColumn Text="History" CommandName="History" HeaderText="Playing History" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
					<asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
				</Columns>
			</asp:DataGrid>
		</form>
	</body>
</HTML>
