<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svHome.aspx.cs" Inherits="svHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="row text-left text-primary" style="margin-left:20px; font-family:Calibri 100">
        HELLO <asp:Label ID="sv" runat="server" CssClass="text-capitalize"></asp:Label>
    </div>
    <div class="row text-right text-primary">
        <asp:Button runat="server" ID="blo" OnClick="blo_Click" CssClass="btn pull-right btn-danger" Text="LOG OUT" style="margin-right:50px;" />
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-lg-2"></div>

        
        <div class="col-lg-2">
            <asp:Button runat="server" ID="bw" OnClick="bw_Click" Text="WORKERS" CssClass="btn btn-block btn-primary" />

        </div>
        <div class="col-lg-2">
            <asp:Button runat="server" ID="bj" OnClick="bj_Click" Text="JOBS" CssClass="btn btn-block btn-primary" />

        </div>
        <div class="col-lg-2">
            <asp:Button runat="server" ID="bm" OnClick="bm_Click" Text="MACHINES" CssClass="btn btn-block btn-primary" />

        </div>
        <div class="col-lg-2">
            <asp:Button runat="server" ID="bc" OnClick="bc_Click" Text="CUSTOMERS" CssClass="btn btn-block btn-primary" />
        </div>
        <div class="col-lg-2"></div>

    </div>
</asp:Content>

