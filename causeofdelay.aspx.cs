using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class causeofdelay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();

        //string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        //SqlConnection conn = new SqlConnection(cs);

        //string query = "SELECT cod FROM [causeofdelay] ORDER BY Id DESC";
        //SqlDataAdapter dap = new SqlDataAdapter(query, conn);
        //DataSet ds = new DataSet();
        //dap.Fill(ds);

        //Repeater1.DataSource = ds.Tables[0];
        //Repeater1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);


        conn.Open();
        string cmd = "INSERT INTO causeofdelay(cod) VALUES(@cod)";
        SqlCommand command = new SqlCommand(cmd, conn);
        command.Parameters.AddWithValue("@cod", TextBox1.Text);
        command.ExecuteNonQuery();
        conn.Close();


        //string query = "SELECT cod FROM [causeofdelay] ORDER BY Id DESC";
        //SqlDataAdapter dap = new SqlDataAdapter(query, conn);
        //DataSet ds = new DataSet();
        
        //dap.Fill(ds);

        //Repeater1.DataSource = ds.Tables[0];
        //Repeater1.DataBind();
        Response.Redirect("causeofdelay.aspx");
    }
}