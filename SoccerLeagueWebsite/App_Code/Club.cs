using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Club
/// </summary>
public class Club
{
	public Club()
	{
		//
		// TODO: Add constructor logic here
		//
	}
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
    
}