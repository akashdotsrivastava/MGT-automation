<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="planning.aspx.cs" Inherits="planning" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
    <div class="row center-block text-primary text-center" style="color:green;">PLANNING</div>
    <div class="row text-center">MACHINE NAME : <asp:Label ID="lblmid" runat="server"></asp:Label> <asp:Button ID="adjust" runat="server" Text="ADJUST TO HOLIDAYS" CssClass="btn btn-info" CausesValidation="false" OnClick="adjust_Click" /></div>
    <br />
    <div class="row">
        <div class="col-lg-1">
            <asp:Button ID="gotoprogress" runat="server" CssClass="btn btn-info" Text="PROGRESS" OnClick="gotoprogress_Click" CausesValidation="false" />
        </div>
        <div class="col-lg-1 text-primary text-center">CHANGE PLAN</div>
        <div class="col-lg-2">
            <asp:Label ID="lbop" runat="server" CssClass="label label-info" Text="OPERATION"></asp:Label>
            <asp:DropDownList ID="ddlop" runat="server" CssClass="form-control" DataSourceID="sdsddlop" DataTextField="phaseNAME" DataValueField="phaseORDER"></asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="lbstrt" Text="START" runat="server" CssClass="label label-info" ></asp:Label>
            <asp:TextBox ID="tbstrt" runat="server" CssClass="form-group"></asp:TextBox>
            <asp:CalendarExtender ID="cdstrt" runat="server" PopupButtonID="tbstrt" Animated="true" TargetControlID="tbstrt" PopupPosition="BottomRight"></asp:CalendarExtender>
        <asp:RequiredFieldValidator ID="rq1" runat="server" ControlToValidate="tbstrt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="lbend" Text="END" runat="server" CssClass="label label-info"></asp:Label>
            <asp:TextBox ID="tbend" runat="server" CssClass="form-group"></asp:TextBox>
            <asp:CalendarExtender ID="cdend" runat="server" PopupButtonID="tbend" Animated="true" TargetControlID="tbend" PopupPosition="BottomRight"></asp:CalendarExtender>
        <asp:RequiredFieldValidator ID="rq2" runat="server" ControlToValidate="tbend" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        
        </div>
        <div class="col-lg-1">
            <asp:Button id="addduration" runat="server" CssClass="btn btn-info" OnClick="addduration_Click" Text="ADD DAYS"/>
        </div>
        <div class="col-lg-1">
            <asp:Button ID="resetduration" runat="server" CssClass="btn btn-info" OnClick="resetduration_Click" Text="RESET DAYS" BackColor="Red" />
        </div>
        <div class="col-lg-1">
            <asp:Button ID="gotoinput" runat="server" CssClass="btn btn-info" OnClick="gotoinput_Click" Text="GO TO INPUT" BackColor="Green" CausesValidation="false" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8" style="overflow-y:scroll;height:340px;">
            <asp:Table ID="tblplanning" runat="server" CssClass="table table-responsive table-hover">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell Text="OPERATION"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="DURATION"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="DATE"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="REMOVE"></asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>

    </div>
    <asp:SqlDataSource ID="sdsplan" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan] WHERE ([job] = @job)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsphase" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [phase] ORDER BY [phaseORDER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsddlop" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan],[phase] WHERE ([job] = @job) AND ([phase]=[phaseORDER]) ORDER BY [phase]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsholi" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [holiday]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsmonholi" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [holiday-running-machine] WHERE ([machine] = @machine)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="mid" Name="machine" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

