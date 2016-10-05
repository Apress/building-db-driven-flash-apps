<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL

' Build a SQL delete statement
sSQL = "delete from Polls where intPollID = " & request.QueryString("idPoll")

'  Execute the query
Set objRS = objConn.Execute(sSQL)


' Build a SQL delete statement
sSQL = "delete from PollAnswers where intPollID = " & request.QueryString("idPoll")

'  Execute the query
Set objRS = objConn.Execute(sSQL)

objConn.close

'  Send the user back to the main Polls admin page
response.Redirect("MaintainPolls.asp")

%>