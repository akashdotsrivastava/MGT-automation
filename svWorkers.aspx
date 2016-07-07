<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svWorkers.aspx.cs" Inherits="svWorkers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-primary text-center">
        WORKERS
    </div>
    <div class="row text-right" style="margin-right:100px;"><a href="svHome.aspx">BACK</a></div>
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <asp:Table runat="server" ID="twork" CssClass="table table-responsive table-hover">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell BorderWidth="1">WORKER NAME</asp:TableHeaderCell>
                    <asp:TableHeaderCell BorderWidth="1">GROUP LEADER</asp:TableHeaderCell>
                    <asp:TableHeaderCell BorderWidth="1">JOIN DATE</asp:TableHeaderCell>
                    <asp:TableHeaderCell BorderWidth="1">DETAILS</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <div class="col-lg-3"></div>
        <asp:SqlDataSource ID="sdcjob" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([over] = @over)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="over" Type="Int32"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdcwork" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [worker]"></asp:SqlDataSource>

    </div>
</asp:Content>

