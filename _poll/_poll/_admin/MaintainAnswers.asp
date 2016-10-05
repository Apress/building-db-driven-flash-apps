<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Manage Polls Answers</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->

<%

dim sSQL

' Retrieve the Polls question
sSQL = "select strQuestion from Polls where intPollID = " & _
       request.QueryString("idPoll")

'  Execute the query
Set objRS = objConn.Execute(sSQL)

%>

<!-- Build a table to display the options for managing the Polls PollAnswers -->
<table cellpadding="4" cellspacing="4" border="1" align="center">
<tr>
	<td colspan="3" align="center">Manage Polls Answers</td>
</tr>

<!--  Show the question -->
<tr>
	<td>Question:</td>
	<td colspan="2"><%=objRS("strQuestion")%></td>
</tr>

<!--  Build an option to add an answer.  Note the ID of the Polls to 
      add the answer to is passed on the query string -->
<tr>
	<td colspan="3" align="center">
		<a href="AddAnswer.asp?idPoll=<%=request.querystring("idPoll")%>">
		   Add Answer</a>
	</td>
</tr>
<%

' Retrieve the current PollAnswers for te poll
sSQL = "select intAnswerID, strAnswer, intResponseCount from PollAnswers " & _
       "where intPollID = " & request.QueryString("idPoll")

'  Execute the query
Set objRS = objConn.Execute(sSQL)

'  Loop through the answers
do until objRS.eof
%>

<tr>
	<!--  Show the answer id -->
	<td align="center"><%=objRS("intAnswerID")%></td>
	<!--  Build an option to update the answer.  Note that the id 
	      of the answer and the Polls are passed on the query strong -->
	<td>
		<a href="UpdateAnswer.asp?idPoll=<%=request.querystring("idPoll")%>&idAnswer=<%=objRS("intAnswerID")%>"><%=objRS("strAnswer")%></a>
	</td>
	<!--  Build an option to delete an answer -->
	<td>
		<a href="DeleteAnswer.asp?idPoll=<%=request.querystring("idPoll")%>&idAnswer=<%=objRS("intAnswerID")%>">Delete</a>
	</td>
</tr>

<%
'  Move to the next answser in the record set
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
