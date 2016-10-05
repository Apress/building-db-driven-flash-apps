<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<%

dim sSQL

sSQL = "update Polls set blnActive = 1 where intPollID = " & request.QueryString("idPoll")

'  Execute the SQL statement
Set objRS = objConn.Execute(sSQL)

'  Send back to the Polls maintance main pae
response.Redirect("MaintainPolls.asp")

objConn.close

%>