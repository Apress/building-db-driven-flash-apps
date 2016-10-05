<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL
dim sUserName
dim sPassword

'  Retrieve the posted username and password
sUserName = trim(request.form("UserName"))
sPassword = trim(request.form("Password"))

'  Double up any single quotes for a sucessfuly SQL query
sUserName = replace(sUserName, "'", "''")
sPassword = replace(sPassword, "'", "''")

' Build a query to see if there are any matching admin records
sSQL = "select username, password from PollAdmins where username = '" & _
sUserName & "' and Password = '" & sPassword & "'"

'  Execute the query
Set objRS = objConn.Execute(sSQL)

'  Check the results
if objRS.eof then
	'  No matching admin - send the user to the login page
	response.Redirect("Login.asp")
	session("Validated") = False
else
	'  Maching admin - store the successful validation in a 
	'  session variable and send the user to the main menu
	session("Validated") = True
	response.Redirect("menu.asp")
end if

objConn.close

%>