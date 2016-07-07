using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class inputMap : System.Web.UI.Page
{
    //private Dictionary<string, TextBox> fDynamicControls = new Dictionary<string, TextBox>();
    DataView dvps;
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    void Page_PreRender (object obj, EventArgs e)
    {
        ViewState["update"] = Session["update"];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");

        if (Request.QueryString["mid"] == null)
            Response.Redirect("assembly.aspx");

        machineID.Text = Request.QueryString["mid"].ToString();
       // machineID.PostBackUrl="macDesc.aspx?mid="+ Request.QueryString["mid"].ToString();
        dvps = (DataView)(SqlDataSourcephasess.Select(DataSourceSelectArguments.Empty));
        dvps.Sort = "phaseORDER";
        DataView dvj = (DataView)(SqlDataSourcejob.Select(DataSourceSelectArguments.Empty));
        DataView dvc = (DataView)(SqlDataSourcecustomer.Select(DataSourceSelectArguments.Empty));
        h2.Value = dvj.Table.Rows[0]["jobID"].ToString();
        dvc.Sort = "custID";
        jid.Value = dvj.Table.Rows[0]["jobID"].ToString();
        jobID.Text = dvj.Table.Rows[0]["jobID"].ToString();
        //jobID.PostBackUrl="jobDesc.aspx?jid="+ dvj.Table.Rows[0]["jobID"].ToString();
        customer.Text = dvc.Table.Rows[dvc.Find(dvj.Table.Rows[0]["customerID"].ToString())]["custName"].ToString();
        //customer.PostBackUrl = "custDesc.aspx?cid=" + dvj.Table.Rows[0]["customerID"].ToString();
        DataView dvff = (DataView)(sdsff.Select(DataSourceSelectArguments.Empty));
        DataView dvspa = (DataView)(sdsplantoactual.Select(DataSourceSelectArguments.Empty));

        if (!IsPostBack)
        {
            Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            for (int i = 0; i < dvspa.Table.Rows.Count; i++)
            {
                int p = dvps.Find(dvspa.Table.Rows[i]["phase"].ToString());
                ddlop.Items.Add(new ListItem(dvps.Table.Rows[p]["phaseNAME"].ToString()+" ("+ dvps.Table.Rows[p]["phaseDURATION"].ToString()+")", dvps.Table.Rows[p]["phaseORDER"].ToString()));
            }
        }
        
        int op = 0;
        for (int i = 0; i <dvff.Table.Rows.Count ; i++)
        {
            TableRow tr = new TableRow();
            tr.ID = "r"+dvff.Table.Rows[i][0].ToString();
            tblinput.Rows.Add(tr);
            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            TableCell c3 = new TableCell();
            TableCell c4 = new TableCell();
            TableCell c5 = new TableCell();
            TableCell c6 = new TableCell();
            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            tr.Cells.Add(c3);
            tr.Cells.Add(c4);
            tr.Cells.Add(c5);
            tr.Cells.Add(c6);

            Button bdel = new Button();
            c6.Controls.Add(bdel);
            bdel.ID = "b" + tr.ID.ToString().TrimStart('r');
            bdel.Click += Bdel_Click;
            bdel.Attributes.CssStyle.Add("CssClass","btn btn-danger");
            bdel.Text = "REMOVE";
            bdel.CausesValidation = false;

            if (Convert.ToInt32(dvff.Table.Rows[i]["phase"]) != op)
            {
                c1.Text = dvps.Table.Rows[dvps.Find(dvff.Table.Rows[i]["phase"])]["phaseNAME"].ToString();
                op = Convert.ToInt32(dvff.Table.Rows[i]["phase"]);
            }
            c2.Text = dvff.Table.Rows[i]["date"].ToString();

            DropDownList ddlhours = new DropDownList();
            ddlhours.ID = "h" + tr.ID.ToString().TrimStart('r');
            c3.Controls.Add(ddlhours);
            ddlhours.AutoPostBack = true;
            ddlhours.DataSourceID = "sdshr";
            ddlhours.DataTextField = "hr";
            ddlhours.DataValueField = "hr";
            ddlhours.SelectedIndexChanged += Ddlhours_SelectedIndexChanged;
            ddlhours.SelectedValue = dvff.Table.Rows[i]["hours"].ToString();

            DropDownList ddlstatus = new DropDownList();
            ddlstatus.ID = "s" + tr.ID.ToString().TrimStart('r');
            c4.Controls.Add(ddlstatus);
            ddlstatus.AutoPostBack = true;
            ddlstatus.DataSourceID = "sdsst";
            ddlstatus.DataValueField = "val";
            ddlstatus.DataTextField = "stat";
            ddlstatus.SelectedIndexChanged += Ddlstatus_SelectedIndexChanged;
            ddlstatus.SelectedValue = dvff.Table.Rows[i]["status"].ToString();

            DropDownList ddlcomm = new DropDownList();
            ddlcomm.ID = "c" + tr.ID.ToString().TrimStart('r');
            c5.Controls.Add(ddlcomm);
            ddlcomm.AutoPostBack = true;
            ddlcomm.DataSourceID = "SqlDataSourceCauseOfDelay";
            ddlcomm.DataValueField = "Id";
            ddlcomm.DataTextField = "cod";
            ddlcomm.SelectedIndexChanged += Ddlcomm_SelectedIndexChanged;
            ddlcomm.SelectedValue = dvff.Table.Rows[i]["comment"].ToString();
        }







    }

    private void Ddlcomm_SelectedIndexChanged(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
        DropDownList dd = (DropDownList)sender;
        con.Open();
        SqlCommand cmd = new SqlCommand("update finishedfinal set comment=" + dd.SelectedValue + " where Id=" + dd.ID.ToString().TrimStart('c'), con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void Ddlstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
        DropDownList dd = (DropDownList)sender;
        con.Open();
        SqlCommand cmd = new SqlCommand("update finishedfinal set status=" + dd.SelectedValue + " where Id=" + dd.ID.ToString().TrimStart('s'), con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void Ddlhours_SelectedIndexChanged(object sender, EventArgs e)
    {
        //throw new NotImplementedException();
        DropDownList dd = (DropDownList)sender;
        con.Open();
        SqlCommand cmd = new SqlCommand("update finishedfinal set hours="+dd.SelectedValue+" where Id="+dd.ID.ToString().TrimStart('h'),con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void Bdel_Click(object sender, EventArgs e)
    {
        Button bh = (Button)sender;
        string ide = bh.ID.ToString().TrimStart('b');
        //throw new NotImplementedException();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from finishedfinal where Id="+ide,con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("inputmap.aspx?mid=" + Request.QueryString["mid"].ToString());
    }

    protected void btnprogress_Click(object sender, EventArgs e)
    {
        Session["bu"] = "inputMap.aspx?mid="+Request.QueryString["mid"];
        Response.Redirect("jobprogress.aspx?jid="+jobID.Text+"&mid="+machineID.Text);
    }



    protected void btnfinish_Click(object sender, EventArgs e)
    {
        
            DateTime dt = DateTime.Now;
            h5.Value = dt.ToString();
            sdj3.Update();
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
            string qrr2 = "update machine set w_status=0, a_status=0, locationID=0 where machineID=@mac";
            string qrr1 = "select locationID from machine where machineID=@mac";
            string qrr3 = "update location set occ=0 where Id=@id";
            SqlCommand cmd = new SqlCommand(qrr1,con);
            SqlCommand cmd2 = new SqlCommand(qrr2, con);
            SqlCommand cmd3 = new SqlCommand(qrr3, con);
            
        cmd.Parameters.AddWithValue("@mac",machineID.Text);
        cmd2.Parameters.AddWithValue("@mac", machineID.Text);

        con.Open();
        int id = Convert.ToInt32(cmd.ExecuteScalar());
        cmd3.Parameters.AddWithValue("@id",id);
        cmd2.ExecuteNonQuery();

        cmd3.ExecuteNonQuery();
            con.Close();
            Response.Redirect("jobOver.aspx?jid=" + jid.Value.ToString());

        
    }



    protected void btnadd_Click(object sender, EventArgs e)
    {
        if(ViewState["update"].ToString()==Session["update"].ToString())
        sdsff.Insert();
        Response.Redirect("inputmap.aspx?mid="+Request.QueryString["mid"].ToString());
    }

    protected void btngoplan_Click(object sender, EventArgs e)
    {
        Response.Redirect("planning.aspx?mid="+Request.QueryString["mid"].ToString()+"&jid="+jid.Value);
    }

    protected void cbfin_CheckedChanged(object sender, EventArgs e)
    {
        if (cbfin.Checked == true) btnfinish.Enabled = true;
        else btnfinish.Enabled = false;
    }

    protected void addremoveworkers_Click(object sender, EventArgs e)
    {
        Session["bu"] = "inputMap.aspx?mid=" + Request.QueryString["mid"].ToString(); 
        Response.Redirect("addremoveworker.aspx?jid="+jid.Value+"&mid="+Request.QueryString["mid"].ToString());
    }
}