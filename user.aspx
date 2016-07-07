<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
        <h4>
            <asp:Label CssClass="col-lg-2 col-md-2 col-sm-2 text-right" ID="admin" runat="server" />
        </h4>
        <div class="pull-right">
            <h4><a href="adminHOME.aspx">Back</a></h4>
        </div>
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">USERS</h4>
    </div>
    <div class="row">
        <div class="container">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-title text-center">ADD NEW ADMIN</h5>
                    </div>
                    <div class="panel-body">
                        <asp:Label ID="aid" runat="server" Text="ID" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="taid" runat="server" CssClass="form-control panel-group" placeholder="ID"></asp:TextBox>
                        <asp:Label ID="aname" runat="server" Text="NAME" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="taname" runat="server" CssClass="form-control panel-group" placeholder="Name"></asp:TextBox>
                        <asp:Label ID="apw" runat="server" Text="PASSWORD" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="tapw" runat="server" TextMode="Password" CssClass="form-control panel-group" placeholder="Password"></asp:TextBox>
                        <asp:Label ID="adpw" runat="server" Text="SUPER ADMIN PASSWORD" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="tadpw" TextMode="Password" runat="server" CssClass="form-control panel-group" placeholder="Super Admin Password"></asp:TextBox>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="submitADMIN" Text="ADD" runat="server" OnClick="submitADMIN_Click" CssClass="btn btn-success btn-block" />
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-lg-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="text-center panel-title">ADD NEW STATS VIEWER</h5>
                    </div>
                    <div class="panel-body">
                        <asp:Label runat="server" ID="svid" Text="ID" CssClass="label label-info"></asp:Label>
                        <asp:TextBox runat="server" ID="tsvid" CssClass="form-control panel-group" placeholder="ID"></asp:TextBox>
                        <asp:Label runat="server" ID="svpw" Text="PASSWORD" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="tsvpw" runat="server" TextMode="Password" CssClass="form-control panel-group" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="addSV" Text="ADD" runat="server" OnClick="addSV_Click" CssClass="btn btn-success btn-block"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceADMIN" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [admin] WHERE [adminID] = @adminID" InsertCommand="INSERT INTO [admin] ([adminID], [adminPW], [adminNAME]) VALUES (@adminID, @adminPW, @adminNAME)" SelectCommand="SELECT * FROM [admin]" UpdateCommand="UPDATE [admin] SET [adminPW] = @adminPW, [adminNAME] = @adminNAME WHERE [adminID] = @adminID">
        <DeleteParameters>
            <asp:Parameter Name="adminID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="taid" Name="adminID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tapw" Name="adminPW" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="taname" Name="adminNAME" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="adminPW" Type="String" />
            <asp:Parameter Name="adminNAME" Type="String" />
            <asp:Parameter Name="adminID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSV" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [statsviewer] WHERE [svID] = @svID" InsertCommand="INSERT INTO [statsviewer] ([svID], [svPW]) VALUES (@svID, @svPW)" SelectCommand="SELECT * FROM [statsviewer]" UpdateCommand="UPDATE [statsviewer] SET [svPW] = @svPW WHERE [svID] = @svID">
        <DeleteParameters>
            <asp:Parameter Name="svID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="tsvid" Name="svID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tsvpw" Name="svPW" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="svPW" Type="String" />
            <asp:Parameter Name="svID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

