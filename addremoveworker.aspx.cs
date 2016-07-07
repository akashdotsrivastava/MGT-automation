using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class addremoveworker : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");

        if (!Page.IsPostBack)
        {
            lblmid.Text = Request.QueryString["mid"].ToString();
            DataView dvdistinct = (DataView)(sdsdistinctworkerID.Select(DataSourceSelectArguments.Empty));
            DataView dvw = (DataView)(sdsworkers.Select(DataSourceSelectArguments.Empty));
            dvw.Sort = "workerID";
            for (int i = 0; i < dvdistinct.Table.Rows.Count; i++)
            {
                wid.Value = dvdistinct.Table.Rows[i][0].ToString();
                DataView dvfinal = (DataView)(sdsselectfinal.Select(DataSourceSelectArguments.Empty));
                if (dvfinal.Table.Rows.Count % 2 == 1)
                {
                    if(dvw.Find(wid.Value)>=0)
                        ddlremwork.Items.Add(new ListItem(dvw.Table.Rows[dvw.Find(wid.Value)]["workerName"].ToString(),wid.Value));
                }

            }
            for (int i = 0; i < dvw.Table.Rows.Count; i++)
            {
                wid.Value = dvw.Table.Rows[i][0].ToString();
                DataView dvfinal = (DataView)(sdsselectfinal.Select(DataSourceSelectArguments.Empty));
                if (dvfinal.Table.Rows.Count % 2 == 0)
                    ddlworkers.Items.Add(new ListItem(dvw.Table.Rows[dvw.Find(wid.Value)]["workerName"].ToString(), wid.Value));

            }
        }
    }

    

    

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect(Session["bu"].ToString());
    }

    protected void addworker_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into [job-worker](job,wid,time,status) values(@j,@w,@t,@s)",con);
        cmd.Parameters.AddWithValue("@j",Request.QueryString["jid"].ToString());
        cmd.Parameters.AddWithValue("@w",ddlworkers.SelectedValue);
        cmd.Parameters.AddWithValue("@t",DateTime.ParseExact(tbadddate.Text, "dd-MM-yyyy",null));
        cmd.Parameters.AddWithValue("@s","ADDED");
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("addremoveworker.aspx?jid="+Request.QueryString["jid"].ToString()+"&mid="+Request.QueryString["mid"].ToString());

    }

    protected void btremworker_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into [job-worker](job,wid,time,status) values(@j,@w,@t,@s)", con);
        cmd.Parameters.AddWithValue("@j", Request.QueryString["jid"].ToString());
        cmd.Parameters.AddWithValue("@w", ddlremwork.SelectedValue);
        cmd.Parameters.AddWithValue("@t", DateTime.ParseExact(tbremwo.Text, "dd-MM-yyyy", null));
        cmd.Parameters.AddWithValue("@s", "REMOVED");
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("addremoveworker.aspx?jid=" + Request.QueryString["jid"].ToString() + "&mid=" + Request.QueryString["mid"].ToString());

    }
}