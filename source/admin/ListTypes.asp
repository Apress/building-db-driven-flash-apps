<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
<HEAD>
<!--#include file="../include/dbOpen.asp"-->
<!--#include file="../include/functions.inc"-->
<link rel="stylesheet" type="text/css" href="../style.css">

<script language="javascript">
<!--
//  Validate the request to delete the type
function deleteItem(id,title) {
	msg = 'Are you sure your want to delete ' + title + '?\nThis item CANNOT be recovered once deleted.';
	if (!confirm(msg)){ 
		return false;
	} else {
		//  Send the user back to this page and indicate a delete
		location.href = 'ListTypes.asp?f=delete&id=' + id;
	}
}

//-->
</script>
</head>
<body>


<%
Dim rs, strBGColor,rs2, sSQL
Dim dtStart, dtEnd

'  Check for the delete
if request.QueryString("f") = "delete" then
	'  Execute the delete query
	oConn.Execute("delete from eventTypes where intTypeID = " & _
	               Request.QueryString("id"))
end if

%>
<table width="750" cellspacing="5" cellpadding="0" border="0" valign="top">
	<tr>
		<td valign="top">
			<br><br>
			<span class="head">Type Administration - List Types</span><br>
		</td>
	</tr>
	<tr>
		<td valign=top>
			<!-- #include file="../include/admintypenav.asp" -->
<%	
	
		'  Indicate success for an add, edit or delete
		if Request.QueryString("m") = "a" then 
			Response.Write("<span class=alert>New Type Added</span><br><br>")
		elseif Request.QueryString("f") = "delete" then
			Response.Write("<span class=alert>Type Deleted</span><br><br>")
		elseif Request.QueryString("m") = "e" then
			Response.Write("<span class=alert>Type Updated</span><br><br>")
		end if
		
		'  Get the list of types
		sSQL = "select * from eventTypes order by strType"
		
		'  Execute the query								
		set rs = oConn.Execute(sSQL)
		
		'  Indicate no event types 
		if rs.EOF then
			Response.Write("No Event Types To Show")
		else %>
			<table width="700" cellspacing=2 cellpadding=3 border=0 align=left>
				<tr bgcolor=black>
				<td class=fineprintW>
					<img src="../images/edit.gif" width=16 height=16 border=0>
			    </td>
				<td class=fineprintW>
				    <img src="../images/delete.gif" width=16 height=16 border=0>
				</td>
					<td class=fineprintW>Type</td>
					<td class=fineprintW>Description</td>
				</tr>
			<%	
				'  Rotate the row color
				strBGColor = "#cccccc"
				while not rs.EOF 
					if strBGColor = "#cccccc" then
						strBGColor = "#eeeeee"
					else
						strBGColor = "#cccccc"
					end if %>
				<!--  Show the edit button which when clicked on sends the user
				      to the manage types page -->
				<tr bgcolor="<%=strBGColor%>">
					<td><a href="managetype.asp?f=edit&id=<%=rs("intTypeID")%>">
					    <img src="../images/edit.gif" width=16 height=16 border=0>
					    </a>
					 </td>

				<!--  Show the delete button which when clicked on sends the user
				      back to this page -->
					<td>
					  <img src="../images/delete.gif" width=16 height=16 border=0 
					     onClick="deleteItem('<%=rs("intTypeID")%>','<%=replace(rs("strType"),"'","\'")%>');" 
					     style="cursor:hand;">
					</td>
					<!--  Show the type and description -->
					<td><%=rs("strType")%></td>
					<td><%=rs("strDescription")%></td>
				</tr>
			<%		rs.MoveNext
				wend %>
			</table>
	<%	end if
		set rs = nothing
	%>
							
		</td>
	</tr>
</table>
<!--#include file="../include/dbClose.asp"-->
</body>
</HTML>