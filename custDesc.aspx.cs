using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class custDesc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dvc = (DataView)(sdcc.Select(DataSourceSelectArguments.Empty));
        DataView dvj = (DataView)(sdcj.Select(DataSourceSelectArguments.Empty));

        cu.Text = dvc.Table.Rows[0][1].ToString();
        jo.Text = Convert.ToDateTime(dvc.Table.Rows[0][2]).ToShortDateString();
        noj.Text = dvj.Table.Rows.Count.ToString();

        for (int i = 0; i < dvj.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            tcd.Rows.Add(tr);

            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            c1.BorderWidth = 1;
            c2.BorderWidth = 1;
            tr.Cells.Add(c1) ;
            tr.Cells.Add(c2);

            LinkButton l = new LinkButton();
            l.Text = dvj.Table.Rows[i][0].ToString();
            l.PostBackUrl="jobDesc.aspx?jid="+l.Text;
            c1.Controls.Add(l);

            if (dvj.Table.Rows[i]["over"].ToString() == "0")
            {
                c2.Text = "CURRENTLY GOING ON";
                c2.ForeColor = System.Drawing.Color.Red;
            }
            else
                c2.Text = Convert.ToDateTime(dvj.Table.Rows[i]["enddate"]).ToShortDateString();

           


        }
        foreach (TableRow tr in tcd.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
            }
        }

    }
}