using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminHOME : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"]!=null)
        {
            Server.Transfer("adminHOME.aspx");
        }
        
    }
    protected void adminLOGIN_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);
        string query = "SELECT * FROM admin WHERE adminID='" + textboxADMINID.Text + "' AND adminPW='" + textboxADMINPW.Text + "'";
        SqlDataAdapter dap = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        if (ds.Tables[0].Rows.Count == 1)
        {
            Session["admin"] = textboxADMINID.Text.ToString();
            Application["admin"] = textboxADMINID.Text.ToString();
            Response.Redirect("adminHOME.aspx");
        }
        else
        {
            textboxADMINID.Text = null;
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Wrong Credentials')", true);
        }
    }
}