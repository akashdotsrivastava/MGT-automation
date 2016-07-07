<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svMachines.aspx.cs" Inherits="svMachines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-primary text-center">
        MACHINES
    </div>
    <div class="row text-right" style="margin-right:100px;"><a href="svHome.aspx">BACK</a></div>

    <br />
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
    <asp:Table ID="tmac" runat="server" CssClass="table table-hover">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell Text="MACHINE" BorderWidth="1"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="WORKING STATUS" BorderWidth="1"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="ACTIVE STATUS" BorderWidth="1"></asp:TableHeaderCell>
           
            <asp:TableHeaderCell Text="JOB" BorderWidth="1"></asp:TableHeaderCell>
            
            <asp:TableHeaderCell Text="DATE ADDED" BorderWidth="1"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="DETAILS" BorderWidth="1"></asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
        </div>
    <br />
    <asp:SqlDataSource ID="sdcmac" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine] ORDER BY [locationID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcjobs" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcloc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>

</asp:Content>

