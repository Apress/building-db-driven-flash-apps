<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
<HEAD>
<!--#include file="../include/dbOpen.asp"-->
<!--#include file="../include/functions.inc"-->
<link rel="stylesheet" type="text/css" href="../style.css">

<script language="javascript">
<!--
//  Check to ensure something was entered
function notFilled(input) {
	var myreg = /\S+/;
	return(input.search(myreg) == -1)
}

//  Validate that a name and description were put in
function validateForm(){

	if(notFilled(document.add.strType.value)) {
		document.add.strType.focus();
		alert('Type Name is required');
		return false;
	}
	if(notFilled(document.add.strDescription.value)) {
		document.add.strDescription.focus();
		alert('Event Description is required');
		return false;
	}
	return true;
}

//-->
</script>
</head>
<body>


<%
Dim rs, strBGColor,rs2, SQL
Dim ErrorMsg
Dim ProcessFunc
Dim strType 
Dim strDescription 

'  Find out what action is to be taken
if request.QueryString("f") = "edit" then processfunc = "edit"
if request.QueryString("f") = "add" then processfunc = "add"
if request.form("process") = "edit" then processfunc = "edit"
if request.form("process") = "add" then processfunc = "add"

'  Post Back
if Request.Form("process") = "add" or Request.Form("process") = "edit" then

	'  Check for an add
	if request.Form("process") = "add" then
	
		'  Build the SQL insert statement
		SQL = "insert into eventTypes(strType, strDescription) values('" & _
			safeSQL(request.Form("strType")) & "', '" & _
			safeSQL(request.Form("strDescription")) & "')"
		
		'  Execute
		oConn.Execute(SQL)

		'  Send the user back to the type listing and indicate a successful add
		Response.Redirect("ListTypes.asp?m=a")
		
	end if
	
	'  Check for an edit
	if request.Form("process") = "edit" then
			
		'  Build the SQL udpate statement
		SQL = "update eventTypes set " & _
			"strType = '" & safeSQL(request.Form("strTYpe")) & "', " & _
			"strDescription = '" & safeSQL(request.Form("strDescription")) & _
			"' " & _
			"where intTypeID = " & Request.Form("intTypeID") 
		
		'  Execute
		oConn.Execute(SQL)
		
		' Send the user back to the type listing page
		Response.Redirect("listTypes.asp?m=e")
	
	end if
		

'  Not a post back
else

	
	'  Check for an initial edit
	if request.QueryString("f") = "edit" then

			'  Get the type from DB
			SQL = "select * from eventtypes where intTypeID = " & _
				Request.QueryString("id")
			
			'  Execute the query
			set rs = oConn.Execute(SQL)

			'  Get type data from the the database
			strType = rs("strType")
			strDescription = rs("strDescription")
	
	end if

end if 

%>
<table width="750" cellspacing="5" cellpadding="0" border="0" valign="top">
	<tr>
		<td valign="top">
			<br><br>
			<span class="head">Calendar Administration - Manage Type</span><br>
		</td>
	</tr>
	<tr>
		<td valign=top>
		
		<!-- #Include File="../include/admintypenav.asp" -->
		
		<form name=add id=add method=post onsubmit="return validateForm()">

		<!--  Indicate what type of action is being taken so the right
		      things happens on the form post -->
		<% if processfunc = "add" then %>
		<input type=hidden name=process value=add>
		<%else%>
		<input type=hidden name=process value=edit>
		<input type=hidden name=intTypeID value=<%=request.QueryString("id")%>>
		<%end if%>
		
		<table width=700 cellspacing=2 cellpadding=3 border=0 align=center>
			<tr>
				<td align=right valign=top>Type Name: </td>
				<td><input value="<%=strType%>" type=text name=strType style="width:500px" maxlength=255></td>
			</tr>
			<tr>
				<td align=right valign=top>Description: </td>
				<td><textarea name=strDescription rows=10 style="width:500px"><%=strDescription%></textarea>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type=submit value=Save class=button>&nbsp;<button name=cancel class=button onClick="javascript:history.back(1);">Cancel</button></td>
			</tr>
			</table>
			</form>
							
		</td>
	</tr>
</table><br><br>
<!--#include file="../include/dbClose.asp"-->
</body>
</HTML>