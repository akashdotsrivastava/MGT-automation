using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        DataView dv = (DataView)(SqlDataSourceADDCUST.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            
            TableRow r = new TableRow();
            custtable.Rows.Add(r);
            TableCell c1= new TableCell();
            c1.Text = dv.Table.Rows[i]["custName"].ToString();
            r.Cells.Add(c1);
            TableCell c2 = new TableCell();
            Button b = new Button();
            b.CssClass = "btn btn-danger";
            b.Text = "DELETE";
            b.ID = dv.Table.Rows[i]["custID"].ToString();
            b.Click += B_Click;
            c2.Controls.Add(b);
            r.Cells.Add(c2);
        }
    }

    private void B_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        h1.Value = b.ID;
        SqlDataSourceADDCUST.Delete();
        Response.Redirect("customer.aspx");
    }

    protected void btnADD_Click(object sender, EventArgs e)
    {
        SqlDataSourceADDCUST.Insert();
        Response.Redirect("customer.aspx");
    }

    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminHOME.aspx");
    }
}