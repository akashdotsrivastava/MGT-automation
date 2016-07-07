<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="machine.aspx.cs" Inherits="machine" %>

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
        <div class="row">
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">MACHINES</h4>
            <div class="pull-left">
                <h4><a href="machinetype.aspx">Add a new machine type</a></h4>
            </div>
            <div class="pull-right">
                <h4><a href="machineslotswap.aspx"> Change Machine Location</a></h4>
            </div>
            </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <!--container starts here-->
                <div class="container">
                    <div class="col-lg-offset-1"></div>
                    <div class="col-lg-5">
                        <div class="row">
                            <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3">
                                <br />
                                <div class="panel-default panel">
                                    <div class="panel-heading">
                                        <center><h3 class="panel-title">Add Machine</h3></center>
                                    </div>
                                    <div class="panel-body">
                                        <fieldset>
                                            <asp:Label ID="lblmtype" runat="server" CssClass="label label-info" Text="Machine Type"></asp:Label>
                                            <asp:DropDownList ID="ddlmtype" runat="server" DataSourceID="sdsmtype" DataTextField="type" DataValueField="type" CssClass="form-control" ></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="Please specify Name" ControlToValidate="TextBox1" runat="server" />
                                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Machine Name" CssClass="form-group form-control">
                                            </asp:TextBox>
                                            <asp:Label Text="Location" CssClass="label label-info" ID="LabelLocation" runat="server" />
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="form-control">
                                                <asp:ListItem Value="c27" Selected="True">C 27</asp:ListItem>
                                                <asp:ListItem Value="c28">C 28</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:Label Text="Slot" CssClass="label label-info" ID="LabelSlot" runat="server" />
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceSlot" DataTextField="slot" DataValueField="slot" CssClass="form-control form-group">
                                            </asp:DropDownList>
                                        </fieldset>
                                    </div>
                                    <div class="panel-footer">
                                        <asp:Button Text="Add Machine" ID="buttonLogin" OnClick="ButtonAdd_Click" CssClass="btn btn-lg btn-success btn-block" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5 pre-scrollable">
                        <asp:SqlDataSource ID="SqlDataSourceSlot" runat="server" ConnectionString="<%$ ConnectionStrings:automationConnectionString %>" SelectCommand="SELECT * FROM [location] WHERE ([assembly] = @assembly) AND ([occ] = 0)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="C27" Name="assembly" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" CssClass="table-responsive table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="machineID" DataSourceID="SqlDataSourceMachine" CellSpacing="5" PageSize="12" AutoGenerateDeleteButton="true">
                            <Columns>
                                <asp:BoundField DataField="machineID" HeaderText="Machine" ReadOnly="True" SortExpression="machineID" />
                                <asp:TemplateField HeaderText="Working" SortExpression="w_status">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("w_status") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Bind("w_status") %>'></asp:Label>
                                        <asp:Button Text="Toggle" ID="ButtonToggleWork" runat="server" CommandName="work" OnClick="ButtonToggleWork_Click" CommandArgument='<%# Bind("machineID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" SortExpression="a_status">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("a_status") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Bind("a_status") %>'></asp:Label>
                                        <asp:Button Text="Toggle" ID="ButtonToggleActive" CommandName="active" runat="server" OnClick="ButtonToggleActive_Click" CommandArgument='<%# Bind("machineID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="locationID" HeaderText="locationID" SortExpression="locationID" />
                            </Columns>
                            <PagerSettings Position="Top" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceMachine" runat="server"
                            ConnectionString="<%$ ConnectionStrings:automationConnectionString %>"
                            DeleteCommand="DELETE FROM [machine] WHERE [machineID] = @machineID"
                            InsertCommand="INSERT INTO [machine] ([machineID], [w_status], [a_status]) VALUES (@machineID, @w_status, @a_status)"
                            SelectCommand="SELECT * FROM [machine]"
                            UpdateCommand="UPDATE [machine] SET [w_status] = @w_status, [a_status] = @a_status WHERE [machineID] = @machineID">
                            <DeleteParameters>
                                <asp:Parameter Name="machineID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="machineID" Type="String" />
                                <asp:Parameter Name="w_status" Type="Int32" />
                                <asp:Parameter Name="a_status" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="w_status" Type="Int32" />
                                <asp:Parameter Name="a_status" Type="Int32" />
                                <asp:Parameter Name="machineID" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="sdsmtype" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine-type]"></asp:SqlDataSource>
</asp:Content>

