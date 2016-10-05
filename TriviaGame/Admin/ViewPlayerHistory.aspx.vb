Public Class ViewPlayerHistory
    Inherits System.Web.UI.Page
    Protected WithEvents dgAnswers As System.Web.UI.WebControls.DataGrid
    Protected WithEvents ResetPlayer As System.Web.UI.WebControls.LinkButton
    Protected WithEvents Score As System.Web.UI.WebControls.Label

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
        Dim blnReturn As Boolean
        Dim objDR As SqlClient.SqlDataReader

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Build a query to get the score by looking at the correct responses and get the
        '  corresponding level and point value
        strSQL = "SELECT Sum(Levels.QuestionPoints) FROM (Questions INNER " & _
        "JOIN (Responses INNER JOIN Answers ON Responses.idAnswer = " & _
        "Answers.idAnswer) ON Questions.idQuestion = Answers.idQuestion) " & _
        "INNER JOIN Levels ON Questions.idLevel = Levels.idLevel WHERE " & _
        "Responses.idPlayer=" & Request.QueryString("idPlayer") & _
        " and answers.correct = 1"

        '  Open the connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Get the data and ensure something is returned (there may be no correct responses)
        blnReturn = objDR.Read()

        '  If data was returned (any answers at all)
        If blnReturn = True Then
            '  Display the score if not NULL
            If Not objDR.IsDBNull(0) Then
                Score.Text = objDR.Item(0)
            Else
                Score.Text = 0
            End If

        Else
            '  Else score of 0
            Score.Text = 0
        End If

        '  Close the reader for reuse
        objDR.Close()

        '  Build a query to get the responses of the user and the corresponding 
        '  question text, answer text, and point value
        strSQL = "SELECT questions.questiontext, Levels.QuestionPoints, " & _
        "Answers.AnswerText, Answers.Correct FROM (Questions INNER JOIN " & _
        "(Responses INNER JOIN Answers ON Responses.idAnswer = " & _
        "Answers.idAnswer) ON Questions.idQuestion = Answers.idQuestion) " & _
        "INNER JOIN Levels ON Questions.idLevel = Levels.idLevel WHERE " & _
        "(((Responses.idPlayer)=" & Request.QueryString("idPlayer") & ")) " & _
        "order by levels.levelorder, questions.displayordernumber"

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Set the grid data source
        dgAnswers.DataSource = objDR

        '  Show the data
        dgAnswers.DataBind()

    End Sub

    Private Sub ResetPlayer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ResetPlayer.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim objDR As SqlClient.SqlDataReader

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Open the connection
        objCMD.Connection = objConn

        '  Delete all of the responses
        strSQL = "delete FROM responses where idPlayer = " & _
        Request.QueryString("idPlayer")

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Reset the last question
        strSQL = "update players set LastQuestion = NULL where idPlayer = " & _
        Request.QueryString("idPlayer")

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        Server.Transfer("ManagePlayers.aspx")

    End Sub

End Class
