using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class machinetype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");

        DataView dvop = (DataView)(sdsoper.Select(DataSourceSelectArguments.Empty));
        if (!Page.IsPostBack)
        {
            for (int i = 0; i < dvop.Table.Rows.Count; i++)
            {
                cblist.Items.Add(new ListItem("("+ dvop.Table.Rows[i][2].ToString()+") "+dvop.Table.Rows[i][1].ToString()+" ("+dvop.Table.Rows[i][3].ToString()+")", dvop.Table.Rows[i][2].ToString()));
            }
        }

        

        
    }

    protected void submittype_Click(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            List<string> li = new List<string>();
            foreach (ListItem cbf in cblist.Items)
            {
                if (cbf.Selected)
                {
                    li.Add(cbf.Value.ToString());
                }
            }
            string final = string.Join(",", li);
            h1.Value = final;
            sdsmtype.Insert();
            Response.Redirect("machinetype.aspx");
        }
    }

    protected void selectall_CheckedChanged(object sender, EventArgs e)
    {
        if (selectall.Checked==true)
        {
            foreach (ListItem item in cblist.Items)
            {
                item.Selected = true;
            }
        }
        else
        {
            foreach (ListItem item in cblist.Items)
            {
                item.Selected = false;
            }
        }
    }

    protected void cbeditop_CheckedChanged(object sender, EventArgs e)
    {
        if (cbeditop.Checked == true)
        {
            ddleditop.Enabled = true;
            edittype.Enabled = true;
            tbmac.Enabled = false;
            submittype.Enabled = false;
        }
        else
        {
            ddleditop.Enabled = false;
            edittype.Enabled = false;
            tbmac.Enabled = true;
            submittype.Enabled = true;
            foreach (ListItem cbf in cblist.Items) cbf.Selected = false;

        }
    }

    protected void edittype_Click(object sender, EventArgs e)
    {
        List<string> li = new List<string>();
        foreach (ListItem cbf in cblist.Items)
        {
            if (cbf.Selected)
            {
                li.Add(cbf.Value.ToString());
            }
        }
        string final = string.Join(",", li);
        h1.Value = final;
        sdsmtype.Update();
        DataView dvm = (DataView)(reflectmac.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dvm.Table.Rows.Count; i++)
        {
            string mac = dvm.Table.Rows[i][0].ToString();
            hiddenmac.Value = mac;
            DataView dvj = (DataView)(reflectjob.Select(DataSourceSelectArguments.Empty));
            if(dvj.Table.Rows.Count>0)
            {
                hiddenjob.Value = dvj.Table.Rows[0][0].ToString();
                DataView dvplan = (DataView)(reflectplan.Select(DataSourceSelectArguments.Empty));
                dvplan.Sort = "phase";
                foreach(ListItem cbf in cblist.Items)
                {
                    if (cbf.Selected)
                    {
                        if(dvplan.Find(cbf.Value)<0)
                        {
                            hiddenphase.Value = cbf.Value;
                            string dtt = Convert.ToDateTime(dvj.Table.Rows[0]["startdate"]).ToShortDateString();
                            reflectplan.Insert();
                        }
                    }
                }

            }

        }

    }

    protected void ddleditop_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (ListItem cbf in cblist.Items) cbf.Selected = false;
        DataView dv = (DataView)(sdsmtype.Select(DataSourceSelectArguments.Empty));
        dv.Sort = "type";
        int i = dv.Find(ddleditop.SelectedValue);
        if(i>=0)
        {
            string ph = dv.Table.Rows[i][1].ToString();
            string []pharr = ph.Split(',');
            foreach (ListItem cbf in cblist.Items)
            {
                if (pharr.Contains<string>(cbf.Value.ToString())) cbf.Selected = true;
            }
        }
    }
}