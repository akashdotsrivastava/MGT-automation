<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svCustomer.aspx.cs" Inherits="svCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-primary text-center">
        CUSTOMERS
    </div>
    <div class="row text-right" style="margin-right:100px;"><a href="svHome.aspx">BACK</a></div>
    <br />
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-5">
            <asp:Table ID="tcust" runat="server" CssClass="table table-hover">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell BorderWidth="1">CUSTOMER</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">JOINING DATE</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">NO. OF JOBS</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">CURRENT JOB(S)</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">DETAILS</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
        </div>
        <div class="col-lg-3"></div>

    </div>
    <asp:SqlDataSource ID="sdcc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer] ORDER BY [joinDate]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcj" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([customerID] = @customerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="h" PropertyName="Value" Name="customerID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="h" runat="server" />
</asp:Content>

