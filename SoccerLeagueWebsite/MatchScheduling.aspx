<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="MatchScheduling.aspx.cs" Inherits="MatchScheduling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FooterContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <h1 style="text-align:center;">
    **SCHEDULE THE MATCHES**
</h1>

    <form id="matchSchduleForm" runat="server">

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

   <div id="ddl1" style="margin-left:10%;  margin-top:5%">
       <asp:Label ID="Label1" runat="server" Text="HOST TEAM" style="z-index: 1; left: 10%; top: 10%; position: absolute; font-size:x-large; font-weight:900"></asp:Label>
       <asp:DropDownList ID="HostDropDownList" runat="server" style="z-index: 1; left:10%; top: 15%; position: absolute; width: 124px; height: 31px; right: 428px;" AutoPostBack="True" OnSelectedIndexChanged="HostDropDownList_SelectedIndexChanged"></asp:DropDownList>
       <asp:Label ID="Label2" runat="server" Text="GUEST TEAM" style="z-index: 1; right: 10%; top: 10%; position: absolute; font-size:x-large; font-weight:900"></asp:Label>
       <asp:DropDownList ID="GuestDropDownList" runat="server" style="z-index: 1; right:10%; top: 15%; position: absolute; width: 124px; height: 31px" AutoPostBack="True" OnSelectedIndexChanged="GuestDropDownList_SelectedIndexChanged"></asp:DropDownList>
   </div>
        <div style="height: 311px">
            <asp:Label ID="Label3" runat="server" Text="*SELECT THE MATCH DATE*" style="z-index: 1; left: 30%; top: 20%; position: absolute; right: 107px;" Font-Bold="False"></asp:Label>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" Width="400px" style="z-index: 1; left: 25%; top: 25%; position: absolute; height: 193px; width: 356px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged" DayNameFormat="Shortest" TitleFormat="Month">
        <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
        <NextPrevStyle Font-Size="11pt" ForeColor="White" Font-Underline="False" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#FF6600" BorderColor="#999966" BorderStyle="Solid" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
        <TodayDayStyle BackColor="#CCCC99" />
    </asp:Calendar>
            <asp:Button ID="ConfirmMatch" runat="server" Text="CONFIRM MATCH"  style="z-index: 1; left: 312px; top: 55%; position: absolute" OnClick="ConfirmMatch_Click" BackColor="#6699FF" BorderColor="#FFFFCC" BorderStyle="Ridge" BorderWidth="2px" ForeColor="#FFFFCC" Height="40px" Width="150px" />
            <br /><br />
            <asp:Label ID="Label4" runat="server" Text="LIST OF MATCHES:" style="z-index: 1; left: 108px; top: 62%; position: absolute; font-size:x-large; right: 446px;"></asp:Label>                      <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" style="z-index: 1; left: 10%; top: 65%; position: absolute; height: 188px; width: 75%; margin-top: 0px" Width="150%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="hostteam" HeaderText="HOST TEAM" />
                    <asp:BoundField DataField="guestteam" HeaderText="GUEST TEAM" />
                    <asp:BoundField DataField="matchdate" HeaderText="MATCH DATE" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
           
        </div>
        <div style="z-index: 1; left: 10%; top: 45%; position: absolute">
         <asp:Literal ID="ExistingMatchLiteral1" runat="server" EnableViewState="False" ></asp:Literal><br />
         <asp:Literal ID="ExistingMatchLiteral2" runat="server" EnableViewState="False"></asp:Literal>
            </div>
        </form>
    
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContentPlaceHolder" Runat="Server">
    <h1 style="text-align:center;">

    **Pages Under Construction**
</h1>
</asp:Content>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>