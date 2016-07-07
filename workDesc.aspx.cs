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

public partial class workDesc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");

        DataView dvw = (DataView)(sdcw.Select(DataSourceSelectArguments.Empty));
        DataView dvwj = (DataView)(sdsjw.Select(DataSourceSelectArguments.Empty));

        DataView dvj = (DataView)(sdsj.Select(DataSourceSelectArguments.Empty));
        dvj.Sort = "jobID";
        wl.Text = dvw.Table.Rows[0][1].ToString();
        wid.Text = dvw.Table.Rows[0][0].ToString();
        jo.Text = Convert.ToDateTime(dvw.Table.Rows[0][4]).ToShortDateString();
        gl.Text = (dvw.Table.Rows[0][1].ToString() == dvw.Table.Rows[0][2].ToString()) ?"-": dvw.Table.Rows[0][2].ToString();

        for (int i = 0; i < dvwj.Table.Rows.Count; i++)
        {
            if (dvj.Find(dvwj.Table.Rows[i]["job"].ToString()) >= 0)
            {
                TableRow tr = new TableRow();
                twd.Rows.Add(tr);
                TableCell c1 = new TableCell();
                TableCell c2 = new TableCell();
                TableCell c3 = new TableCell();
                tr.Cells.Add(c1);
                tr.Cells.Add(c2);
                tr.Cells.Add(c3);
                c1.Text = dvj.Table.Rows[dvj.Find(dvwj.Table.Rows[i]["job"].ToString())][1].ToString();
                c2.Text = Convert.ToDateTime(dvwj.Table.Rows[i]["time"]).ToShortDateString();
                c3.Text = dvwj.Table.Rows[i]["status"].ToString();
            }

        }

        foreach (TableRow tr in twd.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
            }
        }

    }

    protected void btnExpo_Click(object sender, EventArgs e)
    {
        Response.AppendHeader("content-disposition", "attachment;filename=Worker Details " + wl.Text + " " + DateTime.Now.ToString() + ".xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            twd.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}