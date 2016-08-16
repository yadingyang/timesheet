using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using indentitytiti.Models;
using System.Data.SqlClient;

namespace indentitytiti
{
    public partial class stuff : System.Web.UI.Page
    {
   
        private static string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(_connectionString);
            conn.Open();
            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();
            DateTime current = DateTime.Now;
            string dat = current.ToString("MM/dd/yyyy");


            string cd = "select count(*) from [Timesheets] where [Date]=@value1 and [Username]=@value2";

            SqlCommand cdsearch = new SqlCommand(cd, conn);
            cdsearch.Parameters.AddWithValue("@value1", dat);
            cdsearch.Parameters.AddWithValue("@value2", username);


            object result = cdsearch.ExecuteScalar();

            int count = Convert.ToInt32(result);

            if (count ==1)
            { ClockIn.Enabled = false;
               ClockOut.Enabled = true;
                Label1.Text = "You have clocked in today";
            }

            else if (count ==2)
            {
                ClockIn.Enabled = false;
                ClockOut.Enabled = false;
                Label1.Text = "You have clocked in and out today";
            }

            else if (count == 0)
            {
                ClockIn.Enabled = true                    ;
                ClockOut.Enabled = false;
                Label1.Text = "Please Login";
            }


            if (HttpContext.Current.User.IsInRole("stuff"))
            {

            }
            else
            {
                Response.Redirect("mylogin.aspx");
            }


            string url= "timesheets.aspx?user="+System.Web.HttpContext.Current.User.Identity.GetUserName();
            HyperLink1.NavigateUrl = url;

          Label2.Text = "Welcome:" + System.Web.HttpContext.Current.User.Identity.GetUserName();





        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();

            Response.Redirect("mylogin.aspx");
        }

        protected void ClockIn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();



            DateTime now = DateTime.Now;

            string date = now.ToString("MM/dd/yyyy");

            String dt = now.ToString("HH:mm:ss");
          
            
                          
            String cmd = "insert into Timesheets(UserName, ClockIn, Date)  VALUES( " + "'" + username + "'" + ","  +"'"+dt +"'"+","+"'"+date+"')";

            SqlCommand cmdinsert = new SqlCommand(cmd, conn);

            int result = cmdinsert.ExecuteNonQuery();


            Response.Redirect("stuff.aspx");



        }

        protected void ClockOut_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();

         


            DateTime now = DateTime.Now;

            string date = now.ToString("MM/dd/yyyy");

            String dt = now.ToString("HH:mm:ss");



            String cmd = "insert into Timesheets(UserName, ClockOut, Date)  VALUES( " + "'" + username + "'" + "," + "'" + dt + "'" + "," + "'" + date + "')";

            SqlCommand cmdinsert = new SqlCommand(cmd, conn);

            int result = cmdinsert.ExecuteNonQuery();

            Response.Redirect("stuff.aspx");
        }

   

        



    }
   }
