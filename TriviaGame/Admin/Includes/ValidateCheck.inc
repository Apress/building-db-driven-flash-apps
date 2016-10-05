<%
'  ValidateCheck.inc - Ensures that the manager has 
'  been validated.
'  Check our session variable to see if the user has
'  been validated. This will help to ensure that 
'  none of the admin pages are accessed without
'  authorization.
If Not Session("Validated") Then
'	' Redirect back to the login page.
	'Server.Transfer("Login.aspx")
End If
%>