<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Maintain Administrators</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%

dim sSQL

' Retrieve admin id and user name
sSQL = "select intAdminID, username from PollAdmins order by username"

'  Execute the query
Set objRS = objConn.Execute(sSQL)
%>

<!--  Build a table to display the current PollAdmins -->
<table border=1 cellspacing="2" cellpadding="2" align="center">
<tr>
	<th colspan="2">Administrator Maintenance</th>
</tr>
<tr>
	<!--  Provide an option to add a new administrator -->
	<td colspan="2" align="center">
		<a href="AddNewAdmin.asp">*Add New Admin*</a>
	</td>
</tr>
<%
'  Loop through the admins
do until objRS.eof
%>

	<tr>
		<!--  Build an option to update the current administrator -->
		<td>
			<a href="UpdateAdmin.asp?idAdmin=<%=objRS("intAdminID")%>">
			   <%=objRS("UserName")%></a>
		</td>
		<!--  Build an option to delete a current administrator -->
		<td>
			<a href="DeleteAdmin.asp?idAdmin=<%=objRS("intAdminID")%>">Delete</a>
		</td>
	</tr>

<%

'  Move to the next administrator in the record set
objRS.movenext

'  Loop back
Loop
%>

</table>

<%
objConn.close
%>

</body>
</html>
