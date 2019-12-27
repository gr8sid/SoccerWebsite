<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <form runat="server"> 
  <div id="Login" style="font-size:30px; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Underline="false"/>
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false"/>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    </form>
    <div style="align-items:center;margin-left:35%;margin-top:5px">
    <b><a href="Setup.aspx" class="ref" style="text-decoration:none; font-size:30px; border:groove;">Change Theme</a></b>
    </div><hr />
      

<h1 class="aboutus">
    !!About Us!!
</h1>
    <p class ="text">
        At CSL, we make every effort to re-create a professional Soccer sports league 
        environment for adult recreational players - ensuring that you get the 
        most out of your leisure time and hard-earned money.Cent Soccer League's 
        outdoor leagues are entering their 4th season offering men's, co-ed and 
        women's outdoor leagues to over 100 players in the Scarborough area. 
        All games are played on turf with locations at Progress Ave, 
        Centennial College and a new field at Morningside Campus. 
        This popular league is sanctioned by the Toronto Soccer Association 
        and Ontario Soccer Association, and offers a safe environment with 
        professional referees in all of their recreational and competitive programs.
        <br /><br />
       <img src="IMAGES/soccer.jpg" style="margin-left:30px; width:90%;height:42%; border-color:#b4e53a"; />
    </p>
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
    
    <h1 style="text-align:center;">
   We are Here!! Join Us  
        </h1>
<%--<form id="form2" runat="server" style="margin-left:20px;">
<p style="font-family:Elephant;font-size:30px;">E-Mail: &nbsp <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="200px">Enter E-mail</asp:TextBox><br /><br />
Contact: <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="200px">Enter Contact Number</asp:TextBox></p>
   <p style="text-align:center"><asp:Button ID="Button1" runat="server" Text="Submit Details" ForeColor="#339966" Font-Size="X-Large" BorderStyle="Outset" BorderWidth="3px" OnClick="Button1_Click" /></p>
</form>--%>

</asp:Content>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>