<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="assembly.aspx.cs" Inherits="INPUT_assembly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-right" style="margin-right:100px;"><asp:LinkButton ID="lbiplg" runat="server" Text="LOG OUT" OnClick="lbiplg_Click" ></asp:LinkButton></div>
    
    <div class="row">
        <div class="col-lg-12" style="height:200px;"></div>
    </div>

    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-3">
            <asp:Button CssClass="btn btn-info btn-lg btn-primary btn-block" Text="C 27" ID="c27" runat="server" OnClick="c27_Click" />
        </div>
        <div class="col-lg-3">
            <asp:Button CssClass="btn btn-info btn-lg btn-primary btn-block" Text="C 28" ID="c28" runat="server" OnClick="c28_Click" />
            </div>
        <div class="col-lg-3"></div>

    </div>

</asp:Content>

