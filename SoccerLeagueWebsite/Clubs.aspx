<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Clubs.aspx.cs" Inherits="Clubs" %>
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

        <div id="Login" style="font-size:30px; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Underline="false" />
                Restricted Page
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false"/>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>

   <table style="align-content:center; width:50%; margin-left:25%; border:groove; border-width:3px"> 
       <tr>
           <th><b>CLUB NAMES</b><hr /></th>
           
       </tr>
       
      <tr>
          <td>
          <asp:DataList ID="ClubDetailsList" runat="server" OnItemCommand="ClubDetailsList_ItemCommand">
              <ItemTemplate>
                  <%# Eval("CLUBID") %>. 
             <asp:LinkButton ID="DetailsButton" runat="server" CommandName="MoreDetailsButton" CommandArgument = '<%# Eval("CLUBID") %>' Font-Underline="false" Font-Size="X-Large" ForeColor="#006600" ><%# Eval("CLUBNAME") %></asp:LinkButton>
            <asp:Literal ID="extraDetailsLiteral" runat="server" EnableViewState="false"></asp:Literal>
              </ItemTemplate>
          </asp:DataList> 
          </td>
      </tr>
   </table>
 
      </form>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
    <h1 style="text-align:center;">
    **Pages Under Construction**
</h1>
</asp:Content>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>