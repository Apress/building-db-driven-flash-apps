<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->

<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Add New Poll</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%
'  Check for an error
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid question</font>
</center>
<%
end if 
%>

<!--  Build a form to add the new Polls -->
<form method="post" action="InsUpdPoll.asp" ID="Form1">

<!--  Indicate an insert of the new Polls is to be performed -->
<input type="hidden" value="insert" name="Action" ID="Hidden1">

<!--  Build a table to display the data entry of the new Polls -->
<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Add New Poll<br>&nbsp;</td>
</tr>
<tr>
	<td>Question:</td>
	<td>
		<textarea cols="50" name="Question"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Add" name="Submit">
	</td>
</tr>

</table>

</form>


</body>
</html>
