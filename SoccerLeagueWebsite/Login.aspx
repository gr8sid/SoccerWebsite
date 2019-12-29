<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 .remove  
  {
    text-decoration:none;
            z-index: 1;
            right:10px;
            top: 10px;
            position: absolute;
            font-weight:bold;
            border:ridge;
            border-color:black;
            border-width:5px;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <form runat="server">
        <%--<div >
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="remove" ForeColor="#FF3300" >&nbsp LOGOUT &nbsp </asp:LinkButton>
        </div>--%>
     

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <%--<asp:LoginStatus ID="LoginStatus1" runat="server" />--%>
                <asp:Login ID="Login1" runat="server" CreateUserText="REGISTER NOW" Font-Underline="false" LoginButtonStyle-BorderColor="Black" LoginButtonStyle-BorderWidth="3px" LoginButtonStyle-Height="30px" LoginButtonStyle-Width="120px" LoginButtonStyle-Font-Size="Large" HyperLinkStyle-Font-Bold="true" HyperLinkStyle-Font-Underline="false" CreateUserUrl="Register.aspx" >        
        </asp:Login>
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false"/>
            </LoggedInTemplate>
        </asp:LoginView>
        
            </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>

<%--Name: Sidharth Choudhary    Student#- 300990285--%>