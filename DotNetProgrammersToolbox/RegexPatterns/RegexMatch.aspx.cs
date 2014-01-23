using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public partial class RegexMatch : System.Web.UI.Page
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
            if (String.IsNullOrWhiteSpace(this.RegularExpressionTextBox.Text))
            {
                this.ErrorsHtmlTableRow.Visible = true;
                this.ResultsHtmlTableRow.Visible = false;
                this.ErrorsBulletedList.Items.Clear();
                this.ErrorsBulletedList.Items.Add("No regular expression was provided.");
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
                this.ErrorsHtmlTableRow.Visible = true;
                this.ResultsHtmlTableRow.Visible = false;
                this.ErrorsBulletedList.Items.Clear();
                this.ErrorsBulletedList.Items.Add("Error while parsing regular expression");
                this.ErrorsBulletedList.Items.Add(exc.Message);
                regex = null;
            }

            if (regex == null)
                return;

            Match match;
            try
            {
                match = regex.Match(this.SourceTextTextBox.Text);
            }
            catch (Exception exc)
            {
                this.ErrorsHtmlTableRow.Visible = true;
                this.ResultsHtmlTableRow.Visible = false;
                this.ErrorsBulletedList.Items.Clear();
                this.ErrorsBulletedList.Items.Add("Error while evaluating regular expression");
                this.ErrorsBulletedList.Items.Add(exc.Message);
                match = null;
            }

            if (match == null)
                return;

            this.DataContext.Load(match, regex);
            this.ErrorsHtmlTableRow.Visible = false;
            this.ResultsHtmlTableRow.Visible = true;
            this.MatchResultsGridView.DataBind();
        }
    }
}