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
    public partial class leader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Welcome:" + System.Web.HttpContext.Current.User.Identity.GetUserName();
            if (HttpContext.Current.User.IsInRole("Leader"))
            {
                
            }
            else
            {
                Response.Redirect("mylogin.aspx");
            }

            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
  string url = "Approve.aspx?user=" + DropDownList1.Text;

            Response.Redirect(url);


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

 string url = "Approve.aspx?user=" + DropDownList1.Text;










        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();

            Response.Redirect("mylogin.aspx");
        }
    }
}