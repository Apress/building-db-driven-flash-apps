<%@ Language=VBScript %>
<%Option Explicit%>

<HTML>
<HEAD>
<!--#include file="../include/dbOpen.asp"-->
<!--#include file="../include/functions.inc"-->
<link rel="stylesheet" type="text/css" href="../style.css">

<script language="javascript">
<!--

// Confirm the delete of the event
function deleteItem(id,title) {
	msg = 'Are you sure your want to delete ' 
	msg = msg + title + '?\nThis item CANNOT be recovered once deleted.';
	if (!confirm(msg)){ 
		return false;
	} else {
		//  Send the user back to this page and indicate a delete will 
		//  be performed
		location.href = 'ListEvents.asp?f=delete&id=' + id;
	}
}

//-->
</script>
</head>
<body>


<%
Dim rs, strBGColor, sSQL
Dim dtStart, dtEnd

'  Get the start and end dates to show the events
dtStart = trim(request.Form("dtStart"))
dtEnd = trim(request.Form("dtEnd"))

'  Check to see if there is no start date
if len(dtStart) = 0 then
	'  Default to for the start date
	dtStart = datepart("m", now) & "/" & _
	          datepart("d", now) & "/" & _
	          datepart("yyyy", now)
end if

'  See if there is no end date
if len(dtEnd) = 0 then
	'  Default to far out in the future to show all events
	dtEnd = "1/1/2050"
end if

'  Check to see if a delete should be performed
if request.QueryString("f") = "delete" then
		'  Execute the delete
		oConn.Execute("Delete from eventCalendar where intEventID = " & _
		    Request.QueryString("id"))
end if

%>
<!--  Start the table to display the events -->
<table width="750" cellspacing="5" cellpadding="0" border="0" valign="top">
	<tr>
		<td valign="top">
			<br><br>
			<span class="head">Calendar Administration - List Events</span><br>
		</td>
	</tr>
	<tr>
		<td valign=top>
			<!-- Nav for the event pages -->
			<!-- #include file="../include/admineventnav.asp" -->
			
			<!-- Form to allow the user to filer events by date range -->
			<form method="post" action="listevents.asp">
			Date Start:  <input type="text" value="<%=dtStart%>" name="dtStart"> 
			Date End:  <input type="text" value="<%=dtEnd%>" name="dtEnd"> 

			<input class="button" type="submit" name="Submit" value="Show Events">
			
			<br><br>
			
			</form>

		<%	
	
		'  If an event was added, updated or deleted then indicate it to the user
		if Request.QueryString("m") = "a" then 
			Response.Write("<span class=alert>New Event Added</span><br><br>")
		elseif Request.QueryString("f") = "delete" then
			Response.Write("<span class=alert>Event Deleted</span><br><br>")
		elseif Request.QueryString("m") = "e" then
			Response.Write("<span class=alert>Event Updated</span><br><br>")
		end if
		
		'  Build the query to retrieve the events
		sSQL = "select * from eventCalendar where dteEventStart >= '" & _
			dtStart & "' and dteEventEnd <= '" & dtEnd & _
			"' order by dteEventStart"
		
		'  Execute the query		
		set rs = oConn.Execute(sSQL)
		
		'  If no events are found then indicate so
		if rs.EOF then
			Response.Write("No Calendar Items To Show")
		else %>
			<!--  Build the event display table -->
			<table width=700 cellspacing=2 cellpadding=3 border=0 align=center>

				<!-- Table Header -->
				<tr bgcolor=black>
					<td class=fineprintW>
					   <img src="../images/edit.gif" width=16 height=16 border=0 alt="">
					</td>
					
					<td class=fineprintW>
						<img src="../images/delete.gif" width=16 height=16 border=0 alt="">
					</td>
					
					<td class=fineprintW>Event</td>
					<td class=fineprintW>Start</td>
					<td class=fineprintW>End</td>
				</tr>
			<%	
			'  The row colors for the events will be rotated for easy viewing
			strBGColor = "#cccccc"
			while not rs.EOF 
				if strBGColor = "#cccccc" then
					strBGColor = "#eeeeee"
				else
					strBGColor = "#cccccc"
				end if %>
			<!--  Build the row with the right row color -->
			<tr bgcolor="<%=strBGColor%>">
				<!--  Show the edit icon.  When clicked on the user is sent to 
					  the manage event page with an indication the event should 
					  be deleted -->
				<td><a href="manageevent.asp?f=edit&id=<%=rs("intEventID")%>">
					<img src="../images/edit.gif" width=16 height=16 border=0 alt=""></a>
				</td>

				<!--  Show the delete icon.  When clicked on the user is sent to 
					  this page with an indication the event should 
					  be deleted -->
				<td>
					<img src="../images/delete.gif" width=16 height=16 border=0 alt="" 
					onClick="deleteItem('<%=rs("intEventID")%>','<%=replace(rs("strTitle"),"'","\'")%>');" 
					style="cursor:hand;">
			    </td>
			    
			    <!--  Show the event title -->
				<td><%=rs("strTitle")%></td>
				<td>
			<!--  Show the formated date with or with out time -->
			<%	if hour(rs("dteEventStart")) > 0 then
					Response.write(formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y at %h:%N%P"))
				else
					Response.write(formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y"))
				end if %>
				</td>
				<td>

			<!--  Show the formated date with or with out time -->
			<%	if hour(rs("dteEventEnd")) > 0 then
					Response.write(formatDate(rs("dteEventEnd"),"%A, %B %d%O, %Y at %h:%N%P"))
				else
					Response.write(formatDate(rs("dteEventEnd"),"%A, %B %d%O, %Y"))
				end if %>
				</td>
			</tr>
		<%		
			rs.MoveNext
			wend 
		%>
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