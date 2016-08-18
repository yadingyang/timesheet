<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timesheets.aspx.cs" Inherits="indentitytiti.Timesheets" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="TMS">
        <p>
            <h3>
                <asp:Label ID="Label1" runat="server" Text="Please Choose the Date You Want to Check"></asp:Label>
            </h3>


            <div id="tmsheet">


                <asp:Calendar ID="Calendar1" runat="server" SelectionMode="Day" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px">
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


                <asp:GridView ID="Timesheetview" runat="server" AutoGenerateColumns="False">

                    <Columns>
 <asp:BoundField HeaderText="Username" DataField="UserName" ReadOnly="true" />
<asp:BoundField HeaderText="ClockIn" DataField="ClockIn" ReadOnly="true" />
 <asp:BoundField HeaderText="ClockOut" DataField="ClockOut" ReadOnly="true" />


                    </Columns>



                </asp:GridView>




                <br />


                &nbsp;
    
  
            </div>

            <asp:Label ID="Label2" runat="server" Text="userid" Visible="false"></asp:Label>

            &nbsp;
    
  
        <asp:Label ID="Label3" runat="server" Text="currentdate" Visible="false"></asp:Label>


        </p>

    </div>
    </div>
</asp:Content>
