using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class svMachines : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");

        DataView dvm = (DataView)(sdcmac.Select(DataSourceSelectArguments.Empty));
        DataView dvj = (DataView)(sdcjobs.Select(DataSourceSelectArguments.Empty));
        DataView dvl = (DataView)(sdcloc.Select(DataSourceSelectArguments.Empty));
        dvj.Sort = "machineID";
        dvl.Sort = "Id";
        for (int i = 0; i < dvm.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();

            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            TableCell c3 = new TableCell();
            TableCell c4 = new TableCell();
            TableCell c5 = new TableCell();
            TableCell c6 = new TableCell();
            //TableCell c7 = new TableCell();
            TableCell c8 = new TableCell();
            TableCell c9 = new TableCell();

            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            tr.Cells.Add(c3);
            //tr.Cells.Add(c4);
            //tr.Cells.Add(c5);
            tr.Cells.Add(c6);
            //tr.Cells.Add(c7);
            tr.Cells.Add(c8);
            tr.Cells.Add(c9);

            c1.Text = dvm.Table.Rows[i]["machineID"].ToString();
            LinkButton l1 = new LinkButton();
            c2.Text = (dvm.Table.Rows[i]["w_status"].ToString() == "1") ? "Not Finished" : "Finished";
            c3.Text = (dvm.Table.Rows[i]["a_status"].ToString() == "0") ? "Job Over" : "Job Going On";
            c2.ForeColor = (dvm.Table.Rows[i]["w_status"].ToString() == "0") ?System.Drawing.Color.Green: System.Drawing.Color.Red;
            c3.ForeColor = (dvm.Table.Rows[i]["a_status"].ToString() == "1") ? System.Drawing.Color.Green : System.Drawing.Color.Red;

            

            if (c3.Text == "Not Active") c6.BackColor = System.Drawing.Color.Gray;
            else
            {
                LinkButton l2 = new LinkButton();
                for (int k = 0; k < dvj.Table.Rows.Count; k++)
                {
                    if ((dvj.Table.Rows[k]["machineID"].ToString() == c1.Text))
                    {
                        l2.Text = dvj.Table.Rows[k]["jobID"].ToString();
                        break;
                    }
                }
                l2.PostBackUrl = "jobDesc.aspx?jid="+l2.Text;
                c6.Controls.Add(l2);

                Button b = new Button();
                b.CssClass = "btn btn-default";
                c9.Controls.Add(b);
                b.Text = "VIEW DETAILS";
                b.ID = c1.Text;
                Session["bu"] = "svMachines.aspx";
                if (dvj.Find(c1.Text) >= 0)
                    b.PostBackUrl = "jobProgress.aspx?mid=" + c1.Text + "&jid=" + l2.Text;
            }

            
            c8.Text = (Convert.ToDateTime(dvm.Table.Rows[i]["machineAddDate"])).ToShortDateString();
            tmac.Rows.Add(tr);

            

        }

        foreach (TableRow tr in tmac.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align","center");
                tc.BorderWidth = 1;
            }
        }

    }

    
}