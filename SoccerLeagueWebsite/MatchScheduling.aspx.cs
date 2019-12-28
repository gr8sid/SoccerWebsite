using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class MatchScheduling : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
    SqlConnection conn = new SqlConnection();
    private List<DateTime> listDates;
 
    protected void Page_Load(object sender, EventArgs e)
    {
        listDates = new List<DateTime>();
        if (!IsPostBack)
        {
            databind();
        }
        

    }

    private void rebuildDropdownLists()
    {
        HostDropDownList.Items[0].Attributes["Disabled"] = "Disabled|";
        GuestDropDownList.Items[0].Attributes["Disabled"] = "Disabled|";
        if (HostDropDownList.SelectedValue != null)
        {
            GuestDropDownList.Items[HostDropDownList.SelectedIndex].Attributes["Disabled"] = "Disabled|";
        }
       if (GuestDropDownList.SelectedValue != null)
        {
            HostDropDownList.Items[GuestDropDownList.SelectedIndex].Attributes["Disabled"] = "Disabled|";
        }
        disableDates();
    }
    private void databind()
    {
        HostDropDownList.Items.Clear();
        GuestDropDownList.Items.Clear();
        HostDropDownList.Items.Insert(0, "Select");
        HostDropDownList.Items[0].Selected = true;
        HostDropDownList.Items[0].Attributes["Disabled"] = "Disabled|";
        GuestDropDownList.Items.Insert(0, "Select");
        GuestDropDownList.Items[0].Selected = true;
        GuestDropDownList.Items[0].Attributes["Disabled"] = "Disabled|";

        conn.ConnectionString = connectionString;
        SqlCommand comm = new SqlCommand("select clubname from clubs ", conn);
        SqlDataReader ClubReader;
       
        SqlCommand gridcom = new SqlCommand("select * from matches ", conn);
        SqlDataReader gridReader;

        try
        {
            conn.Open();
            
            gridReader = gridcom.ExecuteReader();
            GridView1.DataSource = gridReader;
            GridView1.DataBind();
            gridReader.Close();

            ClubReader = comm.ExecuteReader();
            if (ClubReader.HasRows)
            {
                while (ClubReader.Read())
                {
                    HostDropDownList.Items.Add(ClubReader[0].ToString());
                    GuestDropDownList.Items.Add(ClubReader[0].ToString());
                }
            }
            ClubReader.Close();
        }

        finally
        {
            conn.Close();
        }

    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }

    }

    protected void HostDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        rebuildDropdownLists();
        //disableDates();
    }

    protected void GuestDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        rebuildDropdownLists();
        //disableDates();
    }


    protected void disableDates()
    {
        conn.ConnectionString = connectionString;
        SqlDataAdapter da;
        DataSet ds = new DataSet();

        ds.Reset();
        da = new SqlDataAdapter("Select * from Matches", conn);
        da.Fill(ds);
        string selectedHostClub = HostDropDownList.SelectedValue.ToString();
        string selectedGuestClub = GuestDropDownList.SelectedValue.ToString();
        int rowcount = ds.Tables[0].Rows.Count;
        int row;

        for (row = 0; row < rowcount; row++)
        {
            if (selectedHostClub == ds.Tables[0].Rows[row][1].ToString() || selectedGuestClub == ds.Tables[0].Rows[row][1].ToString()
                || selectedHostClub == ds.Tables[0].Rows[row][2].ToString() || selectedGuestClub == ds.Tables[0].Rows[row][2].ToString())
            {
                string date = ds.Tables[0].Rows[row][3].ToString();
                DateTime selectedDate = DateTime.Parse(date);
                listDates.Add(selectedDate);
                listDates.Add(selectedDate.AddDays(1));
                listDates.Add(selectedDate.AddDays(2));
                listDates.Add(selectedDate.AddDays(-1));
                listDates.Add(selectedDate.AddDays(-2));
                string displayDate = selectedDate.ToShortDateString();
                

                if (selectedHostClub == ds.Tables[0].Rows[row][1].ToString() || selectedHostClub == ds.Tables[0].Rows[row][2].ToString())
                {
                    ExistingMatchLiteral1.Visible = true;
                    ExistingMatchLiteral1.Text = "Club: " + selectedHostClub + " is having match on " + displayDate;
                }
              

                if (selectedGuestClub == ds.Tables[0].Rows[row][1].ToString() || selectedGuestClub == ds.Tables[0].Rows[row][2].ToString())
                {
                    ExistingMatchLiteral2.Text = "Club: " + selectedGuestClub + " is having match on " + displayDate;
                }
                
            }
        }
    }

    protected void ConfirmMatch_Click(object sender, EventArgs e)
    {
        if (Calendar1.SelectedDate.Date == DateTime.MinValue.Date || HostDropDownList.SelectedIndex==0 || GuestDropDownList.SelectedIndex==0)
        {
            Label3.Font.Bold = true;
            Label3.Text = "**!!!!PLEASE SELECT AN APPROPRIATE VALUE!!!!**"; 
        }
        else
        {
            conn.ConnectionString = connectionString;
            string hostname = HostDropDownList.SelectedItem.ToString();
            string guestname = GuestDropDownList.SelectedItem.ToString();
            string selectedDate = Calendar1.SelectedDate.ToShortDateString();
            SqlCommand matchCom = new SqlCommand("INSERT INTO matches(hostteam,guestteam,matchdate) values (@hostname,@guestname,@matchdate)", conn);
            matchCom.Parameters.AddWithValue("@hostname", hostname);
            matchCom.Parameters.AddWithValue("@guestname", guestname);
            matchCom.Parameters.AddWithValue("@matchdate", selectedDate); 

            try
            {
                conn.Open();
                matchCom.ExecuteNonQuery();
            }

            finally
            {
                conn.Close();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Match scheduled successfully')");
                Response.Redirect("MatchScheduling.aspx");
            }
        }
        //disableDates();
        rebuildDropdownLists();
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        //disableDates();
        rebuildDropdownLists();
        if (e.Day.Date.CompareTo(DateTime.Today) < 0)
        {
            e.Cell.BackColor = System.Drawing.Color.LightGray;
            e.Day.IsSelectable = false;
        }
        
        foreach (DateTime d in listDates)
        {
            Calendar1.SelectedDates.Add(d);
            //Calendar1.SelectedDates.SelectRange(d, d.AddDays(2));
            //Calendar1.SelectedDates.SelectRange(d, d.AddDays(-2));
           
            if (e.Day.IsSelected)
            {
                e.Cell.BackColor = System.Drawing.Color.LightCoral;
                e.Day.IsSelectable = false;
            }
            

        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        rebuildDropdownLists();
    }

    protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        rebuildDropdownLists();
    }
}
//Name: Sidharth Choudhary    Student#- 300990285