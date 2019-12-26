<%--Name: Sidharth Choudhary    Student#- 300990285--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddDisplayClubs.ascx.cs" Inherits="AddDisplayClubs" %>

<div>

<b> CLUB NAME</b> :<br /> <asp:TextBox ID="txtClub" runat="server"  Height="30px" Width="200px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please Enter Club Name " ControlToValidate="txtClub" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
    <b>CLUB CITY:</b><br /> <asp:TextBox ID="txtCity" runat="server"  Height="30px" Width="200px">
    </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Enter Club City" ControlToValidate="txtCity" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><br />

</div>
<%--Name: Sidharth Choudhary    Student#- 300990285--%>