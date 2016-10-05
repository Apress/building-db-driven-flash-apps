<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->

<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Add New Polls Answer</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%
'  Check for an error
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid answer</font>
</center>
<%
end if 
%>

<!--  Build a form to post the new answer data -->
<form method="post" action="InsUpdAnswer.asp" ID="Form1">

<!--  Indicate to the post page an insert should be performed -->
<input type="hidden" value="insert" name="Action" ID="Hidden1">

<!--  Pass along the ID of the Polls for the answer -->
<input type="hidden" value="<%=request.querystring("idPoll")%>" name="IDPoll">

<!--  Build a table to display the data entry screen -->
<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Add New Polls Answer<br>&nbsp;</td>
</tr>
<tr>
	<td>Answer:</td>
	<td>
		<textarea cols="50" name="Answer" ID="Textarea1"></textarea>
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
