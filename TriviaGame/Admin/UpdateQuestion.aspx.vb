Public Class UpdateQuestion
    Inherits System.Web.UI.Page
    Protected WithEvents Levels As System.Web.UI.WebControls.DropDownList
    Protected WithEvents DisplayOrderNumber As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents QuestionText As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents SubmitUpdateQuestion As System.Web.UI.WebControls.Button
    Protected WithEvents idQuestion As System.Web.UI.WebControls.Label
    Protected WithEvents DeleteQuestion As System.Web.UI.WebControls.LinkButton
    Protected WithEvents RequiredFieldValidator4 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents Categories As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Form2 As System.Web.UI.HtmlControls.HtmlForm

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

        Dim objCMDLevels As New SqlClient.SqlCommand()
        Dim objCMDCat As New SqlClient.SqlCommand()
        Dim objCMDDR As New SqlClient.SqlCommand()
        Dim objConnLevels As New SqlClient.SqlConnection()
        Dim objConnCat As New SqlClient.SqlConnection()
        Dim objConnDR As New SqlClient.SqlConnection()
        Dim strSQL As String
        Dim intCnt As Integer
        Dim objDRLevels As SqlClient.SqlDataReader
        Dim objDRCat As SqlClient.SqlDataReader
        Dim objDR As SqlClient.SqlDataReader

        '  First time the page is loaded (not a form post)
        If Not IsPostBack Then

            '  Open several connections for getting the page data

            '  Open the connection
            objConnLevels.ConnectionString = Application("strConn")
            objConnLevels.Open()

            '  Set the command connection
            objCMDLevels.Connection = objConnLevels

            '  Open the connection
            objConnCat.ConnectionString = Application("strConn")
            objConnCat.Open()

            '  Set the command connection
            objCMDCat.Connection = objConnCat

            '  Open the connection
            objConnDR.ConnectionString = Application("strConn")
            objConnDR.Open()

            '  Set the command connection
            objCMDDR.Connection = objConnDR

            '  Build query to get the level data
            strSQL = "Select * from levels order by LevelOrder"

            '  Set the command query
            objCMDLevels.CommandText = strSQL

            '  Set the reader
            objDRLevels = objCMDLevels.ExecuteReader

            '  Assign the drop down list data source and fields to display
            Levels.DataSource = objDRLevels
            Levels.DataTextField = "LevelName"
            Levels.DataValueField = "idLevel"
            Levels.DataBind()

            '  Build the query to get the categories
            strSQL = "Select * from categories"

            '  Set the command query
            objCMDCat.CommandText = strSQL

            '  Set the reader
            objDRCat = objCMDCat.ExecuteReader

            '  Assign the drop down list data source and fields to display
            Categories.DataSource = objDRCat
            Categories.DataTextField = "CategoryName"
            Categories.DataValueField = "idCategory"
            Categories.DataBind()

            '  Build the query to get the question data
            strSQL = "select * from questions where idQuestion = " & _
            Request.QueryString("idQuestion")

            '  Set the command query
            objCMDDR.CommandText = strSQL

            ' Set the reader
            objDR = objCMDDR.ExecuteReader

            '  Get the data
            objDR.Read()

            '  Display the data
            idQuestion.Text = objDR.Item("idQuestion")
            QuestionText.Text = objDR.Item("QuestionText")
            DisplayOrderNumber.Text = objDR.Item("DisplayOrderNumber")

            '  Select the current level
            For intCnt = 0 To (Levels.Items.Count - 1)
                If Levels.Items(intCnt).Value = objDR.Item("idLevel") Then
                    Levels.SelectedIndex = intCnt
                End If
            Next

            '  Select the current category
            For intCnt = 0 To (Categories.Items.Count - 1)
                If Categories.Items(intCnt).Value = objDR.Item("idCategory") Then
                    Categories.SelectedIndex = intCnt
                End If
            Next

        End If

    End Sub

    Private Sub DeleteQuestion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteQuestion.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Set the command connection
        objCMD.Connection = objConn

        '  Build the delete query
        strSQL = "Delete from Questions where idQuestion = " & idQuestion.Text

        '  Set the command text
        objCMD.CommandText = strSQL

        '  Execute thee query
        objCMD.ExecuteNonQuery()

        '  We also need to delete any related answers
        strSQL = "Delete from Answers where idQuestion = " & idQuestion.Text

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user to the question management page
        Server.Transfer("ManageQuestions.aspx")

    End Sub

    Private Sub SubmitUpdateQuestion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitUpdateQuestion.Click

        Dim objCMD As New SqlClient.SqlCommand()
        Dim objConn As New SqlClient.SqlConnection()
        Dim strSQL As String

        '  Open the connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  Build the update query
        strSQL = "Update Questions set QuestionText = '" & _
                  Replace(QuestionText.Text, "'", "''") & _
                  "', DisplayOrderNumber = " & _
                  DisplayOrderNumber.Text & ", idLevel=" & _
                  Levels.SelectedItem.Value & ", idCategory = " & _
                  Categories.SelectedItem.Value & " where idQuestion = " & _
                  idQuestion.Text

        '  Set the command connection
        objCMD.Connection = objConn

        '  Set the command query
        objCMD.CommandText = strSQL

        '  Execute the query
        objCMD.ExecuteNonQuery()

        '  Send the user to the question management page
        Server.Transfer("ManageQuestions.aspx")

    End Sub

End Class
