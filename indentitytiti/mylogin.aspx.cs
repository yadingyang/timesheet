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
    public partial class mylogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("admin"))
            { Response.Redirect("admin.aspx"); }
            else if (HttpContext.Current.User.IsInRole("Leader"))
            { Response.Redirect("leader.aspx"); }
            else if (HttpContext.Current.User.IsInRole("stuff"))
            { Response.Redirect("stuff.aspx"); }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(username.Text, password.Text);
            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

             Response.Redirect("mylogin.aspx");

            }
                else
                {
                    Label1.Text = "<font color=red>Wrong password！</font>";

                }

            }
        }
    }
