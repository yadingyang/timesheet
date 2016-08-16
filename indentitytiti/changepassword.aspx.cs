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

namespace indentitytiti
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String t1 = TextBox1.Text;
            String t2 = TextBox2.Text;
            if (t1 == t2 & t1!=null & t2!=null)
            {

                var Store = new UserStore<IdentityUser>();
                var UserManager = new UserManager<IdentityUser>(Store);

                var userid = System.Web.HttpContext.Current.User.Identity.GetUserId();
                var user = UserManager.FindById(userid);

                String newPassword = TextBox1.Text;
                String hashedNewPassword = UserManager.PasswordHasher.HashPassword(newPassword);

                Store.SetPasswordHashAsync(user, hashedNewPassword);
                Store.UpdateAsync(user);

                Label1.Text = "The password has been reset.";
            }
            else { Label2.Text = "Please type valide password"; }


        }
    }
}