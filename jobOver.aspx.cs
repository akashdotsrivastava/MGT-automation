using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class jobOver : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["jid"] == null) Response.Redirect("assembly.aspx");
        jo.Text = Request.QueryString["jid"].ToString();

        DataView dvdist = (DataView)(remjobwdistinct.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dvdist.Table.Rows.Count; i++)
        {
            h1.Value = dvdist.Table.Rows[i][0].ToString();
            DataView dvfinal = (DataView)(remfinal.Select(DataSourceSelectArguments.Empty));
            if(dvfinal.Table.Rows.Count%2==1)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into [job-worker](job,wid,time,status) values(@j,@w,@t,@s)",con);
                cmd.Parameters.AddWithValue("@j",Request.QueryString["jid"].ToString());
                cmd.Parameters.AddWithValue("@w",h1.Value);
                cmd.Parameters.AddWithValue("@t",DateTime.Now);
                cmd.Parameters.AddWithValue("@s","REMOVED");
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }
}