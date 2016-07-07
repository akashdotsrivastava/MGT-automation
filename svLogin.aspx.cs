using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class svLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] != null)
        {
            Response.Redirect("svAssembly.aspx");
        }
    }

    protected void bsub_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)(sdcsv.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            if ((dv.Table.Rows[i]["svID"].ToString() == tun.Text) && (dv.Table.Rows[i]["svPW"].ToString() == tpw.Text))
            {
                Session["statsViewer"] = dv.Table.Rows[i]["svID"].ToString();
                Response.Redirect("svHome.aspx");
                break;
            }
        }
    }
}