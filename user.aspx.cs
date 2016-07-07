using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Server.Transfer("admin.aspx");
        else
            admin.Text = "ADMIN " + Session["admin"].ToString();
    }

    protected void submitADMIN_Click(object sender, EventArgs e)
    {
        if (tadpw.Text == "root")
        {
            SqlDataSourceADMIN.Insert();
            Response.Redirect("user.aspx");
        }
        else
            Response.Redirect("user.aspx");
    }

    protected void addSV_Click(object sender, EventArgs e)
    {
        try
        {
            if (SqlDataSourceSV.Insert() != 0)
            {
                tsvid.Text = "";
                tsvpw.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Registered Stats viewer with username:" + tsvid.Text + "')", true);
            }
        }
        catch (SqlException SqlException)
        {
            tsvid.Text = "";
            tsvpw.Text = "";
            string message = SqlException.ErrorCode.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "confirm('Error code: " + message + "')", true);
        }
    }
}