<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL
dim sAnswer
dim sPassword

'  Retrievet the answer and trim any trailing or
'  leading spaces
sAnswer = trim(request.form("Answer"))

'  Check to see if a value was entered
if len(sAnswer) = 0 then
	'  Check the value of the action variable
	if request.Form("action") = "insert" then
	
		'  Send the user to the Add Answer page
		response.Redirect("AddAnswer.asp?Error=1")
	else
	
		'  Send the user to the update answer page
		response.Redirect("UpdateAnswer.asp?idAnswer=" & _
		     request.Form("idAnswer") & "&Error=1")	
	end if
end if

'  Double up any single quotes for a successful SQL insert
sAnswer = replace(sAnswer, "'", "''")

'  Check the value of the action variable
if request.Form("action") = "insert" then
	' Insert the new answer
	sSQL = "insert into PollAnswers(strAnswer, intPollID) values('" & sAnswer & _
		   "', " & request.Form("idPoll") & ")"
else
	' Update the existing answer
	sSQL = "update PollAnswers set strAnswer = '" & sAnswer & _
		   "' where intAnswerID = " & request.Form("AnswerID")
end if

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

objConn.close

'  Send the user back ot the answer main administration page
'  for the current poll
response.Redirect("MaintainAnswers.asp?idPoll=" & request.Form("idPoll"))

%>