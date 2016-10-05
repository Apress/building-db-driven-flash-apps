<%@ Language=VBScript %>
<%Option Explicit%>
<!--#INCLUDE FILE="../includes/validate.inc"-->
<!--#INCLUDE FILE="../includes/DBConnection.inc"-->
<html>
<head>
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
</head>
<body>
<title>Maintain Polls</title>
<!--#INCLUDE FILE="../includes/navigation.inc"-->
<%

dim sSQL

' Retrieve the Polls id and question
sSQL = "select intPollID, strQuestion, blnActive from Polls order by intPollID"

'  Execute the query
Set objRS = objConn.Execute(sSQL)
%>

<!--  Build a table to display the option for managing the Polls -->
<table border=1 cellspacing="3" cellpadding="4" align="center" ID="Table1">
<tr>
	<th colspan="5">Poll Maintenance</th>
</tr>
<tr>
	<!--  Add a new Polls option -->
	<td colspan="5" align="center"><a href="AddNewPoll.asp">*Add New Poll*</a></td>
</tr>
<%
'  Loop through each poll
do until objRS.eof
%>

	<tr>
		<!--  Show the ID of the Polls -->
		<td bgcolor=<%	if objRS("blnActive") then 
					response.Write("green><FONT COLOR=white>" & objRS("intPollID") & "</font>")
				else
					response.Write("red><FONT COLOR=white>" & objRS("intPollID") & "</font>")
				end if	%></td>
		
		<!--  Show the question and link it to be updated -->
		<td>
			<a href="UpdatePoll.asp?idPoll=<%=objRS("intPollID")%>">
			   <%=objRS("strQuestion")%></a>
		</td>

		<!--  Provide an option to manage the PollAnswers to the Polls question -->
		<td>
			<a href="MaintainAnswers.asp?idPoll=<%=objRS("intPollID")%>">
			   Manage Answers</a>
		</td>
		
		<!---  Provide an option to delete the Polls -->
		<td>
			<a href="DeletePoll.asp?idPoll=<%=objRS("intPollID")%>">Delete</a>
		</td>
		<td>
		<%	if objRS("blnActive") then 
				response.Write("<a href=""DeactivatePoll.asp?idPoll=" & objRS("intPollID") & """>Deactivate Poll</a>")
			else
				response.Write("<a href=""ActivatePoll.asp?idPoll=" & objRS("intPollID") & """>Activate Poll</a>")
			end if	%>
		</td>
	</tr>

<%
'  Move to the next record in the record set
objRS.movenext

'  Loop back
Loop
%>

</table>

<%
objConn.close
%>

</body>
</html>
