using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class machineslotswap : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    DataView dv27,dv28,dvmac;
    protected void Page_Load(object sender, EventArgs e)
    {
    dv27 = (DataView)(sdc27.Select(DataSourceSelectArguments.Empty));
    dv28 = (DataView)(sdc28.Select(DataSourceSelectArguments.Empty));
    dvmac = (DataView)(mac.Select(DataSourceSelectArguments.Empty));
    dvmac.Sort = "locationID";
        if (!Page.IsPostBack)
        {
            for (int i = 0; i < dv27.Table.Rows.Count; i++)
            {
                int p = dvmac.Find(dv27.Table.Rows[i][0]);
                if (p >= 0)
                    ddlmac.Items.Add(new ListItem(dvmac.Table.Rows[p][0].ToString(), dvmac.Table.Rows[p][0].ToString()));
            }
        }
    }

    protected void ddlassembly_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlmac.Items.Clear();
        ddlchslot.Items.Clear();
        dvmac.Sort = "locationID";
        if (ddlassembly.SelectedIndex==0)
        {

            for (int i = 0; i < dv27.Table.Rows.Count; i++)
            {
                int p = dvmac.Find(dv27.Table.Rows[i][0]);
                if (p >= 0)
                    ddlmac.Items.Add(new ListItem(dvmac.Table.Rows[p][0].ToString(), dvmac.Table.Rows[p][0].ToString()));
            }
            for (int i = 0; i < dv27.Table.Rows.Count; i++)
            {
                if(dv27.Table.Rows[i]["occ"].ToString()=="0")
                ddlchslot.Items.Add(new ListItem(dv27.Table.Rows[i]["slot"].ToString(),dv27.Table.Rows[i]["Id"].ToString()));
            }
        }
        else
        {
            for (int i = 0; i < dv28.Table.Rows.Count; i++)
            {
                int p = dvmac.Find(dv28.Table.Rows[i][0]);
                if (p >= 0)
                    ddlmac.Items.Add(new ListItem(dvmac.Table.Rows[p][0].ToString(), dvmac.Table.Rows[p][0].ToString()));
            }
            for (int i = 0; i < dv28.Table.Rows.Count; i++)
            {
                if(dv28.Table.Rows[i]["occ"].ToString()=="0")
                ddlchslot.Items.Add(new ListItem(dv28.Table.Rows[i]["slot"].ToString(), dv28.Table.Rows[i]["Id"].ToString()));
            }
        }
    }

    protected void ddlmac_SelectedIndexChanged(object sender, EventArgs e)
    {
        dv27.Sort = "Id";
        dv28.Sort = "Id";
        dvmac.Sort = "machineID";
        if(ddlassembly.SelectedIndex==0)
        {
            tbcurrslot.Text = dv27.Table.Rows[dv27.Find(dvmac.Table.Rows[dvmac.Find(ddlmac.SelectedValue)][1].ToString())]["slot"].ToString();
        }
        else
        {
            tbcurrslot.Text = dv28.Table.Rows[dv28.Find(dvmac.Table.Rows[dvmac.Find(ddlmac.SelectedValue)][1].ToString())]["slot"].ToString();

        }
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        DataView dmac = (DataView)(mac.Select(DataSourceSelectArguments.Empty));
        dmac.Sort = "machineID";
        string originalloc = dmac.Table.Rows[dmac.Find(ddlmac.SelectedValue.ToString())][1].ToString();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("update [machine] set locationID=@l where machineID=@m",con);
        cmd1.Parameters.AddWithValue("@l",ddlchslot.SelectedValue);
        cmd1.Parameters.AddWithValue("@m",ddlmac.SelectedValue);
        SqlCommand cmd2 = new SqlCommand("update [location] set occ=1 where Id=@i", con);
        cmd2.Parameters.AddWithValue("@i",ddlchslot.SelectedValue);
        SqlCommand cmd3 = new SqlCommand("update [location] set occ=0 where Id=@oloc",con);
        cmd3.Parameters.AddWithValue("@oloc",originalloc);
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        con.Close();
        Response.Redirect("machineslotswap.aspx");
    }
}