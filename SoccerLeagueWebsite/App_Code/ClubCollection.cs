using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubCollection
/// </summary>
public class ClubCollection
{
    public List<Club> clubs { get; private set; }
	public ClubCollection()
	{
        clubs = new List<Club>();
	}
}