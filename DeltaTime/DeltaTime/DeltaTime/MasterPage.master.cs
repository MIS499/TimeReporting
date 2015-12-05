using ASPNET.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class MasterPage_master : System.Web.UI.MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token

            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime current = DateTime.Now;
        Int32 dayOfWeek = Convert.ToInt32(current.DayOfWeek);
        DateTime ThisSunday = current.AddDays(-1 * dayOfWeek);
        DateTime ThisSaturday = current.AddDays(6 - dayOfWeek);
        DateTime OneWeekSunday = ThisSunday.AddDays(-7);
        DateTime OneWeekSaturday = ThisSaturday.AddDays(-7);
        DateTime TwoWeekSunday = ThisSunday.AddDays(-14);
        DateTime TwoWeekSaturday = ThisSaturday.AddDays(-14);
        DateTime ThreeWeekSunday = ThisSunday.AddDays(-21);
        DateTime ThreeWeekSaturday = ThisSaturday.AddDays(-21);
        DateTime FourWeekSunday = ThisSunday.AddDays(-28);
        DateTime FourWeekSaturday = ThisSaturday.AddDays(-28);
        CurrentWeek.Text = ThisSunday.ToString("d") + " - " + ThisSaturday.ToString("d");
        OneWeekAgo.Text = OneWeekSunday.ToString("d") + " - " + OneWeekSaturday.ToString("d");
        TwoWeekAgo.Text = TwoWeekSunday.ToString("d") + " - " + TwoWeekSaturday.ToString("d");
        ThreeWeekAgo.Text = ThreeWeekSunday.ToString("d") + " - " + ThreeWeekSaturday.ToString("d");
        FourWeekAgo.Text = FourWeekSunday.ToString("d") + " - " + FourWeekSaturday.ToString("d");
    }

    // protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    //{
    //    Context.GetOwinContext().Authentication.SignOut();
    //}
}