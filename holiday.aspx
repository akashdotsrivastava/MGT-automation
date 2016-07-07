<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="holiday.aspx.cs" Inherits="holiday" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
            <div class="pull-right">
                <asp:Button id="bmoh" runat="server" CssClass="btn btn-info" Text="Running Machines On Holidays" OnClick="bmoh_Click"/>

            </div>
        </div>
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">HOLIDAY</h4>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title text-center">ADD HOLIDAY</div>
                    </div>
                    <div class="panel-body">
                        <asp:Label Text="Holiday Name" ID="LabellHolidayName" CssClass="label label-info" runat="server" />
                        <asp:TextBox ID="TextBoxHN" runat="server" CssClass="form-control panel-group"></asp:TextBox>
                        <asp:Label Text="Holiday Date" ID="LabelHolidayDate" CssClass="label label-info" runat="server" />
                        <asp:TextBox ID="TextBoxHD" runat="server" CssClass="form-control panel-group"></asp:TextBox>
                        <asp:CalendarExtender
                            ID="TextBoxHD_CalendarExtender"
                            runat="server"
                            Enabled="True" 
                            FirstDayOfWeek="Sunday"
                            PopupButtonID="TextBoxHD"
                            Format="dd-MM-yyyy"
                            TargetControlID="TextBoxHD"
                            PopupPosition="Right"
                            Animated="true">
                        </asp:CalendarExtender>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="ButtonH" runat="server" CssClass="btn btn-block btn-success" Text="Add Holiday" OnClick="ButtonH_Click" />
                    </div>
                </div>

                <div class="row">
                    
                    <div class="col-lg-4">ADD SUNDAYS AND SATURDAYS BETWEEN</div>
                    <div class="col-lg-4">
                        <asp:Label ID="sd" runat="server" Text="START" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="tbsd" runat="server" CssClass="form-group"></asp:TextBox>
                        <asp:CalendarExtender ID="cdsd" runat="server" TargetControlID="tbsd" PopupButtonID="tbsd" Animated="true" PopupPosition="Right"></asp:CalendarExtender>
                        <asp:Label ID="ed" runat="server" Text="END" CssClass="label label-info"></asp:Label>
                        <asp:TextBox ID="tbed" runat="server" CssClass="form-group"></asp:TextBox>
                        <asp:CalendarExtender ID="cded" runat="server" TargetControlID="tbed" PopupButtonID="tbed" Animated="true" PopupPosition="Right"></asp:CalendarExtender>
                        <asp:Button id="addsunsat" runat="server" CssClass="btn btn-info" Text="ADD" BackColor="Green" OnClick="addsunsat_Click"/>
                        
                    </div>
                    
                </div>
            </div>
            
            <div class="col-lg-6 col-lg-offset-2" style="overflow-y:scroll;height:400px;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceHoliday">
                            <Columns>
                                <asp:BoundField DataField="holidayNAME" HeaderText="Ocassion" SortExpression="holidayNAME"></asp:BoundField>
                                <asp:BoundField DataField="holidayDATE" HeaderText="Date" SortExpression="holidayDATE"></asp:BoundField>
                                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <%-- <asp:GridView CssClass="table table-hover" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHoliday">
                            <Columns>
                                <asp:BoundField DataField="holidayNAME" HeaderText="Holiday Name" SortExpression="holidayNAME" />
                                <asp:BoundField DataField="holidayDATE" HeaderText="Holiday Date" SortExpression="holidayDATE" />
                                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource
                            ID="SqlDataSourceHoliday"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:automationConnectionString %>"
                            SelectCommand="SELECT [holidayNAME], [holidayDATE] FROM [holiday]"
                            InsertCommand="INSERT INTO [holiday] ([holidayNAME], [holidayDATE]) VALUES (@holidayNAME, @holidayDATE)"
                            DeleteCommand="DELETE FROM [holiday] WHERE [holidayDATE]=@holidayDATE">
                            <InsertParameters>
                                <asp:Parameter Name="holidayNAME" Type="String" />
                                <asp:Parameter DbType="Date" Name="holidayDATE" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:Parameter DbType="Date" Name="holidayDATE" />
                            </DeleteParameters>
                        </asp:SqlDataSource>--%>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceHoliday" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [holiday] WHERE [Id] = @Id" InsertCommand="INSERT INTO [holiday] ([holidayNAME], [holidayDATE]) VALUES (@holidayNAME, @holidayDATE)" SelectCommand="SELECT * FROM [holiday] ORDER BY holidayDATE DESC " UpdateCommand="UPDATE [holiday] SET [holidayNAME] = @holidayNAME, [holidayDATE] = @holidayDATE WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="holidayNAME" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="holidayDATE"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="holidayNAME" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="holidayDATE"></asp:Parameter>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
