using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace DeltatimeApp
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                StatusText.Text = string.Format("Hello {0}!!", User.Identity.GetUserName());
                LnkTimeSheet.Visible = true;
                LnkViewReports.Visible = true;
                LnkLogOff.Visible = true;
            }
            else
            {
                LnkTimeSheet.Visible = false;
                LnkViewReports.Visible = false;
                LnkLogOff.Visible = false;
            }
        }
    }
}
