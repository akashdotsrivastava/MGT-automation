<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="jobprogress.aspx.cs" Inherits="jobprogress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .vertical{
            -ms-transform:rotate(270deg); /* IE 9 */
  -moz-transform:rotate(270deg); /* Firefox */
  -webkit-transform:rotate(270deg); /* Safari and Chrome */
  -o-transform:rotate(270deg); /* Opera */
        }
        .abs{
            position:absolute;
        }
        .ht{
            height:350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-capitalize text-primary text-center" style="font:100px;">JOB PROGRESS</div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-2">
            JOB ID: <asp:Label ID="jid" runat="server"></asp:Label>
        </div>
        <div class="col-lg-2">
            MACHINE NAME: <asp:Label ID="mid" runat="server"></asp:Label>
        </div>
        <div class="col-lg-1">
            <asp:Button runat="server" ID="fin" Text="FINISHED" CssClass="btn btn-info" BackColor="Green"/>
        </div>
        <div class="col-lg-1">
            <asp:Button runat="server" ID="going" Text="GOING ON" CssClass="btn btn-info" BackColor="Yellow" ForeColor="Black" />
        </div>
        <div class="col-lg-1">
            <asp:Button runat="server" ID="ideal" Text="IDEAL" CssClass="btn-info btn" BackColor="White" BorderWidth="2" ForeColor="Black" />     

        </div>
        <div class="col-lg-1">
            <asp:Button runat="server" ID="back" Text="BACK" CssClass="btn btn-danger" BackColor="Red" OnClick="back_Click" />
        </div>
        </div>
        <div class="row" style="height:50px;"></div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10" id="tbl" runat="server" style="overflow-x:scroll;overflow-y:scroll;height:350px;"><!--350-->
        <asp:Table ID="progresstable" runat="server" CssClass="table table-responsive table-hover" >
            
        </asp:Table>
                </div>
            <div class="col-lg-1"></div>
            </div>
    <div class="row center-block">
        <div class="col-lg-5"></div> 
        <div class="col-lg-2">
            <asp:Button ID="expo" runat="server" Text="EXPORT TO EXCEL" OnClick="expo_Click" />
        </div>       
    </div>
        <asp:SqlDataSource ID="sdcjob" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([jobID] = @jobID)">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="jid" Name="jobID" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        
        
        <asp:SqlDataSource ID="sdcph" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [phase] ORDER BY [phaseORDER]">
        </asp:SqlDataSource>

    
    <asp:HiddenField runat="server" ID="phaseorder" />

    <!--UPDATE MARCH-->
    <asp:SqlDataSource ID="sdsnewfin" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finishedfinal] WHERE ([job] = @job) ORDER BY [phase] DESC">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsplan" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan] WHERE ([job] = @job) ORDER BY [phase] DESC">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdccod" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [causeofdelay]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="thisphasefinished" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finishedfinal] WHERE (([job] = @job) AND ([phase] = @phase))">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="jid" Name="job" Type="Int32"></asp:QueryStringParameter>
            <asp:ControlParameter ControlID="xx" PropertyName="Value" Name="phase" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="xx" runat="server" />
</asp:Content>

