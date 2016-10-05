<% 
'  Check for validation
if session("Validated") <> true then
	'  If not validated make the user log in
	response.Redirect("login.asp")
end if
%>