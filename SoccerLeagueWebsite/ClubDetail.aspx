<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ClubDetail.aspx.cs" Inherits="ClubDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="gridStyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">

    <h1 style="text-align:center;">
    **CLUB DETAILS **
    </h1>
    <form runat="server">
        <div id="Login" style="font-size:30px; font-family:'Comic Sans MS';margin-left:13%;margin-top:10%; z-index: 1; left: -43px; top: -126px; position: absolute; height: 23px; width: 891px;">
      
      <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                 <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Underline="false" />
            </AnonymousTemplate>

            <LoggedInTemplate>
                &nbsp<asp:LoginName ID="LoginName1" runat="server" FormatString ="Hello, {0}" LogoutPageUrl="~/Login.aspx"/> 
                <asp:LoginStatus ID="LoginStatus2" runat="server" Font-Underline="false"/>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
        <div style="margin-left:8%" >
            <asp:linkbutton id="GoBackLink" runat="server" onclick="GoBackLink_Click" visible="False" forecolor="PaleTurquoise">CLUB DELETED SUCCESSFULLY !! Go Back to CLUBS List</asp:linkbutton>
        </div>

    <div style="margin-left:20%">
       
    <asp:DetailsView id="ClubDetailsView" runat="server" cellpadding="4" forecolor="#333333" autogeneraterows="False" onitemdeleting="ClubDetailsView_ItemDeleting">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ClubId" HeaderText="ID" />
            <asp:BoundField DataField="ClubName" HeaderText="CLUB NAME" />
            <asp:BoundField DataField="ClubCity" HeaderText="CITY" />
            <asp:BoundField DataField="Address" HeaderText="ADDRESS" />
            <asp:BoundField DataField="registrationNumber" HeaderText="REGISTRATION NUMBER" />
           
            <%--<asp:CommandField HeaderText="Delete Club" ShowDeleteButton="True" ShowHeader="True" />--%>
           
            <asp:CommandField  />
            <asp:TemplateField ShowHeader="true" HeaderText="DELETE THE CLUB">
                <ItemTemplate>
                    <asp:LinkButton ID="DeleteLinkButton"  Font-Bold="true" Font-Underline="false" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete Club" OnClientClick="return confirm('Are you sure you want to delete Club');" BorderWidth="2px"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
        </div><br />

        <asp:Literal ID="NoPlayerLiteral" runat="server" EnableViewState="false"></asp:Literal>

       <div style="margin-left:5%"> 
        <asp:GridView ID="PlayerGrid" runat="server" AutoGenerateColumns="False" 
            OnSelectedIndexChanged="PlayerGrid_SelectedIndexChanged" DataKeyNames="PlayerId">

            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="ProfileImg"  AlternateText="No Image" runat="server" Style="position: relative; height:60px; width: 50px" ImageUrl='<%# Eval("ProfileImage") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="playername" HeaderText="PLAYER NAME" />
                <asp:BoundField DataField="jerseynumber" HeaderText="JERSEY NUMBER" />
                <asp:BoundField DataField="DATEOFBIRTH" HeaderText="DATE OF BIRTH" />
                <asp:ButtonField Text="Update Details" CommandName="Select" ControlStyle-Font-Underline="false" >
