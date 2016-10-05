Public Class Login
    Inherits System.Web.UI.Page
    Protected WithEvents UserName As System.Web.UI.WebControls.TextBox
    Protected WithEvents Password As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents SubmitLogin As System.Web.UI.WebControls.Button

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
    End Sub

    Private Sub SubmitLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitLogin.Click

        '  See if the proper user name and password was entered
        If LCase(UserName.Text) = "admin" And _
           LCase(Password.Text) = "password" Then

            '  If so then validate the user
            Session("Validated") = True

            '  Send the user to the manager menu
            Server.Transfer("ManagerMenu.aspx")

        Else
            '  Indicate the user was not validated
            Session("Validated") = False
        End If

    End Sub


End Class
