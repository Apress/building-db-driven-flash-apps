<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL

' Build the SQL delete statement
sSQL = "delete from PollAnswers where intAnswerID = " & _
		request.QueryString("idAnswer")

'  Execute the query
Set objRS = objConn.Execute(sSQL)

objConn.close

'  Send the user back to the main answer maintenance page
response.Redirect("MaintainAnswers.asp?idPoll=" & request.QueryString("idPoll"))

%>