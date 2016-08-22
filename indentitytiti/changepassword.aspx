<%@ Page Title="Change Password"  Language="C#"MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="indentitytiti.changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="CPW">
    
  
        <p>
          <h2>Change Password</h2>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>
        <p>
            New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            Comfirm Password&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>

        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <p>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </p>
  </div>

         </asp:Content>
