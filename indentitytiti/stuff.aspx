<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="stuff.aspx.cs" Inherits="indentitytiti.stuff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="stuffpage">
    <p>
        
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" />
   
        <p>
        
            &nbsp;&nbsp;&nbsp;&nbsp;
           
        <h3>
       
            <asp:Label ID="Label1" runat="server" Text="Please Login"></asp:Label>
        
  
        
        </h3>
        <p>&nbsp;</p>
        
            <asp:Button ID="ClockIn" runat="server" Text="Clock In" OnClick="ClockIn_Click" Height="105px" Width="205px" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ClockOut" runat="server" Text="Clock Out" OnClick="ClockOut_Click" Height="105px" Width="205px" />
       
       
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
       
       
            <br />
       
       
            <br />
       
       
        
        <br />
        
  
        
        <br />
        
  
        
            <a  id="changepw" "   href="changepassword.aspx">Change Password</a>&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" >Check My Timesheet</asp:HyperLink> 
        
        <br />
        
        <br />
        
        <br />
    <br />
        
        <br />
           
    </p>
      </div>
     </asp:Content>
