using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class svHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null)
        {
            Server.Transfer("svLogin.aspx");
        }
        sv.Text = Session["statsViewer"].ToString();
    }

    protected void blo_Click(object sender, EventArgs e)
    {
        Session.Remove("statsViewer");
        Response.Redirect("svLogin.aspx");
    }

    

    protected void bw_Click(object sender, EventArgs e)
    {
        Response.Redirect("svWorkers.aspx");

    }

    protected void bj_Click(object sender, EventArgs e)
    {
        Response.Redirect("svJobs.aspx?fstat=0");

    }

    protected void bm_Click(object sender, EventArgs e)
    {
        Response.Redirect("svMachines.aspx");

    }

    protected void bc_Click(object sender, EventArgs e)
    {
        Response.Redirect("svCustomer.aspx");
    }
}