using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class svWorkers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");

        DataView dvw = (DataView)(sdcwork.Select(DataSourceSelectArguments.Empty));
        DataView dvj = (DataView)(sdcjob.Select(DataSourceSelectArguments.Empty));

        for (int i = 0; i <dvw.Table.Rows.Count ; i++)
        {
            TableRow tr = new TableRow();
            twork.Rows.Add(tr);

            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            //TableCell c3 = new TableCell();
            TableCell c4 = new TableCell();
            TableCell c6 = new TableCell();
            c1.BorderWidth = 1;
            c2.BorderWidth = 1;
            //c3.BorderWidth = 1;
            c4.BorderWidth = 1;
            c6.BorderWidth = 1;

            c1.Text = dvw.Table.Rows[i]["workerName"].ToString();
            c2.Text = (dvw.Table.Rows[i][1].ToString() != dvw.Table.Rows[i][2].ToString()) ? dvw.Table.Rows[i][2].ToString() : "-";
            //c3.BackColor = (dvw.Table.Rows[i][3].Equals(true)) ? System.Drawing.Color.Green : System.Drawing.Color.Black;
            c4.Text = Convert.ToDateTime(dvw.Table.Rows[i][4]).ToShortDateString();
            

            Button b = new Button();
            b.Text = "VIEW DETAILS";
            b.CssClass = "btn btn-default";
            b.PostBackUrl = "workDesc.aspx?wid=" + dvw.Table.Rows[i][0].ToString();
            c6.Controls.Add(b);

            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            //tr.Cells.Add(c3);
            tr.Cells.Add(c4);
            tr.Cells.Add(c6);

        }
        foreach (TableRow tr in twork.Rows)
        {
            foreach  (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align","center");
            }
        }
    }
}