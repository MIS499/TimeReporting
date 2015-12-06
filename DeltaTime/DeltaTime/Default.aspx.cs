using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Default_aspx : System.Web.UI.Page

{
    public Default_aspx()
    {
        Load += new EventHandler(Page_Load);
    }

    private void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/DeltaTime/Timesheet.aspx");
    }
}