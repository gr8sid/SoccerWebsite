using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

//Name: Sidharth Choudhary    Student#- 300990285
public partial class AddClub : System.Web.UI.Page
{
    public static int clubNo;
    public static int playerNo = 0; 
    string connectionString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
    SqlConnection conn = new SqlConnection();
    SqlCommand comm;
    SqlCommand comPlayer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            btnAddPlayer.Visible = false;
            playerPanel.Visible = false;
            Label1.Visible = false;
            playerAddLabel.Visible = false;
        }
        
        conn.ConnectionString = connectionString;
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
    }
    protected void btnAddClub_Click(object sender, EventArgs e)
    {
        if (AC.textBoxClub == null)
            btnAddPlayer.Visible = false;
        else
            btnAddPlayer.Visible = true;

        if (AC.textBoxCity == null)
            btnAddPlayer.Visible = false;
        else
            btnAddPlayer.Visible = true;

        if (txtReg.Text == null)
            btnAddPlayer.Visible = false;
        else
            btnAddPlayer.Visible = true;

        if (txtAddress.Text == null)
            btnAddPlayer.Visible = false;
        else
            btnAddPlayer.Visible = true;
        Label1.Text = "Club added Successfully";

        string clubName = AC.textBoxClub;
        string clubCity = AC.textBoxCity;
        string regNo = txtReg.Text;
        string address = txtAddress.Text;
        //int id = clubNo + 1;
        clubNo++;
        comm = new SqlCommand("insert into clubs values (@clubName, @clubCity, @regNo, @address)", conn);
        //comm.Parameters.AddWithValue("@id", id);
        comm.Parameters.AddWithValue("@clubName", AC.textBoxClub);
        comm.Parameters.AddWithValue("@clubCity", AC.textBoxCity);
        comm.Parameters.AddWithValue("@regNo", txtReg.Text);
        comm.Parameters.AddWithValue("@address", txtAddress.Text);
        Label1.Visible = true;
        Label1.Text = "Club " + clubName + " added Successfully";
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            conn.Close();
        }

    }

    protected void btnAddPlayer_Click(object sender, EventArgs e)
    {
        playerPanel.Visible = true;
    }
    protected void btnSavePlayer_Click(object sender, EventArgs e)
    {
        comm = new SqlCommand("select MAX(clubid) from clubs", conn);
        try
        {
            conn.Open();
            clubNo = Convert.ToInt32(comm.ExecuteScalar());
        }
        finally
        {
            conn.Close();
        }
        playerNo++;
        string playerName = txtPlayerName.Text;
        string dob = txtDob.Text;
        int jerserNo = Convert.ToInt32(txtJerseyNo.Text);
        comm = new SqlCommand("insert into players(clubid,playername,jerseynumber,dateofbirth) values (@clubId, @playerName, @jerseyNo, @dob)", conn);
        //comm.Parameters.AddWithValue("@playerId", playerNo);
        comm.Parameters.AddWithValue("@clubId", clubNo);
        comm.Parameters.AddWithValue("@playerName", playerName);
        comm.Parameters.AddWithValue("@jerseyNo", jerserNo);
        comm.Parameters.AddWithValue("@dob", dob);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            playerAddLabel.Visible = true;
            playerAddLabel.Text = "Player " + playerName + " added Successfully";
        }

        finally
        {
            conn.Close();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
         
        RequiredFieldValidator3.Enabled = false;
      
        txtPlayerName.Text = string.Empty;
        txtDob.Text = string.Empty;
        txtJerseyNo.Text = string.Empty;


    }
    protected void btnCancelClub_Click(object sender, EventArgs e)
    {
        AC.clearmethod();
        txtReg.Text = string.Empty;
        txtAddress.Text = string.Empty;
        btnAddPlayer.Visible = false;
        playerPanel.Visible = false;
        Label1.Text = " ";
    }
}

//Name: Sidharth Choudhary    Student#- 300990285