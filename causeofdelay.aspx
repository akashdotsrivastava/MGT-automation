<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="causeofdelay.aspx.cs" Inherits="causeofdelay" %>

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
        <h4 class="text-center page-header col-lg-12 col-md-12 col-sm-12 col-xs-12">CAUSE OF DEALAY</h4>
    </div>
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="text-center panel-heading panel-title">
                    ADD CAUSE OF DELAY
                </div>
                <div class="panel-body">
                    <asp:Label Text="Cause" ID="LabelCause" runat="server" CssClass="label label-info" />
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control panel-group" placeholder="Cause of delay"></asp:TextBox>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="btn btn-success btn-block" />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="col-lg-6 col-md-6 col-lg-offset-4 col-md-offset-2 " style="overflow-y:scroll;height:330px;">
                        <div class="panel panel-default">
                            <div class="panel-heading panel-title text-center">
                                Cause
                            </div>
                            <div class="panel-body">
                                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceCauseOfDelay">
                                    <Columns>
                                        <asp:BoundField DataField="cod" HeaderText="Cause Of Delay" SortExpression="cod"></asp:BoundField>
                                        <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceCauseOfDelay" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [causeofdelay] WHERE [Id] = @Id" InsertCommand="INSERT INTO [causeofdelay] ([cod]) VALUES (@cod)" SelectCommand="SELECT * FROM [causeofdelay]" UpdateCommand="UPDATE [causeofdelay] SET [cod] = @cod WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="cod" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="cod" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
