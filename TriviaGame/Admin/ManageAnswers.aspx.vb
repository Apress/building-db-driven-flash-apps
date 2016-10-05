Public Class ManageAnswers
    Inherits System.Web.UI.Page
    Protected WithEvents QuestionText As System.Web.UI.WebControls.Label
    Protected WithEvents NewAnswer As System.Web.UI.WebControls.LinkButton
    Protected WithEvents dgAnswers As System.Web.UI.WebControls.DataGrid

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
        Dim strSQL As String
        Dim objDR As SqlClient.SqlDataReader

        '  FIrst time the page is loaded
        If Not IsPostBack Then

            ' Open a DB connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Set the commad connection
            objCMD.Connection = objConn

            '  Get the question text we are working with
            strSQL = "select QuestionText from Questions where idQuestion=" & _
            Request.QueryString("idQuestion")

            '  Set the query
            objCMD.CommandText = strSQL

            '  Set the data to read
            objDR = objCMD.ExecuteReader

            '  Read the data
            objDR.Read()

            '  Display the question
            QuestionText.Text = objDr.Item("QuestionText")

            '  Close the reader
            objDR.Close()

            '  Get the answers
            strSQL = "select * from answers where idQuestion=" & _
            Request.QueryString("idQuestion")

            '  Set the query
            objCMD.CommandText = strSQL

            '  Set the data to read
            objDR = objCMD.ExecuteReader

            '  Set the grid data source
            dgAnswers.DataSource = objDR

            '  Show the data
            dgAnswers.DataBind()

        End If

    End Sub

    Private Sub NewAnswer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewAnswer.Click
        '  Send the user to add a new answer
        Server.Transfer("NewAnswer.aspx?idQuestion=" & _
        Request.QueryString("idQuestion"))
    End Sub

    Private Sub dgAnswers_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles dgAnswers.ItemCommand
        '  When the user selects a row, send them to the update answer page
        Server.Transfer("UpdateAnswer.aspx?idQuestion=" & _
        Request.QueryString("idQuestion") & "&idAnswer=" & e.Item.Cells(0).Text)

    End Sub
End Class
