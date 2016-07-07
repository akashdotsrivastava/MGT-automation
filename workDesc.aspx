<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="workDesc.aspx.cs" Inherits="workDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center row"><asp:Label ID="wl" runat="server"></asp:Label></div>
    <div class="row text-right" style="margin-right:100px;"><a href="svWorkers.aspx">BACK</a></div>
    <div class="row">
        <div class="col-lg-3 text-center">WORKER ID : <asp:Label ID="wid" runat="server"></asp:Label></div>
        <div class="col-lg-3 text-center">GROUP LEADER : <asp:Label ID="gl" runat="server"></asp:Label></div>
        <div class="col-lg-3 text-center">JOINED ON : <asp:Label ID="jo" runat="server"></asp:Label></div>

    </div>
    <br />
    <div class="row text-center">WORKER HISTORY</div>
    <br />
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4" style="overflow-y:scroll;height:300px;" >
        <asp:Table ID="twd" runat="server" CssClass="table table-responsive table-hover">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell BorderWidth="1">MACHINE</asp:TableHeaderCell>
                <asp:TableHeaderCell BorderWidth="1">DATE</asp:TableHeaderCell>
                <asp:TableHeaderCell BorderWidth="1">STATUS</asp:TableHeaderCell>

            </asp:TableHeaderRow>
        </asp:Table>
            </div>
        <div class="col-lg-4"></div>

    </div>
    <div class="row text-center">
    <asp:Button ID="btnExpo" runat="server" Text="EXPORT TO EXCEL" OnClick="btnExpo_Click" />

    </div>
    <asp:SqlDataSource ID="sdcw" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [worker] WHERE ([workerID] = @workerID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="wid" Name="workerID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
    <!--update april-->
    <asp:SqlDataSource ID="sdsjw" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job-worker] WHERE ([wid] = @wid) ORDER BY [time] DESC">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="wid" Name="wid" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsj" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [jobID], [machineID] FROM [job]"></asp:SqlDataSource>
</asp:Content>

