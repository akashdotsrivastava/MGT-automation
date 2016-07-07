<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="job.aspx.cs" Inherits="job" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h4>
            <asp:Label CssClass="col-lg-2 col-md-2 col-sm-2 text-right" ID="admin" runat="server" />
        </h4>
        <div class="pull-right">
            <h4><a href="adminHOME.aspx">Back</a></h4>
        </div>
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">JOBS</h4>
    </div>
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <div class="panel panel-default">
                <div class=" panel-heading">
                    <div class=" panel-title text-center">Add New JOB</div>
                </div>
                <div class="panel-body">
                    <asp:Label Text="Machine Name" ID="LabelMachineID" CssClass="label label-info" runat="server" />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceMachineID" DataTextField="machineID" DataValueField="machineID" CssClass="btn form-control breadcrumb"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceMachineID" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [machine] WHERE (w_status=1) AND (a_status=0)"></asp:SqlDataSource>
                    <asp:Label Text="Customer" ID="LabelCustomer" CssClass="label label-info" runat="server" />
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceCustomerID" DataTextField="custName" DataValueField="custID" CssClass="btn form-control breadcrumb"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCustomerID" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label Text="Group Leader" ID="LabelGroupLeader" CssClass="label label-info" runat="server" />
                            <asp:DropDownList ID="ddlGroupLeader" AutoPostBack="True" runat="server" DataSourceID="SqlDataSourceGLeader" DataTextField="groupLeader" DataValueField="workerID" CssClass="btn form-control breadcrumb"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceGLeader" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT workerID, workerName, groupLeader, busy, joindate FROM worker WHERE (groupLeader = workerName)"></asp:SqlDataSource>
                            <asp:Label Text="Employee Name" ID="LabelWorkerName" CssClass="label label-info" runat="server" />
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceWorker" DataTextField="workerName" DataValueField="workerID" CssClass="btn form-control breadcrumb"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceWorker" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT workerID, workerName, groupLeader, busy, joindate FROM worker WHERE workerName &lt;&gt; groupLeader AND (groupLeader IN (SELECT workerName FROM worker AS worker_1 WHERE (workerID = @groupLeader)))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlGroupLeader" Name="groupLeader" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlGroupLeader" Name="workerName" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Label ID="startdate" runat="server" Text="Choose Start Date" CssClass="label label-info"></asp:Label>
                    <asp:TextBox ID="TextBoxSD" runat="server" CssClass="form-control panel-group"></asp:TextBox>
                        <asp:CalendarExtender
                            ID="TextBoxHD_CalendarExtender"
                            runat="server"
                            Enabled="True" 
                            FirstDayOfWeek="Sunday"
                            PopupButtonID="TextBoxSD"
                            Format="dd-MM-yyyy"
                            TargetControlID="TextBoxSD"
                            PopupPosition="Right"
                            Animated="true">
                        </asp:CalendarExtender>

                 
                </div>
                <div class="panel-footer">
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-block btn-success" OnClick="Button1_Click" />
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-1" style="overflow-y:scroll;height:400px;">
            <asp:GridView ID="GridView1"
                CssClass="table table-responsive table-hover col-lg-6 col-md-6"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceDataDisplay" AutoGenerateDeleteButton="true" DataKeyNames="jobID">
                <Columns>
                    <asp:BoundField DataField="jobID" HeaderText="Job" SortExpression="jobID" />
                    <asp:BoundField DataField="machineID" HeaderText="MachineID" SortExpression="machineID" />
                    <asp:BoundField DataField="custName" HeaderText="Customer" SortExpression="custName" />
                    <asp:BoundField DataField="startdate" HeaderText="Start Date" SortExpression="startdate" />
                    <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate" />
                    
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDataDisplay"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:automationConnectionString %>"
                SelectCommand="SELECT 
                                    job.jobID,
                                    job.machineID,
                                	customer.custName,
                                	job.startdate, 
                                	job.enddate, 
                                	worker.groupleader,
                                	job.worker2ID,
                                	customer.custName,
                                    machine.machineID,
                                    machine.a_status
                               FROM
                                	job,
                                	customer, 
                                	worker,
                                    machine
                               WHERE
                                	job.customerID=customer.custID 
                                	AND job.groupLeaderID=worker.workerID
                                    AND machine.machineID=job.machineID"
                UpdateCommand="UPDATE
                                    job,
                                	customer, 
                                	worker
                               SET
                                    job.machineID,
                                	customer.custName,
                                	job.startdate, 
                                	job.enddate, 
                                	worker.groupleader,
                                	job.worker2ID,
                                	customer.custName
                               WHERE
                                	job.customerID=customer.custID 
                                	AND job.groupLeaderID=worker.workerID"
                DeleteCommand="
                                 DELETE FROM job where jobID=@jobID"
                
                >
                <DeleteParameters>
                    <asp:Parameter Name="jobID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourcemachine" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [machine] WHERE [machineID] = @machineID" InsertCommand="INSERT INTO [machine] ([machineID], [a_status]) VALUES (@machineID, @a_status)" SelectCommand="SELECT [machineID], [a_status] FROM [machine]" UpdateCommand="UPDATE [machine] SET [a_status] = @a_status WHERE [machineID] = @machineID">
        <DeleteParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="machineID" Type="String"></asp:Parameter>
            <asp:Parameter Name="a_status" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="a_status" Type="Int32" DefaultValue="1"></asp:Parameter>
            <asp:ControlParameter ControlID="DropDownList1" Name="machineID" PropertyName="SelectedValue" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdcj" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([over] = @over)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="over" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcw" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [workerID], [busy] FROM [worker]" DeleteCommand="DELETE FROM [worker] WHERE [workerID] = @workerID" InsertCommand="INSERT INTO [worker] ([busy]) VALUES (@busy)" UpdateCommand="UPDATE [worker] SET [busy] = @busy WHERE [workerID] = @workerID">
        <DeleteParameters>
            <asp:Parameter Name="workerID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="busy" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="busy" Type="Boolean" DefaultValue="True"></asp:Parameter>
            <asp:ControlParameter ControlID="h" DefaultValue="" Name="workerID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="h" runat="server" />

    <asp:SqlDataSource ID="sdcp" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [phase] ORDER BY [phaseORDER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="selectcurrentjob" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [jobID], [machineID], [startdate] FROM [job] WHERE ([machineID] = @machineID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="machineID" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdjobphase" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [job-phases] WHERE [Id] = @Id" InsertCommand="INSERT INTO [job-phases] ([job], [phase]) VALUES (@job, @phase)" SelectCommand="SELECT * FROM [job-phases]" UpdateCommand="UPDATE [job-phases] SET [job] = @job, [phase] = @phase WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="currjob" Name="job" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="checkphase" Name="phase" PropertyName="Value" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="job" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="phase" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="currjob" runat="server"/>
    <asp:HiddenField ID="checkphase" runat="server" />

    <asp:SqlDataSource ID="newsdsmac" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID], [mactype] FROM [machine] WHERE ([machineID] = @machineID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="machineID" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="newsdsmactype" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine-type] WHERE ([type] = @type)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hh1" PropertyName="Value" Name="type" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hh1" runat="server" />
    <!--UPDATE APRIL -->
    <asp:HiddenField ID="x1" runat="server" />
    <asp:HiddenField ID="x2" runat="server" />
    <asp:HiddenField ID="x3" runat="server" />
    <asp:SqlDataSource ID="sdsplan" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [job], [phase] FROM [plan]" DeleteCommand="DELETE FROM [plan] WHERE [job] = @job AND [phase] = @phase" InsertCommand="INSERT INTO [plan] ([job], [phase]) VALUES (@job, @phase)">
        <DeleteParameters>
            <asp:Parameter Name="job" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="phase" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="x1" Name="job" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="x2" Name="phase" PropertyName="Value" Type="Int32" />

        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsplan2" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan] WHERE (([job] = @job) AND ([phase] = @phase))" DeleteCommand="DELETE FROM [plan] WHERE [job] = @job AND [phase] = @phase" InsertCommand="INSERT INTO [plan] ([job], [phase], [date]) VALUES (@job, @phase, @date)" UpdateCommand="UPDATE [plan] SET [date] = @date WHERE [job] = @job AND [phase] = @phase">
        <DeleteParameters>
            <asp:Parameter Name="job" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="phase" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="job" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="phase" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="date" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="x1" PropertyName="Value" Name="job" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="x2" PropertyName="Value" Name="phase" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="x3" Name="date" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="x1" Name="job" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="x2" Name="phase" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
