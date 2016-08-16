using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(indentitytiti.Startup))]
namespace indentitytiti
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
