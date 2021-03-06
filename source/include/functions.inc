<%
Function fncGetDayOrdinal( _
 byVal intDay _
 )
 ' Accepts a day of the month as an integer and returns the
 ' appropriate suffix

 Dim strOrd

 Select Case intDay
 Case 1, 21, 31
  strOrd = "st"
 Case 2, 22
  strOrd = "nd"
 Case 3, 23
  strOrd = "rd"
 Case Else
  strOrd = "th"
 End Select

 fncGetDayOrdinal = strOrd
End Function ' fncGetDayOrdinal


Function formatDate( _
    byVal strDate, _
    byRef strFormat _
   )
 ' Accepts strDate as a valid date/time,
 ' strFormat as the output template.
 ' The function finds each item in the
 ' template and replaces it with the
 ' relevant information extracted from strDate

 ' Template items (example)
 ' %m Month as a decimal (02)
 ' %B Full month name (February)
 ' %b Abbreviated month name (Feb )
 ' %d Day of the month (23)
 ' %O Ordinal of day of month (eg st or rd or nd)
 ' %j Day of the year (54)
 ' %Y Year with century (1998)
 ' %y Year without century (98)
 ' %w Weekday as integer (0 is Sunday)
 ' %a Abbreviated day name (Fri)
 ' %A Weekday Name (Friday)
 ' %H Hour in 24 hour format (24)
 ' %h Hour in 12 hour format (12)
 ' %N Minute as an integer (01)
 ' %n Minute as optional if minute <> 0
 ' %S Second as an integer (55)
 ' %P AM/PM Indicator (PM)

 On Error Resume Next

 Dim intPosItem
 Dim int12HourPart
 Dim str24HourPart
 Dim strMinutePart
 Dim strSecondPart
 Dim strAMPM

 ' Insert Month Numbers
 strFormat = Replace(strFormat, "%m", _
          DatePart("m", strDate), 1, -1, vbBinaryCompare)

 ' Insert non-Abbreviated Month Names
 strFormat = Replace(strFormat, "%B", _
          MonthName(DatePart("m", strDate), _
          False), 1, -1, vbBinaryCompare)

 ' Insert Abbreviated Month Names
 strFormat = Replace(strFormat, "%b", _
          MonthName(DatePart("m", strDate), _
          True), 1, -1, vbBinaryCompare)

 ' Insert Day Of Month
 strFormat = Replace(strFormat, "%d", _
          DatePart("d",strDate), 1, _
          -1, vbBinaryCompare)

 ' Insert Day of Month Ordinal (eg st, th, or rd)
 strFormat = Replace(strFormat, "%O", _
          fncGetDayOrdinal(Day(strDate)), _
          1, -1, vbBinaryCompare)

 ' Insert Day of Year
 strFormat = Replace(strFormat, "%j", _
          DatePart("y",strDate), 1, _
          -1, vbBinaryCompare)

 ' Insert Long Year (4 digit)
 strFormat = Replace(strFormat, "%Y", _
          DatePart("yyyy",strDate), 1, _
          -1, vbBinaryCompare)

 ' Insert Short Year (2 digit)
 strFormat = Replace(strFormat, "%y", _
          Right(DatePart("yyyy",strDate),2), _
          1, -1, vbBinaryCompare)

 ' Insert Weekday as Integer (eg 0 = Sunday)
 strFormat = Replace(strFormat, "%w", _
          DatePart("w",strDate,1), 1, _
          -1, vbBinaryCompare)

 ' Insert Abbreviated Weekday Name (eg Sun)
 strFormat = Replace(strFormat, "%a", _
          WeekDayName(DatePart("w",strDate,1),True), 1, _
          -1, vbBinaryCompare)

 ' Insert non-Abbreviated Weekday Name
 strFormat = Replace(strFormat, "%A", _
          WeekDayName(DatePart("w",strDate,1),False), 1, _
          -1, vbBinaryCompare)

 ' Insert Hour in 24hr format
 str24HourPart = DatePart("h",strDate)
 If Len(str24HourPart) < 2 then str24HourPart = "0" & _
                                                 str24HourPart
 strFormat = Replace(strFormat, "%H", str24HourPart, 1, _
          -1, vbBinaryCompare)

 ' Insert Hour in 12hr format
 int12HourPart = DatePart("h",strDate) Mod 12
 If int12HourPart = 0 then int12HourPart = 12
 strFormat = Replace(strFormat, "%h", int12HourPart, 1, _
          -1, vbBinaryCompare)

 ' Insert Minutes
 strMinutePart = DatePart("n",strDate)
 If Len(strMinutePart) < 2 then _
          strMinutePart = "0" & strMinutePart
 strFormat = Replace(strFormat, "%N", strMinutePart, _
          1, -1, vbBinaryCompare)

 ' Insert Optional Minutes
 If CInt(strMinutePart) = 0 then
  strFormat = Replace(strFormat, "%n", "", 1, _
           -1, vbBinaryCompare)
 Else
  If CInt(strMinutePart) < 10 then _
           strMinutePart = "0" & strMinutePart
  strMinutePart = ":" & strMinutePart
  strFormat = Replace(strFormat, "%n", strMinutePart, _
           1, -1, vbBinaryCompare)
 End if

 ' Insert Seconds
 strSecondPart = DatePart("s",strDate)
 If Len(strSecondPart) < 2 then _
          strSecondPart = "0" & strSecondPart
 strFormat = Replace(strFormat, "%S", strSecondPart, 1, _
          -1, vbBinaryCompare)

 ' Insert AM/PM indicator
 If DatePart("h",strDate) >= 12 then
   strAMPM = "PM"
 Else
   strAMPM = "AM"
 End If

 strFormat = Replace(strFormat, "%P", strAMPM, 1, _
          -1, vbBinaryCompare)

 formatDate = strFormat

 'If there is an error output its value
 If err.Number <> 0 then
  Response.Clear
  Response.Write "ERROR " & err.Number & _
                 ": formatDate - " & err.Description
  Response.Flush
  Response.End
 End if
End Function ' fncFmtDate


Function safeSQL(s)
	on error resume next
	safeSQL = replace(s,"'","''")
End Function

%>