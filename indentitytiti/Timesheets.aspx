<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timesheets.aspx.cs" Inherits="indentitytiti.Timesheets" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 
    <div id="TMS">
    <p>
     <h3>   <asp:Label ID="Label1" runat="server" Text="Please Choose the Date You Want to Check"></asp:Label> </h3>
    
  
       <div id="tmsheet">  
    
  
         <asp:Calendar ID="Calendar1" runat="server" SelectionMode="Day" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px" >
             <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
             <NextPrevStyle VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#808080" />
             <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
             <SelectorStyle BackColor="#CCCCCC" />
             <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
             <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
             <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
        <br />
    
  
         <asp:GridView ID="Timesh" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="ClockIn" HeaderText="ClockIn" SortExpression="ClockIn" />
                <asp:BoundField DataField="ClockOut" HeaderText="ClockOut" SortExpression="ClockOut" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName], [ClockIn], [ClockOut], [Date] FROM [Timesheets] WHERE (([UserName] = @UserName) AND ([Date] = @Date))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label2" Name="UserName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Label3" Name="Date" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
    
  
        &nbsp;
    
  
      </div>

        <asp:Label ID="Label2" runat="server" Text="userid" Visible="false"></asp:Label>

 </p> 

    </div>
    </div>
 </asp:Content>
