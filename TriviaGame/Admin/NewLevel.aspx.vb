Public Class NewLevel
    Inherits System.Web.UI.Page
    Protected WithEvents SubmitNewLevel As System.Web.UI.WebControls.Button
    Protected WithEvents LevelName As System.Web.UI.WebControls.TextBox
    Protected WithEvents LevelColor As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents LevelOrder As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator4 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents QuestionPoints As System.Web.UI.WebControls.TextBox
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

        '  Execute when the form is posted
        If IsPostBack Then

            '  Set up the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Build the insert query
            strSQL = "Insert into Levels(LevelName, LevelColor, LevelOrder, " & _
            "QuestionPoints) values('" & Replace(LevelName.Text, "'", "''") & _
            "', '" & LevelColor.Text & "', " & LevelOrder.Text & _
            ", " & QuestionPoints.Text & ")"

            '  Set up the command object and execute the query
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL
            objCMD.ExecuteNonQuery()

            '  Send the user back to the levels management page
            Server.Transfer("ManageLevels.aspx")

        End If

    End Sub

End Class
