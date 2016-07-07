using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;

public partial class machineonholiday : System.Web.UI.Page
{
    string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)(machrunhol.Select(DataSourceSelectArguments.Empty));
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            mroht.Rows.Add(tr);
            TableCell c1 = new TableCell();
            TableCell c2 = new TableCell();
            tr.Cells.Add(c1);
            tr.Cells.Add(c2);
            c1.Text = Convert.ToDateTime(dv.Table.Rows[i][1].ToString()).ToShortDateString();
            c2.Text = dv.Table.Rows[i][2].ToString();
            c1.BorderWidth = 1;
            c2.BorderWidth = 1;
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();

        string cmd = "INSERT INTO [holiday-running-machine](holiday,machine) VALUES(@holi,@hmac)";
        SqlCommand command = new SqlCommand(cmd, conn);

        command.Parameters.AddWithValue("@hmac", ddlmach.SelectedValue);
        //command.Parameters.AddWithValue("@hdate", TextBoxHD.Text);
        command.Parameters.AddWithValue("@holi", DateTime.ParseExact(hid.Text, "dd-MM-yyyy", null));


        command.ExecuteNonQuery();

        conn.Close();
        Response.Redirect("machineonholiday.aspx");
    }
}