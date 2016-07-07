using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void admin_Click(object sender, EventArgs e)
    {
        Session["bu"] = "Default.aspx";
        Response.Redirect("admin.aspx");
    }

    protected void input_Click(object sender, EventArgs e)
    {
        Session["bu"] = "Default.aspx";
        Response.Redirect("inputLogin.aspx");
    }

    protected void statsviewer_Click(object sender, EventArgs e)
    {
        Session["bu"] = "Default.aspx";
        Response.Redirect("svLogin.aspx");
    }
}