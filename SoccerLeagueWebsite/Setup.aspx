<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
 <form runat="server">

     <div id="Login" style="font-size:30px; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Underline="false" />
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server"  Font-Underline="false"/>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>

    <table style="border-style: ridge; border-width: 1px; padding: 0px 20px; width:100%">
        <tr>
            <td style="font-size: x-large; text-align: right"><b style="text-align: right">Select Theme</b></td>
            <td>
                <ul>
                    <li>
                        
                       <b><a href="Setup.aspx?theme=DarkTheme" style=" text-decoration:none; color:#3E2723;">DarkTheme</a></b>
                    </li>
                    <li>
                       <b><a href="Setup.aspx?theme=LightTheme" style=" text-decoration:none; color:#3E2723">LightTheme</a></b>
                    </li>
                </ul>

            </td>
        </tr>
    </table>
     <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" BorderColor="#990000" BorderStyle="Double" BorderWidth="3px" ForeColor="#0066FF" Width="200px" Height="50px" style="z-index: 1; left: 40%; top: 100px; position: absolute; font-size:30px" />
     </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>

<%--Name: Sidharth Choudhary    Student#- 300990285--%>