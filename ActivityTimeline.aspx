<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="ActivityTimeline.aspx.cs" Inherits="ActivityTimeline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row text-right" style="margin-right: 100px;"><a href="svAssembly.aspx">BACK</a></div>
    <br />
    Select Job ID(will later be changed to something else)
    <asp:DropDownList ID="DropDownListRunningJobs" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRunningJobs" DataTextField="jobID" DataValueField="jobID" OnSelectedIndexChanged="DropDownListRunningJobs_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRunningJobs" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [job] WHERE ([enddate] IS NULL)"></asp:SqlDataSource>
    <br />
    <asp:Table runat="server" ID="TableStatus" CssClass="table">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Operation</asp:TableHeaderCell>
            <asp:TableHeaderCell>Duration</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>

