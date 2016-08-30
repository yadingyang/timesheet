<%@ Page Title="Stuff Page" Language="C#"  AutoEventWireup="true" CodeBehind="stuff.aspx.cs" Inherits="indentitytiti.stuff" %>


<!DOCTYPE html>
<html lang="en">
<head>
 
    <title>Bootstrap Theme Company Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


       <style>

.navbar {
    margin-bottom: 0;
      background-color: #fff;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
}

.navbar li a, .navbar .navbar-brand {
    color: #016191 !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
    color: #fff !important;
    background-color: #016191 !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}


.bg-gr {
               background-color: #cccccc;
               color: #016191;
               text-align:center;
                font-family: Montserrat, sans-serif;
                 padding: 230px 25px;
           }


.bg-bl{
               background-color:#016191;
               color: #cccccc;
               text-align:center;
                font-family: Montserrat, sans-serif;
                 padding: 165px 25px;                   
           }

.center{  width: auto;
  display: table;
  margin-left: auto;
  margin-right: auto;
  margin-top: 10%;
    }



  </style>
 </head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
 <form id="form1" runat="server">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="http://www.bill-jc.com/">Bill-JC Technology</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#welpage">Clock In/Out</a></li>
        <li><a href="#timesheet">Check My Timesheets</a></li>
        <li><a href="changepassword">Change Password</a></li>
      <li><asp:Button ID="Logout" class="btn" runat="server" OnClick="logout" Text="Lougout" /></li>
      </ul>
    </div>
  </div>
</nav>

     
   <div ID="welpage" class="container-fluid bg-gr">
  <h1> <asp:Label ID="welcome" runat="server" Text="Welcome"></asp:Label>    </h1>
<h2> <asp:Label ID="instruction" runat="server" Text="Please Clockin"></asp:Label> </h2>     
  <asp:Button ID="clockin" class="btn-lg" runat="server" Text="Clock  In " OnClick="ClockIn_Click" ForeColor="#cccccc" BackColor="#016191" />
 <asp:Button ID="clockout" class="btn-lg" runat="server" Text="Clock Out" OnClick="ClockOut_Click" ForeColor="#cccccc" BackColor="#016191" />
 <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
  </div> 




 <div ID="timesheet" class="container-fluid bg-bl">

 <h1><asp:Label ID="Label1" runat="server" Text="Check My Timesheet"></asp:Label>   </h1>

   <div class="row">
    <div class="col-sm-2">
        </div> 
       <div class="col-sm-4">
        <div class="center">
 <asp:Calendar ID="Calendar1" runat="server" BackColor="#016191"  BorderColor="#016191"  Font-Names="Verdana" Font-Size="9pt" ForeColor="#cccccc" Height="190px" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px" BorderWidth="1px" NextPrevFormat="FullMonth">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#cccccc"  />
                    <OtherMonthDayStyle ForeColor="#cccccc" />
                    <SelectedDayStyle BackColor="#cccccc" ForeColor="#016191" />
                    <TitleStyle BackColor="#016191" BorderColor="#016191" Font-Bold="True" BorderWidth="4px" Font-Size="12pt" ForeColor="#cccccc" />
                    <TodayDayStyle BackColor="#016191" />
                </asp:Calendar>
           </div>
        </div>
      

    <div class="col-sm-4">
        <div class="center">
<asp:GridView ID="Timesheetview"   runat="server" AutoGenerateColumns="False" Width="489px" CellPadding="6"  GridLines="None">
 <Columns>
 <asp:BoundField HeaderText="Username" DataField="UserName" ReadOnly="true" />
<asp:BoundField HeaderText="ClockIn" DataField="ClockIn" ReadOnly="true" />
 <asp:BoundField HeaderText="ClockOut" DataField="ClockOut" ReadOnly="true" />
<asp:BoundField HeaderText="Duration" DataField="Duration" ReadOnly="true" />
<asp:BoundField HeaderText="Status" DataField="Status" ReadOnly="true" />
 </Columns> </asp:GridView>
 </div> </div>  

<div class="col-sm-2">
 </div>  
 </div>  
   </div>


      </form>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== ""){
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})
</script>




</body>
</html>
