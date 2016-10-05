Public Class NewQuestion
    Inherits System.Web.UI.Page
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents QuestionText As System.Web.UI.WebControls.TextBox
    Protected WithEvents Levels As System.Web.UI.WebControls.DropDownList
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents DisplayOrderNumber As System.Web.UI.WebControls.TextBox
    Protected WithEvents SubmitNewQuestion As System.Web.UI.WebControls.Button
    Protected WithEvents RequiredFieldValidator4 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents Categories As System.Web.UI.WebControls.DropDownList
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator

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

        '  Open the DB connection
        objConn.ConnectionString = Application("strConn")
        objConn.Open()

        '  First time the page is dislayed populate the drop down lists
        If Not IsPostBack Then

            '  Set the command connection
            objCMD.Connection = objConn

            '  Retrieve all of the levels order by level order
            strSQL = "Select * from levels order by LevelOrder"

            '  Set the query
            objCMD.CommandText = strSQL

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Show the list of levels by setting the drop down list
            '  data source and what fields to display
            Levels.DataSource = objDR
            Levels.DataTextField = "LevelName"
            Levels.DataValueField = "idLevel"
            Levels.DataBind()

            '  Get all of the categories
            strSQL = "Select * from categories"

            '  Set the command query
            objCMD.CommandText = strSQL

            '  Close the previous data reader
            objDR.Close()

            '  Set the reader
            objDR = objCMD.ExecuteReader

            '  Show the list of categories by setting the drop down list
            '  data source and what fields to display
            Categories.DataSource = objDR
            Categories.DataTextField = "CategoryName"
            Categories.DataValueField = "idCategory"
            Categories.DataBind()


        Else

            '  Build the query to insert the new question
            strSQL = "Insert into Questions(QuestionText, idLevel, " & _
            "DisplayOrderNumber, idCategory) values('" & _
            Replace(QuestionText.Text, "'", "''") & "', " & _
            Levels.SelectedItem.Value & ", " & DisplayOrderNumber.Text & _
            ", " & Categories.SelectedItem.Value & ")"

            '  Set up the command object
            objCMD.Connection = objConn
            objCMD.CommandText = strSQL

            '  Execute the query
            objCMD.ExecuteNonQuery()

            '  Send the user to the questions management page
            Server.Transfer("ManageQuestions.aspx")

        End If

    End Sub

End Class
