<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>

<script runat="server">
  void Logon_Click(object sender, EventArgs e)
  {
    if ((Username.Text == "Admin") && 
            (UserPass.Text == "admin"))
      {
          FormsAuthentication.RedirectFromLoginPage 
             (Username.Text, Persist.Checked);
      }
      else
      {
          Msg.Text = "Invalid credentials. Please try again.";
      }
  }
</script>
<html>
<head id="Head1" runat="server">
  <title>Login</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <header>
        <h2>
            <img src="/Content/RankenLogo.png" style="width: 516px; height: 69px;" />
           <span> Concern Report Sytem</span></h2>
    </header>  
  <form id="form1" runat="server">
    <h3>
      Login</h3>
    <table>
      <tr>
        <td>
          Username:</td>
        <td>
          <asp:TextBox ID="Username" runat="server" /></td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            ControlToValidate="Username"
            Display="Dynamic" 
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Password:</td>
        <td>
          <asp:TextBox ID="UserPass" TextMode="Password" 
             runat="server" />
        </td>
        <td>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            ControlToValidate="UserPass"
            ErrorMessage="Cannot be empty." 
            runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          Remember me?</td>
        <td>
          <asp:CheckBox ID="Persist" runat="server" /></td>
      </tr>
    </table>
    <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Log On" 
       runat="server" />
    <p>
      <asp:Label ID="Msg" ForeColor="red" runat="server" />
    </p>
  </form>
</body>
</html>