using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminHOME : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
    }

    protected void customer_Click(object sender, EventArgs e)
    {
        Response.Redirect("customer.aspx");
    }

    protected void machine_Click(object sender, EventArgs e)
    {
        Response.Redirect("machine.aspx");

    }

    protected void phase_Click(object sender, EventArgs e)
    {
        Response.Redirect("phase.aspx");

    }

    protected void holiday_Click(object sender, EventArgs e)
    {
        Response.Redirect("holiday.aspx");

    }

    protected void worker_Click(object sender, EventArgs e)
    {
        Response.Redirect("worker.aspx");

    }

    protected void job_Click(object sender, EventArgs e)
    {
        Response.Redirect("job.aspx");

    }

    protected void causeofdelay_Click(object sender, EventArgs e)
    {
        Response.Redirect("causeofdelay.aspx");

    }

    protected void user_Click(object sender, EventArgs e)
    {
        Response.Redirect("user.aspx");

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Application.Remove("admin");
        Application.RemoveAll();
        Session.Abandon();
        Response.Redirect("admin.aspx");
    }

    protected void trshoot_Click(object sender, EventArgs e)
    {
        Response.Redirect("troubleshooting.aspx");
    }
}