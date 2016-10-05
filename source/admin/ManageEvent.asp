<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
<HEAD>
<!--#include file="../include/dbOpen.asp"-->
<!--#include file="../include/functions.inc"-->
<link rel="stylesheet" type="text/css" href="../style.css">

<!--  Script language to validat the user's input -->
<script language="javascript">
<!--
//  Check to see if something was entered 
function notFilled(input) {
	var myreg = /\S+/;
	return(input.search(myreg) == -1)
}
			
function validateForm(){
	//  If nothing was entered or no type was selected
	if(notFilled(document.add.intType.value) | document.add.intType.value == "0") {
		document.add.intType.focus();
		alert('Event Type is required');
		return false;
	}
	//  If no start month was entered
	if(notFilled(document.add.dteStartMonth.value)| document.add.dteStartMonth.value == "") {
		document.add.dteStartMonth.focus();
		alert('Start Date/Time is required');
		return false;
	}
	//  If no start date was entered
	if(notFilled(document.add.dteStartDay.value)) {
		document.add.dteStartDay.focus();
		alert('Start Date/Time is required');
		return false;
	}
	//  If no start year was entered
	if(notFilled(document.add.dteStartYear.value)) {
		document.add.dteStartYear.focus();
		alert('Start Date/Time is required');
		return false;
	}
	//  If no end month was entered
	if(notFilled(document.add.dteEndMonth.value)) {
		document.add.dteEndMonth.focus();
		alert('End Date/Time is required');
		return false;
	}
	//  If no end date was entered
	if(notFilled(document.add.dteEndDay.value)) {
		document.add.dteEndDay.focus();
		alert('End Date/Time is required');
		return false;
	}
	//  If no end year was entered
	if(notFilled(document.add.dteEndYear.value)) {
		document.add.dteEndYear.focus();
		alert('End Date/Time is required');
		return false;
	}
	//  If no title was entered
	if(notFilled(document.add.strTitle.value)) {
		document.add.strTitle.focus();
		alert('Event Title is required');
		return false;
	}
	//  If no location was entered
	if(notFilled(document.add.strLocation.value)) {
		document.add.strLocation.focus();
		alert('Event Location is required');
		return false;
	}
	//  If no description was entered
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
Dim rs, strBGColor,rs2, sSQL
Dim ErrorMsg
Dim ProcessFunc
Dim intType 
Dim strTitle 
Dim dteStartDateTime
Dim dteStartDate
dim dteStartTime 
Dim dteEndDate
dim dteEndDateTime
Dim strLocation 
Dim blnMap 
Dim strDescription 
Dim dteStartMonth, dteStartDay, dteStartYear
Dim dteStartHour, dteStartMinute, dteStartAMPM
Dim dteEndMonth, dteEndDay, dteEndYear, dteEndHour
Dim dteEndMinute, dteEndAMPM
Dim iCNT

'  Find out what action is being taken
if request.QueryString("f") = "edit" then processfunc = "edit"
if request.QueryString("f") = "add" then processfunc = "add"
if request.form("process") = "edit" then processfunc = "edit"
if request.form("process") = "add" then processfunc = "add"

'  Build the start date from the drop down boxes
dteStartDate = request.Form("dteStartMonth") & "/" & _
		   request.Form("dteStartDay") & "/" & _
		   request.Form("dteStartYear") & " " & _
		   request.Form("dteStartHour") & ":" & _
		   request.Form("dteStartMinute") & " " & _
		   request.Form("dteStartAMPM")

'  Build the end date from the drop down boxes
dteEndDate = request.Form("dteEndMonth") & "/" & _
		   request.Form("dteEndDay") & "/" & _
		   request.Form("dteEndYear") & " " & _
		   request.Form("dteEndHour") & ":" & _
		   request.Form("dteEndMinute") & " " & _
		   request.Form("dteEndAMPM")

'  If no times were entered then remove the spaces and : left
'  from the date build
dteStartDate = replace(dteStartDate, " : " , "")
dteEndDate = replace(dteEndDate, " : " , "")

'  Post Back
if Request.Form("process") = "add" or Request.Form("process") = "edit" then

	'  Check to ensure a valid date was entered
	if not isdate(dteStartDate) then
		ErrorMsg = "You did not enter a valid start date.<BR>"
	end if

	'  Check to ensure a valid date was entered
	if not isdate(dteEndDate) then
		ErrorMsg = ErrorMsg & "You did not enter a valid end date.<BR>"
	end if

	'  Ensure a start date in the past was not entered	
	if isDate(dteStartDate) then 
		if cdate(dteStartDate) < now then
			ErrorMsg = ErrorMsg & "You can not enter a date in the past.<BR>"
		end if
	end if

	'  See if everything is OK so far so that the DateDiff doesn't fail on
	'  on a non date
	if ErrorMsg = "" then
		'  Get the difference between the dates and see if a negative
		'  is returned which means the end date is before the 
		'  start date
		if datediff("s", dteStartDate, dteEndDate) < 0 then
				ErrorMsg = ErrorMsg & "You can not enter an end date " & _
				"that is prior to the start date.<BR>"
		end if
	end if

	'  If there is no error message
	if ErrorMsg = "" then

		'  Check for an add 
		if request.Form("process") = "add" then
		
			'  Build the insert query		
			sSQL = "INSERT INTO eventCalendar(intType, dteEventStart, " 
			sSQL = sSQL & "dteEventEnd, strTitle, strLocation, blnMap, "
			sSQL = sSQL & "strDescription) VALUES ("
			sSQL = sSQL & Request.Form("intType") & ","
			sSQL = sSQL & "'" & dteStartDate & "',"
			sSQL = sSQL & "'" & dteEndDate & "',"
			sSQL = sSQL & "'" & safeSQL(Request.Form("strTitle")) & "',"
			sSQL = sSQL & "'" & safeSQL(Request.Form("strLocation")) & "',"
			'  Build the query with a 1 or 0 depending on what was entered
			if Request.Form("blnMap") = 1 then
				sSQL = sSQL & "1,"
			else
				sSQL = sSQL & "0,"
			end if
			sSQL = sSQL & "'" & safeSQL(Request.Form("strDescription")) & "')"
			
			'  Execute the query
			oConn.Execute(sSQL)

			'  Send the user to the event listing and indicate an add
			'  was done
			Response.Redirect("ListEvents.asp?m=a")
			
		end if
		
		'  Check for an edit 
		if request.Form("process") = "edit" then
			
			'  Build the update query
			sSQL = "UPDATE eventCalendar SET " 
			sSQL = sSQL & "intType=" & Request.Form("intType") & ","
			sSQL = sSQL & "dteEventStart = '" & dteStartDate & "', " 
			sSQL = sSQL & "dteEventEnd = '" & dteEndDate & "',"
			
			'  Make sure the data is processed for a successful insert
			sSQL = sSQL & "strTitle = '" & _
			       safeSQL(Request.Form("strTitle")) & "',"

			'  Make sure the data is processed for a successful insert			
			sSQL = sSQL & "strLocation = '" & _
				safeSQL(Request.Form("strLocation")) & "',"
			
			if Request.Form("blnMap") = 1 then
				sSQL = sSQL & "blnMap=1,"
			else
				sSQL = sSQL & "blnMap=0,"
			end if
			sSQL = sSQL & "strDescription='" & safeSQL(Request.Form("strDescription")) & "' "

			'  Indicate the event to be updated
			sSQL = sSQL & "where intEventID=" & Request.Form("intEventID") 
			
			'  Execute the query
			oConn.Execute(sSQL)
			
			'  Send the user back to the event listing and indicate the
			'  edit was successful
			Response.Redirect("listevents.asp?m=e")
		
		end if
		
		else
		
			'  Show the error message
			ErrorMsg = "<font color=""red"">" & ErrorMsg & "</font>"

			'  Get the event data entered from the form
			intType = request.Form("intType")
			strTitle = request.Form("strTitle")

			'  Get the start date selections			
			dteStartMonth = request.Form("dteStartMonth")
			dteStartDay = request.Form("dteStartDay")
			dteStartYear = request.Form("dteStartYear")
			dteStartHour = request.Form("dteStartHour")
			
			'  If no hour was entered then default hour to -1
			'  so nothing is shown as selected
			if len(dteStartHour) = 0 then
				dteStartHour = -1
			end if
			
			' Get the start minute
			dteStartMinute = request.Form("dteStartMinute")

			'  If there is no minute then default the minute to
			'  -1 so nothing is shown as selected
			if len(dteStartMinute) = 0 then
				dteStartMinute = -1
			end if
			
			'  Get the AM/PM selection
			dteStartAMPM = request.Form("dteStartAMPM")

			'  Get the end date selections			
			dteEndMonth = request.Form("dteEndMonth")
			dteEndDay = request.Form("dteEndDay")
			dteEndYear = request.Form("dteEndYear")
			dteEndHour = request.Form("dteEndHour")
			
			if len(dteEndHour) = 0 then
				dteEndHour = -1
			end if
			
			dteEndMinute = request.Form("dteEndMinute")

			if len(dteEndMinute) = 0 then
				dteEndMinute = -1
			end if
			
			dteEndAMPM = request.Form("dteEndAMPM")

			strLocation = request.Form("strLocation")
			blnMap = request.Form("blnMap")
			strDescription = request.Form("strDescription")
		end if

'  Not a post back
else


	'  See if an edit is being performed
	if request.QueryString("f") = "edit" then
			
			'  Get event from DB
			sSQL = "SELECT * FROM eventCalendar WHERE intEventID=" & _
				Request.QueryString("id")
		
			'  Execute the query
			set rs = oConn.Execute(sSQL)

			'  Get event from the the database
			intType = rs("intType")
			strTitle = rs("strTitle")

			'  Get the start date
			dteStartDateTime = rs("dteEventStart")

			'  Break it up
			dteStartMonth = datepart("m", dteStartDateTime)
			dteStartDay = datepart("d", dteStartDateTime)
			dteStartYear = datepart("yyyy", dteStartDateTime)
			
			'  See if there is a time included
			if len(trim(dteStartDateTime)) > 8 then
			
				'  Get the hour which returns in military time
				dteStartHour = datepart("h", dteStartDateTime)
				
				'  See if it is greater than or equal to 12 (pm)
				if cint(dteStartHour) >= 12 then
					
					'  If greater than 12 then subtract 12 to get non-military
					if dteStartHour > 12 then dtestartHour  = dtestarthour - 12
					
					'  Indicate PM
					dteStartAMPM = "PM"
					
				else 
					
					'  If 1 to 11 
					If (cint(dteStartHour) >= 0) and (cint(dteStartHour) < 12) then
						'  Indicate AM
						dteStartAMPM = "AM"
						
						'  If 0 then set to 12
						if dteStartHour = 0 then dteStartHour = 12
					end if
				
				end if
				
				'  Get the minute
				dteStartMinute = datepart("n", dteStartDateTime)
				
				'  Set to minus 1 if there is no value
				if dteStartAMPM = "" then
					dteStartMinute = "-1"
				end if
			
			else
				
				'  Don't show anything selected in the times
				dteStartHour = "-1"
				dteStartMinute = "-1"
				dteStartAMPM = ""
				
			end if
			
			'  Follow the same logic for the end date/time
			dteEndDateTime = rs("dteEventEnd")

			dteEndMonth = datepart("m", dteEndDateTime)
			dteEndDay = datepart("d", dteEndDateTime)
			dteEndYear = datepart("yyyy", dteEndDateTime)

			if len(trim(dteEndDateTime)) > 8 then

				dteEndHour = datepart("h", dteEndDateTime)
				
				if cint(dteEndHour) >= 12 then
					if dteEndHour > 12 then dteEndHour  = dteEndHour - 12
					dteEndAMPM = "PM"
				else
				
					If cint(dteEndHour) >= 0 and cint(dteEndHour) < 12 then
						dteEndAMPM = "AM"
						if dteEndHour = 0 then dteEndHour = 12
					end if
				
				end if

				dteEndMinute = datepart("n", dteEndDateTime)
							
				if dteEndAMPM = "" then
					dteEndMinute = "-1"
				end if

			else
			
				dteEndHour = "-1"
				dteEndMinute = "-1"
				dteEndAMPM = ""
				
			end if
			
			
			
			strLocation = rs("strLocation")
			blnMap = rs("blnMap")
			strDescription = rs("strDescription")

	else

		'  Default to minus 1 for a new event so that nothing
		'  is selected in the drop downs
		dteEndHour = "-1"
		dteEndMinute = "-1"
		dteEndAMPM = ""

		dteStartHour = "-1"
		dteStartMinute = "-1"
		dteStartAMPM = ""
	
	end if

end if 

%>
<table width="750" cellspacing="5" cellpadding="0" border="0" valign="top">
	<tr>
		<td valign="top">
			<br><br>
			<span class="head">Calendar Administration - Manage Event</span><br>
		</td>
	</tr>
	<tr>
		<td valign=top>
		
		<!-- #Include File="../include/admineventnav.asp" -->
		
		<%
				'  Show any errors
				response.Write ErrorMsg & ""
		%>
		<form name=add id=add method=post onsubmit="return validateForm()">

		<!--  Store in a hidden variable if we are adding or editing.  
		      This tells the page what to do when the page is posted -->
		<% if processfunc = "add" then %>
		<input type=hidden name=process value=add>
		<%else%>
		<input type=hidden name=process value=edit>
		<!--  Store the ID of the event being edited -->
		<input type=hidden name=intEventID value=<%=request.QueryString("id")%>>
		<%end if%>
		
		<table width=700 cellspacing=2 cellpadding=3 border=0 align=center>
			<tr>
				<td align=right valign=top>Event Type: </td>
				<td><select name=intType style="width:500px">
					<option value=0 selected>Select an Event Type</option>
				<%	
				
					'  Get the event types
					sSQL = "SELECT * FROM eventTypes ORDER BY strType ASC"
				
					set rs2 = oConn.Execute(sSQL)
					
					'  Loop through the types
					while not rs2.EOF
					
						'  Check to see if the event type matches the previously 
						'  selected event type
						if cint(intType) = cint(rs2("intTypeID")) then
							'  Show selected
							Response.Write("<option selected value=" & _
							       rs2("intTypeID") & ">" & rs2("strType") & _
							       "</option>")
						else
							'  No selection
							Response.Write("<option value=" & rs2("intTypeID") & _
							       ">" & rs2("strType") & _
							       "</option>")
						end if
						rs2.MoveNext
					wend
					set rs2=nothing %>
					</select></td>
			</tr>
			<tr>
				<td align=right valign=top>Event Title: </td>
				<td>
				  <input value="<%=strTitle%>" type=text name=strTitle 
				  style="width:500px" maxlength=255>
				</td>
			</tr>
			<tr>
				<td align=right valign=top>Start: </td>
				<td>
			<!--  Start month - default to previous value -->
			<select name="dteStartMonth">
				<option></option>
				<option value="1" <%if dteStartMonth=1 then _
				        response.Write("selected")%>>Jan</option>
				<option value="2" <%if dteStartMonth=2 then response.Write("selected")%>>Feb</option>
				<option value="3" <%if dteStartMonth=3 then response.Write("selected")%>>Mar</option>
				<option value="4" <%if dteStartMonth=4 then response.Write("selected")%>>Apr</option>
				<option value="5" <%if dteStartMonth=5 then response.Write("selected")%>>May</option>
				<option value="6" <%if dteStartMonth=6 then response.Write("selected")%>>Jun</option>
				<option value="7" <%if dteStartMonth=7 then response.Write("selected")%>>Jul</option>
				<option value="8" <%if dteStartMonth=8 then response.Write("selected")%>>Aug</option>
				<option value="9" <%if dteStartMonth=9 then response.Write("selected")%>>Sep</option>
				<option value="10" <%if dteStartMonth=10 then response.Write("selected")%>>Oct</option>
				<option value="11" <%if dteStartMonth=11 then response.Write("selected")%>>Nov</option>
				<option value="12" <%if dteStartMonth=12 then response.Write("selected")%>>Dec</option>
			</select>

			<!--  Start Dat - default to previous value -->				
			<select name="dteStartDay" ID="Select1">
				<option></option>
				<% for iCNT = 1 to 31 %>				
				<option value="<%=iCnt%>" <%if cint(dteStartDay)=iCNT then response.Write("selected")%>><%=iCNT%></option>
				<% next %>					
			</select>
			
			<!--  Start year - default to previous value -->				
			<select name="dteStartYear" ID="Select2">
				<option></option>			
				<option value="2003" <%if dteStartYear=2003 then response.Write("selected")%>>2003</option>
				<option value="2004" <%if dteStartYear=2004 then response.Write("selected")%>>2004</option>
				<option value="2005" <%if dteStartYear=2005 then response.Write("selected")%>>2005</option>
			</select>

			<!--  Start hour - default to previous value -->				
			<select name="dteStartHour" ID="Select3">
				<option value=""></option>
				<option value="1" <%if cint(dteStartHour)=1 then response.Write("selected")%>>1</option>
				<option value="2" <%if cint(dteStartHour)=2 then response.Write("selected")%>>2</option>
				<option value="3" <%if dteStartHour=3 then response.Write("selected")%>>3</option>
				<option value="4" <%if dteStartHour=4 then response.Write("selected")%>>4</option>
				<option value="5" <%if cint(dteStartHour)=5 then response.Write("selected")%>>5</option>
				<option value="6" <%if dteStartHour=6 then response.Write("selected")%>>6</option>
				<option value="7" <%if dteStartHour=7 then response.Write("selected")%>>7</option>
				<option value="8" <%if dteStartHour=8 then response.Write("selected")%>>8</option>
				<option value="9" <%if dteStartHour=9 then response.Write("selected")%>>9</option>
				<option value="10" <%if dteStartHour=10 then response.Write("selected")%>>10</option>
				<option value="11" <%if dteStartHour=11 then response.Write("selected")%>>11</option>
				<option value="12" <%if dteStartHour=12 then response.Write("selected")%>>12</option>
			</select>

			<!--  Start minute - default to previous value -->
			<select name="dteStartMinute" ID="Select4">
				<option value=""></option>
				<% for iCNT = 0 to 60 %>				
				<option value="<%=right("0" & iCnt, 2)%>" <%if cint(dteStartMinute)=iCNT then response.Write("selected")%>><%=right("0" & iCNT, 2)%></option>
				<% next %>					
			</select>

			<!--  Start AM/PM - default to previous value -->
			<select name="dteStartAMPM" ID="Select5">
				<option value=""></option>
				<option value="AM" <%if dteStartAMPM="AM" then response.Write("selected")%>>AM</option>
				<option value="PM" <%if dteStartAMPM="PM" then response.Write("selected")%>>PM</option>
			</select>


				<br>				
				<span class=fineprintBK>MM/DD/YYYY HH:MM (24 hour format) NOTE: Time is optional.</span>
				
				</td>
			</tr>

			<!--  End date/time follows the same logic -->
			<tr>
				<td align=right valign=top>End: </td>
				<td>
			
			<select name="dteEndMonth" ID="Select6">
				<option></option>
				<option value="1" <%if dteEndMonth=1 then response.Write("selected")%>>Jan</option>
				<option value="2" <%if dteEndMonth=2 then response.Write("selected")%>>Feb</option>
				<option value="3" <%if dteEndMonth=3 then response.Write("selected")%>>Mar</option>
				<option value="4" <%if dteEndMonth=4 then response.Write("selected")%>>Apr</option>
				<option value="5" <%if dteEndMonth=5 then response.Write("selected")%>>May</option>
				<option value="6" <%if dteEndMonth=6 then response.Write("selected")%>>Jun</option>
				<option value="7" <%if dteEndMonth=7 then response.Write("selected")%>>Jul</option>
				<option value="8" <%if dteEndMonth=8 then response.Write("selected")%>>Aug</option>
				<option value="9" <%if dteEndMonth=9 then response.Write("selected")%>>Sep</option>
				<option value="10" <%if dteEndMonth=10 then response.Write("selected")%>>Oct</option>
				<option value="11" <%if dteEndMonth=11 then response.Write("selected")%>>Nov</option>
				<option value="12" <%if dteEndMonth=12 then response.Write("selected")%>>Dec</option>
			</select>
			
			<select name="dteEndDay" ID="Select7">
				<option></option>
				<% for iCNT = 1 to 31 %>				
				<option value="<%=iCnt%>" <%if cint(dteEndDay)=iCNT then response.Write("selected")%>><%=iCNT%></option>
				<% next %>					
			</select>
			
			<select name="dteEndYear" ID="Select8">
				<option></option>			
				<option value="2003" <%if dteEndYear=2003 then response.Write("selected")%>>2003</option>
				<option value="2004" <%if dteEndYear=2004 then response.Write("selected")%>>2004</option>
				<option value="2005" <%if dteEndYear=2005 then response.Write("selected")%>>2005</option>
			</select>
			
			<select name="dteEndHour" ID="Select9">
				<option value=""></option>
				<option value="1" <%if cint(dteEndHour)=1 then response.Write("selected")%>>1</option>
				<option value="2" <%if cint(dteEndHour)=2 then response.Write("selected")%>>2</option>
				<option value="3" <%if dteEndHour=3 then response.Write("selected")%>>3</option>
				<option value="4" <%if dteEndHour=4 then response.Write("selected")%>>4</option>
				<option value="5" <%if cint(dteEndHour)=5 then response.Write("selected")%>>5</option>
				<option value="6" <%if dteEndHour=6 then response.Write("selected")%>>6</option>
				<option value="7" <%if dteEndHour=7 then response.Write("selected")%>>7</option>
				<option value="8" <%if dteEndHour=8 then response.Write("selected")%>>8</option>
				<option value="9" <%if dteEndHour=9 then response.Write("selected")%>>9</option>
				<option value="10" <%if dteEndHour=10 then response.Write("selected")%>>10</option>
				<option value="11" <%if dteEndHour=11 then response.Write("selected")%>>11</option>
				<option value="12" <%if dteEndHour=12 then response.Write("selected")%>>12</option>

			</select>

			<select name="dteEndMinute" ID="Select10">
				<option value=""></option>
				<% for iCNT = 0 to 60 %>				
				<option value="<%=right("0" & iCnt, 2)%>" <%if cint(dteEndMinute)=iCNT then response.Write("selected")%>><%=right("0" & iCNT, 2)%></option>
				<% next %>					
			</select>

			<select name="dteEndAMPM" ID="Select11">
				<option value=""></option>
				<option value="AM" <%if dteEndAMPM="AM" then response.Write("selected")%>>AM</option>
				<option value="PM" <%if dteEndAMPM="PM" then response.Write("selected")%>>PM</option>
			</select>

				<br>				
				<span class=fineprintBK>MM/DD/YYYY HH:MM (24 hour format) NOTE: Time is optional.</span>
				
				</td>
			</tr>
			<tr>
				<td align=right valign=top>Location: </td>
				<td>
				  <input value="<%=strLocation%>" type=text name=strLocation 
				     style="width:500px" maxlength=500>
				  &nbsp;
				  <!--  Show the button to offer to build the map link for
				        the location -->
				  <button TITLE="Create a Map Link" 
				    style="BORDER-STYLE:outset; background-image: WIDTH:22px; HEIGHT:22px;" 
				    id="linker" name="linker" hidefocus="true" unselectable="true" 
				    onclick="strLocation.value = window.showModalDialog('locationLinker.asp',strLocation.value,'dialogHeight: 400px; dialogWidth: 465px; center: Yes; help: No; resizable: No; status: No;');">
				    <img src="../images/link.gif" width=16 height=16 border=0>
				    </button>
				 </td>
																													 
			</tr>
			<tr>
				<td align=right valign=top>
				  <input <% if blnMap = True then response.Write("checked")%> 
				    type=checkbox name=blnMap value=1>
				 </td>
				<td>Check this box to include a link to map<br>
				    <span class=fineprint>NOTE: the Location field above MUST be 
				    populated using the Location Linker button to the right of 
				    the Location field for the map link to work.</span></td>
			</tr>
			<tr>
				<td align=right valign=top>Description: </td>
				<td>
				 <textarea name=strDescription rows=10 style="width:500px"><%=strDescription%></textarea>&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center>
				  <input type=submit value=Save class=button>
				  &nbsp;
				  <button name=cancel class=button onClick="javascript:history.back(1);">Cancel</button>
				</td>
			</tr>
			</table>
			</form>
							
		</td>
	</tr>
</table><br><br>
<!--#include file="../include/dbClose.asp"-->
</body>
</HTML>