<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="jobOver.aspx.cs" Inherits="jobOver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row text-center"><h1>JOB <asp:label ID="jo" runat="server"></asp:label> OVER</h1></div>
    <div class="row text-center">
        <a href="assembly.aspx">OKAY</a>
    </div>
    
    <asp:HiddenField ID="h1" runat="server" />
    <asp:HiddenField ID="h2" runat="server" />
    <asp:SqlDataSource ID="remjobwdistinct" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="select distinct wid from [job-worker] where job=@job" >
        <SelectParameters>
            <asp:QueryStringParameter Name="job" QueryStringField="jid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="remfinal" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job-worker] WHERE (([job] = @job) AND ([wid] = @wid))">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
            <asp:ControlParameter ControlID="h1" PropertyName="Value" Name="wid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

