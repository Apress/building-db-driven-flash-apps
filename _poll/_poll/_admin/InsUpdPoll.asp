<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL
dim sQuestion
dim sPassword

'  Retrieve the question from the posted form and ensure 
'  any leading or trailing spaces are removed
sQuestion = trim(request.form("Question"))

'  Check to see if a value was entered at all
if len(sQuestion) = 0 then
	'  Check the value of the hidden action variable 
	if request.Form("action") = "insert" then
		'  If an insert, send them to the add new Polls page
		response.Redirect("AddNewPoll.asp?Error=1")
	else
		'  If an update, send them to the update Polls page
		response.Redirect("UpdatePoll.asp?idPoll=" & _
				request.Form("PollID") & "&Error=1")	
	end if
end if

'  Double up any single quotes for a successful insert into SQL
sQuestion = replace(sQuestion, "'", "''")

'  Check the value of the hidden action variable
if request.Form("action") = "insert" then
	' Build a SQL insert for the new poll
	sSQL = "insert into Polls(strQuestion) values('" & sQuestion & "')"
else
	' Build a SQL update for the existing poll
	sSQL = "update Polls set strQuestion = '" & sQuestion & _
			"' where intPollID = " & request.Form("PollID")
end if

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

'  Send back to the Polls maintance main pae
response.Redirect("MaintainPolls.asp")

objConn.close

%>