using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class worker2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
        if (!IsPostBack)
        {
            DropDownListLeaders.Visible = false;
            DropDownListLeaders.Enabled = false;
        }
    }
    protected void RadioButtonWorker_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButtonWorker.Checked)
        {
            DropDownListLeaders.Visible = true;
            DropDownListLeaders.Enabled = true;
        }
        else if (!RadioButtonWorker.Checked)
        {
            DropDownListLeaders.Visible = false;
            DropDownListLeaders.Enabled = false;
        }
    }
    protected void RadioButtonGroupLeader_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButtonWorker.Checked)
        {
            DropDownListLeaders.Visible = true;
            DropDownListLeaders.Enabled = true;
        }
        else if (!RadioButtonWorker.Checked)
        {
            DropDownListLeaders.Visible = false;
            DropDownListLeaders.Enabled = false;
        }
    }
    protected void btnSubmitWORKER_Click(object sender, EventArgs e)
    {
        if (RadioButtonGroupLeader.Checked)
        {
            SqlDataSourceAddWorker.InsertParameters["groupLeader"].DefaultValue = TextBox_workername.Text;
        }
        else
        {
            SqlDataSourceAddWorker.InsertParameters["groupLeader"].DefaultValue = DropDownListLeaders.SelectedItem.Text;
        }
        SqlDataSourceAddWorker.InsertParameters["joindate"].DefaultValue = DateTime.Now.ToString();
        SqlDataSourceAddWorker.Insert();
        TextBox_workername.Text = "";
        DropDownListLeaders.ClearSelection();
        DropDownListLeaders.DataBind();
        GridView1.Sort("groupLeader", SortDirection.Ascending);
    }

}