<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svAssembly.aspx.cs" Inherits="svAssembly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center"><span style="font-family:Calibri;font-size:x-large;">ASSEMBLY</span></div>

    <div class="row text-right" style="margin-right:100px;font-size:x-large;"><a href="svHome.aspx">BACK</a></div>

    <div class="row">
        <div class="col-lg-12" style="height:200px;"></div>
    </div>
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-4">
            <asp:Button CssClass="btn btn-default btn-block" Text="C 27" ID="c27" runat="server" OnClick="c27_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button CssClass="btn btn-default btn-block" Text="C 28" ID="c28" runat="server" OnClick="c28_Click" />
            </div>
        <div class="col-lg-2"></div>

    </div>
    <div class="row" style="margin-top:7px;">
        <div class="col-lg-3"></div>
        <div class="col-lg-2">
            <asp:LinkButton CssClass="btn btn-success btn-block" ID="c27gc" runat="server" PostBackUrl="~/svC27.aspx" Text="GANTT CHART"></asp:LinkButton>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <asp:LinkButton id="c28gc" CssClass="btn btn-success btn-block" runat="server" PostBackUrl="~/svC28.aspx" Text="GANTT CHART"></asp:LinkButton>
        </div>
        <div class="col-lg-3"></div>

    </div>
</asp:Content>

