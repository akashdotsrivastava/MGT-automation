using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class INPUT_c28 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");

        DataView dvm = (DataView)(SqlDataSourcemachine.Select(DataSourceSelectArguments.Empty));
            DataView dvl = (DataView)(SqlDataSourcelocation.Select(DataSourceSelectArguments.Empty));
            dvl.Sort = "slot";
            dvm.Sort = "locationID";
            foreach (TableRow tr in ta.Rows)
            {
                foreach (TableCell tc in tr.Cells)
                {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    tc.ID = tc.ID.ToString().TrimStart('a');
                    int x = dvl.Find(tc.ID);
                    if (x >= 0)
                    {
                        for (int i = 0; i < dvm.Table.Rows.Count; i++)
                        {
                            if (dvm.Table.Rows[i]["locationID"].ToString() == dvl.Table.Rows[x]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.Text = dvm.Table.Rows[i]["machineID"].ToString();
                                b.ID = dvm.Table.Rows[i]["machineID"].ToString();
                                tc.Controls.Add(b);
                                b.Width = 75;
                                b.Height = 50;
                                if (Convert.ToInt32(dvm.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.BackColor = System.Drawing.Color.Green;
                                    b.PostBackUrl = "inputMap.aspx?mid=" + b.ID;
                                }
                                else
                                    b.BackColor = System.Drawing.Color.Black;
                                b.ForeColor = System.Drawing.Color.White;
                            }
                        }
                    }
                }
                else
                {
                    string x = tc.ID.ToString().TrimStart('s');
                    tc.Text = x;
                    tc.BackColor = System.Drawing.Color.Black;
                    tc.ForeColor = System.Drawing.Color.White;
                }

                }
            }
            foreach (TableRow tr in tb.Rows)
            {
                foreach (TableCell tc in tr.Cells)
                {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    tc.ID = tc.ID.ToString().TrimStart('a');
                    int x = dvl.Find(tc.ID);
                    if (x >= 0)
                    {
                        for (int i = 0; i < dvm.Table.Rows.Count; i++)
                        {
                            if (dvm.Table.Rows[i]["locationID"].ToString() == dvl.Table.Rows[x]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.Text = dvm.Table.Rows[i]["machineID"].ToString();
                                b.ID = dvm.Table.Rows[i]["machineID"].ToString();
                                b.Width = 75;
                                b.Height = 50;
                                tc.Controls.Add(b);
                                if (Convert.ToInt32(dvm.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.BackColor = System.Drawing.Color.Green;
                                    b.PostBackUrl = "inputmap.aspx?mid=" + b.ID;

                                }
                                else
                                    b.BackColor = System.Drawing.Color.Black;
                                b.ForeColor = System.Drawing.Color.White;

                            }
                        }
                    }
                }
                else
                {
                    string x = tc.ID.ToString().TrimStart('s');
                    tc.Text = x;
                    tc.BackColor = System.Drawing.Color.Black;
                    tc.ForeColor = System.Drawing.Color.White;
                }

                }

            }
        
    }

    
}
