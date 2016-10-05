<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL
dim sUserName
dim sPassword

'  Retrieve the username and password values
sUserName = trim(request.form("UserName"))
sPassword = trim(request.form("Password"))

'  Check to see if either are empty
if len(sUserName) = 0 or len(sPassword) = 0 then
	'  Check the form action value
	if request.Form("action") = "insert" then
		'  Send the user to the add new admin page
		response.Redirect("AddNewAdmin.asp?Error=1")
	else
		'  Send the user to the update admin page
		response.Redirect("UpdateAdmin.asp?idAdmin=" & _
			request.Form("AdminID") & "&Error=1")	
	end if
end if

'  Check to ensure there aren't any spaces entered into 
'  either value
if instr(1, sUserName, " ") or instr(1, sPassword, " ") then
	' Check the form action value
	if request.Form("action") = "insert" then
		response.Redirect("AddNewAdmin.asp?Error=1")
	else
		response.Redirect("UpdateAdmin.asp?Error=1")	
	end if
end if 

'  Check the form action value
if request.Form("action") = "insert" then 
	' If an insert then see if there is an existing admin with 
	' the same username
	sSQL = "select username from PollAdmins where username = '" & _
	sUserName & "'"

	'  Execute the query
	Set objRS = objConn.Execute(sSQL)

	'  If an admin with the same username appears
	'  then send the user back to the add new admin page
	if not objRS.eof then

		objConn.close
		
		response.Redirect("AddNewAdmin.asp?Error=1")
	end if
end if

'  Double up any single quotes for a successful insert
sUserName = replace(sUserName, "'", "''")
sPassword = replace(sPassword, "'", "''")

'  check the form action value
if request.Form("action") = "insert" then
	' Insert the new admin
	sSQL = "insert into PollAdmins(UserName, Password) values('" & sUserName & _
			"', '" & sPassword & "')"
else
	' Update the existing admin
	sSQL = "update PollAdmins set username = '" & sUserName & "', Password = '" & _
			sPassword & "' where intAdminID = " & request.Form("AdminID")
end if

'  Execute the query
Set objRS = objConn.Execute(sSQL)

objConn.close

'  Send the user back to the main admin maintenance page
response.Redirect("MaintainAdmins.asp")

%>