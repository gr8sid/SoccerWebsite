<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="AddClub.aspx.cs" Inherits="AddClub" %>
<%@ Register Src="~/AddDisplayClubs.ascx" TagName="AddClub" TagPrefix="AC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <h1 style="text-align:center;">
    **BE A PART OF OUR CLUBS**
</h1>
    <form runat="server">
      
    <div id="Login" style="font-size:30px; text-decoration:none; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="LOGIN" Font-Underline="false"  LogoutText="LOGOUT"/>
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server"  FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
       
        <div style="margin-left:10px">

        <AC:AddClub ID="AC" runat="server" />
        <div style =""> 
              <b>REGISTRATION NUMBER :</b><br /> <asp:TextBox ID="txtReg" runat="server"  Height="30px" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Enter Registration Number" ControlToValidate="txtReg" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
   <b> ADDRESS:</b><br /><asp:TextBox ID="txtAddress" runat="server"  Height="30px" Width="200px"></asp:TextBox>
        <br />
        <br />
                </div> 
        </div>
         <div style="margin-top:-30%; margin-left:50%; color:palevioletred;">
           <b> <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#009933" BorderColor="Black" BorderStyle="Ridge" BorderWidth="3px" ForeColor="#0033CC"></asp:Label></b>
         </div> 
             <div>
        
                 <div style="margin-left:15%; margin-top:30%;margin-right:15%; width:80%">
    <asp:Button ID="btnAddClub" runat="server" Text="SAVE CLUB" Font-Size="X-Large" BorderStyle="Outset" BorderWidth="3px" OnClick="btnAddClub_Click" BackColor="#00CC66" BorderColor="#006600"/>
       &nbsp;&nbsp;
          <asp:Button ID="BtnCancelClub" runat="server"  Text="CANCEL" Font-Size="X-Large" BorderStyle="Outset" BorderWidth="3px" CausesValidation="false" OnClick="btnCancelClub_Click" BackColor="#00CC66" BorderColor="#006600"/>
               &nbsp;&nbsp; 
         <asp:Button ID="btnAddPlayer" runat="server" Text="ADD PLAYERS" Font-Size="X-Large" BorderStyle="Outset" BorderWidth="3px" OnClick="btnAddPlayer_Click" BackColor="#00CC66" BorderColor="#006600"/>
   
                 </div> 
                     <br />
        <br />
        <br />
         <div style="margin-top:-10%; margin-left:30%; color:palevioletred;">
           <b> <asp:Label ID="playerAddLabel" runat="server" Text="Label" BackColor="#009933" BorderColor="Black" BorderStyle="Ridge" BorderWidth="3px" ForeColor="#0033CC"></asp:Label></b>
         </div>         
       
       <asp:Panel ID="playerPanel" runat="server" BorderColor="black"  BorderStyle="Solid" Height ="40%"  style="width:60%; align-content:center; margin-left:20%" BackColor="#CCCCFF"  Font-Names="Courier" HorizontalAlign="Center">
        <br /> <b>You can Add/Update Profile picture while updating the Player details!</b><br />
           <br />   <b>PLAYER NAME:</b> &nbsp;<asp:TextBox ID="txtPlayerName" runat="server"  Height="30px" Width="200px"></asp:TextBox>
        <br />
         <br /> <b>DATE OF BIRTH:</b>&nbsp;<asp:TextBox ID="txtDob" runat="server"  Height="30px" Width="200px"></asp:TextBox>
        <br />
         <br /> <b>JERSEY NUMBER:</b>&nbsp;<asp:TextBox ID="txtJerseyNo" runat="server"  Height="30px" Width="200px"></asp:TextBox>
           <br />
           <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Enter a number between 0 to 99" ControlToValidate="txtJerseyNo" Display="Dynamic" ForeColor="#CC0000" MaximumValue="99" MinimumValue="0" Type="Integer"></asp:RangeValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtJerseyNo" Display="Dynamic" ErrorMessage="*Please Enter Jersey Number" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
           <div style="margin-left:10%">
    <asp:Button ID="btnSavePlayer" runat="server" Text="SAVE PLAYER" Font-Size="X-Large" BorderStyle="Outset" BorderWidth="3px" OnClick="btnSavePlayer_Click" BackColor="#00CC66" BorderColor="#006600"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Font-Size="X-Large" BorderStyle="Outset" CausesValidation="false" BorderWidth="3px" OnClick="btnCancel_Click" BackColor="#00CC66" BorderColor="#006600"/>
        <br /></div> <br />

       </asp:Panel>

                 
        </div>     
            </form>
    
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
    <h1 style="text-align:center;">
    **Pages Under Construction**
</h1>
</asp:Content>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>