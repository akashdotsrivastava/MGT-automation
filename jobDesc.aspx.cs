using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.IO;

public partial class jobDesc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)(sdcjobs.Select(DataSourceSelectArguments.Empty));
        DataView dvm = (DataView)(sdcmac.Select(DataSourceSelectArguments.Empty));
        DataView dvl = (DataView)(sdcloc.Select(DataSourceSelectArguments.Empty));

        DataView dvcod = (DataView)(sdccod.Select(DataSourceSelectArguments.Empty));
        DataView dvff = (DataView)(sdsfinishedfinal.Select(DataSourceSelectArguments.Empty));
        DataView dvph = (DataView)(sdcphases.Select(DataSourceSelectArguments.Empty));
        dvph.Sort = "phaseORDER";
        DataView dvss = (DataView)(sdsstatus.Select(DataSourceSelectArguments.Empty));
        dvss.Sort = "val";
        dvcod.Sort ="Id";


        dvm.Sort = "machineID";
        dvl.Sort = "Id";
        jid.Text = Request.QueryString["jid"].ToString();
        //delay.Text = (Convert.ToInt32(dv.Table.Rows[0]["t_delay"])==0)?"ON TIME": dv.Table.Rows[0]["t_delay"].ToString()+" DAYS";
        //delay.ForeColor = (Convert.ToInt32(dv.Table.Rows[0]["t_delay"]) == 0) ?System.Drawing.Color.Green:System.Drawing.Color.Red;
        m.Text = dv.Table.Rows[0]["machineID"].ToString();
        m.PostBackUrl = "macDesc.aspx?mid="+m.Text;
        if (dv.Table.Rows[0]["over"].ToString() == "0")
        {
            //aa.Text = dvl.Table.Rows[dvl.Find(dvm.Table.Rows[dvm.Find(dv.Table.Rows[0]["machineID"].ToString())]["locationID"].ToString())]["assembly"].ToString();
            //aa.PostBackUrl = "svC" + aa.Text.TrimStart('c') + ".aspx";
        }
        s.Text = (Convert.ToDateTime(dv.Table.Rows[0]["startdate"])).ToShortDateString();
        if(dv.Table.Rows[0]["over"].ToString()=="1") en.Text= (Convert.ToDateTime(dv.Table.Rows[0]["enddate"])).ToShortDateString();

        jad.Text = s.Text;
        for (int i = 0; i < dvff.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();

            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            TableCell c3 = new TableCell();
            TableCell c4 = new TableCell();
            TableCell c5 = new TableCell();
            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            c1.BorderWidth = 1;
            c2.BorderWidth = 1;
           tr.Cells.Add(c3);
            tr.Cells.Add(c4);
            c3.BorderWidth = 1;
            c4.BorderWidth = 1;
            c5.BorderWidth = 1;
            tr.Cells.Add(c5);
            tjd.Rows.Add(tr);

            c1.Text = dvph.Table.Rows[dvph.Find(dvff.Table.Rows[i]["phase"])]["phaseNAME"].ToString();
            c2.Text = dvff.Table.Rows[i]["date"].ToString();
            c3.Text = dvff.Table.Rows[i]["hours"].ToString();
            c4.Text = dvss.Table.Rows[dvss.Find(dvff.Table.Rows[i]["status"])]["stat"].ToString();
            c5.Text = dvcod.Table.Rows[dvcod.Find(dvff.Table.Rows[i]["comment"])]["cod"].ToString();
        }

        foreach (TableRow tr in tjd.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
            }
        }
    }


    protected void expo_Click(object sender, EventArgs e)
    {
        Response.AppendHeader("content-disposition", "attachment;filename=ProgressTimeline Machine- " + m.Text + " " + DateTime.Now.ToString() + ".xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            tjd.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}