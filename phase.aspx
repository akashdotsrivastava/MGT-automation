<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="phase.aspx.cs" Inherits="phase" %>

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
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">OPERATIONS</h4>
    </div>
    <div class="container">
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title">ADD NEW OPERATIONS</h5>
                </div>
                <div class="panel-body">
                    <asp:Label ID="pNAME" runat="server" Text="OPERATION NAME" CssClass="label label-info"></asp:Label>
                    <asp:TextBox ID="phasename" runat="server" CssClass="form-control panel-group" placeholder="Phase Name"></asp:TextBox>
                    <asp:Label ID="pORDER" runat="server" Text="OPERATION AC" CssClass="label label-info"></asp:Label>
                    <asp:TextBox ID="phaseorder" runat="server" CssClass="form-control panel-group" placeholder="Phase Order"></asp:TextBox>
                    <asp:Label ID="pDURATION" runat="server" Text="OPERATION DURATION (IN HOURS)" CssClass="label label-info"></asp:Label>
                    <asp:TextBox ID="phaseduration" runat="server" CssClass="form-control panel-group" placeholder="Duration"></asp:TextBox>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="addPHASE" runat="server" OnClick="addPHASE_Click" Text="ADD PHASE" type="submit" CssClass="btn btn-block btn-success" />
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-lg-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title text-center">REMOVE OPERATIONS</h5>
                </div>
                <div class="panel-body pre-scrollable">
                    <asp:Table ID="phasetable" CssClass="table table-hover" runat="server"></asp:Table>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourcePHASES" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [phase] WHERE [phaseID] = @phaseID" InsertCommand="INSERT INTO [phase] ([phaseNAME], [phaseORDER], [phaseDURATION]) VALUES (@phaseNAME, @phaseORDER, @phaseDURATION)" SelectCommand="SELECT [phaseID], [phaseNAME], [phaseORDER], [phaseDURATION] FROM [phase] ORDER BY [phaseORDER]" UpdateCommand="UPDATE [phase] SET [phaseNAME] = @phaseNAME, [phaseORDER] = @phaseORDER, [phaseDURATION] = @phaseDURATION WHERE [phaseID] = @phaseID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="h" Name="phaseID" PropertyName="Value" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="phasename" Name="phaseNAME" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="phaseorder" Name="phaseORDER" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="phaseduration" Name="phaseDURATION" PropertyName="Text" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="phaseNAME" Type="String" />
            <asp:Parameter Name="phaseORDER" Type="Int32" />
            <asp:Parameter Name="phaseDURATION" Type="Double" />
            <asp:Parameter Name="phaseID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="h" runat="server" />
</asp:Content>
