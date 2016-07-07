<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="macDesc.aspx.cs" Inherits="macDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center">MACHINE ID : <asp:Label runat="server" ID="mid"></asp:Label></div>
    <div class="row text-right" style="margin-right:100px;"><a href="svMachines.aspx">BACK</a></div>
    <div class="row">
        <div class="col-lg-3 text-center"></div>

        
        <div class="col-lg-3 text-center">
            ASSEMBLY : <asp:LinkButton ID="aa" runat="server"></asp:LinkButton>
        </div>
        <div class="col-lg-3 text-center">
            ADDED ON : <asp:Label ID="ado" runat="server"></asp:Label>
        </div>
        <div class="col-lg-3 text-center">
        </div>
        
    </div>
    <br />
    <br />
    <div class="text-center text-primary">MACHINE HISTORY</div>
    <br />
    <div class="row">
<div class="col-lg-6 col-lg-offset-3">
    <asp:Table runat="server" ID="tmach" CssClass="table table-hover table-responsive">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell BorderWidth="1">JOB</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">ADDED ON</asp:TableHeaderCell>
            <asp:TableHeaderCell BorderWidth="1">ENDED ON</asp:TableHeaderCell>
            
        </asp:TableHeaderRow>
    </asp:Table>
    </div>
        <div class="col-lg-3"></div>
        </div>
    <asp:SqlDataSource ID="sdcjobs" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([machineID] = @machineID) ORDER BY [startdate] DESC">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="mid" Name="machineID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcm" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine] WHERE ([machineID] = @machineID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="mid" Name="machineID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcl" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>

</asp:Content>

