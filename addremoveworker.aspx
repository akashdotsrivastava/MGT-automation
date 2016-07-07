<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="addremoveworker.aspx.cs" Inherits="addremoveworker" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="sc1" runat="server"
        ></asp:ScriptManager>
    <div class="row text-center text-primary text-info" style="font:100">
        ADD     /    REMOVE    WORKERS
    </div>
    <div class="row">
        <div class="col-lg-5"></div>
        <div class="col-lg-2">
            MACHINE NAME: <asp:Label ID="lblmid" runat="server"></asp:Label>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <asp:Button ID="btnback" runat="server" CssClass="btn btn-danger" Text="BACK" OnClick="btnback_Click" />
        </div>

    </div>
    <br />
    <div class="row">
        <div class="col-lg-3 text-center">
            <div class="row text-center">
                ADD A WORKER
            </div>
            <br />
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-7">
                    <div class="row">
                        <asp:Label ID="lblcw" runat="server" CssClass="label label-info" Text="Choose Worker"></asp:Label>
                <asp:DropDownList ID="ddlworkers" runat="server" CssClass="form-control" ></asp:DropDownList>
            </div>
                    <br />
            <div class="row">
                        <asp:Label ID="lblcd" runat="server" CssClass="label label-info" Text="Choose Date"></asp:Label>

                <asp:TextBox ID="tbadddate" runat="server" CssClass="form-control" ></asp:TextBox>
                <asp:CalendarExtender ID="cdadddate" runat="server" Animated="true" Format="dd-MM-yyyy" TargetControlID="tbadddate" PopupButtonID="tbadddate" PopupPosition="BottomRight"></asp:CalendarExtender>
            </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="addworker" runat="server" CssClass="btn btn-info" BackColor="LightGreen" Text="ADD" OnClick="addworker_Click" />
                    </div>

                </div>
            </div>
            
        </div>

        <div class="col-lg-3 text-center">
            <div class="row text-center">
                REMOVE A WORKER
            </div>
            <br />
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-7">
                    <div class="row">
                        <asp:Label ID="lblremw" runat="server" CssClass="label label-info" Text="Choose Worker"></asp:Label>
                <asp:DropDownList ID="ddlremwork" runat="server" CssClass="form-control"></asp:DropDownList>

                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="lblcrdate" runat="server" CssClass="label label-info" Text="Choose Date"></asp:Label>

                <asp:TextBox ID="tbremwo" runat="server" CssClass="form-control" ></asp:TextBox>
                <asp:CalendarExtender ID="cdremwo" runat="server" Animated="true" Format="dd-MM-yyyy" TargetControlID="tbremwo" PopupButtonID="tbremwo" PopupPosition="BottomRight"></asp:CalendarExtender>
            </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="btremworker" runat="server" Text="REMOVE" CssClass="btn btn-danger" OnClick="btremworker_Click" />
                    </div>

                </div>

            </div>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-4 text-center" style="overflow-y:scroll;height:350px;">
            <asp:GridView ID="grdworkers" runat="server" CssClass="table table-hover table-responsive" DataKeyNames="Id" DataSourceID="sdsjobworkers" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="WORKER" DataField="workerName" SortExpression="workerName" />
                    <asp:BoundField HeaderText="DATE" DataField="time" SortExpression="time" />
                    <asp:BoundField HeaderText="STATUS" DataField="status" SortExpression="status" />
                </Columns>
            </asp:GridView>
        </div>

    </div>
    <asp:SqlDataSource ID="sdsjobworkers" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT Id,job,wid,time,status,workerID,workerName FROM [job-worker],[worker] WHERE ([job] = @job) AND (wid=workerID) ORDER BY [time]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsworkers" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [workerID], [workerName] FROM [worker]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsdistinctworkerID" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT distinct wid from [job-worker] where (job=@job)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="wid" runat="server" />
    <asp:SqlDataSource ID="sdsselectfinal" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job-worker] WHERE (([job] = @job) AND ([wid] = @wid))">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
            <asp:ControlParameter ControlID="wid" PropertyName="Value" Name="wid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content> 

