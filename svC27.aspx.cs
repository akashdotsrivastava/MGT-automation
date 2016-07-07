using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class svC27 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");

        DataView dv = (DataView)(sdcph.Select(DataSourceSelectArguments.Empty));
        DataView dvm = (DataView)(sdcmac.Select(DataSourceSelectArguments.Empty));
        DataView dvl = (DataView)(sdloc.Select(DataSourceSelectArguments.Empty));
        DataView dvf = (DataView)(sdcfin.Select(DataSourceSelectArguments.Empty));
        DataView dvj = (DataView)(sdcjob.Select(DataSourceSelectArguments.Empty));
        DataView dvc = (DataView)(sdccust.Select(DataSourceSelectArguments.Empty));
        dvc.Sort = "custID";
        dvj.Sort = "machineID";
        dvl.Sort = "Id";
        dvf.Sort = "jobID";
        string ass = "c27";
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = dv.Table.Rows[i]["phaseORDER"].ToString();
            thc.BorderWidth = 1;
            thr.Cells.Add(thc);
            thc.Width = 100;
            thc.Attributes.Add("data-toggle", "tooltip");
            thc.Attributes.Add("data-placement", "top");
            thc.Attributes.Add("title", dv.Table.Rows[i]["phaseNAME"].ToString());
        }
        for (int k = 0; k < dvm.Table.Rows.Count; k++)
        {
            if ((dvl.Find(dvm.Table.Rows[k]["locationID"])) >= 0)
            {
                TableRow tr = new TableRow();

                tr.BackColor = System.Drawing.Color.Gray;

                TableCell c1 = new TableCell();
                LinkButton lb1 = new LinkButton();
                lb1.Text = dvm.Table.Rows[k]["machineID"].ToString();
                string ado = Convert.ToDateTime(dvm.Table.Rows[k]["machineAddDate"]).ToShortDateString();
                lb1.PostBackUrl = "macDesc.aspx?mid=" + lb1.Text + "&ass=" + ass + "&ado=" + ado;
                c1.Controls.Add(lb1);
                c1.BorderWidth = 1;
                tr.Cells.Add(c1);
                c1.BackColor = System.Drawing.Color.White;

                TableCell c2 = new TableCell();
                LinkButton lb2 = new LinkButton();
                c2.Controls.Add(lb2);
                c2.BorderWidth = 1;
                tr.Cells.Add(c2);
                TableCell c3 = new TableCell();
                LinkButton lb3 = new LinkButton();
                c3.Controls.Add(lb3);
                c3.BorderWidth = 1;
                tr.Cells.Add(c3);


                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    TableCell tc = new TableHeaderCell();
                    tc.ID = dv.Table.Rows[i]["phaseORDER"].ToString();
                    tc.BorderWidth = 1;
                    tr.Cells.Add(tc);
                }

                int p = dvj.Find(dvm.Table.Rows[k]["machineID"]);
                if (p >= 0)
                {
                    tr.BackColor = System.Drawing.Color.White;
                    lb2.Text = dvj.Table.Rows[p]["jobID"].ToString();
                    lb2.PostBackUrl = "jobDesc.aspx?jid=" + lb2.Text;
                    lb3.Text = dvc.Table.Rows[dvc.Find(dvj.Table.Rows[p]["customerID"])]["custName"].ToString();
                    lb3.PostBackUrl = "custDesc.aspx?cid=" + dvc.Table.Rows[dvc.Find(dvj.Table.Rows[p]["customerID"])]["custID"].ToString();
                    hjob.Value = lb2.Text;
                    DataView dvjj = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
                    dvjj.Sort = "phase";
                    foreach (TableCell tcc in tr.Cells)
                    {
                        if (dvjj.Find(tcc.ID) >= 0) tcc.BackColor = System.Drawing.Color.Gray;
                        
                    }
                }



                tc27.Rows.Add(tr);
            }
        }

        foreach (TableRow tr in tc27.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
            }
        }

    }
}