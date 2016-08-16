<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="indentitytiti.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="admin">
   <p> 

        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
  <a  id="changepassword" "   href="changepassword.aspx">Change Password</a>

        &nbsp;&nbsp;
        <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
        <br />

        <br />

<a  id="adminLink" "   href="role.aspx">Add Roles</a>&nbsp; <a id="myregisterlink" "  href="myregister.aspx">Add Users</a>
        <br />
        <br />
     <h3>   Users and Roles Chart<br /> </h3>
        <br />



<div id="URC">
  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Name" HeaderText="Role" SortExpression="Name" />
            </Columns>
        </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.UserName, AspNetRoles.Name FROM AspNetRoles INNER JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId INNER JOIN AspNetUsers ON AspNetUserRoles.UserId = AspNetUsers.Id"></asp:SqlDataSource>
   </p>
        </div>
    
</asp:Content>