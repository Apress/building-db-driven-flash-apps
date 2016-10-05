<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Update Answer</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%

dim sSQL

'  See if there was an error on a previous post
if request.QueryString("Error") = 1 then
%>
<center>
<font color="red">You did not enter a valid answer</font>
</center>
<%
end if 

' Retrieve the answer text
sSQL = "select strAnswer from PollAnswers where intAnswerID = " & _
       request.QueryString("idAnswer")

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

%>

<!-- Form to post the answer update -->
<form method="post" action="InsUpdAnswer.asp" ID="Form1">

<!-- Indicate to the post page that an update is to be done -->
<input type="hidden" value="update" name="Action" ID="Hidden1">

<!-- Pass the ID of the answer to update -->
<input type="hidden" value="<%=request.querystring("idAnswer")%>" name="AnswerID">

<!-- Pass the ID of the Polls that is being worked with -->
<input type="hidden" value="<%=request.querystring("idPoll")%>" name="idPoll">

<table cellpadding="2" cellspacing="2" ID="Table1" align="center">
<tr>
	<td colspan="2" align="center">Update Answer<br>&nbsp;</td>
</tr>
<tr>
	<td>Question:</td>
	
	<!-- Show the answer text -->
	<td>
	  <textarea cols="50" name="Answer"><%=objRS("strAnswer")%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Update" name="Submit" ID="Submit1">
	</td>
</tr>

</table>

</form>

<%
objConn.close
%>

</body>
</html>
