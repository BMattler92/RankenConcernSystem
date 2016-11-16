<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="CreateConcern.aspx.cs" Inherits="CreateConcern" %>

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
    
        <asp:SqlDataSource ID="ContactDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT [ContactMethodID], [ContactMethodType] FROM [ContactMethod]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="RelationshipDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT [RelationshipID], [RelationshipType] FROM [Relationship]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ConcernReasonDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT [ConcernReasonID], [ConcernReasonType] FROM [ConcernReason]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="EmployeeDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="Select (EmployeeFirstName + ' ' + EmployeeLastName) AS EmployeeName, EmployeeID FROM Employee"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PersonDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT (FirstName + ' ' + LastName) AS FullName, PersonID FROM Person"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ConcernDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConcernReportConnectionString(server) %>" ProviderName="<%$ ConnectionStrings:ConcernReportConnectionString(server).ProviderName %>" SelectCommand="SELECT (ConcernReason.ConcernReasonType + ' ' + CONVERT(NVARCHAR(23), ConcernDate, 121)) AS ConcernOverview, ConcernID FROM Concern
JOIN ConcernReason ON Concern.ConcernReasonID = ConcernReason.ConcernReasonID"></asp:SqlDataSource>
        First Name
        <asp:TextBox ID="tbfname" runat="server"></asp:TextBox>
        <br />
        Last Name
        <asp:TextBox ID="tblname" runat="server"></asp:TextBox>
        <br />
        Phone
        <asp:TextBox ID="tbphone" runat="server" ></asp:TextBox>
        <br />
        Email
        <asp:TextBox ID="tbemail" runat="server" ></asp:TextBox>
        <br />
        Relationship
        <asp:DropDownList ID="ddlrelationship" runat="server" DataSourceID="RelationshipDatasource" DataTextField="RelationshipType" DataValueField="RelationshipID">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnsubmitperson" runat="server" OnClick="btnsubmitperson_Click" Text="Submit" />
        <br />
        <asp:Label ID="lblperson" runat="server"></asp:Label>
        <br />
        <br />
        Person&#39;s Name
        <asp:DropDownList ID="ddlperson" runat="server" DataSourceID="PersonDatasource" DataTextField="FullName" DataValueField="PersonID">
        </asp:DropDownList>
        <br />
        Contact Method <asp:DropDownList ID="ddlcontactmethod" runat="server" DataSourceID="ContactDatasource" DataTextField="ContactMethodType" DataValueField="ContactMethodID">
        </asp:DropDownList>
        <br />
        Concern Reason <asp:DropDownList ID="ddlconcernreason" runat="server" DataSourceID="ConcernReasonDatasource" DataTextField="ConcernReasonType" DataValueField="ConcernReasonID">
        </asp:DropDownList>
        <br />
        Concern Details
        <asp:TextBox ID="tbdetails" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        Concern Date
        <asp:TextBox ID="tbconcerndate" runat="server" ></asp:TextBox>
        <br />
        Employee Name
        <asp:DropDownList ID="ddlemployee" runat="server" DataSourceID="EmployeeDatasource" DataTextField="EmployeeName" DataValueField="EmployeeID">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnsubmitconcern" runat="server" OnClick="btnsubmitconcern_Click" Text="Submit" />
        <br />
        <asp:Label ID="lblconcern" runat="server"></asp:Label>
        <br />
        <br />
        Concern Reason
        <asp:DropDownList ID="ddlconcern" runat="server" DataSourceID="ConcernDatasource" DataTextField="ConcernOverview" DataValueField="ConcernID">
        </asp:DropDownList>
        <br />
        Employee Name
        <asp:DropDownList ID="ddlemployee0" runat="server" DataSourceID="EmployeeDatasource" DataTextField="EmployeeName" DataValueField="EmployeeID">
        </asp:DropDownList>
        <br />
        Action Taken <asp:TextBox ID="tbaction" runat="server"></asp:TextBox>
        <br />
        Resolution Action
        <asp:CheckBox ID="cbresolutionaction" runat="server" />
        <br />
        Action Date
        <asp:TextBox ID="tbactiondate" runat="server" ></asp:TextBox>
        <br />
        <asp:Button ID="btnsubmitaction" runat="server" OnClick="btnsubmitaction_Click" Text="Submit" />
    
        <br />
        <asp:Label ID="lblaction" runat="server"></asp:Label>
        <br />
    <br />
        <a href="ViewConcern.aspx">View Concerns</a><br />
        <a href ="UpdateConcern.aspx">Update Concerns</a><br />
        <a href="Default.aspx">Return to Home Page</a>
    </div>
    </form>
</body>
</html>
