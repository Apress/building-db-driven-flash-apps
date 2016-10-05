Public Class UpdateLevel
    Inherits System.Web.UI.Page
    Protected WithEvents DeleteUser As System.Web.UI.WebControls.LinkButton
    Protected WithEvents SubmitUpdateLevel As System.Web.UI.WebControls.Button
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents LevelName As System.Web.UI.WebControls.TextBox
    Protected WithEvents idLevel As System.Web.UI.WebControls.Label
    Protected WithEvents LevelColor As System.Web.UI.WebControls.TextBox
    Protected WithEvents DeleteLevel As System.Web.UI.WebControls.LinkButton
    Protected WithEvents LevelOrder As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents QuestionPoints As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator4 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator

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
        Dim objDR As SqlClient.SqlDataReader
        Dim strSQL As String

        '  First time the page is displayed (not a form post)
        If Not IsPostBack Then

            '  Open the DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Set the command connection
            objCMD.Connection = objConn

            '  Retrieve the level data
            strSQL = "select * from Levels where idLevel = " & _
            Request.QueryString("idLevel")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Get the data
            objDR.Read()

            '  Display the data
            idLevel.Text = objDR.Item("idLevel")
            LevelName.Text = objDR.Item("LevelName")
            LevelOrder.Text = objDR.Item("LevelOrder")

            If Not IsDBNull(objDR.Item("LevelColor")) Then
                LevelColor.Text = objDR.Item("LevelColor")
            End If

            QuestionPoints.Text = objDR.Item("QuestionPoints")

        End If


    End Sub

    Private Sub DeleteLevel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteLevel.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  Build the delete query
        strSQL = "Delete from Levels where idLevel = " & idLevel.Text

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the level management page
        Server.Transfer("ManageLevels.aspx")

    End Sub

    Private Sub SubmitUpdateLevel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitUpdateLevel.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Build the update query
        strSQL = "Update Levels set LevelName = '" & _
        Replace(LevelName.Text, "'", "''") & "', LevelColor = '" & _
        Replace(LevelColor.Text, "'", "''") & "', LevelOrder=" & _
        LevelOrder.Text & ", QuestionPoints = " & QuestionPoints.Text & _
        " where idLevel = " & idLevel.Text

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the level management page
        Server.Transfer("ManageLevels.aspx")

    End Sub
End Class
