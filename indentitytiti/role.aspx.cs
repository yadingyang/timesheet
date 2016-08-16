using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace indentitytiti
{
    public partial class role : System.Web.UI.Page
    
 {
      //  Models.ApplicationDbContext context = new ApplicationDbContext();


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

        protected void ButtonRolechuangjian_Click(object sender, EventArgs e)
        {
            var roleStore = new RoleStore<IdentityRole>();
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            if (!roleManager.RoleExists(TextBoxRoleName.Text))
            {
                var IdRoleResult = roleManager.Create(new IdentityRole { Name = TextBoxRoleName.Text });

                Labelcjts.Text = "Created new role";
            }
            else
            {
                Labelcjts.Text = "The role exists";
            }
        }
    }





    }
