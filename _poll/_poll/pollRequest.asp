<%@ Language=VBScript %>
<!--#INCLUDE FILE="includes/DBConnection.inc"-->

<%
Dim intPollID, strSQL, PollData, PollVote, strQuestion, intNumOpts, PollOptions
Dim strOptsOutput, strError, intCount, intNewCnt, intAnswerID, intTotalVotes
strError = ""
intTotalVotes = 0

if Request.QueryString("action") = "init" then
  'get poll data
  If Request.QueryString("intPollID") > 0 Then
    intPollID = Request.QueryString("intPollID")
  Else
    intPollID = 0
  End If

  If intPollID > 0 Then
    strSQL = "SELECT * FROM Polls WHERE intPollID=" & intPollID
  Else
    strSQL = "SELECT TOP 1 * FROM Polls WHERE blnActive=1"
  End If

  PollData = objConn.Execute(strSQL)
  strQuestion = trim(PollData("strQuestion"))
  intPollID = PollData("intPollID")

  set PollOptions = objConn.Execute("SELECT * FROM PollAnswers WHERE intPollID=" & _
                                 PollData("intPollID") & "ORDER BY intAnswerID")
  if not PollOptions.EOF then
    intCount = 0
    while not PollOptions.EOF
      intCount = intCount + 1
      Execute("Dim strOpt" & intCount)
      Execute("strOpt" & intCount & "=" & chr(34)&PollOptions("strAnswer")&chr(34))
      Execute("strOptsOutput = " & chr(34)&strOptsOutput & "&opt" & intCount & _
                                        "=" & eval("strOpt" & intCount)&chr(34))

      Execute("Dim intOptCnt" & intCount)
      Execute("intOptCnt" & intCount & "=" & chr(34) & _
              PollOptions("intResponseCount") & chr(34))
      Execute("strOptsOutput = " & chr(34) & strOptsOutput & "&opt" & intCount & _
                                  "Cnt=" & eval("intOptCnt" & intCount) & chr(34))
      intTotalVotes = intTotalVotes + PollOptions("intResponseCount")
      PollOptions.MoveNext
    wend
    intNumOpts = intCount
  else
    strError = "Error pulling options."
  end if
  set PollOptions = nothing

  strSQL = "SELECT * FROM PollVoters WHERE strVoterIP='" & _
                  Request.ServerVariables("REMOTE_ADDR") & _
                  "' AND intPollID=" & PollData("intPollID")
  set PollVoted = objConn.Execute(strSQL)
  if PollVoted.EOF then
    voted = 0
  else
    voted = 1
  end if
  set PollVoted = nothing

  Response.Write("dummy=1&question=" & strQuestion & "&numopts=" & intNumOpts & _ 
                           "&intTotalVotes=" & intTotalVotes & "&ID=" & intPollID)
  Response.Write(strOptsOutput)
  if len(strError) > 0 then
    Response.Write("&error=" & strError)
  end if
  Response.Write("&voted=" & voted & "&done=1")

  set PollData = nothing
elseif Request.QueryString("action") = "vote" then
  'add vote
  strSQL = "SELECT * FROM PollAnswers WHERE intPollID=" & Request.QueryString("ID") & _
                                                            " ORDER BY intAnswerID"
  set PollVote = objConn.Execute(strSQL)

  if not PollVote.EOF then
    intCount = 0
    while not PollVote.EOF
      intCount = intCount + 1
      Execute("Dim intOptCnt" & intCount)
      if intCount = cint(Request.QueryString("select")) then
        Execute("intOptCnt" & intCount & "=" & chr(34) & _
               PollVote("intResponseCount") + 1 & chr(34))
        intNewCnt = PollVote("intResponseCount") + 1
        intAnswerID = PollVote("intAnswerID")
      else
        Execute("intOptCnt" & intCount & "=" & chr(34) & _
                   PollVote("intResponseCount") & chr(34))
      end if
      Execute("strOptsOutput = " & chr(34) & strOptsOutput & "&opt" & intCount & _
                                  "Cnt=" & eval("intOptCnt" & intCount) & chr(34))
      intTotalVotes = intTotalVotes + PollVote("intResponseCount")
      PollVote.MoveNext
    wend
    intTotalVotes = intTotalVotes + 1

    strSQL = "UPDATE PollAnswers set intResponseCount=" & intNewCnt & _
        " where intPollID = " & cint(Request.QueryString("ID")) & _
                                  " AND intAnswerID=" & intAnswerID
    response.Write(strSQL)
    objConn.Execute(strSQL)

    strSQL = "INSERT INTO PollVoters (intPollID, strVoterIP) VALUES (" & _
                                     Request.QueryString("ID") & ", '" & _
                             Request.ServerVariables("REMOTE_HOST") & "')"
    objConn.Execute(strSQL)
  else
    strError="There was an error tabulating votes"
  end if
  set PollVote = nothing

  Response.Write("dummy=1" & strOptsOutput & "&intTotalVotes=" & intTotalVotes & _
                                               "&ID=" & Request.QueryString("ID"))
  if len(strError) > 0 then
    Response.Write("&error=" & strError)
  end if
  Response.Write("&done=1")
end if
%>