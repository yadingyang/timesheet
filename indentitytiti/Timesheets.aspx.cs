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

    public partial class Timesheets : System.Web.UI.Page
    {
        static string dat;

        private static string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();


        public class Timesheet
        {
            public string UserName { get; set; }
            public string ClockIn { get; set; }
            public string ClockOut { get; set; }
            public string Duration { get; set; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Text = Request.QueryString["user"];



        }
        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            

            dat = Calendar1.SelectedDate.ToString("MM/dd/yyyy");

            List<Timesheet> Timest = new List<Timesheet>();

            Timest = Timesheets.GetClocktime();

            Timesheetview.DataSource = Timest;

            Timesheetview.DataBind();


        }


        public static List<Timesheet> GetClocktime()
        {
            List<Timesheet> Timest = new List<Timesheet>();

            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();

            
            string cd = "select ClockIn ,ClockOut from [Timesheets] where [Date]=@value1 and [Username]=@value2";

            SqlCommand cdsearch = new SqlCommand(cd, conn);

            cdsearch.Parameters.AddWithValue("@value1", dat);

            cdsearch.Parameters.AddWithValue("@value2", username);

            SqlDataReader result = cdsearch.ExecuteReader();

            Timesheet tmst = new Timesheet();

            if (result.Read())
            {

                tmst.ClockIn = result["ClockIn"].ToString();
                tmst.ClockOut = result["ClockOut"].ToString();
            }

            tmst.UserName = username;

            DateTime ci = Convert.ToDateTime(tmst.ClockIn);
            DateTime co = Convert.ToDateTime(tmst.ClockOut);


            TimeSpan Du = co-ci;
            tmst.Duration = Du.ToString();

            Timest.Add(tmst);

            return Timest;
        }

    }

  }