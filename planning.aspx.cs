using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class planning : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");

        if (Request.QueryString["mid"] == null) Response.Redirect("assembly.aspx");
        lblmid.Text = Request.QueryString["mid"].ToString();
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        DataView dvphase = (DataView)(sdsphase.Select(DataSourceSelectArguments.Empty));
        dvphase.Sort = "phaseORDER";
        int x;
        for (int i = 0; i < dvplan.Table.Rows.Count; i++)
        {
            string coll = dvplan.Table.Rows[i]["date"].ToString();
            string[] collarr = coll.Split(',');
            x = 0;
            foreach (string c in collarr)
            {
                TableRow tr = new TableRow();
                tblplanning.Rows.Add(tr);
                TableCell c1 = new TableCell();
                tr.Cells.Add(c1);
                TableCell c2 = new TableCell();
                tr.Cells.Add(c2);
                if (x == 0)
                {
                    c1.Text = dvphase.Table.Rows[dvphase.Find(dvplan.Table.Rows[i]["phase"])]["phaseNAME"].ToString();
                    c2.Text = dvphase.Table.Rows[dvphase.Find(dvplan.Table.Rows[i]["phase"])]["phaseDURATION"].ToString();
                    x = 1;
                }
                TableCell c3 = new TableCell();
                tr.Cells.Add(c3);
                c3.Text = c;
                TableCell c4 = new TableCell();
                tr.Cells.Add(c4);
                Button bdel = new Button();
                bdel.Text = "REMOVE";
                bdel.ID = dvplan.Table.Rows[i]["phase"].ToString() + "," + c;
                bdel.Click += Bdel_Click;
                bdel.CausesValidation = false;
                c4.Controls.Add(bdel);
            }
        }


    }

    private void Bdel_Click(object sender, EventArgs e)
    {
        // throw new NotImplementedException();
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        dvplan.Sort = "phase";
        Button but = (Button)sender;
        string []parts = but.ID.ToString().Split(',');
        string phase = parts[0];
        string date = parts[1];
        List<string> licoll=new List<string>();
        licoll.AddRange(dvplan.Table.Rows[dvplan.Find(phase)]["date"].ToString().Split(','));
        if (licoll.Contains(date)) licoll.Remove(date);
        string rebuilt = string.Join(",", licoll);
        con.Open();
        SqlCommand cmd = new SqlCommand("update [plan] set date=@reb,job=@job,phase=@phase where job=@job and phase=@phase",con);
        cmd.Parameters.AddWithValue("@reb",rebuilt);
        cmd.Parameters.AddWithValue("@job",Request.QueryString["jid"].ToString());
        cmd.Parameters.AddWithValue("@phase",phase);

        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("planning.aspx?jid=" + Request.QueryString["jid"].ToString() + "&mid=" + Request.QueryString["mid"].ToString());
    }

    protected void addduration_Click(object sender, EventArgs e)
    {
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        dvplan.Sort = "phase";
        DateTime init = Convert.ToDateTime(tbstrt.Text);
        DateTime last = Convert.ToDateTime(tbend.Text);
        if (last >= init)
        {
            List<DateTime> li = new List<DateTime>();
            for (DateTime i = init; i <= last; i = i.AddDays(1))
            {
                li.Add(i);
            }
            string[] ex = dvplan.Table.Rows[dvplan.Find(ddlop.SelectedValue)]["date"].ToString().Split(',');
            if (dvplan.Table.Rows[dvplan.Find(ddlop.SelectedValue)]["date"].ToString() != "")
            {
                foreach (string ee in ex)
                {
                    DateTime eee = Convert.ToDateTime(ee);
                    if (!li.Contains(eee)) li.Add(eee);
                }
            }
            li.Sort();
            List<string> dates = new List<string>();
            foreach (DateTime item in li)
            {
                dates.Add(item.ToShortDateString());
            }
            string rebuilt = string.Join(",", dates);
            con.Open();
            SqlCommand cmd = new SqlCommand("update [plan] set date=@reb where job=@j and phase=@p", con);
            cmd.Parameters.AddWithValue("@reb", rebuilt);
            cmd.Parameters.AddWithValue("@j", Request.QueryString["jid"].ToString());
            cmd.Parameters.AddWithValue("@p", ddlop.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("planning.aspx?jid=" + Request.QueryString["jid"].ToString() + "&mid=" + Request.QueryString["mid"].ToString());
        }
    }

    protected void resetduration_Click(object sender, EventArgs e)
    {
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        dvplan.Sort = "phase";
        DateTime init = Convert.ToDateTime(tbstrt.Text);
        DateTime last = Convert.ToDateTime(tbend.Text);
        if (last >= init)
        {
            List<DateTime> li = new List<DateTime>();
            for (DateTime i = init; i <= last; i = i.AddDays(1))
            {
                li.Add(i);
            }
            li.Sort();
            List<string> dates = new List<string>();
            foreach (DateTime item in li)
            {
                dates.Add(item.ToShortDateString());
            }
            string rebuilt = string.Join(",", dates);
            con.Open();
            SqlCommand cmd = new SqlCommand("update [plan] set date=@reb where job=@j and phase=@p", con);
            cmd.Parameters.AddWithValue("@reb", rebuilt);
            cmd.Parameters.AddWithValue("@j", Request.QueryString["jid"].ToString());
            cmd.Parameters.AddWithValue("@p", ddlop.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("planning.aspx?jid=" + Request.QueryString["jid"].ToString() + "&mid=" + Request.QueryString["mid"].ToString());
        }
    }

    protected void gotoinput_Click(object sender, EventArgs e)
    {
        Response.Redirect("inputmap.aspx?mid="+Request.QueryString["mid"].ToString());
    }

    protected void gotoprogress_Click(object sender, EventArgs e)
    {
        Session["bu"] = "planning.aspx?mid=" + Request.QueryString["mid"].ToString() + "&jid=" + Request.QueryString["jid"].ToString();
        Response.Redirect("jobprogress.aspx?jid="+Request.QueryString["jid"].ToString()+"&mid="+Request.QueryString["mid"].ToString());
    }

    protected void adjust_Click(object sender, EventArgs e)
    {
        List<DateTime> li = new List<DateTime>();
        DataView dvplan = (DataView)(sdsplan.Select(DataSourceSelectArguments.Empty));
        dvplan.Sort = "phase";
        for (int i = 0; i < dvplan.Table.Rows.Count; i++)
        {
            string[] datarr = dvplan.Table.Rows[i]["date"].ToString().Split(',');
            if (dvplan.Table.Rows[i]["date"].ToString() != "")
            {
                foreach (string s in datarr)
                {
                    if (!li.Contains(Convert.ToDateTime(s))) li.Add(Convert.ToDateTime(s));
                }
            }
        }
        li.Sort();
        int count = li.Count;
        List<DateTime> wd = new List<DateTime>();
        int p = 0;
        DateTime dt = li[0];
        while(p<=count)
        {
            if(isworkingday(dt)==1)
            {
                wd.Add(dt);
                p++;
            }
            dt = dt.AddDays(1);
        }
        for (int i = 0; i < dvplan.Table.Rows.Count; i++)
        {
            string[] datarr = dvplan.Table.Rows[i]["date"].ToString().Split(',');
            List<string> reb = new List<string>();
            if (dvplan.Table.Rows[i]["date"].ToString() != "")
            {
                foreach (string s in datarr)
                {
                    int index = li.IndexOf(Convert.ToDateTime(s));
                    reb.Add(wd[index].ToShortDateString());
                }
            }
            string rebuilt = string.Join(",", reb);
            con.Open();
            SqlCommand cmd = new SqlCommand("update [plan] set date=@reb where job=@j and phase=@p", con);
            cmd.Parameters.AddWithValue("@reb", rebuilt);
            cmd.Parameters.AddWithValue("@j", Request.QueryString["jid"].ToString());
            cmd.Parameters.AddWithValue("@p", dvplan.Table.Rows[i]["phase"].ToString());
            cmd.ExecuteNonQuery();
            con.Close();
        }
        Response.Redirect("planning.aspx?jid=" + Request.QueryString["jid"].ToString() + "&mid=" + Request.QueryString["mid"].ToString());

    }
    public int isworkingday(DateTime dt)
    {
        DataView dvhol = (DataView)(sdsholi.Select(DataSourceSelectArguments.Empty));
        DataView dvmhol = (DataView)(sdsmonholi.Select(DataSourceSelectArguments.Empty));
        dvhol.Sort = "holidayDATE";
        dvmhol.Sort = "holiday";
        if (dvhol.Find(dt) < 0) return 1;
        else
        {
            if (dvmhol.Find(dt) >= 0) return 1;
            else return 0;
        }

    }
}