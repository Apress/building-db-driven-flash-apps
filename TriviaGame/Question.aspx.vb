Public Class Question
    Inherits System.Web.UI.Page
    Dim blnGameOver As Boolean = False

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
        Dim intLastQuestion As Integer
        Dim objDR As SqlClient.SqlDataReader
        Dim blnResult As Boolean

        Response.Write("dummy=1")

        '  Set the connection
        objConn.ConnectionString = Application("strConn")

        '  Open the connection
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  Get the last question for the player
        strSQL = "select LastQuestion from Players where idPlayer = " & _
        Session("idPlayer")

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader()

        '  Get the data 
        blnResult = objDR.Read()

        '  See if the lastquestion field is null
        If Not objDR.IsDBNull(0) Then

            '  Get the last question
            intLastQuestion = objDR.Item("LastQuestion")

            '  Get the last question's display order and level order
            strSQL = "SELECT Questions.DisplayOrderNumber, " & _
            "Levels.LevelOrder FROM Questions INNER JOIN Levels " & _
            "ON Levels.idLevel = Questions.idLevel where " & _
            "questions.idQuestion = " & intLastQuestion

            '  Close the reader for reuse
            objDR.Close()

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader()

            '  Get the data
            objDR.Read()

            '  Store the starting level and the starting question display order
            Session("DisplayOrderNum") = objDR.Item("DisplayOrderNumber")

            Session("LevelOrder") = objDR.Item("LevelOrder")

            '  Get the next question and indicate that this isn't a new user
            GetNextQuestionFromDB(True)

        Else

            '  Get the next question and indicate this is a new user
            GetNextQuestionFromDB(False)

        End If

        '  Always display the current score
        DisplayScore()
        Response.Write("&done=1")

    End Sub

    Private Sub GetNextQuestionFromDB(ByVal getnextflag As Integer)

        'Put user code to initialize the page here
        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim intCnt As Integer
        Dim objDR As SqlClient.SqlDataReader
        Dim blnResult As Boolean

        '  Set up the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  See if this is a new user or an in process user
        If getnextflag = True Then

            '  Get the next question in the level for in process users
            strSQL = "SELECT Questions.idQuestion, Questions.QuestionText, " & _
            "Questions.DisplayOrderNumber, Levels.LevelName, " & _
            "Levels.LevelOrder, Levels.LevelColor, Categories.CategoryName " & _
            "FROM Levels INNER JOIN (Categories INNER JOIN Questions ON " & _
            "Categories.idCategory = Questions.idCategory) ON " & _
            "Levels.idLevel = Questions.idLevel where Levels.LevelOrder = " & _
            Session("LevelOrder") & " and Questions.DisplayOrderNumber > " & _
            Session("DisplayOrderNum") & _
            " order by levelorder, DisplayOrderNumber"

        Else

            '  Get all questions orderd by level and display order to start the user
            '  Note this is only executed when it is a new user who has not seen a 
            '  question before
            strSQL = "SELECT Questions.idQuestion, Questions.QuestionText, " & _
            "Questions.DisplayOrderNumber, Levels.LevelName, " & _
            "Levels.LevelOrder, Levels.LevelColor, Categories.CategoryName " & _
            "FROM Levels INNER JOIN (Categories INNER JOIN Questions ON " & _
            "Categories.idCategory = Questions.idCategory) ON " & _
            "Levels.idLevel = Questions.idLevel order by levelorder, " & _
            "DisplayOrderNumber"

        End If

        '  Set the query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader()

        '  Get data and see if there is a result
        blnResult = objDR.Read()

        '  check to see if there is a next question
        '  If not then we may be moving to a new level
        '  or may be at the last level and question
        If blnResult = False Then

            '  Query for the next higher level and the first question
            strSQL = "SELECT Questions.idQuestion, Questions.QuestionText, " & _
            "Questions.DisplayOrderNumber, Levels.LevelName, " & _
            "Levels.LevelOrder, Levels.LevelColor, Categories.CategoryName " & _
            "FROM Levels INNER JOIN (Categories INNER JOIN Questions ON " & _
            "Categories.idCategory = Questions.idCategory) ON " & _
            "Levels.idLevel = Questions.idLevel where Levels.LevelOrder > " & _
            Session("LevelOrder") & " order by levelorder, DisplayOrderNumber"

            '  Close the reader for reuse
            objDR.Close()

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader()

            '  Get the data and see if there is a result
            blnResult = objDR.Read()

            '  If there is no result then there are no more questions
            '  Send the user to the game over page
            If blnResult = False Then
                Response.Write("&GameOver=1")
                blnGameOver = True
            End If
        End If
        If blnResult Then

            '  Save the current display order and level for future queries
            Session("DisplayOrderNum") = objDR.Item("DisplayOrderNumber")
            Session("LevelOrder") = objDR.Item("LevelOrder")

            '  Save the question for future queries
            Session("idQuestion") = objDR.Item("idQuestion")

            '  SHow the level with the appropriate color
            Response.Write("&Level=" & objDR.Item("LevelName"))
            Response.Write("&LevelColor=" & Replace(objDR.Item("LevelColor"), "#", ""))

            '  Show the question category
            Response.Write("&Category=" & objDR.Item("CategoryName"))

            '  Show the question
            Response.Write("&Question=" & objDR.Item("QuestionText"))

            '  Get the answers for the question
            strSQL = "SELECT idAnswer, AnswerText FROM Answers where " & _
            "idQuestion = " & objDR.Item("idQuestion")

            '  Close the reader for reuse
            objDR.Close()

            '  Set the query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader()

            Dim i As Integer = 0
            While objDR.Read
                i = i + 1
                Response.Write("&Answer" & i & "ID=" & objDR("idAnswer") & "&Answer" & i & "Text=" & objDR("AnswerText"))
            End While
            Response.Write("&numAnswers=" & i)
        End If
    End Sub

    Private Sub DisplayScore()

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim objDR As SqlClient.SqlDataReader
        Dim blnResult As Boolean

        '  Set up hte connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  Get the total points by combining responses, questions and levels
        strSQL = "SELECT Sum(Levels.QuestionPoints) FROM (Questions INNER " & _
        "JOIN (Responses INNER JOIN Answers ON Responses.idAnswer = " & _
        "Answers.idAnswer) ON Questions.idQuestion = Answers.idQuestion) " & _
        "INNER JOIN Levels ON Questions.idLevel = Levels.idLevel WHERE " & _
        "Responses.idPlayer=" & Session("idPlayer") & " and answers.correct = 1"

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Read the data and see if results are returned
        blnResult = objDR.Read()

        '  If results are returned
        If blnResult = True Then
            '  If the score is no NULL
            If Not objDR.IsDBNull(0) Then
                ' Show score
                Response.Write("&Score=" & objDR.Item(0))
            Else
                '  Show 0 score
                Response.Write("&Score=0")
            End If
        Else
            '  Show 0 score
            Response.Write("&Score=0")
        End If

    End Sub
End Class
