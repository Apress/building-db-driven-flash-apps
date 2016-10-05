<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Update Administrator</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%

dim sSQL

'  See if there was an error in a previous post
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid username of password</font>
</center>
<%
end if 

' Retrieve the username and password for update
sSQL = "select username, password from PollAdmins where intAdminID = " & _
       request.QueryString("idAdmin")

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

%>

<!--  Build a form to enter the update -->
<form method="post" action="InsUpdAdmin.asp" ID="Form1">

<!-- Indicate to the post page than an update is to be peformed -->
<input type="hidden" value="update" name="Action" ID="Hidden1">

<!-- Pass through the id of the adminstrator -->
<input type="hidden" value="<%=request.querystring("idadmin")%>" name="AdminID">

<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Update Administrator<br>&nbsp;</td>
</tr>
<tr>
	<td>Username:</td>
	
	<!-- Show the user name -->	
	<td>
		<input type="text" size="29" 
		       value="<%=objRS("UserName")%>" name="UserName">
	</td>
</tr>
<tr>
	<td>Password:</td>

	<!-- Show the password -->	
	<td>
		<input type="password" size="25" value="<%=objRS("Password")%>" 
		       name="Password">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Update" name="Submit">
	</td>
</tr>

</table>

</form>

<%
objConn.close
%>

</body>
</html>
