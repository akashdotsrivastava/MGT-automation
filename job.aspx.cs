using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class job : System.Web.UI.Page
{
    private Dictionary<string, CheckBox> fDynamicControls = new Dictionary<string, CheckBox>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();

        string cmd = "INSERT INTO job(machineID,customerID,groupleaderID,worker2ID,startdate) VALUES(@mId,@cId,@gId,@wId,@sdID)";
        SqlCommand command = new SqlCommand(cmd, conn);

        command.Parameters.AddWithValue("@mId", DropDownList1.SelectedValue);
        command.Parameters.AddWithValue("@cId", DropDownList2.SelectedValue);
        command.Parameters.AddWithValue("@gId", ddlGroupLeader.SelectedValue);
        command.Parameters.AddWithValue("@wId", DropDownList4.SelectedValue);
        command.Parameters.AddWithValue("@sdID",DateTime.ParseExact(TextBoxSD.Text,"dd-MM-yyyy",null));
        //command.Parameters.AddWithValue("@cpId", DropDownList5.SelectedValue);

        command.ExecuteNonQuery();

        conn.Close();
        GridView1.Sort("machineID", SortDirection.Ascending);

        SqlDataSourcemachine.Update();

        DataView dvj = (DataView)(sdcj.Select(DataSourceSelectArguments.Empty));
        DataView dvw = (DataView)(sdcw.Select(DataSourceSelectArguments.Empty));
        dvw.Sort = "workerID";
        for (int i = 0; i < dvj.Table.Rows.Count; i++)
        {
            h.Value = dvj.Table.Rows[i][5].ToString();
            sdcw.Update();
            h.Value = dvj.Table.Rows[i][6].ToString();
            sdcw.Update();

        }

        DataView dvpcurrentjob = (DataView)(selectcurrentjob.Select(DataSourceSelectArguments.Empty));
        currjob.Value = dvpcurrentjob.Table.Rows[0][0].ToString();
        makeplan(dvpcurrentjob.Table.Rows[0][0].ToString(), Convert.ToDateTime(dvpcurrentjob.Table.Rows[0]["startdate"]));

        conn.Open();
        SqlCommand cm = new SqlCommand("insert into [job-worker](job,wid,time,status) values(@j1,@w1,@t1,@s1)", conn);
        cm.Parameters.AddWithValue("@j1",currjob.Value);
        cm.Parameters.AddWithValue("@t1", DateTime.ParseExact(TextBoxSD.Text, "dd-MM-yyyy", null));
        cm.Parameters.AddWithValue("@s1","ADDED");
        cm.Parameters.AddWithValue("@w1",ddlGroupLeader.SelectedValue);
        cm.ExecuteNonQuery();
        cm = new SqlCommand("insert into [job-worker](job,wid,time,status) values(@j2,@w2,@t2,@s2)", conn);
        cm.Parameters.AddWithValue("@j2", currjob.Value);
        cm.Parameters.AddWithValue("@t2", DateTime.ParseExact(TextBoxSD.Text, "dd-MM-yyyy", null));
        cm.Parameters.AddWithValue("@s2", "ADDED");
        cm.Parameters.AddWithValue("@w2",DropDownList4.SelectedValue);
        cm.ExecuteNonQuery();
        conn.Close();


        Response.Redirect("job.aspx");
    }

    public void makeplan(string job,DateTime sd)
    {
        DataView dvp = (DataView)(sdcp.Select(DataSourceSelectArguments.Empty));
        dvp.Sort = "phaseORDER";
        DataView dvmac = (DataView)(newsdsmac.Select(DataSourceSelectArguments.Empty));
        hh1.Value = dvmac.Table.Rows[0][1].ToString();
        DataView dvmactyp = (DataView)(newsdsmactype.Select(DataSourceSelectArguments.Empty));
        char[] splitchar = { ',' };
        string[] li = dvmactyp.Table.Rows[0][1].ToString().Split(splitchar);
        foreach (string str in li)
        {
            x1.Value = job;
            x2.Value = str;
            sdsplan.Insert();  
        }
        DateTime init = sd;
        foreach (string str in li)
        {
            x1.Value = job;
            x2.Value = str;
            double duration = Convert.ToDouble(dvp.Table.Rows[dvp.Find(str)]["phaseDURATION"]);
            duration = duration / 7.5;
            int dur = (int)(duration);
            if (dur == 0) dur = 1;
            List<string> p = new List<string>();
            DateTime dt;
            for(dt= init;dt<init.AddDays(dur);dt=dt.AddDays(1))
            {
                string tobe = dt.ToShortDateString();
                p.Add(tobe);
            }
            init = dt;
            x3.Value = string.Join(",",p);
            sdsplan2.Update();
        }
    }
    
}