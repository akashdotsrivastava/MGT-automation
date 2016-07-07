using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class holiday : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);

        string query = "SELECT holidayNAME,holidayDATE FROM [holiday] ORDER BY Id DESC";
        SqlDataAdapter dap = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
    }
    
    
    protected void ButtonH_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();

        string cmd = "INSERT INTO holiday(holidayNAME,holidayDATE) VALUES(@hname,@hdate)";
        SqlCommand command = new SqlCommand(cmd, conn);
        
        command.Parameters.AddWithValue("@hname",TextBoxHN.Text);
        //command.Parameters.AddWithValue("@hdate", TextBoxHD.Text);
        command.Parameters.AddWithValue("@hdate", DateTime.ParseExact(TextBoxHD.Text,"dd-MM-yyyy",null));


        command.ExecuteNonQuery();

        conn.Close();

        string query = "SELECT holidayNAME,holidayDATE FROM [holiday] ORDER BY Id DESC";
        SqlDataAdapter dap = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);

        Response.Redirect("holiday.aspx");
    }

    protected void bmoh_Click(object sender, EventArgs e)
    {
        Response.Redirect("machineonholiday.aspx");
    }

    protected void addsunsat_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        string hname = null;
        DateTime sd = Convert.ToDateTime(tbsd.Text);
        DateTime ed = Convert.ToDateTime(tbed.Text);
        if(ed>=sd)
        {
            for (DateTime i = sd; i <= ed; i=i.AddDays(1))
            {
                if (i.DayOfWeek==DayOfWeek.Saturday)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO holiday(holidayNAME,holidayDATE) VALUES(@hname,@hdate)", conn);

                    hname = "SATURDAY";
                    cmd.Parameters.AddWithValue("@hname",hname);
                    cmd.Parameters.AddWithValue("@hdate",i);
                    cmd.ExecuteNonQuery();
                }
                if (i.DayOfWeek==DayOfWeek.Sunday)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO holiday(holidayNAME,holidayDATE) VALUES(@hnamee,@hdate)", conn);

                    hname = "SUNDAY";
                    cmd.Parameters.AddWithValue("@hnamee", hname);
                    cmd.Parameters.AddWithValue("@hdate",i);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        conn.Close();
        Response.Redirect("holiday.aspx");
    }
}