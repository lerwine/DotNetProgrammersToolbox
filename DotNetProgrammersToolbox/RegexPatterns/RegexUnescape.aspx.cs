using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public partial class RegexUnescape : System.Web.UI.Page
    {
        protected void GoButton_Click(object sender, EventArgs e)
        {
            this.ResultsTextTextBox.Text = Regex.Unescape(this.SourceTextTextBox.Text);
        }
    }
}