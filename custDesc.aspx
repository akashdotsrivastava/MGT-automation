<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="custDesc.aspx.cs" Inherits="custDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center"><asp:Label ID="cu" runat="server"></asp:Label></div>
    <div class="row text-right" style="margin-right:100px;"><a href="svCustomer.aspx">BACK</a></div>
    <div class="row">
        <div class="col-lg-6 text-center">JOINED ON : <asp:Label ID="jo" runat="server"></asp:Label></div>
        <div class="col-lg-6 text-center">NO. OF JOBS : <asp:Label ID="noj" runat="server"></asp:Label></div>
        
    </div>
    <br />
    
    <div class="row text-center">CUSTOMER HISTORY</div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">'
            <asp:Table ID="tcd" runat="server" CssClass="table table-hover table-responsive">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell BorderWidth="1">JOB</asp:TableHeaderCell>
                    <asp:TableHeaderCell BorderWidth="1">COMPLETED ON</asp:TableHeaderCell>

                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        <div class="col-lg-4"></div>

    </div>
    <asp:SqlDataSource ID="sdcc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer] WHERE ([custID] = @custID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="cid" Name="custID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcj" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([customerID] = @customerID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="cid" Name="customerID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