<ControlStyle Font-Underline="False"></ControlStyle>
                </asp:ButtonField>
               <%-- <asp:ButtonField Text="Update Profile Picture" CommandName="Select" ControlStyle-Font-Underline="false" />--%>
                <%--<ItemTemplate>  
                      <asp:Image runat="server" ID="imgProfile" ImageUrl='<%# Eval("ImagePath") %>' Width="400px" Height="150px" />  
                </ItemTemplate>--%>
              
            </Columns>
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="gridRow" />
            <SelectedRowStyle CssClass="gridSelectedRow" />
        </asp:GridView>
        <br />
    <asp:Label ID="detailsLabel" runat="server" />
           </div>
        
        <div style="margin-left:30%">
          <asp:DetailsView ID="PLayerDetailView" runat="server" Height="50px" Width="15px" 
            AutoGenerateRows="False" OnItemUpdating="PLayerDetailView_ItemUpdating" OnItemCommand="PLayerDetailView_ItemCommand" OnModeChanging="PLayerDetailView_ModeChanging" OnItemDeleting="PLayerDetailView_ItemDeleting1">
           <Fields>
               <asp:TemplateField ShowHeader="true" HeaderText="DELETE THE Player">
                <ItemTemplate>
                    <asp:LinkButton ID="DeleteLinkButton"  Font-Bold="true" Font-Underline="false" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete Player" OnClientClick="return confirm('Are you sure you want to Remove the Player');" BorderWidth="2px"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="PlayerName">
        <EditItemTemplate>
          <asp:TextBox ID="editPlayerNameTextBox" runat="server" Text='<%# Bind("PlayerName") %>'></asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="insertPlayerNameTextBox" runat="server" Text='<%# Bind("PlayerName") %>'></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:Label ID="playerNameLabel" runat="server" Text='<%# Bind("PlayerName") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>

                 <asp:TemplateField HeaderText="JerseyNumber">
        <EditItemTemplate>
          <asp:TextBox ID="editJerseyNumberTextBox" runat="server" Text='<%# Bind("JerseyNumber") %>'></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Enter a number between 0 to 99" ControlToValidate="editJerseyNumberTextBox" Display="Dynamic" ForeColor="#CC0000" MaximumValue="99" MinimumValue="0" Type="Integer"></asp:RangeValidator>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="editJerseyNumberTextBox" Display="Dynamic" ErrorMessage="*Please Enter Jersey Number" ForeColor="Red"></asp:RequiredFieldValidator>
        
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="insertJerseyNumberTextBox" runat="server" Text='<%# Bind("JerseyNumber") %>'></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:Label ID="jerseyNumberLabel" runat="server" Text='<%# Bind("JerseyNumber") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>

                    <asp:TemplateField HeaderText="DateOfBirth">
        <EditItemTemplate>
          <asp:TextBox ID="editDateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
           </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="insertDateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
          <asp:Label ID="dateOfBirthLabel" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>

<%--                <asp:BoundField DataField="playername" HeaderText="Player Name" />
                <asp:BoundField DataField="dateofbirth" HeaderText="Date of Birth" />
                <asp:BoundField DataField="jerseynumber" HeaderText="Jersey Number" />--%>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"  ShowHeader="false" />
               
            </Fields>

             <HeaderTemplate>
                    <%#Eval("playername")%>
            </HeaderTemplate>

            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="gridRow" />
        </asp:DetailsView>
</div>
        <div style="margin-left:30%">
        <asp:DetailsView ID="ProfieDetailsView" runat="server" Height="50px" Width="125px"
            AutoGenerateRows="False" OnItemUpdating="ProfileDetailView_ItemUpdating" OnItemCommand="ProfileDetailView_ItemCommand" OnModeChanging="ProfileDetailView_ModeChanging" OnPageIndexChanging="ProfieDetailsView_PageIndexChanging">
             <Fields>

               <asp:TemplateField ShowHeader="false">
        <EditItemTemplate>
            <asp:FileUpload ID="profileFileUpload" runat="server" BackColor="wHITE" BorderColor="Gray" BorderWidth="3px" />
            <asp:Label ID="selectImageLabel" runat="server"  Text="Label" style ="color:Red"  Visible="false"></asp:Label>
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="insertProfileImageTextBox" runat="server" Text='<%# Bind("ProfileImage") %>'></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image runat="server" ID="imgProfile" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" AlternateText="NO PROFILE PICTURE ADDED FOR THIS PLAYER" /> 
            <asp:Literal runat="server" id="selectImageLiteral"></asp:Literal>
        </ItemTemplate>  
                 </asp:TemplateField>
                
                 <asp:CommandField ShowEditButton="True" ShowHeader="false" />
               </Fields>
            <HeaderTemplate>
                    <%#Eval("playername")%> - <strong>PROFILE IMAGE</strong>
            </HeaderTemplate>

            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="gridRow" />

        </asp:DetailsView>
        </div>





    </form>
         
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>

<%--Name: Sidharth Choudhary    Student#- 300990285--%>