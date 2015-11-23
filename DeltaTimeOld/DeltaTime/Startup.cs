using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeltaTime.Startup))]
namespace DeltaTime
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
