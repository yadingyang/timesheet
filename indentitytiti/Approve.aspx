<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Approve.aspx.cs" Inherits="indentitytiti.Approve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="TMS">
        <p>
            &nbsp;<h3>
                <asp:Label ID="Label1" runat="server" Text="Please Choose the Date You Want to Check"></asp:Label>
                &nbsp;
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


                <asp:GridView ID="Timesheetview" runat="server" AutoGenerateColumns="False" OnRawCommand="RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="CancelingEdit" OnRowEditing="Editing" OnRowUpdating="Updating" OnRowDeleting="Deleting" >

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                    <Columns>
                        <asp:BoundField HeaderText="Username" DataField="UserName" ReadOnly="true" />
                        <asp:BoundField HeaderText="Date" DataField="Date" ReadOnly="true" />
                        <asp:BoundField HeaderText="ClockIn" DataField="ClockIn" ReadOnly="true" />
                        <asp:BoundField HeaderText="ClockOut" DataField="ClockOut" ReadOnly="true" />
                        <asp:BoundField HeaderText="Duration" DataField="Duration" ReadOnly="true" />
                        <asp:BoundField HeaderText="Status" DataField="Status"  />

                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <asp:TextBox ID="rightdt" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Submit">
                            <ItemTemplate>
                                <asp:Button ID="modify" runat="Server" CausesValidation="false"
                                    Text="Submit"
                                    Visible="true"
                                    CommandName="modify"
                                  CommandArgument='<%#((GridViewRow) Container).RowIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button ID="Approve" runat="Server" CausesValidation="false"
                                    Text="Approved"
                                    Visible="true"
                                    CommandName="approve"
                                  CommandArgument='<%#((GridViewRow) Container).RowIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:CommandField HeaderText="Edit" ShowEditButton="true" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />



                    </Columns>



                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />



                </asp:GridView>




                <br />


                &nbsp;
    
  
            </div>

            &nbsp;
    
  
        <asp:Label ID="Label3" runat="server" Text="currentdate" Visible="false"></asp:Label>


        </p>

    </div>
    </div>
</asp:Content>
