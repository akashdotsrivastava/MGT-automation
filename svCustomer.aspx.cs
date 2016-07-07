using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class svCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");
        DataView dvc = (DataView)(sdcc.Select(DataSourceSelectArguments.Empty));

        for (int i = 0; i < dvc.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            tcust.Rows.Add(tr);
            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            TableCell c3 = new TableCell();
            TableCell c4 = new TableCell();
            TableCell c5 = new TableCell();
            c1.BorderWidth = 1;
            c2.BorderWidth = 1;
            c3.BorderWidth = 1;
            c4.BorderWidth = 1;
            c5.BorderWidth = 1;
            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            tr.Cells.Add(c3);
            tr.Cells.Add(c4);
            tr.Cells.Add(c5);
            c4.Text = "";
            h.Value = dvc.Table.Rows[i][0].ToString();
            DataView dvj = (DataView)(sdcj.Select(DataSourceSelectArguments.Empty));
            c1.Text = dvc.Table.Rows[i][1].ToString();
            c2.Text = Convert.ToDateTime(dvc.Table.Rows[i][2]).ToShortDateString();
            c3.Text = dvj.Table.Rows.Count.ToString();
            for (int j = 0; j < dvj.Table.Rows.Count; j++)
            {
                if(dvj.Table.Rows[j]["over"].ToString()=="0")
                {
                    LinkButton l = new LinkButton();
                    c4.Controls.Add(l);
                    l.Text = dvj.Table.Rows[j][0].ToString()+" ";
                    l.PostBackUrl = "jobDesc.aspx?jid="+l.Text.TrimEnd(' ');
                }
            }
            Button b = new Button();
            b.CssClass = "btn btn-default";
            c5.Controls.Add(b);
            b.Text = "VIEW DETAILS";
            b.PostBackUrl = "custDesc.aspx?cid=" + h.Value;
        }
        foreach (TableRow tr in tcust.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align","center");
            }
        }
    }
}