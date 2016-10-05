Public Class GameOver
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim blnResult As Boolean
        Dim objDR As SqlClient.SqlDataReader
        Dim score As String
        Dim cnt As Integer

        '  Set the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Get the score
        strSQL = "SELECT Sum(Levels.QuestionPoints) FROM (Questions INNER JOIN " & _
        "(Responses INNER JOIN Answers ON Responses.idAnswer = " & _
        "Answers.idAnswer) ON Questions.idQuestion = Answers.idQuestion) " & _
        "INNER JOIN Levels ON Questions.idLevel = Levels.idLevel WHERE " & _
        "Responses.idPlayer=" & Session("idPlayer") & " and answers.correct = 1"

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Read the data
        blnResult = objDR.Read()

        '  if there is a result
        If blnResult = True Then
            '  Show the score
            If Not objDR.IsDBNull(0) Then
                score = objDR.Item(0)
            Else
                score = score + 0
            End If

        Else
            '  Show a score of 0
            score = 0
        End If

        '  Close the reader for future use
        objDR.Close()

        '  Get the question responses and join with the level of the question to get the point score and the answer text
        strSQL = "SELECT questions.questiontext, Levels.QuestionPoints, " & _
        "Answers.AnswerText, Answers.Correct FROM (Questions INNER JOIN " & _
        "(Responses INNER JOIN Answers ON Responses.idAnswer = " & _
        "Answers.idAnswer) ON Questions.idQuestion = Answers.idQuestion) " & _
        "INNER JOIN Levels ON Questions.idLevel = Levels.idLevel WHERE " & _
        "(((Responses.idPlayer)=" & Session("idPlayer") & ")) order by " & _
        "levels.levelorder, questions.displayordernumber"

        '  Set the query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader
        Response.Write("dummy=1&strSummary=")
        Response.Write("<b><u>FINAL SCORE: " & score & "</u></b><br><br>")
        While objDR.Read
            Response.Write("<b>Question: </b><u>" & objDR("QuestionText") & "</u> - was worth <b>" & objDR("QuestionPoints") & "</b> Points<br><b>You Answered:</b> " & objDR("AnswerText") & "<br>You answered this question ")
            If objDR("Correct") Then
                Response.Write("<b>correctly</b>.<br><br>")
            Else
                Response.Write("<b>incorrectly</b>.<br><br>")
            End If
        End While
        Response.Write("&done=1")

    End Sub

End Class
