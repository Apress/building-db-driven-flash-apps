Public Class ManageCategories
    Inherits System.Web.UI.Page
    Protected WithEvents NewCategory As System.Web.UI.WebControls.LinkButton
    Protected WithEvents dgCategories As System.Web.UI.WebControls.DataGrid

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

        '  Create a new SQL data reader
        Dim objDR As SqlClient.SqlDataReader


        If Not IsPostBack Then

            '  Open the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Get all the categories
            strSQL = "select * from categories"

            '  Set up the command object
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL

            '  Set the data reader
            objDR = objCMD.ExecuteReader

            '  Set the grid data source
            dgCategories.DataSource = objDR

            '  Show the data
            dgCategories.DataBind()

        End If


    End Sub


    Private Sub dgCategories_ItemCommand(ByVal source As Object, _
     ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) _
     Handles dgCategories.ItemCommand
        ' e.Item is the row of the DataGrid where the link was 
        ' clicked.

        ' When the user selects a category, send them to update
        Server.Transfer("UpdateCategory.aspx?idCategory=" & _
        e.Item.Cells(0).Text)

    End Sub


    Private Sub NewCategory_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewCategory.Click

        '  Send the user to add a new category
        Server.Transfer("NewCategory.aspx")

    End Sub


End Class
