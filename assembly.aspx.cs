using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class INPUT_assembly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");
    }

    protected void c27_Click(object sender, EventArgs e)
    {
        Response.Redirect("c27.aspx");
    }

    protected void c28_Click(object sender, EventArgs e)
    {
        Response.Redirect("c28.aspx");

    }

    protected void lbiplg_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("inputLogin.aspx");
    }
}