using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TC.LocalIIS.Test.Startup))]
namespace TC.LocalIIS.Test
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
