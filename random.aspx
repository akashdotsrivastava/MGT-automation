<%@ Page Language="C#" AutoEventWireup="true" CodeFile="random.aspx.cs" Inherits="random" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:DropDownList ID="DropDownListRunningJobs" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRunningJobs" DataTextField="jobID" DataValueField="jobID" OnSelectedIndexChanged="DropDownListRunningJobs_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceRunningJobs" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [job] WHERE ([enddate] IS NULL)"></asp:SqlDataSource>
        <br />
        <asp:table runat="server" ID="TableStatus" CssClass="table">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Operation</asp:TableHeaderCell>
                <asp:TableHeaderCell>Duration</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:table>
    </div>
    </form>
</body>

</html>
