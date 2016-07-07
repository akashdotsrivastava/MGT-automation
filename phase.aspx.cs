using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class phase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        DataView dv = (DataView)(SqlDataSourcePHASES.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            TableRow r = new TableRow();
            TableCell c1 = new TableCell();
            c1.Text = dv.Table.Rows[i]["phaseORDER"].ToString();
            r.Cells.Add(c1);
            TableCell c2 = new TableCell();
            c2.Text = dv.Table.Rows[i]["phaseNAME"].ToString()+" ("+dv.Table.Rows[i]["phaseDURATION"].ToString()+")";

            r.Cells.Add(c2);
            TableCell c3 = new TableCell();
            Button b = new Button();
            b.CssClass = "btn btn-danger";
            b.ID = dv.Table.Rows[i]["phaseID"].ToString();
            b.Text = "DELETE";
            b.Click += new EventHandler(B_Click);
            c3.Controls.Add(b);
            r.Cells.Add(c3);
            phasetable.Rows.Add(r);
        }
    }

    private void B_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        h.Value = b.ID;
        SqlDataSourcePHASES.Delete();
        Response.Redirect("phase.aspx");

    }

    protected void addPHASE_Click(object sender, EventArgs e)
    {
        SqlDataSourcePHASES.Insert();
        Response.Redirect("phase.aspx");
    }
}