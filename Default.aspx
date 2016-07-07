<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-lg-4" style="margin-top:40px;">
        <asp:Button CssClass="btn btn-primary btn-block" runat="server" ID="admin" Text="ADMIN PORTAL" style="" OnClick="admin_Click" />
    </div>
    <div class="col-lg-4" style="margin-top:40px;">
        <asp:Button CssClass="btn btn-primary btn-block" runat="server" ID="statsviewer" Text="STATS VIEWING INTERFACE" style="" OnClick="statsviewer_Click" />
    </div>
    <div class="col-lg-4" style="margin-top:40px;">
        <asp:Button CssClass="btn btn-primary btn-block" runat="server" ID="input" Text="INPUT MODE" style="" OnClick="input_Click" />
    </div>

</asp:Content>

