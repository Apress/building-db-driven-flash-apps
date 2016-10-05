<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ManageAnswers.aspx.vb" Inherits="TriviaGame.ManageAnswers" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ManageAnswers</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 103; LEFT: 16px; WIDTH: 186px; POSITION: absolute; TOP: 131px; HEIGHT: 46px" ms_positioning="FlowLayout">Manage 
				Answsers:</DIV>
			<asp:DataGrid id="dgAnswers" style="Z-INDEX: 101; LEFT: 9px; POSITION: absolute; TOP: 192px" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2" AllowSorting="True">
				<Columns>
					<asp:BoundColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="center" DataField="idAnswer" HeaderText="Answer ID"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="AnswerText" HeaderText="Answer"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Correct" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox runat="server" ID="Correct" Checked='<%# DataBinder.Eval(Container.DataItem, "Correct") %>'>
							</asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:ButtonColumn Text="Update Answer" CommandName="Update"></asp:ButtonColumn>
				</Columns>
			</asp:DataGrid>
			<asp:LinkButton id="NewAnswer" style="Z-INDEX: 102; LEFT: 271px; POSITION: absolute; TOP: 133px" runat="server">New Answer</asp:LinkButton>
			<DIV style="DISPLAY: inline; FONT-WEIGHT: bold; Z-INDEX: 104; LEFT: 18px; WIDTH: 83px; POSITION: absolute; TOP: 64px; HEIGHT: 46px" ms_positioning="FlowLayout">Question:</DIV>
			<asp:Label id="QuestionText" style="Z-INDEX: 105; LEFT: 121px; POSITION: absolute; TOP: 68px" runat="server" Width="398px"></asp:Label>
		</form>
	</body>
</HTML>
