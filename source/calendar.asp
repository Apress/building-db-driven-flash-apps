'include the database opening code and functions
<!-- #include file="include/dbOpen.asp" -->
<!-- #include file="include/functions.inc" -->

<%
'Pull events from database and output data in plain text to a Flash calendar application
   if len(Request.QueryString("toMonth")) > 0 and len(Request.QueryString("toYear")) > 0 then
   ' if QueryString contains a month and year to display, use it
      strCurrentDate = Request.QueryString("toMonth") & "/1/" & Request.QueryString("toYear")
   else
   'else use current date
      strCurrentDate = date
   end if
'set up values for current date
   intToDay = day(date)
   intThisMonth = month(date)
   intThisYear = year(date)
'format for output to Flash
   strThisYear = "&intThisYear=" & intThisYear
   strThisMonth = "&intThisMonth=" & intThisMonth
   strToday = "&intToDay=" & intToDay
'set up values for requested date
   intDay = day(strCurrentDate)
   intMonth = month(strCurrentDate)
   intYear = year(strCurrentDate)
   intFirstDayOfMonth = intMonth & "/1/" & intYear
'format for output to Flash
   strMonthText = "&monthtext=" & monthname(intMonth)
   strToMonth = "&tomonth=" & intMonth
   strToYear = "&toyear=" & intYear
   strBdow = "&bdow=" & weekday(intFirstDayofMonth)
'find last day of month
   for x = 28 to 31
      if isdate(intMonth & "/" & x & "/" & intYear) then
         intLastDay = x
         intLastDayOfMonth = intMonth & "/" & x & "/" & intYear
         strLastDay = "&lastday=" & x
      end if
   next
'set up calendar date navigation vars
'all vars are based on requested date
   strNMonth = "&nmonth=" & month(dateadd("m",1,strCurrentDate))
   strNMonthYear = "&nmonthyear=" & year(dateadd("m",1,strCurrentDate))
   strPMonth = "&pmonth=" & month(dateadd("m",-1,strCurrentDate))
   strPMonthYear = "&pmonthyear=" & year(dateadd("m",-1,strCurrentDate))
   strNYear = "&nyear=" & year(dateadd("yyyy",1,strCurrentDate))
   strPYear = "&pyear=" & year(dateadd("yyyy",-1,strCurrentDate)) 
'stick everything so far into one string	
   strVarText = strLastDay & strMonthText & strToMonth & strToYear & strBdow & strNMonth & strPMonth & strPMonthYear & strNMonthYear & strNYear & strPYear & strToDay & strThisMonth & strThisYear
'pull each days events from database and put into vars
   for y = 1 to intLastDay
   'each date has two vars here incremented with a number on the end
   'ex. strEvents1=xxx&strEventsPop1=xxx&strEvents2=xxx&strEventsPop2=xxx
   'the number is the date
      strEvents = strEvents & "&event" & y & "="
      strEventsPop = strEventsPop & "&eventsPop" & y & "=" & chr(10)
   'for adding filter for different event types
      select case Request.QueryString("f")
      case "Meetings"
         intFilter = 1
      case "Events"
         intFilter = 2
      case else
         intFilter = 0
      end select
   'pull events from database
   strSQL = "SELECT * FROM eventCalendar WHERE " & _
            "convert(datetime,convert(varchar,DatePart(yyyy, dteEventStart)) + '-' + " & _
            "convert(varchar,DatePart(mm, dteEventStart)) + '-' + " & _
            "convert(varchar,DatePart(dd,dteEventStart))) <= " & _ 
            "'" & intYear & "-" & intMonth & "-" & y & "'" & " AND " & _ 
            "convert(datetime,convert(varchar,DatePart(yyyy, dteEventEnd)) + '-' + " & _
            "convert(varchar,DatePart(mm, dteEventEnd)) + '-' + " & _
            "convert(varchar,DatePart(dd,dteEventEnd))) >= " & _
            "'" & intYear & "-" & intMonth & "-" & y & "'" & _
            "ORDER BY dteEventStart, dteEventEnd"      
   Set rs = oConn.Execute(strSQL)
      do while not rs.EOF
         strEvents = strEvents & Server.URLEncode(rs("strTitle") & chr(10))
         if hour(rs("dteEventStart")) > 0 then
         'if hour of date is > 0 then display time
            strEventsPop = strEventsPop & Server.URLEncode(rs("strTitle") & chr(10) & _ 
            formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y %h:%N%P") & chr(10) & chr(10))
         else
         'else don't
            strEventsPop = strEventsPop & Server.URLEncode(rs("strTitle") & chr(10) & _ 
            formatDate(rs("dteEventStart"),"%A, %B %d%O, %Y") & chr(10) & chr(10))
         end if
         rs.MoveNext 
      loop
      set rs = nothing
   next

'stick all output vars into one string
   strVarText = strVarText & strEvents & strEventsPop

'output that string
   Response.Write("dummy=nothing" & strVarText & "&done=1")
'done=1 needs to be the LAST value sent
'it will tell the Flash app that it has received all the data

%>

<!-- #include file="include/dbClose.asp" -->
