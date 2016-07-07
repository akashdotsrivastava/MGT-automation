using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class machine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        Button_Format();
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string qry2 = "select Id from location where slot=@slot and assembly=@assembly";
        SqlCommand getLocation = new SqlCommand(qry2, con);
        getLocation.Parameters.AddWithValue("@slot", DropDownList2.SelectedValue);
        getLocation.Parameters.AddWithValue("@assembly", DropDownList1.SelectedValue);
        con.Open();
        int locationId = (int)getLocation.ExecuteScalar();
        con.Close();
        string qry = "insert into machine values(@machineID,@machineType,'1',@machineAddDate,'0',@locationID)";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@machineID", TextBox1.Text);
        cmd.Parameters.AddWithValue("@machineAddDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@locationID", locationId);
        cmd.Parameters.AddWithValue("@machineType",ddlmtype.SelectedValue);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        string qqry = "update location set occ = 1 where Id=@loc";
        SqlCommand cmo = new SqlCommand(qqry,con);
        cmo.Parameters.AddWithValue("@loc",locationId);
        con.Open();
        cmo.ExecuteNonQuery();
        con.Close();
        Response.Redirect("machine.aspx");
    }
    private void Button_Format()
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            Label lablelWork = (Label)gr.FindControl("Label1");
            Label lablelActive = (Label)gr.FindControl("Label2");
            Button btnWork = (Button)gr.FindControl("ButtonToggleWork");
            Button btnActive = (Button)gr.FindControl("ButtonToggleActive");
            if (lablelWork.Text == "1")
            {
                btnWork.CssClass = "btn btn-success";
                btnWork.Text = "Good";
            }
            else
            {
                btnWork.CssClass = "btn btn-danger";
                btnWork.Text = "Bad";
            }
            if (lablelActive.Text == "1")
            {
                btnActive.CssClass = "btn btn-success";
                btnActive.Text = "Active";
            }
            else
            {
                btnActive.CssClass = "btn btn-warning";
                btnActive.Text = "Vacant";
            }
        }
    }
    protected void ButtonToggleWork_Click(object sender, EventArgs e)
    {
        Button btn=(Button)sender;
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string qry = "update machine set w_status=(w_status+1)%2 where machineID=@machineID";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@machineID", btn.CommandArgument.ToString());
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();
        Button_Format();
    }
    protected void ButtonToggleActive_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string qry = "update machine set a_status=(a_status+1)%2 where machineID=@machineID";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@machineID", btn.CommandArgument.ToString());
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();
        Button_Format();
    }

    
}