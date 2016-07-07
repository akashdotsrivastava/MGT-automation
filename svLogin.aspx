<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svLogin.aspx.cs" Inherits="svLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid" style="font-family:Verdana;">
        <div class="row text-center text-primary">
            <h3 >LOGIN</h3>
        </div>
    <div class="row text-right" style="margin-right:100px;"><a href="Default.aspx">BACK</a></div>
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-2">
                <asp:Label ID ="un" runat="server" Text="Username" CssClass="text-center"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="tun" runat="server" BackColor="Black" ForeColor="White"></asp:TextBox>
            </div>
                </div>
                <div class="row">
            <div class="col-lg-2">
                <asp:Label ID ="pw" runat="server" Text="Password" CssClass="text-center"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="tpw" runat="server" TextMode="Password" BackColor="Black" ForeColor="White"></asp:TextBox>           
            </div>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <br />
        <div class="row">
            <asp:Button runat="server" class="" ID="bsub" OnClick="bsub_Click" Text="LOG IN" CssClass="btn center-block btn-lg btn-primary" ></asp:Button>    
        </div>
    </div>
    <asp:SqlDataSource runat="server" ID="sdcsv" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [statsviewer]" ></asp:SqlDataSource>
</asp:Content>

