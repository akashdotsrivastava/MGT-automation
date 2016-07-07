<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="worker.aspx.cs" Inherits="worker2" %>

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
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">WORKERS</h4>
    </div>
    <div class="container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-lg-4 col-md-4">
            <div class="panel panel-default">
                <div class="panel-title panel-heading text-center">
                    New Worker
                </div>
                <div class="panel-body">
                    <asp:Label Text="Name Of Worker" ID="LabelMachineID" CssClass="label label-info" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Name Required" ControlToValidate="TextBox_workername" runat="server" ValidationGroup="NewWorker" />
                    <asp:TextBox ID="TextBox_workername" placeholder="Name Of Worker" CssClass="form-group form-control" runat="server"></asp:TextBox>
                    <div class="panel-control">
                        <asp:Label ID="label_wtype" CssClass="label label-info" runat="server" Text="WORKER TYPE"></asp:Label>
                        <div class="form-control panel-group">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:RadioButton ID="RadioButtonWorker" runat="server" AutoPostBack="True" GroupName="wtype" Text="Worker" OnCheckedChanged="RadioButtonWorker_CheckedChanged" CssClass="panel-group" />
                                    <asp:RadioButton ID="RadioButtonGroupLeader" runat="server" AutoPostBack="True" GroupName="wtype" Text="Group Leader" OnCheckedChanged="RadioButtonGroupLeader_CheckedChanged" CssClass="panel-group" />
                                    <asp:DropDownList ID="DropDownListLeaders" runat="server" DataSourceID="SqlDataSourceGroupLeader" DataTextField="groupLeader" DataValueField="groupLeader" CssClass="panel">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceGroupLeader" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT DISTINCT [groupLeader] FROM [worker]"></asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSourceAddWorker" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" InsertCommand="INSERT INTO [worker] ([workerName], [groupLeader], [busy], [joindate]) VALUES (@workerName, @groupLeader, @busy, @joindate)" SelectCommand="SELECT * FROM [worker]" DeleteCommand="DELETE FROM [worker] WHERE [workerID] = @workerID" UpdateCommand="UPDATE [worker] SET [workerName] = @workerName, [groupLeader] = @groupLeader, [busy] = @busy, [joindate] = @joindate WHERE [workerID] = @workerID">
                        <DeleteParameters>
                            <asp:Parameter Name="workerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox_workername" Name="workerName" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="groupLeader" Type="String" />
                            <asp:Parameter DefaultValue="false" Name="busy" Type="Boolean" />
                            <asp:Parameter DefaultValue="" Name="joindate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="workerName" Type="String" />
                            <asp:Parameter Name="groupLeader" Type="String" />
                            <asp:Parameter Name="busy" Type="Boolean" />
                            <asp:Parameter Name="joindate" Type="DateTime" />
                            <asp:Parameter Name="workerID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnSubmitWORKER" runat="server" Text="ADD" OnClick="btnSubmitWORKER_Click" CssClass="form-control btn btn-block btn-success" />
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-offset-3 col-lg-5">
                    <asp:Panel runat="server" CssClass="panel panel-heading panel-title text-center">
                        Delete Worker
                    </asp:Panel>
                    <div class="row pre-scrollable">
                        <asp:UpdatePanel runat="server" ID="UpdateGrid">
                            <ContentTemplate>
                                <asp:GridView CssClass="table table-responsive table-hover" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="workerID" DataSourceID="SqlDataSourceDisplayWorker">
                                    <Columns>
                                        <asp:BoundField DataField="workerName" HeaderText="Name" SortExpression="workerName" />
                                        <asp:BoundField DataField="groupLeader" HeaderText="Leader" SortExpression="groupLeader" />
                                        <asp:TemplateField HeaderText="Busy" SortExpression="busy">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("busy") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("busy") %>' Enabled="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="joindate" HeaderText="Joindate" SortExpression="joindate" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceDisplayWorker" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" DeleteCommand="DELETE FROM [worker] WHERE [workerID] = @workerID" InsertCommand="INSERT INTO [worker] ([workerName], [groupLeader], [busy], [joindate]) VALUES (@workerName, @groupLeader, @busy, @joindate)" SelectCommand="SELECT * FROM [worker]" UpdateCommand="UPDATE [worker] SET [workerName] = @workerName, [groupLeader] = @groupLeader, [busy] = @busy, [joindate] = @joindate WHERE [workerID] = @workerID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="workerID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="workerName" Type="String" />
                                        <asp:Parameter Name="groupLeader" Type="String" />
                                        <asp:Parameter Name="busy" Type="Boolean" />
                                        <asp:Parameter Name="joindate" Type="DateTime" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="workerName" Type="String" />
                                        <asp:Parameter Name="groupLeader" Type="String" />
                                        <asp:Parameter Name="busy" Type="Boolean" />
                                        <asp:Parameter Name="joindate" Type="DateTime" />
                                        <asp:Parameter Name="workerID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-lg-2"></div>
    </div>
</asp:Content>
