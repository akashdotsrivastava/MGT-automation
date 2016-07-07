using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class random : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["automationConnectionString"].ConnectionString);
    double totalHours = 0;
    double TotalDays = 0;
    DateTime StartDate = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry = "SELECT * FROM phase";
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader OperationList = cmd.ExecuteReader();

        //create a table with phase name in each row
        while (OperationList.Read())
        {
            TableRow PhaseRow = new TableRow();

            TableCell PhaseCellName = new TableCell();
            PhaseCellName.ID = OperationList[0].ToString();
            PhaseCellName.Text = OperationList[1].ToString();
            PhaseRow.Cells.Add(PhaseCellName);

            TableCell PhaseDuration = new TableCell();
            PhaseDuration.ID = "Duration" + PhaseCellName.ID;
            PhaseDuration.Text = OperationList[3].ToString();
            PhaseRow.Cells.Add(PhaseDuration);

            //TableCell StartDay = new TableCell();
            //PhaseRow.Cells.Add(StartDay);
            //TableCell EndDay = new TableCell();
            //PhaseRow.Cells.Add(EndDay);

            TableStatus.Rows.Add(PhaseRow);
        }
        con.Close();

        //Declare table header for StartDate
        //TableHeaderCell StartDate = new TableHeaderCell();
        //StartDate.ID = "TableHeaderStartDate";
        //StartDate.Text = "Start Date";
        //TableStatus.Rows[0].Cells.Add(StartDate);
        
        //TableHeaderCell EndDate = new TableHeaderCell();
        //EndDate.ID = "TableHeaderEndDate";
        //EndDate.Text = "End Date";
        //TableStatus.Rows[0].Cells.Add(EndDate);

    }
    protected void DropDownListRunningJobs_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView DataViewRunningJobs = (DataView)(SqlDataSourceRunningJobs.Select(DataSourceSelectArguments.Empty));
        string qry = "SELECT CONVERT(DATE,startdate) FROM job WHERE jobid=" + DropDownListRunningJobs.SelectedValue;
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader StartDateFromDB = cmd.ExecuteReader();

        while (StartDateFromDB.Read())
        {
            StartDate = (DateTime)StartDateFromDB[0];
        }
        con.Close();

        List<double> phaseEndDay = CalculateDays();
        InsertColumns();
        CreateHeaderRowDays();
        CreateChart(phaseEndDay);
    }

    private List<double> CalculateDays()
    {
        totalHours = 0;
        List<double> phaseEndDay = new List<double>();
        //according to each phaseDuration in table, calculate duration in days
        foreach (TableRow PhaseRows in TableStatus.Rows)
        {
            double TempDuration = 0;
            double.TryParse(PhaseRows.Cells[1].Text, out TempDuration);
            totalHours += TempDuration;
            TotalDays += Math.Ceiling(TempDuration / 8.0);
            phaseEndDay.Add(Math.Ceiling(totalHours / 8.0));
            //PhaseRows.Cells[2].Text = (Math.Ceiling(totalHours / 8.0)).ToString(); //add date of previous phase to it
        }
        phaseEndDay.Remove(0);
        return phaseEndDay;
    }
    private void InsertColumns()
    {
        //TotalDays = Math.Ceiling(totalHours / 8.0);
        foreach (TableRow PhaseRow in TableStatus.Rows)
        {
            for (int i = 0; i < TotalDays; i++)//after inserting start date at index 2, insert cells for remaining dates
            {
                TableCell day = new TableCell();
                day.ID = PhaseRow.Cells[0].ID + "D" + i;
                day.Text = day.ID;
                PhaseRow.Cells.Add(day);
            }
        }
    }
    private void CreateHeaderRowDays()
    {
        for (int i = 0; i < TotalDays; i++)
        {
            TableStatus.Rows[0].Cells[i+2].Text = StartDate.AddDays(i).ToShortDateString();
        }
    }
    private void CreateChart(List<double> phaseEndDay)
    {
        int PhaseCounter = 1;
        double Day = 0;
        foreach (double EndDate in phaseEndDay)
        {
            for (int i = (int)Day; i <= EndDate; i++)
            {
                TableStatus.Rows[PhaseCounter].Cells[i+2].BackColor = System.Drawing.Color.Aqua;
            }
            Day = EndDate;
            PhaseCounter++;
        }
    }

}