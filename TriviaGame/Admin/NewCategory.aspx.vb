Public Class NewCategory
    Inherits System.Web.UI.Page
    Protected WithEvents SubmitNewCategory As System.Web.UI.WebControls.Button
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents CategoryName As System.Web.UI.WebControls.TextBox

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

            '  Open the connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Build a SQL insert query
            strSQL = "Insert into Categories(CategoryName) values('" & _
            Replace(CategoryName.Text, "'", "''") & "')"

            '  Set up the command object and execute the query
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL
            objCMD.ExecuteNonQuery()

            '  Send the user back to the manage categories page
            Server.Transfer("ManageCategories.aspx")

        End If

    End Sub

End Class
