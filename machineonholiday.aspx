<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="machineonholiday.aspx.cs" Inherits="machineonholiday" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="row text-primary text-center">
        CHOOSE MACHINES TO RUN ON A HOLIDAY (BEFOREHAND)
    </div>
    <div class="row text-primary text-center">
        <a href="holiday.aspx">BACK</a>
    </div>
    <div class="row">
        <div class="col-lg-6">

            <div class="row">
                <div class="col-lg-6 text-center">
                    Choose a holiday
                </div>
                <div class="col-lg-6">
                    <asp:TextBox runat="server" ID="hid" CssClass="btn breadcrumb form-control"> </asp:TextBox>
                    <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>
                    <asp:CalendarExtender ID="aceh" runat="server" TargetControlID="hid" PopupButtonID="hid" PopupPosition="BottomRight" Format="dd-MM-yyyy"></asp:CalendarExtender>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6  text-center">
                    Choose a machine
                </div>
                <div class="col-lg-6">
                    <asp:DropDownList ID="ddlmach" runat="server" DataSourceID="sdcrunnmach" DataTextField="machineID" DataValueField="machineID" CssClass="btn form-control breadcrumb"></asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="sdcrunnmach" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID] FROM [machine] WHERE ([a_status] = @a_status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="a_status" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="row">
                <div class="col-lg-5"></div>
                <div class="col-lg-2">
                    <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" CssClass="btn btn-primary btn-info" Text="SAVE" />
                </div>

            </div>
        </div>
        <div class="col-lg-5">
            <asp:Table runat="server" ID="mroht" BorderWidth="1" style="margin-left:10%;margin-right:10%;" CssClass="table table-hover table-responsive">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell BorderWidth="1">HOLIDAY</asp:TableHeaderCell>
                    <asp:TableHeaderCell BorderWidth="1">RUNNING MACHINE</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>

    </div>
    <asp:SqlDataSource ID="machrunhol" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [holiday-running-machine] WHERE [Id] = @Id" InsertCommand="INSERT INTO [holiday-running-machine] ([holiday], [machine]) VALUES (@holiday, @machine)" SelectCommand="SELECT * FROM [holiday-running-machine]" UpdateCommand="UPDATE [holiday-running-machine] SET [holiday] = @holiday, [machine] = @machine WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hid" DbType="Date" Name="holiday" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlmach" Name="machine" PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="holiday"></asp:Parameter>
            <asp:Parameter Name="machine" Type="String"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

