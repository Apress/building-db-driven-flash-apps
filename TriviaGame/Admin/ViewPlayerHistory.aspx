<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ViewPlayerHistory.aspx.vb" Inherits="TriviaGame.ViewPlayerHistory" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ViewPlayerHistory</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<!-- #Include File="includes/ValidateCheck.inc" -->
		<!-- #Include File="includes/menu.inc" -->
		<form id="Form1" method="post" runat="server">
			<asp:label id="Score" style="Z-INDEX: 101; LEFT: 86px; POSITION: absolute; TOP: 60px" runat="server"></asp:label>
			<asp:datagrid id="dgAnswers" style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 125px" runat="server" Width="800" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2" AllowSorting="True">
				<Columns>
					<asp:BoundColumn ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="center" DataField="QuestionText" HeaderText="Question"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="QuestionPoints" HeaderText="Points"></asp:BoundColumn>
					<asp:BoundColumn HeaderStyle-HorizontalAlign="center" DataField="AnswerText" HeaderText="Answer"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Correct" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox runat="server" ID="Correct" Checked='<%# DataBinder.Eval(Container.DataItem, "Correct") %>'>
							</asp:CheckBox>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid>
			<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 8px; WIDTH: 70px; POSITION: absolute; TOP: 60px; HEIGHT: 15px" align="right" ms_positioning="FlowLayout">Score:</DIV>
			<asp:LinkButton id="ResetPlayer" style="Z-INDEX: 104; LEFT: 237px; POSITION: absolute; TOP: 57px" runat="server">Reset Player</asp:LinkButton>
		</form>
	</body>
</HTML>
