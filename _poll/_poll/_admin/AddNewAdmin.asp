<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->

<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Add New Administrator</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%
'  Check for an error
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid username of password</font>
</center>
<%
end if 
%>

<!--  Build a form to post the new admin data -->
<form method="post" action="InsUpdAdmin.asp" ID="Form1">

<!--  Indicate to the post page that an insert is to be performed -->
<input type="hidden" value="insert" name="Action">

<!--  Build a table to display the new admin data entry -->
<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Add New Administrator<br>&nbsp;</td>
</tr>
<tr>
	<td>Username:</td>
	<td><input type="text" size="29" value="" name="UserName"></td>
</tr>
<tr>
	<td>Password:</td>
	<td><input type="password" size="25" value="" name="Password"></td>
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
