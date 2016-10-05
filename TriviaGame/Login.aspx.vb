Public Class Login1
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

        Dim objDR As SqlClient.SqlDataReader
        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim blnResult As Boolean

        '  Open the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  See if the player exists
        strSQL = "select idPlayer from Players where PlayerName= '" & _
        Replace(Request.QueryString("PlayerName"), "'", "''") & "' and Password = '" & _
        Replace(Request.QueryString("Password"), "'", "''") & "'"

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Get the result of the read
        blnResult = objDR.Read

        '  If no results, then there is no player match
        If blnResult = False Then
            Response.Write("&Error=Player not found.")
        Else
            '  There is a match, store the player ID and send the user to the triva home page
            Session("idPlayer") = objDR.Item("idPlayer")
        End If
        Response.Write("&done=1")

    End Sub

End Class
