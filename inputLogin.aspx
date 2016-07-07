<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="inputLogin.aspx.cs" Inherits="inputLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center">
        <h3>LOGIN: INPUT MODE</h3>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="row text-center">
                LOG IN
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <div class="row text-center">
                <asp:Label ID="lbliid" runat="server" Text="ID" CssClass="label label-info"></asp:Label>
                <asp:TextBox ID="tbid" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <div class="row text-center">
                <asp:Label ID="lblipd" runat="server" Text="Password" CssClass="label label-info"></asp:Label>
                <asp:TextBox ID="tbpw" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
                    <br />
                    <div class="row text-center">
                        <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="btn btn-info" BackColor="Green" OnClick="btnLogin_Click" />
                    </div>
                </div>

            </div>
            
        </div>
        <div class="col-lg-4"></div>

    </div>
    <asp:SqlDataSource ID="sdsadmin" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [admin]"></asp:SqlDataSource>
</asp:Content>

