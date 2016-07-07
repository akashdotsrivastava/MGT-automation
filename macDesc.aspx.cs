using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class macDesc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dvj = (DataView)(sdcjobs.Select(DataSourceSelectArguments.Empty));
        DataView dvm = (DataView)(sdcm.Select(DataSourceSelectArguments.Empty));
        DataView dvl = (DataView)(sdcl.Select(DataSourceSelectArguments.Empty));
        dvl.Sort = "Id";
        mid.Text = Request.QueryString["mid"].ToString();
        //aa.Text = (Request.QueryString["ass"].ToString()==null) ?dvl.Table.Rows[dvl.Find(dvm.Table.Rows[0]["locationID"])]["assembly"].ToString():Request.QueryString["ass"].ToString();
        //ado.Text = (Request.QueryString["ado"].ToString()==null) ?Convert.ToDateTime(dvm.Table.Rows[0]["machineAddDate"]).ToShortDateString():Request.QueryString["ado"].ToString();
        //aa.Text = dvl.Table.Rows[dvl.Find(dvm.Table.Rows[0]["locationID"])]["assembly"].ToString();
        ado.Text= ado.Text = Convert.ToDateTime(dvm.Table.Rows[0]["machineAddDate"]).ToShortDateString();
        aa.PostBackUrl = "svC" + aa.Text.TrimStart('c') + ".aspx";

        for (int i = 0; i < dvj.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            tmach.Rows.Add(tr);
            TableCell c1 = new TableCell();
            tr.Cells.Add(c1);
            c1.BorderWidth = 1;
            TableCell c2 = new TableCell();
            tr.Cells.Add(c2);
            c2.BorderWidth = 1;
            TableCell c3 = new TableCell();
            tr.Cells.Add(c3);
            c3.BorderWidth = 1;
            LinkButton l1 = new LinkButton();
            l1.Text = dvj.Table.Rows[i]["jobID"].ToString();
            l1.PostBackUrl = "jobDesc.aspx?jid=" + l1.Text;
            c1.Controls.Add(l1);
            c2.Text= Convert.ToDateTime(dvj.Table.Rows[i]["startdate"]).ToShortDateString();
            if(dvj.Table.Rows[i]["enddate"].ToString()!="")
            c3.Text = Convert.ToDateTime(dvj.Table.Rows[i]["enddate"]).ToShortDateString();
            //TableCell c4 = new TableCell();
            //c4.BorderWidth = 1;
            //c4.Text = (Convert.ToInt32(dvj.Table.Rows[i]["t_delay"]) == 0) ? "DELIVERED ON TIME" :"DELAYED BY "+ dvj.Table.Rows[i]["t_delay"].ToString()+ " DAYS";
            //c4.ForeColor = (Convert.ToInt32(dvj.Table.Rows[i]["t_delay"]) == 0) ?System.Drawing.Color.Green: System.Drawing.Color.Red;
            //tr.Cells.Add(c4);

        }
        foreach (TableRow tr in tmach.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
            }
        }
    }
}