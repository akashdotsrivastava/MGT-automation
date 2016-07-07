<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="troubleshooting.aspx.cs" Inherits="troubleshooting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center text-primary">
        THIS PAGE IS HERE TO DEAL WITH CHANGES DUE TO PREMATURE DELETING OF JOBS AND MACHINES BEFORE THE WORK IS COMPLETED     <a href="adminHOME.aspx" style="color:red">BACK</a>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-6 text-center">
            <div class="row text-center text-primary">
                RE-ACTIVATE A MACHINE FOR ALLOTTING A JOB
            </div>
            <br />
            <div class="row text-center">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                <asp:DropDownList ID="ddlmac" runat="server" CssClass="form-control" ></asp:DropDownList>

                </div>
            </div>
            <br />
            <div class="row text-center">
                
                <asp:Button ID="butreactivate" runat="server" Text="RE-ACTIVATE FOR JOB" CssClass="btn btn-info" BackColor="Green" OnClick="butreactivate_Click" />
            </div>
        </div>
        <div class="col-lg-6 text-center">
            <div class="row text-center text-primary">
                FREE A LOCATION WHICH DOES NOT CONTAIN A MACHINE AND IS STILL OCCUPIED
</div>
            <br />
            <div class="row text-center">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                <asp:DropDownList ID="ddlloc" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
            </div>
            <br />
            <div class="row text-center">
                <asp:Button ID="butfree" runat="server" Text="FREE" CssClass="btn btn-info" BackColor="Green" OnClick="butfree_Click" />
            </div>
        </div>

        </div>
    <div class="row text-center">
        <asp:Button ID="remextra" runat="server" Text="REMOVE EXTRANEOUS ENTRIES FROM DATABASE" CssClass="btn btn-info" BackColor="Green" OnClick="remextra_Click" />
    </div>
    <asp:SqlDataSource ID="sdsmac" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID], [a_status] FROM [machine] WHERE ([a_status] = @a_status)" DeleteCommand="DELETE FROM [machine] WHERE [machineID] = @machineID" InsertCommand="INSERT INTO [machine] ([machineID], [a_status]) VALUES (@machineID, @a_status)" UpdateCommand="UPDATE [machine] SET [a_status] = @a_status WHERE [machineID] = @machineID">
        <DeleteParameters>
            <asp:Parameter Name="machineID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="machineID" Type="String" />
            <asp:Parameter Name="a_status" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="a_status" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="0" Name="a_status" Type="Int32" />
            <asp:ControlParameter ControlID="ddlmac" DefaultValue="" Name="machineID" PropertyName="SelectedValue" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsjobs" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [jobID], [machineID], [over] FROM [job] WHERE ([over] = @over)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="over" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsloc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' DeleteCommand="DELETE FROM [location] WHERE [Id] = @Id" InsertCommand="INSERT INTO [location] ([assembly], [slot], [occ]) VALUES (@assembly, @slot, @occ)" SelectCommand="SELECT * FROM [location] WHERE ([occ] = @occ)" UpdateCommand="UPDATE [location] SET [occ] = @occ WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="assembly" Type="String"></asp:Parameter>
            <asp:Parameter Name="slot" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="occ" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="occ" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="occ" Type="Int32" DefaultValue="0"></asp:Parameter>
            <asp:ControlParameter ControlID="ddlloc" DefaultValue="" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsm2" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID], [w_status], [locationID] FROM [machine] WHERE ([w_status] = @w_status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="w_status" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

