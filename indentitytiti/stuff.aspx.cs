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
    public class Timesheet
    {
        public string UserName { get; set; }
        public string ClockIn { get; set; }
        public string ClockOut { get; set; }
        public string Duration { get; set; }
        public string Status { get; set; }
    }

    public partial class stuff : System.Web.UI.Page
    {
        static string dat;

        static string checkuser;
       

        private static string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(_connectionString);
            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();

            DateTime current = DateTime.Now;

            string dat = current.ToString("MM/dd/yyyy");

            string cd = "select ClockIn ,ClockOut from [Timesheets] where [Date]=@value1 and [Username]=@value2";

            SqlCommand cdsearch = new SqlCommand(cd, conn);

            cdsearch.Parameters.AddWithValue("@value1", dat);
            cdsearch.Parameters.AddWithValue("@value2", username);

            SqlDataReader result = cdsearch.ExecuteReader();

            string cit;
            string cot;

            if (result.Read())
            {
               
                cit = result["ClockIn"].ToString();
                cot = result["ClockOut"].ToString();

                if (cit == null)
                {
                    clockin.Enabled = true;

                    clockout.Enabled = false;
                   
                    clockout.CssClass = "btn btn-primary disabled";

                    instruction.Text = "Please Login";
                }

                else if (cit != null & cot == null | cit != null & cot == "")
                {
                    clockin.Enabled = false;
                    clockin.CssClass = "btn btn-primary disabled";
                    clockout.Enabled = true;
                    instruction.Text = "You have clocked in today";
                }

                else if (cit != null & cot != "")
                {
                    clockout.Enabled = false;
                    clockin.Enabled = false;
                    clockin.CssClass = "btn btn-primary disabled";
                    clockout.CssClass = "btn btn-primary disabled";
                    instruction.Text = "You have clocked in and out today";
                }


            }

            



                if (HttpContext.Current.User.IsInRole("stuff"))
            {

            }
            else
            {
                Response.Redirect("mylogin.aspx");
            }


            //string url= "timesheets.aspx?user="+System.Web.HttpContext.Current.User.Identity.GetUserName();
            //HyperLink1.NavigateUrl = url;

         welcome.Text = "Welcome:" + System.Web.HttpContext.Current.User.Identity.GetUserName();



 checkuser = Request.QueryString["user"];

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

        //   DateTime dt = DateTime.Now.ToLocalTime();

          //  DateTime.Now.ToShortTimeString().

            



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

        //    DateTime dt = DateTime.Now.ToLocalTime();


            //String cmd = "insert into Timesheets(UserName, ClockOut, Date)  VALUES( " + "'" + username + "'" + "," + "'" + dt + "'" + "," + "'" + date + "')";

            //SqlCommand cmdinsert = new SqlCommand(cmd, conn);

            //int result = cmdinsert.ExecuteNonQuery();

            SqlCommand cmd = new SqlCommand("update Timesheets set ClockOut=@dt, Status =@pending where Date=@date and UserName=@username ");
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("dt", dt);
            cmd.Parameters.AddWithValue("date", date);
            cmd.Parameters.AddWithValue("username", username);
            cmd.Parameters.AddWithValue("pending", "Pending");

            var result = cmd.ExecuteNonQuery();




            Response.Redirect("stuff.aspx");
        }


        protected void logout(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();

            Response.Redirect("mylogin.aspx");
        }

       

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {


            dat = Calendar1.SelectedDate.ToString("MM/dd/yyyy");

            DateTime selday = Calendar1.SelectedDate;

            DateTime smonday = selday.AddDays(-(int)selday.DayOfWeek + 1);

            DateTime ssunday = selday.AddDays(-(int)selday.DayOfWeek + 7);

            List<Timesheet> Timest = new List<Timesheet>();

            Timest = stuff.GetClocktime();

            Timesheetview.DataSource = Timest;

            Timesheetview.DataBind();



        }

        



        public static List<Timesheet> GetClocktime()
        {
            List<Timesheet> Timest = new List<Timesheet>();

            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();


            string cd = "select ClockIn ,ClockOut, Status from [Timesheets] where [Date]=@value1 and [Username]=@value2";

            SqlCommand cdsearch = new SqlCommand(cd, conn);

            cdsearch.Parameters.AddWithValue("@value1", dat);


            if (HttpContext.Current.User.IsInRole("Leader"))
            {
                cdsearch.Parameters.AddWithValue("@value2", checkuser);
            }
            else
            {
                cdsearch.Parameters.AddWithValue("@value2", username);
            }

            SqlDataReader result = cdsearch.ExecuteReader();

            Timesheet tmst = new Timesheet();

            if (result.Read())
            {

                tmst.ClockIn = result["ClockIn"].ToString();
                tmst.ClockOut = result["ClockOut"].ToString();
                tmst.Status = result["Status"].ToString();
            }



            if (HttpContext.Current.User.IsInRole("Leader"))
            {
                tmst.UserName = checkuser;
            }
            else
            {
                tmst.UserName = username;
            }




            if (tmst.ClockIn != "" & tmst.ClockOut != "")
            {
                DateTime ci = Convert.ToDateTime(tmst.ClockIn);
                DateTime co = Convert.ToDateTime(tmst.ClockOut);


                TimeSpan Du = co - ci;
                tmst.Duration = Du.ToString();
            }
            else
            { tmst.Duration = "0"; }


            Timest.Add(tmst);

            return Timest;
        }

      




    }
   }
