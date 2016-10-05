Public Class Register
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

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim objDR As SqlClient.SqlDataReader
        Dim strSQL As String
        Dim blnResult As Boolean

        Response.Write("dummy=1")

        '  Set the connection
        objConn.ConnectionString = Application("strConn")

        '  Open the connection
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  See if an existing player with the same name exists
        strSQL = "select idPlayer from Players where PlayerName= '" & _
        Replace(Request.QueryString("PlayerName"), "'", "''") & "'"

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Set the reader
        objDR = objCMD.ExecuteReader

        '  Get the data and see if anything is returned
        blnResult = objDR.Read

        '  If no data returned
        If blnResult = False Then

            '  Build a SQL statement to insert the new player
            strSQL = "insert into Players(PlayerName, Password) values('" & _
            Request.QueryString("PlayerName") & "', '" & Request.QueryString("Password") & "')"

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Close the reader
            objDR.Close()

            '  Execute the query
            objCMD.ExecuteNonQuery()

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
                Response.Write("&Error=There was an error registering your information.")
            Else
                '  There is a match, store the player ID and send the user to the triva home page
                Session("idPlayer") = objDR.Item("idPlayer")
            End If

        Else

            '  Indicate there is a user with the name already
            Response.Write("&Error=The Player Name you selected has already been taken.")

        End If

        Response.Write("&done=1")

    End Sub

End Class
