﻿<%@ Page Title="Leader Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="leader.aspx.cs" Inherits="indentitytiti.leader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div id="leader">
    <p>   
        &nbsp;<h3>   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </h3>
     <a  id="changepass" "   href="changepassword.aspx">Change Password</a>



    
        <p>   
            &nbsp;<p>
            Check 
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            &#39;s Timesheet<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>

        
            <asp:HyperLink ID="HyperLink1" runat="server">Submit</asp:HyperLink>

        
            &nbsp;</p>

        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
        <br />
        <br />
        </p> 
  </div>
 
         </asp:Content>

    