using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp;
using System.IO;

public partial class svJobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["statsViewer"] == null) Response.Redirect("svLogin.aspx");

        DataView dvj = (DataView)(sdcjobs.Select(DataSourceSelectArguments.Empty));
        DataView dvc = (DataView)(sdccust.Select(DataSourceSelectArguments.Empty));
        dvc.Sort = "custID";
        string x = Request.QueryString["fstat"].ToString();
        /*if(x=="1")
        {
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "ENDED ON";
            thc.BorderWidth = 1;
            foreach (TableHeaderRow thr in tjobs.Rows)
                thr.Cells.Add(thc);
        }
        else
        {
            TableHeaderCell thc = new TableHeaderCell();
            thc.Text = "CURRENT PHASE";
            thc.BorderWidth = 1;
            foreach (TableHeaderRow thr in tjobs.Rows)
                thr.Cells.Add(thc);
        }*/
        TableHeaderCell TableHeaderDetails = new TableHeaderCell();
        TableHeaderDetails.Text = "DETAILS";
        TableHeaderDetails.BorderWidth = 1;
        tjobs.Rows[0].Cells.Add(TableHeaderDetails);
        for (int i = 0; i < dvj.Table.Rows.Count; i++)
        {
            if(dvj.Table.Rows[i]["over"].ToString()==x)
            {
                TableRow tr = new TableRow();

                TableCell tc1 = new TableCell();
                tc1.Text = dvj.Table.Rows[i]["jobID"].ToString();
                tr.Cells.Add(tc1);
                TableCell tc2 = new TableCell();
                LinkButton lb2 = new LinkButton();
                lb2.Text = dvj.Table.Rows[i]["machineID"].ToString();
                tc2.Controls.Add(lb2);
                Session["bu"] = "svJobs.aspx?fstat=0";
                lb2.PostBackUrl = "jobProgress.aspx?mid="+lb2.Text+"&jid="+tc1.Text;
                tr.Cells.Add(tc2);
                TableCell tc3 = new TableCell();
                LinkButton lb3 = new LinkButton();
                lb3.Text = dvc.Table.Rows[dvc.Find(dvj.Table.Rows[i]["customerID"])]["custName"].ToString();
                tc3.Controls.Add(lb3);
                lb3.PostBackUrl = "custDesc.aspx?cid="+ dvc.Table.Rows[dvc.Find(dvj.Table.Rows[i]["customerID"])]["custID"].ToString(); ;
                tr.Cells.Add(tc3);
                TableCell tc4 = new TableCell();
                tc4.Text = (Convert.ToDateTime(dvj.Table.Rows[i]["startdate"])).ToShortDateString();
                tr.Cells.Add(tc4);
                //TableCell tc5 = new TableCell();
                //tc5.BackColor = System.Drawing.Color.Green;
                //tr.Cells.Add(tc5);
                //TableCell tc6 = new TableCell();
                //tr.Cells.Add(tc6);

                tc1.BorderWidth = 1;
                tc2.BorderWidth = 1;
                tc3.BorderWidth = 1;
                tc4.BorderWidth = 1;
                //tc5.BorderWidth = 1;
                //tc6.BorderWidth = 1;

                /*if (x=="0")
                {
                    TableCell c = new TableCell();
                    c.Text =dvj.Table.Rows[i]["currentPhaseID"].ToString();
                    tr.Cells.Add(c);
                    c.BorderWidth = 1;
                }
                else
                {
                    TableCell c = new TableCell();
                    c.Text = (Convert.ToDateTime(dvj.Table.Rows[i]["enddate"])).ToShortDateString();
                    tr.Cells.Add(c);
                    c.BorderWidth = 1;
                }*/

                TableCell tc7 = new TableCell();
                Button b = new Button();
                b.ID = tc1.Text;
                b.Text = "VIEW DETAILS";
                b.Click += B_Click;
                b.CssClass = "btn btn-default";
                tc7.Controls.Add(b);
                tr.Cells.Add(tc7);
                tc7.BorderWidth = 1;

                tjobs.Rows.Add(tr);
            }
        }

        foreach (TableRow tr in tjobs.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                tc.Attributes.CssStyle.Add("text-align","center");
            }
        }
    }

    private void B_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        string y = b.ID.ToString();
        Response.Redirect("jobDesc.aspx?jid="+y);
    }

    protected void a0_Click(object sender, EventArgs e)
    {
        Response.Redirect("svJobs.aspx?fstat=0");
    }

    protected void a1_Click(object sender, EventArgs e)
    {
        Response.Redirect("svJobs.aspx?fstat=1");

    }

    protected void pr_Click(object sender, EventArgs e)
    {
        /*Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition","attachment;filename=PrintState.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        //this.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        PdfDocument pdfdoc = new PdfDocument();
        HTMLWorker htmlparser = new HTMLWorker(pdfdoc);
        PdfWriter.GetInstance(pdfdoc,Response.OutputStream);
        pdfdoc.Open();
        htmlparser.Parse(sr);
        pdfdoc.Close();
        Response.Write(pdfdoc);
        Response.End();*/
    }
}