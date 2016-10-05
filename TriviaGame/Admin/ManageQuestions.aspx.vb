Public Class ManageQuestions
    Inherits System.Web.UI.Page
    Protected WithEvents NewLevel As System.Web.UI.WebControls.LinkButton
    Protected WithEvents dgQuestions As System.Web.UI.WebControls.DataGrid
    Protected WithEvents NewQuestion As System.Web.UI.WebControls.LinkButton
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

        '  See if first time page is displayed (not a form post back)
        If Not IsPostBack Then

            '  Set up the connection
            objConn.ConnectionString = Application("strConn")
            objConn.Open()

            '  Query for all questions and the related levels and categories ordered by level 
            '  display order and then question displayordernumber - so it shows all of the 
            '  question detail in the order the player will see them
            strSQL = "SELECT Questions.idQuestion, Questions.QuestionText, " & _
            "Questions.DisplayOrderNumber, Levels.LevelName, " & _
            "Categories.CategoryName FROM Levels INNER JOIN (Categories " & _
            "INNER JOIN Questions ON Categories.idCategory = " & _
            "Questions.idCategory) ON Levels.idLevel = Questions.idLevel " & _
            "order by levelorder, DisplayOrderNumber"

            '  Set up the command object
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL

            '  Set up the reader
            objDR = objCMD.ExecuteReader

            '  Set the grid data source
            dgQuestions.DataSource = objDR

            '  Show the data
            dgQuestions.DataBind()

        End If


    End Sub


    Private Sub dgQuestions_ItemCommand(ByVal source As Object, _
     ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) _
     Handles dgQuestions.ItemCommand
        ' e.Item is the row of the DataGrid where the link was 
        ' clicked.

        ' Based on the option selected, send the user to the appropriate page
        If LCase(Trim(e.CommandName)) = "update" Then
            '  Update the question
            Server.Transfer("UpdateQuestion.aspx?idQuestion=" & e.Item.Cells(0).Text)
        Else
            '  manage the question answers
            Server.Transfer("ManageAnswers.aspx?idQuestion=" & e.Item.Cells(0).Text)
        End If

    End Sub


    Private Sub NewQuestion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewLevel.Click, NewQuestion.Click

        '  Send the user to add a new question
        Server.Transfer("NewQuestion.aspx")

    End Sub

End Class
