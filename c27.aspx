<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="c27.aspx.cs" Inherits="INPUT_c27" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style id="abcd">
        .labelsize{
            font:40px verdana;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row"><h3 style="text-align:center" class="text-success">C 27</h3><asp:Label ID="l" runat="server"></asp:Label></div>
    <div class="row text-right" style="margin-right:100px;"><a href="assembly.aspx">BACK</a></div>

    <br />
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-3"></div>
        <div class="col-lg-3"></div>
        <div class="col-lg-3"></div>
    </div>
    <br />
    <div class="row" style="overflow-y:scroll;">
        <div class="col-lg-3">
            
        </div>
        <div class="col-lg-1">
            <asp:Table runat="server" ID="tcc" BorderWidth="5px" CellSpacing="5" BorderStyle="Double">
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s1"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a1">
                    </asp:TableCell>

                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s2"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a2"></asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s3"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a3"></asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s4"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a4"></asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s5"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a5"></asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s6"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a6"></asp:TableCell></asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s7"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a7"></asp:TableCell></asp:TableRow>

            </asp:Table>
        </div>
        <div class="col-lg-1">
            <asp:Image runat="server" ID="arr1" ImageUrl="~/IMAGES/arrow.png" Width="100px" Height="350px" />
        </div>
        <div class="col-lg-1">
            <asp:Table runat="server" ID="td" BorderWidth="5px" CellSpacing="5" BorderStyle="Double">
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a8"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s8"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a9"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s9"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a10"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s10"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a11"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s11"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a12"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s12"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a13"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s13"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a14"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s14"></asp:TableCell>

                </asp:TableRow>

            </asp:Table>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1">
            <asp:Table runat="server" ID="te" BorderWidth="5px" CellSpacing="5" BorderStyle="Double">
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s15"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a15"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s16"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a16"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s17"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a17"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s18"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a18"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s19"></asp:TableCell>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a19"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s20"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a20"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="50px" Height="50px" ID="s21"></asp:TableCell>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a21"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div class="col-lg-1">
            <asp:Image runat="server" ID="arr2" ImageUrl="~/IMAGES/arrow.png" Width="100px" Height="350px" />

        </div>
        <div class="col-lg-1">
            <asp:Table runat="server" ID="tf" BorderWidth="5px" CellSpacing="5" BorderStyle="Double">
                <asp:TableRow>                    
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a22"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s22"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a23"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s23"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a24"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s24"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a25"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s25"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a26"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s26"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a27"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s27"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Double" BackColor="#cccccc" Width="50px" Height="50px" ID="a28"></asp:TableCell>
                    <asp:TableCell Width="50px" Height="50px" ID="s28"></asp:TableCell>
                </asp:TableRow>

            </asp:Table>
        </div>

    </div>
    <asp:SqlDataSource ID="SqlDataSourcelocation" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location] WHERE (([assembly] = @assembly) AND ([occ] = @occ))">
        <SelectParameters>
            <asp:Parameter DefaultValue="c27" Name="assembly" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="1" Name="occ" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcemachine" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT [machineID], [w_status], [a_status], [locationID] FROM [machine]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlloc2" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location] WHERE ([occ] = @occ)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="occ" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

