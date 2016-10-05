Public Class Answer
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

        Response.Write("dummy=1")

        'check for answer sent from Flash
        'if not one, send error back
        'else process answer
        If Not Request.QueryString("Answers") <> "" Then
            Response.Write("&Error=ANSWER NOT RECEIVED BY SERVER" & Chr(13) & Chr(13) & "(i.e. You probably didn't choose one.)")
        Else
            Dim objCMD As New SqlClient.SqlCommand()
            Dim objConn As New SqlClient.SqlConnection()
            Dim strSQL As String
            Dim objDR As SqlClient.SqlDataReader

            '  Set up the connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Set the command connection
            objCMD.Connection = objConn

            '  Update the Player's last question
            strSQL = "update Players set LastQuestion = " & Session("idQuestion") & _
            " where idPlayer = " & Session("idPlayer")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Execute the query
            objCMD.ExecuteNonQuery()

            '  Insert the player's response for the question
            strSQL = "insert into Responses(idPlayer, idQuestion, idAnswer) " & _
            "values(" & Session("idPlayer") & ", " & Session("idQuestion") & _
            ", " & Request.QueryString("Answers") & ")"

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Execute the query
            objCMD.ExecuteNonQuery()

            '  Get the correct setting for the answer
            strSQL = "select answers.correct from responses inner join answers " & _
            "on responses.idAnswer = Answers.idAnswer where responses.idAnswer = " & _
            Request.QueryString("Answers")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Get the data
            objDR.Read()

            '  If it was the correct answer then say so, otherwise indicate incorrect
            If objDR.Item("Correct") = True Then
                Response.Write("&Feedback=1")
            Else
                Response.Write("&Feedback=0")
            End If
        End If

        Response.Write("&done=1")

    End Sub

End Class
