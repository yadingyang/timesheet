<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mylogin.aspx.cs" Inherits="indentitytiti.mylogin" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <Div id="loginbox" class="form-group">
   
    <h3   >Please Login</h3>
    <p   >
        &nbsp;</p>
    <h3   >
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </h3>
  <p>       <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        </p>
    <p>       
        <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" ></asp:TextBox>
        </p>
    <p>       
        <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="Login" class="btn" ForeColor="#666666" />
        &nbsp;
        
        </p>
 </Div>


      
    </div>
      
    </div>


 





    
    </asp:Content>