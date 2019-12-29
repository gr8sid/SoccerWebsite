using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.Management;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class ClubDetail : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
    SqlConnection conn = new SqlConnection();
    private static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack && flag == 1)
        {
            GoBackLink.Visible = true;
            ClubDetailsView.Visible = false;
            PlayerGrid.Visible = false;
            PLayerDetailView.Visible = false;
            flag = 0;
        }

        else if (flag == 2)
        {
            // Display Alert after a player is deleted
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Player Deleted Successfully')", true);
            databind();
            flag = 0;
        }
        else if (!IsPostBack)
        {
            databind();
        }
        

    }

    private void databind()
    {
        int clubNum = Convert.ToInt32(Session["clubIdSelected"]);

        conn.ConnectionString = connectionString;
        SqlCommand comm = new SqlCommand("select * from clubs where clubid =  @id", conn);
        comm.Parameters.AddWithValue("@id", clubNum);
        SqlDataReader reader, playerReader;

        SqlCommand comPlayer = new SqlCommand("select * from players where clubid = @id", conn);
        comPlayer.Parameters.AddWithValue("@id", clubNum);


        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            ClubDetailsView.DataSource = reader;
            ClubDetailsView.DataBind();
            reader.Close();

            playerReader = comPlayer.ExecuteReader();

            if (!playerReader.HasRows)
            {
                NoPlayerLiteral.Text = "NO PLAYER ADDED IN THIS CLUB";
            }
            else
            {
                PlayerGrid.DataSource = playerReader;
                PlayerGrid.DataKeyNames = new string[] { "playerId" };
                PlayerGrid.DataBind();
                playerReader.Close();
            }

        }

        finally
        {
            conn.Close();
        }

    }


 

    protected void ClubDetailsView_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {

        int clubNum = Convert.ToInt32(Session["clubIdSelected"]);
        conn.ConnectionString = connectionString;
        SqlCommand comDeletePlayer = new SqlCommand("delete from players where exists ( select * from players where clubid = @id) and clubid = @id ", conn);
        comDeletePlayer.Parameters.AddWithValue("@id", clubNum);
        SqlCommand comDeleteClub = new SqlCommand("delete from clubs where clubid = @id", conn);
        comDeleteClub.Parameters.AddWithValue("@id", clubNum);
        try
        {
            conn.Open();
            comDeletePlayer.ExecuteNonQuery();
            comDeleteClub.ExecuteNonQuery();
            flag = 1;
            Response.Redirect("ClubDetail.aspx");
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            comDeleteClub.Dispose();
            comDeletePlayer.Dispose();
            conn.Close();
        }
    }

    protected void GoBackLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clubs.aspx");
    }



    protected void PlayerGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int selectedIndexRow;
        //selectedIndexRow = PlayerGrid.SelectedIndex;
        //GridViewRow row = PlayerGrid.Rows[selectedIndexRow];
        //string name = row.Cells[0].Text;
        //detailsLabel.Text = "You Selected : " + name + ".";
        //detailsLabel.Visible = true;
        //detailsLabel.Text = "byee";
        bindDetail();
        bindProfileDetail();
    }

    protected void bindProfileDetail()
    {
        int selectedIndexRow;
        selectedIndexRow = PlayerGrid.SelectedIndex;
        int playerId = (int)PlayerGrid.DataKeys[selectedIndexRow].Value;
        conn.ConnectionString = connectionString;
        SqlCommand comm = new SqlCommand("select playerid,PLAYERNAME,profileimage from players where playerid = @playerid", conn);
        //comm.Parameters.AddWithValue("@id", playerId);
        comm.Parameters.Add("playerid", SqlDbType.Int);
        comm.Parameters["playerid"].Value = playerId;
        flag = 0;
        SqlDataReader reader;
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
           
            ProfieDetailsView.DataSource = reader;
            ProfieDetailsView.DataKeyNames = new string[] { "playerid" };
            ProfieDetailsView.DataBind();
            reader.Close();
        }

        finally
        {
            conn.Close();
        }

    }

    protected void bindDetail()
    {
        int selectedIndexRow;
        selectedIndexRow = PlayerGrid.SelectedIndex;
        int playerId = (int)PlayerGrid.DataKeys[selectedIndexRow].Value;
        //detailsLabel.Text = playerId.ToString();
        conn.ConnectionString = connectionString;
        SqlCommand comm = new SqlCommand("select playerid,playername,jerseynumber,dateofbirth from players where playerid = @playerid", conn);
        //comm.Parameters.AddWithValue("@id", playerId);
        comm.Parameters.Add("playerid", SqlDbType.Int);
        comm.Parameters["playerid"].Value = playerId;
        flag = 0;
        SqlDataReader reader;
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            PLayerDetailView.DataSource = reader;
            PLayerDetailView.DataKeyNames = new string[] { "playerid" };
            PLayerDetailView.DataBind();
            reader.Close();
        }

        finally
        {
            conn.Close();
        }
    }
    protected void PLayerDetailView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {

    }

    protected void PLayerDetailView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int playerid = (int)PLayerDetailView.DataKey.Value;
        TextBox newPlayerNameTxt = (TextBox)PLayerDetailView.FindControl("editPlayerNameTextBox");
        TextBox newJerseyNumberTxt = (TextBox)PLayerDetailView.FindControl("editJerseyNumberTextBox");
        TextBox newDateOfBirthTxt = (TextBox)PLayerDetailView.FindControl("editDateOfBirthTextBox");

        string newPlayerName = newPlayerNameTxt.Text;
        string newJerseyNumber = newJerseyNumberTxt.Text;
        string newDateOfBirth = newDateOfBirthTxt.Text;
        conn.ConnectionString = connectionString;
        SqlCommand com;
        com = new SqlCommand("update players set playername=@newname, dateofbirth=@newDateOfBirth, jerseynumber=@newJerseyNumber where playerid=@playerid", conn);
        com.Parameters.AddWithValue("@playerid", playerid);
        com.Parameters.AddWithValue("@newname", newPlayerName);
        com.Parameters.AddWithValue("@newDateOfBirth", newDateOfBirth);
        com.Parameters.AddWithValue("@newJerseyNumber", newJerseyNumber);
        flag = 0;
        try
        {
            conn.Open();
            com.ExecuteNonQuery();
        }

        finally
        {
            conn.Close();
        }
        PLayerDetailView.ChangeMode(DetailsViewMode.ReadOnly);
        
       databind();
        bindDetail();
    }

    protected void PlayerGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void PLayerDetailView_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        PLayerDetailView.ChangeMode(e.NewMode);        
        bindDetail();
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
    }

    protected void ProfileDetailView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {

    }

   
    protected void ProfileDetailView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

        int playerid = (int)ProfieDetailsView.DataKey.Value;
       // TextBox newPlayerProfileImage = (TextBox)ProfieDetailsView.FindControl("editProfileImage");
        FileUpload newProfileImage = (FileUpload)ProfieDetailsView.FindControl("profileFileUpload");
        Literal selectImageLiteral = (ProfieDetailsView.FindControl("selectImageLiteral") as Literal);

        if (newProfileImage.HasFile)
        {

            Label newlabel = (Label)ProfieDetailsView.FindControl("selectImageLabel");
            string fileName = newProfileImage.FileName;
            newProfileImage.SaveAs(MapPath("~/IMAGES/Players/" + fileName));
            string newImgPath = "~/IMAGES/Players/" + fileName;
            string fileExtension = Path.GetExtension(fileName);

            if (fileExtension.Equals(".jpg") || fileExtension.Equals(".jpeg") || fileExtension.Equals(".gif") || fileExtension.Equals(".png"))
            {
                if (fileName.Length < 100)
                {
                    try
                    {
                        conn.ConnectionString = connectionString;
                        SqlCommand com;
                        com = new SqlCommand("update players set profileimage=@newProfileImage where playerid=@playerid", conn);
                        com.Parameters.AddWithValue("@playerid", playerid);
                        com.Parameters.AddWithValue("@newProfileImage", newImgPath);
                        try
                        {
                            conn.Open();
                            com.ExecuteNonQuery();
                        }

                        finally
                        {
                            conn.Close();
                        }
                        ProfieDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
                        bindProfileDetail();
                        bindDetail();
                        databind();  
                    }

                    catch(Exception ex)
                    {
                        newlabel.Visible = true;
                        newlabel.Text = "Upload status: The file could not be uploaded due to error :" + ex.Message;
                    }
                }
                else
                {
                    newlabel.Visible = true;
                    newlabel.Text = "Upload status: The file could not be uploaded.File Name too large";
                }

            }
            else
            {
                newlabel.Visible = true;
                newlabel.Text = "Please Select a .gif, .jpg or .png file!";

            }
        }
        else
        {
            Label newlabel = (Label)ProfieDetailsView.FindControl("selectImageLabel");
            newlabel.Visible = true;
            newlabel.Text = "No file uploaded!";
        }

    }

    protected void ProfileDetailView_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        ProfieDetailsView.ChangeMode(e.NewMode);
        bindProfileDetail();
    }

    protected void ProfieDetailsView_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
    }

    protected void uploadButton_Click(object sender, EventArgs e)
    {

    }

    protected void PLayerDetailView_ItemDeleting1(object sender, DetailsViewDeleteEventArgs e)
    {

        int selectedIndexRow;
        selectedIndexRow = PlayerGrid.SelectedIndex;
        int playerId = (int)PlayerGrid.DataKeys[selectedIndexRow].Value;

        conn.ConnectionString = connectionString;
        SqlCommand comDeletePlayer = new SqlCommand("delete from players where playerid = @id", conn);
        comDeletePlayer.Parameters.AddWithValue("@id", playerId);

        try
        {
            conn.Open();
            comDeletePlayer.ExecuteNonQuery();
            flag = 2;
            
            //Response.Redirect("ClubDetail.aspx");
            Response.Redirect(Request.RawUrl);

        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            comDeletePlayer.Dispose();
            conn.Close();
        }

    }
}
//Name: Sidharth Choudhary    Student#- 300990285