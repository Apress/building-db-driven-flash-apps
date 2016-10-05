Public Class ManagePlayers
    Inherits System.Web.UI.Page
    Protected WithEvents cnnTriviaGame As System.Data.SqlClient.SqlConnection
    Protected WithEvents dgPlayers As System.Web.UI.WebControls.DataGrid
    Protected WithEvents cmdGetPlayers As System.Data.SqlClient.SqlCommand

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdGetPlayers = New System.Data.SqlClient.SqlCommand()
        Me.cnnTriviaGame = New System.Data.SqlClient.SqlConnection()
        '
        'cmdGetPlayers
        '
        Me.cmdGetPlayers.CommandText = "select * from Players"
        Me.cmdGetPlayers.Connection = Me.cnnTriviaGame
        '
        'cnnTriviaGame
        '
        Me.cnnTriviaGame.ConnectionString = "data source=TOSHIBA-USER\VSdotNET;initial catalog=TriviaGame;integrated security=" & _
        "SSPI;persist security info=False;workstation id=TOSHIBA-USER;packet size=4096"

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        '  First time the page is loaded (not a form post back)
        If Not IsPostBack Then

            '  Create a new SQL data reader
            Dim objDR As SqlClient.SqlDataReader

            '  Open the connection placed on the aspx page
            cnnTriviaGame.Open()

            '  Get the data by executing the command on the aspx page
            objDR = cmdGetPlayers.ExecuteReader

            '  Set the grid data source
            dgPlayers.DataSource = objDR

            '  Show the data
            dgPlayers.DataBind()

        End If

    End Sub


    Private Sub dgPlayers_ItemCommand(ByVal source As Object, _
     ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) _
     Handles dgPlayers.ItemCommand
        ' e.Item is the row of the DataGrid where the link was 
        ' clicked.

        '  Check for what kind of action the user wants to take
        If LCase(Trim(e.CommandName)) = "select" Then

            '  update player
            Server.Transfer("UpdatePlayer.aspx?idPlayer=" & e.Item.Cells(0).Text)

        Else
            '  View the player's answer history
            Server.Transfer("ViewPlayerHistory.aspx?idPlayer=" & _
            e.Item.Cells(0).Text)

        End If

    End Sub

End Class
