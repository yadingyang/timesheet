<%@ Page Title="Add User Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myregister.aspx.cs" Inherits="indentitytiti.myregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="register">
  <p>  

      &nbsp;<h3>  Add Users </h3>
       <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <br />
        <br />
   <p>     <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Comfirm Password"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Choose User's Role"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Stuff</asp:ListItem>
            <asp:ListItem>Leader</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
        </asp:DropDownList>
       </p>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" ForeColor="#666666" />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
     
      </p>     </div>
    </asp:Content>