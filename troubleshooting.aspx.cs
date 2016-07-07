using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class troubleshooting : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("admin.aspx");

        DataView dvm = (DataView) (sdsmac.Select(DataSourceSelectArguments.Empty));
        DataView dvj = (DataView)(sdsjobs.Select(DataSourceSelectArguments.Empty));
        DataView dvl = (DataView)(sdsloc.Select(DataSourceSelectArguments.Empty));
        DataView dvm2 = (DataView)(sdsm2.Select(DataSourceSelectArguments.Empty));

        dvj.Sort = "machineID";
        dvm2.Sort = "locationID";
        if (!IsPostBack)
        {
            for (int i = 0; i < dvm.Table.Rows.Count; i++)
            {
                if (dvj.Find(dvm.Table.Rows[i][0].ToString()) < 0)
                    ddlmac.Items.Add(new ListItem(dvm.Table.Rows[i][0].ToString(), dvm.Table.Rows[i][0].ToString()));
            }
            for (int i = 0; i < dvl.Table.Rows.Count; i++)
            {
                if (dvm2.Find(dvl.Table.Rows[i][0].ToString()) < 0)
                    ddlloc.Items.Add(new ListItem(dvl.Table.Rows[i]["assembly"].ToString()+"-"+dvl.Table.Rows[i]["slot"].ToString(), dvl.Table.Rows[i][0].ToString()));
            }
        }
    }

    protected void butfree_Click(object sender, EventArgs e)
    {
        sdsloc.Update();
        Response.Redirect("troubleshooting.aspx");

    }

    protected void butreactivate_Click(object sender, EventArgs e)
    {
        sdsmac.Update();
        Response.Redirect("troubleshooting.aspx");
    }

    protected void remextra_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("delete from [plan] where job not in ( select jobID from job )",con);
        SqlCommand cmd2 = new SqlCommand("delete from [finishedfinal] where job not in ( select jobID from job )",con);
        SqlCommand cmd3 = new SqlCommand("delete from [job-worker] where job not in ( select jobID from job )",con);
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        con.Close();
        Response.Redirect("troubleshooting.aspx");
    }
}