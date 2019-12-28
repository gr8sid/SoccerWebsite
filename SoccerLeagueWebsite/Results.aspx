<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Results" %>
<%@ Import Namespace="System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script runat="server"> 
        void UploadFile(Object s, EventArgs e)
        {    if (playerFileUpload.HasFile)
            {
                string fileName = playerFileUpload.FileName;
                playerFileUpload.SaveAs(MapPath("~/IMAGES/Players/" + fileName));
                label.Text = "File " + fileName + " uploaded.";
            }
            else
                label.Text = "No file uploaded!";
        } 

    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
<h1 style="text-align:center;">
    **LEAGUE RESULTS**
</h1>
    <form runat="server">
        <div id="Login" style="font-size:30px; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Underline="false"/>
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>

    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
<h1 style="text-align:center;">
    **Pages Under Construction**
</h1>
</asp:Content>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>