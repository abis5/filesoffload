using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FilesOffloadV2.Startup))]
namespace FilesOffloadV2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
