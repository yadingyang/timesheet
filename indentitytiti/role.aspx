<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="role.aspx.cs" Inherits="indentitytiti.role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="role">
    
<p>

        <div>
            <h2>Add roles
            </h2>
            <div>
              
                <div>
       <p>             The name of new role：<asp:TextBox ID="TextBoxRoleName" runat="server"></asp:TextBox>
                    </p>
                    <asp:Button ID="ButtonRolechuangjian" runat="server" Text="Creat" OnClick="ButtonRolechuangjian_Click" />
                    <br />
                    <asp:Label ID="Labelcjts" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxRoleName" CssClass="text-warning" ErrorMessage="RequiredFieldValidator">Please type the name for the new role。</asp:RequiredFieldValidator>
                </div>
            </div>
</div>
  </p>  </div>
</asp:Content>




