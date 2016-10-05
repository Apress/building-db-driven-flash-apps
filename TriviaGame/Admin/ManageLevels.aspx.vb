Public Class ManageLevels
    Inherits System.Web.UI.Page
    Protected WithEvents NewLevel As System.Web.UI.WebControls.LinkButton
    Protected WithEvents dgLevels As System.Web.UI.WebControls.DataGrid

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
        Dim objDR As SqlClient.SqlDataReader

        '  If first time page is shown
        If Not IsPostBack Then

            '  Open the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Get all of the levels
            strSQL = "select * from Levels order by levelorder"

            '  Set up the command 
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL

            '  Get the data reader
            objDR = objCMD.ExecuteReader

            ' Set the grid source
            dgLevels.DataSource = objDR

            '  Show the data
            dgLevels.DataBind()

        End If


    End Sub


    Private Sub dgLevels_ItemCommand(ByVal source As Object, _
     ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) _
     Handles dgLevels.ItemCommand
        ' e.Item is the row of the DataGrid where the link was 
        ' clicked.

        ' When a level is selected send the user to update
        Server.Transfer("UpdateLevel.aspx?idLevel=" & e.Item.Cells(0).Text)

    End Sub


    Private Sub NewLevel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewLevel.Click

        '  Send the user to add a new level
        Server.Transfer("NewLevel.aspx")

    End Sub


End Class



