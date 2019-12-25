using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Players
/// </summary>
public class Players
{
    public string playerName { get; set; }
    public string dob { get; set; }
    public int jerseyNum { get; set; }

    public static int playerNo = 0;
	public Players(string name, int jerseyNo)
	{
        playerNo++;
        playerName = "Player" + playerNo + name;
        
        jerseyNum = jerseyNo;
	}
}