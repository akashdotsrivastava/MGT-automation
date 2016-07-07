<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="adminHOME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h4>
            <asp:Label CssClass="col-lg-2 col-md-2 col-sm-2 text-right" ID="admin" runat="server" />
        </h4>
        <div class="page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="pull-right">
                <h4><a href="default.aspx">Home</a></h4>
            </div>
        </div>
    </div>
    <div class="container col-lg-offset-4">
        <div class="col-lg-4">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading panel-title text-center">
                        <asp:Label ID="adminID" runat="server" Text="Login"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ControlToValidate="textboxADMINID" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label Text="Admin Name" CssClass="label label-info" runat="server" />
                        <asp:TextBox ID="textboxADMINID" runat="server" placeholder="Admin Name" CssClass="form-control panel-group"></asp:TextBox>
                        <asp:Label ID="adminPW" runat="server" Text="ADMIN PASSWORD" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="textboxADMINPW" runat="server" TextMode="Password"  CssClass="form-control panel-group" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="panel-footer">
                        <asp:Button runat="server" ID="adminLOGIN" Text="LOG IN" CssClass="btn btn-block btn-success" OnClick="adminLOGIN_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

