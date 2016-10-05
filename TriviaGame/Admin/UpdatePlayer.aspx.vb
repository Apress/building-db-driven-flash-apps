Public Class UpdatePlayer
    Inherits System.Web.UI.Page
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents Password As System.Web.UI.WebControls.TextBox
    Protected WithEvents idPlayer As System.Web.UI.WebControls.Label
    Protected WithEvents PlayerName As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents SubmitUpdatePlayer As System.Web.UI.WebControls.Button
    Protected WithEvents PlayerDelete As System.Web.UI.WebControls.LinkButton

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

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  First time the page is displayed (not a form post)
        If Not IsPostBack Then

            '  Build a query to retrieve the player data
            strSQL = "select * from Players where idPlayer = " & _
            Request.QueryString("idPlayer")

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Get the data
            objDR.Read()

            '  Display the data
            idPlayer.Text = objDR.Item("idPlayer")
            PlayerName.Text = objDR.Item("PlayerName")
            Password.Text = objDR.Item("Password")

        End If


    End Sub

    Private Sub PlayerDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PlayerDelete.Click
        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        ' Set the command connection
        objCMD.Connection = objConn

        '  Build the delete query
        strSQL = "Delete from Players where idPlayer = " & idPlayer.Text

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the player management page
        Server.Transfer("ManagePlayers.aspx")
    End Sub

    Private Sub SubmitUpdatePlayer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitUpdatePlayer.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Build query to update the player 
        strSQL = "Update Players set PlayerName = '" & _
        Replace(PlayerName.Text, "'", "''") & "', Password = '" & _
        Replace(Password.Text, "'", "''") & _
        "' where idPlayer = " & idPlayer.Text

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user back to the player management page
        Server.Transfer("ManagePlayers.aspx")

    End Sub
End Class
