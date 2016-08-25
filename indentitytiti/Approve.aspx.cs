﻿using System;
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

    public partial class Approve : System.Web.UI.Page
    {
        static string dat;

        static string checkuser;

        private static string _connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();

List<Timesheet> Timest = new List<Timesheet>();

        public class Timesheet
        {
            public string UserName { get; set; }
            public string ClockIn { get; set; }
            public string ClockOut { get; set; }
            public string Duration { get; set; }
            public string Status { get; set; }
            public string Date { get; set; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            checkuser = Request.QueryString["user"];

            Timesheetview.RowCommand += RowCommand;

        }

        private void RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            string username, date;
           
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = Timesheetview.Rows[index];
                username = Convert.ToString(row.Cells[0].Text);
                date = Convert.ToString(row.Cells[1].Text);


            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            
            SqlCommand cmd = new SqlCommand("update Timesheets set Status =@approve where Date=@date and UserName=@username ");
            cmd.Connection = conn;
            
            cmd.Parameters.AddWithValue("date", date);
            cmd.Parameters.AddWithValue("username", username);
            cmd.Parameters.AddWithValue("approve", "Approved");

            var result = cmd.ExecuteNonQuery();

            Timest = Approve.GetClocktime();
            Timesheetview.DataSource = Timest;
            Timesheetview.DataBind();






        }

        


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {


            dat = Calendar1.SelectedDate.ToString("MM/dd/yyyy");

           

            Timest = Approve.GetClocktime();

            Timesheetview.DataSource = Timest;

            Timesheetview.DataBind();


        }


        public static List<Timesheet> GetClocktime()
        {
            List<Timesheet> Timest = new List<Timesheet>();

            SqlConnection conn = new SqlConnection(_connectionString);

            conn.Open();

            var username = System.Web.HttpContext.Current.User.Identity.GetUserName();


            string cd = "select ClockIn ,ClockOut, Status,Date from [Timesheets] where [Date]=@value1 and [Username]=@value2";

            SqlCommand cdsearch = new SqlCommand(cd, conn);

            cdsearch.Parameters.AddWithValue("@value1", dat);


           
            cdsearch.Parameters.AddWithValue("@value2", checkuser);
            

            SqlDataReader result = cdsearch.ExecuteReader();

            Timesheet tmst = new Timesheet();

            if (result.Read())
            {
               
                tmst.ClockIn = result["ClockIn"].ToString();
                tmst.ClockOut = result["ClockOut"].ToString();
                tmst.Status = result["Status"].ToString();
                tmst.Date = result["Date"].ToString();
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