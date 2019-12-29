using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
        switch (Request.QueryString["theme"])
        {
            case "DarkTheme":
                Page.Theme = "ThemeDark";
                break;

            case "LightTheme":
                Page.Theme = "ThemeLight";
                break;
        }

       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // HttpCookie myCookie = new HttpCookie("UserSettings");
        switch (Request.QueryString["theme"])
        {
            case "DarkTheme":
              Session["theme"] = "ThemeDark";
         //       myCookie["theme"] = "ThemeDark";
                break;

            case "LightTheme":
             Session["theme"] = "ThemeLight";
           //     myCookie["theme"] = "ThemeLight";
                break;
        }
        //myCookie.Expires = DateTime.Now.AddDays(1d);
        //Response.Cookies.Add(myCookie);
        Response.Redirect("Home.aspx");
    }
}
//Name: Sidharth Choudhary    Student#- 300990285