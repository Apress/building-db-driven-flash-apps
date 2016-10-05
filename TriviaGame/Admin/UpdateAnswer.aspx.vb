Public Class UpdateAnswer
    Inherits System.Web.UI.Page
    Protected WithEvents DeleteAnswer As System.Web.UI.WebControls.LinkButton
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents AnswerText As System.Web.UI.WebControls.TextBox
    Protected WithEvents SubmitUpdateAnswer As System.Web.UI.WebControls.Button
    Protected WithEvents Correct As System.Web.UI.WebControls.CheckBox
    Protected WithEvents idAnswer As System.Web.UI.WebControls.Label

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
        'Put user code to initialize the page here

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim objDR As SqlClient.SqlDataReader

        '  First time the page is displayed (not a form post)
        If Not IsPostBack Then

            '  Open the connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Set the command connection
            objCMD.Connection = objConn

            '  Get the answer data 
            strSQL = "select * from Answers where idAnswer = " & _
            Request.QueryString("idAnswer")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Read the data
            objDR.Read()

            '  Display the data
            idAnswer.Text = objDR.Item("idAnswer")
            AnswerText.Text = objDR.Item("AnswerText")
            Correct.Checked = objDR.Item("Correct")

        End If

    End Sub

    Private Sub DeleteAnswer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteAnswer.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn


        '  Build the delete query
        strSQL = "Delete from Answers where idAnswer = " & _
        idAnswer.Text

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send te user back to the answer management page for the specified question
        Server.Transfer("ManageAnswsers.aspx?idQuestion=" & _
        Request.QueryString("idQuestion"))

    End Sub


    Private Sub SubmitUpdateAnswer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitUpdateAnswer.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim intCorrectChecked As Integer

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  See if the correct check box was checked
        If Correct.Checked = True Then
            intCorrectChecked = 1
        Else
            intCorrectChecked = 0
        End If

        '  Update the answer data
        strSQL = "Update Answers set AnswerText = '" & _
        Replace(AnswerText.Text, "'", "''") & "', Correct = " & _
        intCorrectChecked & " where idAnswer = " & idAnswer.Text

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the answer management page for the specified question
        Server.Transfer("ManageAnswers.aspx?idQuestion=" & _
        Request.QueryString("idQuestion"))

    End Sub
End Class
