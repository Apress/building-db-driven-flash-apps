<%@ Language=VBScript %>
<%Option Explicit%>
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Poll Engine Administration</title>

<!--  Build a form for the enter to log in and be validated -->
<form method="post" action="ValidateLogin.asp" ID="Form1">

<table cellpadding="4" cellspacing="4" align="center">
<tr>
	<td colspan="2" align="center">Poll Administration Log In<br>&nbsp;</td>
</tr>
<tr>
	<!--  Field to enter their username -->
	<td>User Name:</td>
	<td><input type="text" size="29" value="" name="UserName"></td>
</tr>
<tr>
	<!--  Field to enter their password -->
	<td>Password:</td>
	<td><input type="password" size="25" value="" name="Password"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Log In" name="Submit">
	</td>
</tr>

</table>

</form>

</body>
</html>
