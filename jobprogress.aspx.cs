using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Web.Configuration;

public partial class jobprogress : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["inp"] == null)&&(Session["statsViewer"]==null)) Response.Redirect("inputLogin.aspx");

        if (Request.QueryString["jid"] == null) Response.Redirect("assembly.aspx");
        jid.Text = Request.QueryString["jid"].ToString();
        mid.Text = Request.QueryString["mid"].ToString();

        //tbl.Attributes["class"] = "ht";

        DataView dvjob = (DataView)(sdcjob.Select(DataSourceSelectArguments.Empty));
        DataView dvcod = (DataView)(sdccod.Select(DataSourceSelectArguments.Empty));
        dvcod.Sort = "Id";
        DataView dvph = (DataView)(sdcph.Select(DataSourceSelectArguments.Empty));
        dvph.Sort = "phaseORDER";
        DateTime mindate, maxdate;
        DataView dvfin = (DataView)(sdsnewfin.Select(DataSourceSelectArguments.Empty));
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        List<DateTime> plancollection = new List<DateTime>();
        List<DateTime> fincollection = new List<DateTime>();
        for (int i = 0; i < dvfin.Table.Rows.Count; i++)
        {
            DateTime ee = Convert.ToDateTime(dvfin.Table.Rows[i]["date"]);
            if (!fincollection.Contains(ee)) fincollection.Add(ee);
        }
        for (int i = 0; i < dvplan.Table.Rows.Count; i++)
        {
            string[] dates = dvplan.Table.Rows[i]["date"].ToString().Split(',');
            if (dvplan.Table.Rows[i]["date"].ToString() != "")
            {
                foreach (string item in dates)
                {
                    DateTime ee = Convert.ToDateTime(item);
                    if (!plancollection.Contains(ee)) plancollection.Add(ee);
                }
            }
        }
        plancollection.Sort();
        fincollection.Sort();
        if (dvfin.Table.Rows.Count == 0)
        {
            mindate = plancollection[0];
            maxdate = plancollection[plancollection.Count - 1];
        }
        else
        {
            mindate = (plancollection[0]<fincollection[0]) ?plancollection[0]:fincollection[0];
            maxdate = (plancollection[plancollection.Count - 1] > fincollection[fincollection.Count - 1]) ?plancollection[plancollection.Count-1]:fincollection[fincollection.Count-1];
        }
        double t_hours = 0;
        for (int i = 0; i < dvplan.Table.Rows.Count; i++)
        {
            string[] thisdates = dvplan.Table.Rows[i]["date"].ToString().Split(',');
            List<DateTime> dt = new List<DateTime>();
            if (dvplan.Table.Rows[i]["date"].ToString() != "")
            {
                foreach (string str in thisdates)
                {
                    dt.Add(Convert.ToDateTime(str));
                }
            }
            xx.Value = dvplan.Table.Rows[i]["phase"].ToString();

            DataView dvfinthisphase = (DataView)(thisphasefinished.Select(DataSourceSelectArguments.Empty));
            List<DateTime> dt2 = new List<DateTime>();
            for (int j = 0; j < dvfinthisphase.Table.Rows.Count; j++)
            {
                dt2.Add(Convert.ToDateTime(dvfinthisphase.Table.Rows[j]["date"]));
            }
            dvfinthisphase.Sort = "date";

            TableRow tr = new TableRow();
            progresstable.Rows.Add(tr);

            TableCell tc1 = new TableCell();
            tr.Cells.Add(tc1);
            tc1.Text = dvplan.Table.Rows[i]["phase"].ToString();

            TableCell tc2 = new TableCell();
            tr.Cells.Add(tc2);
            tc2.Text = dvph.Table.Rows[dvph.Find(dvplan.Table.Rows[i]["phase"])]["phaseNAME"].ToString();

            TableCell tc3 = new TableCell();
            tr.Cells.Add(tc3);
            tc3.Text = dvph.Table.Rows[dvph.Find(dvplan.Table.Rows[i]["phase"])]["phaseDURATION"].ToString();

            TableCell tc4 = new TableCell();
            tr.Cells.Add(tc4);

            double hours = 0;

            for (DateTime j = mindate; j <= maxdate; j=j.AddDays(1))
            {
                TableCell cxx = new TableCell();
                tr.Cells.Add(cxx);
                if (dt.Contains(j)) cxx.BorderWidth = 4;
                if(dt2.Contains(j))
                {
                    int p = dvfinthisphase.Find(j.ToShortDateString());
                    if (p >= 0)
                    {
                        int sta = Convert.ToInt32(dvfinthisphase.Table.Rows[p]["status"].ToString());
                        switch (sta)
                        {
                            case 0:
                                cxx.BackColor = System.Drawing.Color.Red;
                                break;
                            case 1:
                                cxx.BackColor = System.Drawing.Color.Green;
                                break;
                            case 2:
                                cxx.BackColor = System.Drawing.Color.Orange;
                                break;
                            case 3:
                                cxx.BackColor = System.Drawing.Color.Yellow;
                                break;
                        }
                        hours += Convert.ToDouble(dvfinthisphase.Table.Rows[p]["hours"].ToString());
                        cxx.Text = dvfinthisphase.Table.Rows[p]["hours"].ToString();
                        cxx.ToolTip = dvcod.Table.Rows[dvcod.Find(dvfinthisphase.Table.Rows[p]["comment"])]["cod"].ToString();
                    }
                }
            }
            tc4.Text = hours.ToString();
            t_hours += hours;

        }


        TableFooterRow tfr = new TableFooterRow();
        progresstable.Rows.Add(tfr);
        TableHeaderCell f1 = new TableHeaderCell();
        TableHeaderCell f2 = new TableHeaderCell();
        TableHeaderCell f3 = new TableHeaderCell();
        TableHeaderCell f4 = new TableHeaderCell();
        

        tfr.Cells.Add(f1);
        tfr.Cells.Add(f2);
        tfr.Cells.Add(f3);
        tfr.Cells.Add(f4);
        f1.Text = "ORDER";
        f2.Text = "OPERATION";
        f3.Text = "ACT DURATION (HRS)";
        f4.Text = "TOTAL MACHINE HOURS ("+t_hours.ToString()+")";

        for (DateTime i = mindate; i <= maxdate; i = i.AddDays(1))
        {
            TableHeaderCell cx = new TableHeaderCell();
            tfr.Cells.Add(cx);
            cx.Text = i.ToShortDateString();
            //cx.Attributes["class"] = "vertical";
        }

        
        foreach (TableRow tr in progresstable.Rows)
        {
            foreach(TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align", "center");
                
            }
        }

        


    }

    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect(Session["bu"].ToString());
    }

    protected void expo_Click(object sender, EventArgs e)
    {
        Response.AppendHeader("content-disposition","attachment;filename=Progress Machine- "+mid.Text+" "+DateTime.Now.ToString()+".xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            progresstable.RenderControl(hw);
            
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

            
    }
}