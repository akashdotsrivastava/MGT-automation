using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class INPUT_c27 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["inp"] == null) Response.Redirect("inputLogin.aspx");
        DataView dv = (DataView)(SqlDataSourcelocation.Select(DataSourceSelectArguments.Empty));
        DataView dvv = (DataView)(SqlDataSourcemachine.Select(DataSourceSelectArguments.Empty));
        DataView dv2 = (DataView)(sqlloc2.Select(DataSourceSelectArguments.Empty));

        dvv.Sort = "locationID";

        foreach (TableRow tr in tcc.Rows)
        {
            foreach(TableCell tc in tr.Cells)
            {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    string x = tc.ID.ToString().TrimStart('a');
                    dv.Sort = "slot";
                    int t = dv.Find(x);
                    if (t >= 0)
                    {
                        for (int i = 0; i < dvv.Table.Rows.Count; i++)
                        {
                            if (dvv.Table.Rows[i]["locationID"].ToString() == dv.Table.Rows[t]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.ID = dvv.Table.Rows[i]["machineID"].ToString();
                                b.Text = b.ID;
                                tc.Controls.Add(b);
                                b.Height = 50;
                                b.Width = 75;
                                if (Convert.ToInt32(dvv.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.PostBackUrl = "inputmap.aspx?mid=" + b.ID;
                                    b.BackColor = System.Drawing.Color.Green;
                                }
                                else b.BackColor = System.Drawing.Color.Black;
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
        foreach (TableRow tr in td.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    string x = tc.ID.ToString().TrimStart('a');
                    dv.Sort = "slot";
                    int t = dv.Find(x);
                    if (t >= 0)
                    {
                        for (int i = 0; i < dvv.Table.Rows.Count; i++)
                        {
                            if (dvv.Table.Rows[i]["locationID"].ToString() == dv.Table.Rows[t]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.ID = dvv.Table.Rows[i]["machineID"].ToString();
                                b.Text = b.ID;
                                tc.Controls.Add(b);
                                b.Width = 75;
                                b.Height = 50;
                                if (Convert.ToInt32(dvv.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.PostBackUrl = "inputmap.aspx?mid=" + b.ID;

                                    b.BackColor = System.Drawing.Color.Green;
                                }
                                else b.BackColor = System.Drawing.Color.Black;
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
        foreach (TableRow tr in te.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    string x = tc.ID.ToString().TrimStart('a');
                    dv.Sort = "slot";
                    int t = dv.Find(x);
                    if (t >= 0)
                    {
                        for (int i = 0; i < dvv.Table.Rows.Count; i++)
                        {
                            if (dvv.Table.Rows[i]["locationID"].ToString() == dv.Table.Rows[t]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.ID = dvv.Table.Rows[i]["machineID"].ToString();
                                b.Text = b.ID;
                                tc.Controls.Add(b);
                                b.Width = 75;
                                b.Height = 50;
                                if (Convert.ToInt32(dvv.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.BackColor = System.Drawing.Color.Green;
                                    b.PostBackUrl = "inputmap.aspx?mid=" + b.ID;

                                }
                                else b.BackColor = System.Drawing.Color.Black;
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
        foreach (TableRow tr in tf.Rows)
        {
            foreach (TableCell tc in tr.Cells)
            {
                string p = tc.ID.ToString();
                if (p[0] == 'a')
                {
                    string x = tc.ID.ToString().TrimStart('a');
                    dv.Sort = "slot";
                    int t = dv.Find(x);
                    if (t >= 0)
                    {
                        for (int i = 0; i < dvv.Table.Rows.Count; i++)
                        {
                            if (dvv.Table.Rows[i]["locationID"].ToString() == dv.Table.Rows[t]["Id"].ToString())
                            {
                                Button b = new Button();
                                b.ID = dvv.Table.Rows[i]["machineID"].ToString();
                                b.Text = b.ID;
                                b.Height = 50;
                                tc.Controls.Add(b);
                                b.Width = 75;
                                if (Convert.ToInt32(dvv.Table.Rows[i]["a_status"].ToString()) == 1)
                                {
                                    b.BackColor = System.Drawing.Color.Green;
                                    b.PostBackUrl = "inputmap.aspx?mid=" + b.ID;

                                }
                                else b.BackColor = System.Drawing.Color.Black;
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