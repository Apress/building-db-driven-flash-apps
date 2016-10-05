Public Class NewAnswer
    Inherits System.Web.UI.Page
    Protected WithEvents SubmitNewAnswer As System.Web.UI.WebControls.Button
    Protected WithEvents AnswerText As System.Web.UI.WebControls.TextBox
    Protected WithEvents Correct As System.Web.UI.WebControls.CheckBox
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator

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
        Dim intCorrectChecked As Integer

        '  Execute when the form is posted
        If IsPostBack Then

            '  Open the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  See if the correct checkbox is checked
            If Correct.Checked = True Then
                intCorrectChecked = 1
            Else
                intCorrectChecked = 0
            End If

            '  Build the insert query
            strSQL = "Insert into Answers(AnswerText, idQuestion, Correct) " & _
            "values('" & Replace(AnswerText.Text, "'", "''") & "', " & _
            Request.QueryString("idQuestion") & ", " & intCorrectChecked & ")"

            '  Set up the command object and execute the query
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL
            objCMD.ExecuteNonQuery()

            '  Send the user back to the manage answers page
            Server.Transfer("ManageAnswers.aspx?idQuestion=" & Request.QueryString("idQuestion"))

        End If

    End Sub


End Class
