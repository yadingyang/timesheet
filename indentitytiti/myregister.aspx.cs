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
    public partial class myregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("admin"))
            {

            }
            else
            {
                Response.Redirect("mylogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String t2 = TextBox2.Text;
            String t3 = TextBox3.Text;
            if (t2 == t3 & t2 != null & t3 != null)
            {
                var userStore = new UserStore<IdentityUser>();
                var manager = new UserManager<IdentityUser>(userStore);
                var user = new IdentityUser() { UserName = TextBox1.Text };
                IdentityResult result = manager.Create(user, TextBox2.Text);
                result = manager.AddToRole(manager.FindByName(TextBox1.Text).Id, DropDownList1.Text);

                if (result.Succeeded)
                {
                    Label1.Text = string.Format("Created new account!", user.UserName);
                }
                else
                {
                    Label1.Text = result.Errors.FirstOrDefault();
                }
            }
            else { Label2.Text = "Please type valide password"; }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
