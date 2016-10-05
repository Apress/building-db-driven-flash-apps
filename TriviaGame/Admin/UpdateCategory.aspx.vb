Public Class UpdateCategory
    Inherits System.Web.UI.Page
    Protected WithEvents CategoryName As System.Web.UI.WebControls.TextBox
    Protected WithEvents idCategory As System.Web.UI.WebControls.Label
    Protected WithEvents DeleteCategory As System.Web.UI.WebControls.LinkButton
    Protected WithEvents SubmitUpdateCategory As System.Web.UI.WebControls.Button
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ID = "SubmitUpdateCategory"

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
        Dim objDR As SqlClient.SqlDataReader
        Dim strSQL As String

        '  First time the page is displayed (not a form post)
        If Not IsPostBack Then

            '  Open the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Set the command connection
            objCMD.Connection = objConn

            '  Build a query to retrieve the category data
            strSQL = "select * from Categories where idCategory = " & _
            Request.QueryString("idCategory")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Get the data
            objDR.Read()

            '  Show the category data
            idCategory.Text = objDR.Item("idCategory")
            CategoryName.Text = objDR.Item("CategoryName")

        End If


    End Sub

    Private Sub DeleteCategory_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteCategory.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  Build the delete query
        strSQL = "Delete from Categories where idCategory = " & idCategory.Text

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user to the category management page
        Server.Transfer("ManageCategories.aspx")

    End Sub


    Private Sub SubmitUpdateCategory_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitUpdateCategory.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Update the category
        strSQL = "Update Categories set CategoryName = '" & _
        Replace(CategoryName.Text, "'", "''") & _
        "' where idCategory = " & idCategory.Text

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the category management page
        Server.Transfer("ManageCategories.aspx")

    End Sub
End Class
