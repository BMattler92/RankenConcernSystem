<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateConcern.aspx.cs" Inherits="UpdateConcern" %>

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
    
        <asp:SqlDataSource ID="EmployeeDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString %>" SelectCommand="Select (EmployeeFirstName + ' ' + EmployeeLastName) AS EmployeeName, EmployeeID FROM Employee"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ConcernDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString %>" SelectCommand="SELECT (ConcernReason.ConcernReasonType + ' ' + CONVERT(NVARCHAR(23), ConcernDate, 121)) AS ConcernOverview, ConcernID FROM Concern
JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID"></asp:SqlDataSource>
        Concern Reason
        <asp:DropDownList ID="ddlconcern" runat="server" DataSourceID="ConcernDatasource" DataTextField="ConcernOverview" DataValueField="ConcernID" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        Employee Name
        <asp:DropDownList ID="ddlemployee" runat="server" DataSourceID="EmployeeDatasource" DataTextField="EmployeeName" DataValueField="EmployeeID">
        </asp:DropDownList>
        <br />
        Action Taken <asp:TextBox ID="tbaction" runat="server"></asp:TextBox>
        <br />
        Resolution Action
        <asp:CheckBox ID="cbresolutionaction" runat="server" />
        <br />
        Action Date
        <asp:TextBox ID="tbactiondate" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnsubmitaction" runat="server" OnClick="btnsubmitaction_Click" Text="Submit" />
        <br />
        <asp:Label ID="lblaction" runat="server"></asp:Label><br />
           <a href="CreateConcern.aspx">Create a New Concern</a><br />
        <a href="ViewConcern.aspx">View All Concerns</a><br />
        <a href="Default.aspx">Return to Home Page</a>
    
    </div>
    </form>
</body>
</html>
