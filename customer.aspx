<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h4>
            <asp:Label CssClass="col-lg-2 col-md-2 col-sm-2 text-right" ID="admin" runat="server" />
        </h4>
        <div class="pull-right">
            <h4>
                <%--<a href="adminHOME.aspx">Back</a>--%>
                <asp:Button Text="Back" ID="ButtonBack" OnClick="ButtonBack_Click" runat="server" />
            </h4>
        </div>
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">CUSTOMERS</h4>
    </div>
    <div class="row">
        <div class="container">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-title text-center">ADD NEW CUSTOMER</h5>
                    </div>
                    <div class="panel-body">
                        <asp:Label ID="customername" runat="server" Text="CUSTOMER NAME" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="custname" placeholder="Customer Name" runat="server" CssClass="form-control panel-group"></asp:TextBox>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btnADD" runat="server" Text="ADD" OnClick="btnADD_Click" CssClass="btn btn-block btn-success" />
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-lg-offset-4">
                <div class="row">
                    <h5 class="text-center modal-header">DELETE CUSTOMERS</h5>
                    <asp:Table runat="server" ID="custtable" CssClass="table table-hover">
                    </asp:Table>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceADDCUST" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [customer] WHERE [custID] = @custID" InsertCommand="INSERT INTO [customer] ([custName]) VALUES (@custName)" SelectCommand="SELECT [custID], [custName] FROM [customer]" UpdateCommand="UPDATE [customer] SET [custName] = @custName WHERE [custID] = @custID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="h1" Name="custID" PropertyName="Value" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="custname" Name="custName" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="custID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="h1" runat="server" />
</asp:Content>

