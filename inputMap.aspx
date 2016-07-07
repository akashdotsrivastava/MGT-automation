<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="inputMap.aspx.cs" Inherits="inputMap" EnableViewState="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .text-info {
            font: bold;
        }
    </style>
    <script type="text/javascript">
window.onload = function () {
    var div = document.getElementById("dvScroll");
    var div_position = document.getElementById("div_position");
    var position = parseInt('<%=Request.Form["div_position"] %>');
    if (isNaN(position)) {
        position = 0;
    }
    div.scrollTop = position;
    div.onscroll = function () {
        div_position.value = div.scrollTop;
    };
};
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row"></div>
    <div class="row text-right" style="margin-right: 100px;"><a href="assembly.aspx">BACK</a></div>

    <div class="row"></div>
    
    <div class="row">
        <div class="col-lg-4 text-center">
            <h5><b>Machine Name : 
                <asp:LinkButton CssClass="text-info text-primary" ID="machineID" runat="server" CausesValidation="false"></asp:LinkButton></b></h5>
        </div>
        <div class="col-lg-4 text-center">
            <h5><b>Job ID : 
                <asp:LinkButton CssClass="text-info text-primary" ID="jobID" runat="server" CausesValidation="false"></asp:LinkButton></b></h5>
        </div>
        <div class="col-lg-4 text-center">
            <h5><b>Customer : 
                <asp:LinkButton CssClass="text-info text-primary" ID="customer" runat="server" CausesValidation="false"></asp:LinkButton></b>
            </h5>
        </div>
    </div>

    <asp:HiddenField ID="finishtime" runat="server" />
    <br />

    <div class="row">

    

    
    <div class="col-lg-2 text-center">
        <asp:Button CssClass="btn btn-info" ID="addremoveworkers" runat="server" Text="ADD/REMOVE WORKERS" BackColor="Red" CausesValidation="false" OnClick="addremoveworkers_Click" />
    </div>
    <div class="col-lg-2">
        <asp:Button CssClass="btn btn-info" ID="btnprogress" runat="server" Text="PROGRESS" OnClick="btnprogress_Click" CausesValidation="false" />
    </div>
        <div class="col-lg-2">
            <asp:CheckBox ID="cbfin" runat="server" Text="FINISH THIS JOB" CssClass="form-control" AutoPostBack="true" OnCheckedChanged="cbfin_CheckedChanged" Checked="false" />
        </div>
    <div class="col-lg-2">
        <asp:Button CssClass="btn btn-info" ID="btnfinish" runat="server" Text="FINISH JOB" OnClick="btnfinish_Click" CausesValidation="false" Enabled="false" />
    </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-2">
            <asp:LinkButton CssClass="btn btn-info" CausesValidation="false" ID="btngoplan" BackColor="Green" runat="server" Text="GO TO PLANNING" OnClick="btngoplan_Click" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-1 text-info text-right">INPUT</div>
        <div class="col-lg-2">
            <asp:Label ID="lblop" runat="server" Text="SELECT OPERATION" CssClass="label label-info" ></asp:Label>
            <asp:DropDownList ID="ddlop" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <div class="row">
                <div class="col-lg-9">
                    <asp:Label ID="lbldt" runat="server" Text="SELECT DATE" CssClass="label label-info"></asp:Label>
            <asp:TextBox ID="tbdt" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:CalendarExtender ID="cddt" runat="server" TargetControlID="tbdt" PopupButtonID="tbdt" PopupPosition="Right" Animated="true" ></asp:CalendarExtender>
                </div>
                <div class="col-lg-3"></div>
            <asp:RequiredFieldValidator ID="rqdt" runat="server" ControlToValidate="tbdt" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>

            </div>
            
        </div>
        <div class="col-lg-1">
            <asp:Label ID="lblhr" runat="server" Text="HOURS" CssClass="label label-info"></asp:Label>
            <asp:DropDownList ID="ddlhr" runat="server" CssClass="form-control" DataSourceID="sdshr" DataTextField="hr" DataValueField="hr">
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="lblst" runat="server" Text="SET STATUS" CssClass="label label-info"></asp:Label>
            <asp:DropDownList ID="ddlst" runat="server" CssClass="form-control" DataSourceID="sdsst" DataTextField="stat" DataValueField="val">
                
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="lblco" runat="server" Text="COMMENT" CssClass="label label-info"></asp:Label>
            <asp:DropDownList ID="ddlco" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceCauseOfDelay" DataTextField="cod" DataValueField="Id">
            </asp:DropDownList>
        </div>
        <div class="col-lg-2 center-block">
            <asp:Button runat="server" ID="btnadd" OnClick="btnadd_Click" Text="ADD" CssClass="btn btn-info" />
        </div>

    </div>
    <br />
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10" style="overflow-y:scroll;height:300px;">
            <asp:Table runat="server" ID="tblinput" CssClass="table table-responsive table-hover" >
            <asp:TableHeaderRow>
                <asp:TableHeaderCell Text="OPERATION"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="DATE"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="HOURS"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="STATUS"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="COMMENT"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="REMOVE"></asp:TableHeaderCell>

            </asp:TableHeaderRow>
        </asp:Table>
        </div>
        <div class="col-lg-2"></div>

    </div>
    <asp:SqlDataSource ID="SqlDataSourcemachine" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT [machineID], [locationID] FROM [machine] WHERE ([machineID] = @machineID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="machineID" QueryStringField="mid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcejob" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [job] WHERE [jobID] = @jobID" InsertCommand="INSERT INTO [job] ([machineID], [customerID], [startdate], [enddate], [groupleaderID], [worker2ID], [currentPhaseID], [causeOfDelayID], [over]) VALUES (@machineID, @customerID, @startdate, @enddate, @groupleaderID, @worker2ID, @currentPhaseID, @causeOfDelayID, @over)" SelectCommand="SELECT * FROM [job] WHERE (([over] = @over) AND ([machineID] = @machineID))" UpdateCommand="UPDATE [job] SET [machineID] = @machineID, [customerID] = @customerID, [startdate] = @startdate, [enddate] = @enddate, [groupleaderID] = @groupleaderID, [worker2ID] = @worker2ID, [currentPhaseID] = @currentPhaseID, [causeOfDelayID] = @causeOfDelayID, [over] = @over WHERE [jobID] = @jobID">
        <DeleteParameters>
            <asp:Parameter Name="jobID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
            <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="startdate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="enddate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="groupleaderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="worker2ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="currentPhaseID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="causeOfDelayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="over" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="over" Type="Int32"></asp:Parameter>
            <asp:QueryStringParameter QueryStringField="mid" Name="machineID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
            <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="startdate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="enddate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="groupleaderID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="worker2ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="currentPhaseID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="causeOfDelayID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="over" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="jobID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcecustomer" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourcephasess" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [phase] ORDER BY [phaseORDER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcephases" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job-phases] WHERE ([job] = @job)">
        <SelectParameters>
            <asp:ControlParameter ControlID="jid" PropertyName="Value" Name="job" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField runat="server" ID="h" />
    <asp:HiddenField runat="server" ID="hh" />
    <asp:SqlDataSource runat="server" ID="sdj2" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [job] WHERE [jobID] = @jobID" InsertCommand="INSERT INTO [job] ([currentPhaseID]) VALUES (@currentPhaseID)" SelectCommand="SELECT [jobID], [currentPhaseID] FROM [job] WHERE ([jobID] = @jobID)" UpdateCommand="UPDATE [job] SET [currentPhaseID] = @currentPhaseID WHERE [jobID] = @jobID">
        <DeleteParameters>
            <asp:Parameter Name="jobID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="currentPhaseID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="jobID" Name="jobID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hh" Name="currentPhaseID" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="h2" Name="jobID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="h2" runat="server" />
    <asp:SqlDataSource ID="sdj3" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [job] WHERE [jobID] = @jobID" InsertCommand="INSERT INTO [job] ([over], [enddate]) VALUES (@over, @enddate)" SelectCommand="SELECT [jobID], [over], [enddate] FROM [job] WHERE ([jobID] = @jobID)" UpdateCommand="UPDATE [job] SET [over] = @over, [enddate] = @enddate WHERE [jobID] = @jobID">
        <DeleteParameters>
            <asp:Parameter Name="jobID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="over" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="enddate" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="h2" PropertyName="Value" Name="jobID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="over" Type="Int32" DefaultValue="1"></asp:Parameter>
            <asp:ControlParameter ControlID="h5" DefaultValue="" Name="enddate" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="h2" Name="jobID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField runat="server" ID="h5" />
    <asp:SqlDataSource runat="server" ID="sdcm" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [machine] WHERE [machineID] = @machineID" InsertCommand="INSERT INTO [machine] ([machineID], [a_status]) VALUES (@machineID, @a_status)" SelectCommand="SELECT [machineID], [a_status] FROM [machine] WHERE ([machineID] = @machineID)" UpdateCommand="UPDATE [machine] SET [a_status] = @a_status WHERE [machineID] = @machineID">
        <DeleteParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
            <asp:Parameter Name="a_status" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="mid" Name="machineID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="a_status" Type="Int32" DefaultValue="0"></asp:Parameter>
            <asp:QueryStringParameter DefaultValue="" Name="machineID" QueryStringField="mid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:HiddenField ID="jid" runat="server" />
    <asp:HiddenField ID="phaseduration" runat="server" />
    <asp:SqlDataSource ID="sdh" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [holiday] WHERE (([holidayDATE] >= @holidayDATE) AND ([holidayDATE] = @holidayDATE2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="init" PropertyName="Value" DbType="Date" Name="holidayDATE"></asp:ControlParameter>
            <asp:ControlParameter ControlID="end" PropertyName="Value" DbType="Date" Name="holidayDATE2"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="init" runat="server" />
    <asp:HiddenField ID="end" runat="server" />
    <asp:HiddenField ID="delay" runat="server" />
    <asp:HiddenField ID="dtn" runat="server" />
    <asp:HiddenField ID="cp" runat="server" />
    <asp:TextBox ID="hiddentextbox" runat="server" Visible="false"></asp:TextBox>

    <asp:SqlDataSource ID="sdcodchange" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [jobID], [causeOfDelayID] FROM [job] WHERE ([jobID] = @jobID)" DeleteCommand="DELETE FROM [job] WHERE [jobID] = @jobID" InsertCommand="INSERT INTO [job] ([causeOfDelayID]) VALUES (@causeOfDelayID)" UpdateCommand="UPDATE [job] SET [causeOfDelayID] = @causeOfDelayID WHERE [jobID] = @jobID">
        <DeleteParameters>
            <asp:Parameter Name="jobID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="causeOfDelayID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="jid" PropertyName="Value" Name="jobID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="changedcod" Name="causeOfDelayID" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="jid" Name="jobID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="changedcod" runat="server" />

    <asp:SqlDataSource ID="sdcmaconhol" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [holiday-running-machine] WHERE (([holiday] >= @holiday) AND ([holiday] <= @holiday2) AND ([machine] = @machine))">
        <SelectParameters>
            <asp:ControlParameter ControlID="init" PropertyName="Value" Name="holiday" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="end" PropertyName="Value" Name="holiday2" Type="String"></asp:ControlParameter>
            <asp:QueryStringParameter QueryStringField="mid" Name="machine" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>


    <!-- UPDATE MARCH -->
    
        <asp:SqlDataSource ID="SqlDataSourceCauseOfDelay" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [causeofdelay]"></asp:SqlDataSource>
    <asp:Label ID="hiddlabel" runat="server"></asp:Label>
   
    <!-- UPDATE APRIL -->
    <asp:SqlDataSource ID="sdsplantoactual" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan],[phase] WHERE ([job] = @job) AND ([phase]=[phaseORDER]) ORDER BY [phase]">
        <SelectParameters>
            <asp:ControlParameter ControlID="jid" PropertyName="Value" Name="job" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsff" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [finishedfinal] WHERE [Id] = @Id" InsertCommand="INSERT INTO [finishedfinal] ([job], [phase], [date], [hours], [status], [comment]) VALUES (@job, @phase, @date, @hours, @status, @comment)" SelectCommand="SELECT * FROM [finishedfinal] WHERE ([job] = @job) ORDER BY [phase], [date]" UpdateCommand="UPDATE [finishedfinal] SET [job] = @job, [phase] = @phase, [date] = @date, [hours] = @hours, [status] = @status, [comment] = @comment WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="jid" Name="job" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="ddlop" Name="phase" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="tbdt" Name="date" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlhr" Name="hours" PropertyName="SelectedValue" Type="Double" />
            <asp:ControlParameter ControlID="ddlst" Name="status" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlco" Name="comment" PropertyName="SelectedValue" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="jid" PropertyName="Value" Name="job" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="job" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="phase" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="date" Type="String"></asp:Parameter>
            <asp:Parameter Name="hours" Type="Double"></asp:Parameter>
            <asp:Parameter Name="status" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="comment" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdshr" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [hour]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsst" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [status] ORDER BY [val] DESC"></asp:SqlDataSource>
</asp:Content>

