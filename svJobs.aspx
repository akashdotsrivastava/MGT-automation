<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svJobs.aspx.cs" Inherits="svJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-primary text-center">
        JOBS
    </div>
    <!--<div class="row text-primary text-center">
        <asp:Button ID="pr" Text="PRINT" runat="server" OnClick="pr_Click" />
    </div>-->
    <div class="row text-right" style="margin-right:100px;"><a href="svHome.aspx">BACK</a></div>

    <br />
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-3">
            <asp:Button ID="a0" runat="server" Text="GOING ON" CssClass="btn btn-block btn-primary" OnClick="a0_Click" />
        </div>
        <div class="col-lg-3">
            <asp:Button ID="a1" runat="server" Text="FINISHED" CssClass="btn btn-block btn-primary" OnClick="a1_Click" />

        </div>
        <div class="col-lg-3"></div>

    </div>
    <br />
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-7">
            <asp:Table ID="tjobs" runat="server" CssClass="table table-hover">
                <asp:TableHeaderRow ID="thr">
                    <asp:TableHeaderCell Text="JOB ID" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="MACHINE" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="CUSTOMER" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="START DATE" BorderWidth="1"></asp:TableHeaderCell>
                   
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <div class="col-lg-2"></div>

    </div>
    <asp:SqlDataSource ID="sdccust" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcjobs" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcmac" runat="server"></asp:SqlDataSource>

</asp:Content>

