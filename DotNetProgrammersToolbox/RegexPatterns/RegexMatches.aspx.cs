using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public partial class RegexMatches : System.Web.UI.Page
    {
        protected PatternMatchData DataContext
        {
            get
            {
                PatternMatchData result = this.ViewState["DataContext"] as PatternMatchData;
                if (result == null)
                {
                    result = new PatternMatchData();
                    this.ViewState["DataContext"] = result;
                }

                return result;
            }
        }

        protected void MatchResultsDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = this.DataContext;
        }

        protected void GroupsDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = Eval("Groups") as DotNetProgrammersToolbox.RegexPatterns.MatchGroupingData;
        }

        protected void CapturesDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            e.ObjectInstance = Eval("Captures") as DotNetProgrammersToolbox.RegexPatterns.GroupCaptureData;
        }

        protected void GoButton_Click(object sender, EventArgs e)
        {
            this.RegularExpressionCustomValidator.IsValid = true;
            this.Validate();
            if (!this.IsValid)
            {
                this.ResultsHtmlTableRow.Visible = false;
                return;
            }
            Regex regex;
            try
            {
                regex = new Regex(this.RegularExpressionTextBox.Text,
                    this.OptionsCheckBoxList.Items.OfType<ListItem>().Where(i => i.Selected).Select(i => (RegexOptions)(Int32.Parse(i.Value)))
                    .Aggregate<RegexOptions, RegexOptions>(RegexOptions.None, (RegexOptions a, RegexOptions b) => a | b));
            }
            catch (Exception exc)
            {
                this.RegularExpressionCustomValidator.ErrorMessage = exc.Message;
                this.RegularExpressionCustomValidator.IsValid = false;
                this.ResultsHtmlTableRow.Visible = false;
                regex = null;
            }

            if (regex == null)
                return;

            MatchCollection matchCollection;
            try
            {
                matchCollection = regex.Matches(this.SourceTextTextBox.Text);
            }
            catch (Exception exc)
            {
                this.RegularExpressionCustomValidator.ErrorMessage = exc.Message;
                this.RegularExpressionCustomValidator.IsValid = false;
                this.ResultsHtmlTableRow.Visible = false;
                matchCollection = null;
            }

            if (matchCollection == null)
                return;

            this.DataContext.Load(matchCollection, regex);
            this.ResultsHtmlTableRow.Visible = true;
            this.MatchResultsGridView.DataBind();
        }
    }
}