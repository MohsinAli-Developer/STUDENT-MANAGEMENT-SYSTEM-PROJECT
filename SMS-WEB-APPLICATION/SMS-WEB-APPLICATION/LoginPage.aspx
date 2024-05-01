<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SMS_WEB_APPLICATION.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript">
        function ShowPassword(checkBox)
        {
        var PasswordTextBox = document.getElementById('PasswordTextBox');
            if (checkBox.checked == true)
            {
                PasswordTextBox.setAttribute("type", "text");
            }
            else
            {
                PasswordTextBox.setAttribute("type", "password");
            }
        }

        function DisableBackButton()
{
    window.history.forward();
    return true;
}
DisableBackButton();
window.onload = DisableBackButton;
window.onpageshow = function (evt)
{
    if (evt.persisted)
        DisableBackButton();
}
window.onunload = function ()
{
    void (0);
}

        //    function preventBack() {window.history.forward()}
        //    setTimeout("preventBack()" , 0);
        //window.onunload = function () { null };

        
     </script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="div">
        <h1 >LOGIN FORM</h1>
                <br />

         <asp:TextBox ID="UsernameTextBox" runat="server" Text="Username"></asp:TextBox>         
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter username" ControlToValidate="UsernameTextBox" Display="Dynamic" ForeColor="Lime"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" Text="Password"></asp:TextBox>
        
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter password" ControlToValidate="PasswordTextBox" Display="Dynamic" ForeColor="Lime"></asp:RequiredFieldValidator>
        <br />
        <br />
         <asp:Button ID="LOGINButton" runat="server" Text="LOGIN" OnClick="LOGINButton_Click" OnClientClick="return DisableBackButton();" />
                <br />
                <br />
            <input id="checkbox" type="checkbox" onclick="ShowPassword(this)"  /> Show Password                
                <br />
        <br />
        <a id="register" href="Register.aspx">Not Register yet ? Click here</a>
        </div>
    </form>
</body>
</html>
