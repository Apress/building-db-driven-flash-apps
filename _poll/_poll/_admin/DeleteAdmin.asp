<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL

' Build the SQL delete statement
sSQL = "delete from PollAdmins where intAdminID = " & request.QueryString("idAdmin")

'  Execute the query
Set objRS = objConn.Execute(sSQL)

objConn.close

'  Send the user back to the main admin maintenance page
response.Redirect("MaintainAdmins.asp")

%>