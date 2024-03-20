using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string IsActive(string pageName)
        {
            if (Request.Url.AbsolutePath.EndsWith(pageName, StringComparison.InvariantCultureIgnoreCase))
            {
                return "active";
            }
            return "text-white";
        }
    }
}