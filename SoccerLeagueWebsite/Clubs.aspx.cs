using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class Clubs : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
    SqlConnection conn = new SqlConnection();
    int clubIdSelected;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            databind();
        }
        
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
    }

    private void databind()
    {
        conn.ConnectionString = connectionString;
        SqlCommand comm = new SqlCommand("select clubid,clubname from clubs", conn);
        SqlDataReader reader;

        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            ClubDetailsList.DataSource = reader;
            ClubDetailsList.DataBind();
        }

        finally
        {
            conn.Close();
        }
         

    }
    
    protected void ClubDetailsList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName== "MoreDetailsButton")
        {
           // Literal li;
            //li = (Literal)e.Item.FindControl("extraDetailsLiteral");
           clubIdSelected = Convert.ToInt32(e.CommandArgument);
            Session["clubIdSelected"] = clubIdSelected;
            //li.Text = "Club Id: <strong>" + Session["clubIdSelected"] + "</strong><br />";
            Response.Redirect("ClubDetail.aspx");
        }
    }
}
//Name: Sidharth Choudhary    Student#- 300990285















/*
     * while (reader.Read())
            {
                DataList dl = new DataList(reader["clubname"}.ToString());
                for(int i = 0; i < reader.FieldCount; i++)
                {
                    ClubDetailsList.a
                }
            }
     * 
     * 
     * public class club
    {
        private string clubName;

        public string ClubName
        {
            get { return clubName; }
            set { clubName = value; }
        }
        private string clubCity;

        public string ClubCity
        {
            get { return clubCity; }
            set { clubCity = value; }
        }

    }*/






