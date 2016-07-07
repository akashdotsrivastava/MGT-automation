<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="machineslotswap.aspx.cs" Inherits="machineslotswap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center" >        <h4>CHANGE MACHINE LOCATION</h4>
    </div>
    <div class="row">
        <div class="col-lg-10" style="height:100px;" >
            
        </div>
        <div class="col-lg-2" style="height:100px;" >
            <asp:Button ID="btnback" runat="server" Text="BACK" CssClass="btn btn-danger" PostBackUrl="~/machine.aspx" />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-2">
            <asp:Label ID="assembly" CssClass="label label-info" runat="server" Text="ASSEMBLY" ></asp:Label>
            <asp:DropDownList ID="ddlassembly" runat="server" OnSelectedIndexChanged="ddlassembly_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="c27" Value="c27" Selected="True"></asp:ListItem>
                <asp:ListItem Text="c28" Value="c28"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="machine" CssClass="label label-info" runat="server" Text="MACHINE"></asp:Label>
            <asp:DropDownList ID="ddlmac" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlmac_SelectedIndexChanged" ></asp:DropDownList>
        </div>
        <div class="col-lg-3">
            <asp:Label ID="slot" CssClass="label label-info" runat="server" Text="SLOT"></asp:Label>
            <asp:TextBox ID="tbcurrslot" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="chslot" CssClass="label label-info" runat="server" Text="CHANGE SLOT"></asp:Label>
            <asp:DropDownList ID="ddlchslot" runat="server" Width="10"></asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Button ID="btnChange" runat="server" Text="CHANGE" CssClass="btn btn-info" OnClick="btnChange_Click" />
        </div>
        
    </div>
    <asp:SqlDataSource ID="sdc27" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location] WHERE ([assembly] = @assembly)">
        <SelectParameters>
            <asp:Parameter DefaultValue="c27" Name="assembly" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdc28" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location] WHERE ([assembly] = @assembly)">
        <SelectParameters>
            <asp:Parameter DefaultValue="c28" Name="assembly" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="mac" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID], [locationID] FROM [machine]"></asp:SqlDataSource>
</asp:Content>

