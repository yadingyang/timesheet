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
        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Text = Request.QueryString["user"];
     
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
              Label3.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");

        //    Label3.Text = Calendar1.SelectedDate.ToShortDateString();
          //  String atest = Label3.Text;
        //11111  
        }
    }
}