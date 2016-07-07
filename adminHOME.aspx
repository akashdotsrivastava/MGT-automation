<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="adminHOME.aspx.cs" Inherits="adminHOME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-6">
        <h4 style="text-align:left;margin-left:10%;"><asp:Label ID="admin" runat="server" ></asp:Label></h4>

        </div>
        <div class="col-lg-6">
        <h4 style="text-align:right;margin-right:10%;"><asp:Button runat="server" ID="logout" CssClass="btn btn-danger" OnClick="logout_Click" Text="LOG OUT" /></h4>
            
        </div>
        <h4 style="text-align:center">ADMIN HOME</h4>
        <div class=" text-center"><asp:Button ID="trshoot" runat="server" Text="TROUBLESHOOT" OnClick="trshoot_Click" CssClass="btn btn-info" BackColor="LightGreen" /></div>
    </div>
    <div class="row">
        <div class="col-lg-12" style="height:20px;"></div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-left:25%;">
        <asp:Table runat="server" ID="tableADMIN">
            <asp:TableRow>
                <asp:TableCell Width="25%">
                    <asp:Button ID="customer" runat="server" Text="CUSTOMERS" CssClass="btn btn-default" OnClick="customer_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell Width="25%">
                    <asp:Button ID="machine" runat="server" Text="MACHINES" CssClass="btn btn-default" OnClick="machine_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell Width="25%">
                    <asp:Button ID="phase" runat="server" Text="OPERATIONS" CssClass="btn btn-default" OnClick="phase_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell Width="25%">
                    <asp:Button ID="holiday" runat="server" Text="HOLIDAYS" CssClass="btn btn-default" OnClick="holiday_Click" Width="150px" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="worker" runat="server" Text="WORKERS" CssClass="btn btn-default" OnClick="worker_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="job" runat="server" Text="JOBS" CssClass="btn btn-default" OnClick="job_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="causeofdelay" runat="server" Text="CAUSE OF DELAY" CssClass="btn btn-default" OnClick="causeofdelay_Click" Width="150px" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="user" runat="server" Text="USERS" CssClass="btn btn-default" OnClick="user_Click" Width="150px" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
            </div>
    </div>
</asp:Content>

