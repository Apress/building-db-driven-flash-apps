<%@ Language=VBScript %>
<%option explicit%>
<html>
<head>
	<title>Day at a Glance</title>
	<link rel=stylesheet type="text/css" href="/style.css">

<SCRIPT LANGUAGE="JavaScript">
<!--
//  Show the print dialogue
function printWindow() {
bV = parseInt(navigator.appVersion);
if (bV >= 4) window.print();
}
// -->
</script>

</head>
<body bgcolor="#333333">

<!--#include file="include/dbOpen.asp" -->

<table width=100% height=100%><tr><td>
<table width=400 cellspacing=0 cellpadding=0 border=0 align=center>
<tr>
	<td width=400 align=center valign=top align=center><a href="javascript:printWindow();"><span class=fineprintW>Print this page</span></a><br>

<table width=380 cellspacing=0 cellpadding=0 border=1 bordercolor="#737373" align=center bgcolor="#FFFFFF">
<tr>
	<td bgcolor="#ffffff"><table width=370 cellspacing=0 cellpadding=4 border=0 align=center><tr><td class=subHead>Event Calendar Day at a Glance - <%=Request.QueryString("qdate")%></td></tr></table></td>
</tr>
<tr>
	<td>
	<table width=380 cellspacing=0 cellpadding=4 border=0 align=center>
<% 

Dim strBGColor, strName, strAddress, strCity, strState, strZip, rs, arAddress, SQL
strBGColor = "#cccccc"

'  Get the event - note that we have to get the mm/dd/yy of the store date
'  to compare to the current day
SQL = "SELECT * FROM eventCalendar " & _
      "WHERE convert(datetime,convert(varchar,DatePart(yyyy, dteEventStart)) " & _
      "+ '-' + convert(varchar,DatePart(mm, dteEventStart)) " & _
      "+ '-' + convert(varchar,DatePart(dd,dteEventStart))) <= '" & request.QueryString("qdate") & "' " & _
      "AND convert(datetime,convert(varchar,DatePart(yyyy, dteEventEnd)) " & _
      "+ '-' + convert(varchar,DatePart(mm, dteEventEnd)) " & _
      "+ '-' + convert(varchar,DatePart(dd,dteEventEnd))) >= '" & request.QueryString("qdate") & "' " & _
      " ORDER BY dteEventStart, dteEventEnd" 

'  Get the data
Set rs = oConn.Execute(SQL)

'  Loop through the events for the day
do while not rs.EOF

		'  Rotate the row colors
		if strBGColor = "#cccccc" then
			strBGColor = "#eeeeee"
		else
			strBGColor = "#cccccc"
		end if %>
		
	<tr bgcolor="<%=strBGColor%>">
		<td>
		<b><%=rs("strTitle")%></b><BR>
		
		<!--  Build the date display based on the whether times should be shown  -->
		<%	if rs("dteEventEnd") > rs("dteEventStart") then
				'  Check for times for both dates
				if hour(rs("dteEventStart")) > 0 and hour(rs("dteEventEnd")) > 0 then %>
				  <span class=fineprintBKthin><b>
				  <%=formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y %h:%N%P")%>
				  &nbsp;-&nbsp;
				  <%=formatDate(rs("dteEventEnd"),"%A, %B %d%O, %Y %h:%N%P")%>
				  </b></span>
			<%	else %>
				<!--  No times shown -->
				<span class=fineprintBKthin><b>
				<%=formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y")%>
				&nbsp;-&nbsp;
				<%=formatDate(rs("dteEventEnd"),"%A, %B %d%O, %Y")%>
				</b></span>
			<%	end if 
			else
				'  Only show the start date if for some reason the 
				'  end date isn't defined
				if hour(rs("dteEventStart")) > 0 then %>
					<span class=fineprintBKthin><b>
					<%=formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y at %h:%N%P")%>
					</b></span>
			<%	else %>
					<span class=fineprintBKthin><b>
					<%=formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y")%>
					</b></span>
			<%	end if
			end if
			
			'  See if there is a location
			if rs("strLocation") <> "" then
			
				'  Split up values between commas
				arAddress = split(rs("strLocation"),",")
				
				'  Ensure there are all fields
				if ubound(arAddress) > 3 then
					strName = arAddress(0)
					strAddress = arAddress(1)
					strCity = arAddress(2)
					strState = arAddress(3)
					strZip = arAddress(4)
					
					'  Show the location
					Response.Write("<br><br><b>Location:</b><br>" & strName & _
					              "<br>" & strAddress & _
					              "<br>" & strCity & ", " & _
					                 strState & " " & strZip)
					
					'  Build the map link 
					if rs("blnMap") then
						Response.Write("<br><a href=""http://maps.expedia.com/default.asp?Street=" & server.URLEncode(strAddress) & "&City=" & server.URLEncode(strCity) & "&State=" & server.URLEncode(strState) & "&ZIP=" & server.URLEncode(strZip) & """ target=""_new"">Click For Map</a>")
					end if
				else
					Response.Write("<br><br><b>Location:</b><br>" & rs("strLocation"))
				end if 
			end if 
			Response.Write("<br><br><b>Details:</b><br>")
			Response.write(rs("strDescription"))
			%>
		</td>
	</tr>
	<% rs.MoveNext
loop
set rs = nothing

%>

	</table>
	</td>
</tr>
</table>
	<a href="javascript:printWindow();"><span class=fineprintW>Print this page</span></a>
	</td>
</tr>
</table>
<br>
		</td>
	</tr>
	</table>
	</td>
</tr>
</table>
</td></tr></table>
<!-- #include file="include/dbClose.asp" -->

</body>
</html>
<!-- #include file="include/functions.inc" -->
