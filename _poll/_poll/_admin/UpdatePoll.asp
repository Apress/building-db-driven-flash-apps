<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Update Poll</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%

dim sSQL

'  See if there is an error from a previous post
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid question.</font>
</center>
<%
end if 

' Retrieve the question
sSQL = "select strQuestion from Polls where intPollID = " & _
       request.QueryString("idPoll")

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

%>

<!--  Build a form to display the Polls question -->
<form method="post" action="InsUpdPoll.asp" ID="Form1">

<!-- Indicate to the post page that a Polls is being updated -->
<input type="hidden" value="update" name="Action" ID="Hidden1">

<!-- Pass the ID of the Polls that is being worked with -->
<input type="hidden" value="<%=request.querystring("idPoll")%>" name="PollID">

<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Update Poll<br>&nbsp;</td>
</tr>
<tr>
	<td>Question:</td>
	
	<!--  Show the question -->
	<td>
	    <textarea cols="50" name="Question"><%=objRS("strQuestion")%></textarea>
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
