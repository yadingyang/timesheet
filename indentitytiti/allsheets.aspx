<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allsheets.aspx.cs" Inherits="indentitytiti.allsheets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        All stuffs&#39; Timesheets</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ClockOut" HeaderText="ClockOut" SortExpression="ClockOut" />
                <asp:BoundField DataField="ClockIn" HeaderText="ClockIn" SortExpression="ClockIn" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ClockOut], [ClockIn], [UserName] FROM [Timesheets]"></asp:SqlDataSource>
    </form>
</body>
</html>
