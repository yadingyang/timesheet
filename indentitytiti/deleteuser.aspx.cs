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
    public partial class deleteuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           


           

            



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();


            var managerdelete = new UserManager<IdentityUser>(userStore);

            var user = managerdelete.FindByName(delete.Text);

            var resultdelete = managerdelete.Delete(user);
        }
    }
}