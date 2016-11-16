<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewConcern.aspx.cs" Inherits="View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <header>
        <h2>
            <img src="/Content/RankenLogo.png" style="width: 516px; height: 69px;" />
           <span> Concern Report Sytem</span></h2>
    </header>  
    <form id="form1" runat="server">
    <div>
        Search by person with concern<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
        <br />
        Searchby Concern Reporter<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" />
        <br />
        Search by Concern Date<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search" />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="View All" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString %>" SelectCommand="SELECT * FROM Concern 
JOIN Person ON Concern.PersonID = Person.PersonID
JOIN Employee ON Concern.EmployeeID = Employee.EmployeeID
JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID
JOIN ContactMethod ON Concern.ContactMethodID = ContactMethod.ContactMethodID
"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ConcernID,PersonID1,EmployeeID1,ConcernReasonID1,ContactMethodID1" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="ConcernDate" HeaderText="Concern Date" SortExpression="ConcernDate" />
                <asp:BoundField DataField="ConcernReasonType" HeaderText="Concern Reason" SortExpression="ConcernReasonType" />
                <asp:BoundField DataField="ConcernDetails" HeaderText="Concern Details" SortExpression="ConcernDetails" />
                <asp:BoundField DataField="ContactMethodType" HeaderText="Contact Method" SortExpression="ContactMethodType" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="EmployeeFirstName" HeaderText="Employee First Name" SortExpression="EmployeeFirstName" />
                <asp:BoundField DataField="EmployeeLastName" HeaderText="Employee Last Name" SortExpression="EmployeeLastName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT * FROM [Action] WHERE ([ConcernID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ConcernID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ActionID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="ActionTaken" HeaderText="Action Taken" SortExpression="ActionTaken" />
                <asp:CheckBoxField DataField="isResolutionAction" HeaderText="Resolving Action?" SortExpression="isResolutionAction" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
        </asp:GridView>
        <br />
            <a href="UpdateConcern.aspx">Update a Previous Concern</a><br />
            <a href="CreateConcern.aspx">Create a New Concern</a><br />
             <a href="Default.aspx">Return to Home Page</a>
    </div>
    </form>
</body>
</html>
