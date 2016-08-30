<%@ Page Title="Login Page" Language="C#" AutoEventWireup="true" CodeBehind="mylogin.aspx.cs" Inherits="indentitytiti.mylogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Bootstrap Theme Company Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .jumbotron {
            background-color: #cccccc;
            color: #016191;
            padding: 165px 25px;
        }

        #username, #password {
            margin-left: 33%;
        }

        .ad-pd {
            margin: 20px 20px;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="container-fluid">
            <div class="jumbotron text-center">
                <h1>Bill-JC</h1>
                <p>Working Hours Management System        </p>

                <asp:Label class="text-danger" ID="Label1" runat="server" Text=""></asp:Label>

                <asp:TextBox class="form-control" Width="400px" placeholder="Enter Username" ID="username" runat="server"></asp:TextBox>

                <asp:TextBox class="form-control" Width="400px" placeholder="Enter password" ID="password" TextMode="Password" runat="server"></asp:TextBox>

                <asp:Button ID="Button1" class="btn ad-pd" runat="server" OnClick="Button1_Click" Text="Login" ForeColor="#cccccc" BackColor="#016191" />

            </div>
        </div>
    </form>
</body>
</html>
