<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="jobDesc.aspx.cs" Inherits="jobDesc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center">JOB ID : <asp:Label runat="server" ID="jid"></asp:Label></div>
    <div class="row text-right" style="margin-right:100px;"><a href="svJobs.aspx?fstat=0">BACK</a></div>
    <div class="row">
        <div class="col-lg-1"></div>

        <div class="col-lg-2 text-center">
            MACHINE : <asp:LinkButton ID="m" runat="server"></asp:LinkButton>
        </div>
        <div class="col-lg-2 text-center">
            ASSEMBLY : <asp:LinkButton ID="aa" runat="server"></asp:LinkButton>
        </div>
        <div class="col-lg-3 text-center">
            STARTED ON : <asp:Label ID="s" runat="server"></asp:Label>
        </div>
        <div class="col-lg-3 text-center">
            ENDED ON : <asp:Label ID="en" runat="server"></asp:Label>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <br />
    <br />
    <!--
    <div class="row text-center">
        OVER-ALL DELAY : <asp:Label ID="delay" runat="server"></asp:Label>
    </div>
    <div class="row text-center">
        CAUSE OF DELAY : <asp:Label ID="cdelay" runat="server"></asp:Label>
    </div>-->
    <br />
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3" style="overflow-y:scroll;height:345px;">
            <asp:Table ID="tjd" runat="server" CssClass="table table-hover table-responsive">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell Text="WORK FLOW" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="DATE" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="HOURS" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="STATUS" BorderWidth="1"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="COMMENT" BorderWidth="1"></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow ID="row0">
                    <asp:TableCell Text="JOB ADDED" BorderWidth="1"></asp:TableCell>
                    <asp:TableCell BorderWidth="1"><asp:Label ID="jad" runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell BorderWidth="1"></asp:TableCell>
                    <asp:TableCell BorderWidth="1"></asp:TableCell>
                    <asp:TableCell BorderWidth="1"></asp:TableCell>

                </asp:TableRow>
            </asp:Table>
        </div>
        <div class="col-lg-2"></div>

    </div>
    <div class="row">
        <div class="col-lg-5"></div>
        <div class="col-lg-2">
            <asp:Button ID="expo" runat="server" OnClick="expo_Click" Text="EXPORT TO EXCEL" />
        </div>
    </div>

    <asp:SqlDataSource ID="sdccust" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcjobs" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([jobID] = @jobID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="jobID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sdcmac" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine]">
    </asp:SqlDataSource>
    <asp:HiddenField ID="h1" runat="server" />
    <asp:HiddenField ID="h2" runat="server" />
    <asp:SqlDataSource ID="sdcloc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcfin" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finished] WHERE ([jobID] = @jobID) ORDER BY [timestamp]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="jobID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcphases" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [phase]"></asp:SqlDataSource>


<!--UPDATE-->
    <asp:SqlDataSource ID="sdsnewfin" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finishednew] WHERE ([job] = @job)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdccod" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [causeofdelay]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsfinishedfinal" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finishedfinal] WHERE ([job] = @job) ORDER BY [phase], [date]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsstatus" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [status]"></asp:SqlDataSource>
</asp:Content>

