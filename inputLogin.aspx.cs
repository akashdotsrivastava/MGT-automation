using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class inputLogin : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)(sdsadmin.Select(DataSourceSelectArguments.Empty));
        int flag = 0;
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            if((dv.Table.Rows[i][0].ToString()==tbid.Text)&&(dv.Table.Rows[i][1].ToString()==tbpw.Text))
            {
                flag = 1;
                Session["inp"] = tbid.Text;
                break;
            }
        }
        if (flag == 1)
        {
            Response.Redirect("assembly.aspx");

        }
        else Response.Redirect("inputLogin.aspx");

    }
}