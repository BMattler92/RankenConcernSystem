<%@ Page Language="C#" %>
<html>
<head>
  <title>Home</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>

<script runat="server">
  void Page_Load(object sender, EventArgs e)
  {
    Welcome.Text = "Hello, " + Context.User.Identity.Name;
  }

  void Signout_Click(object sender, EventArgs e)
  {
    FormsAuthentication.SignOut();
    Response.Redirect("Logon.aspx");
  }
</script>

<body>
         <header>
        <h2>
            <img src="/Content/RankenLogo.png" style="width: 516px; height: 69px;" />
           <span> Concern Report Sytem</span></h2>
    </header>  
    
    <form id="Form1" runat="server">
   <div id="login">
    <asp:Label ID="Welcome" runat="server" />
    <br /> <asp:Button ID="Submit1" OnClick="Signout_Click" Text="Sign Out" runat="server" />
   </div>
  
        <br />
      <span id="header">What would you like to do today?</span><br />
      <br />
      <span class="Concern"> Create a new concern</span><br />
      <a href="CreateConcern.aspx">New Concern</a><br />
       <span class="Concern">Update Past Concern</span><br />
      <a href="UpdateConcern.aspx">Update Concern</a><br />
       <span class="Concern">View Concerns</span><br />
      <a href="ViewConcern.aspx"> Search all records</a><br />
  </form>
</body>

</html>