using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public partial class RegexReplace : System.Web.UI.Page
    {
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
                regex = new Regex(this.RegularExpressionTextBox.Text, this.OptionsCheckBoxList.Items.OfType<ListItem>().Where(i => i.Selected).Select(i => (RegexOptions)(Int32.Parse(i.Value)))
                    .Aggregate<RegexOptions, RegexOptions>(RegexOptions.None, (RegexOptions a, RegexOptions b) => a | b));
            }
            catch (Exception exc)
            {
                this.RegularExpressionCustomValidator.IsValid = false;
                this.RegularExpressionCustomValidator.ErrorMessage = exc.Message;
                this.ResultsHtmlTableRow.Visible = false;
                regex = null;
            }

            if (regex == null)
                return;

            string result;
            try
            {
                if (this.NoneRadioButton.Checked)
                    result = regex.Replace(this.SourceTextTextBox.Text, this.ReplacementTextBox.Text);
                else if (this.CountRadioButton.Checked)
                    result = regex.Replace(this.SourceTextTextBox.Text, this.ReplacementTextBox.Text, Int32.Parse(this.CountTextBox.Text.Trim()));
                else
                    result = regex.Replace(this.SourceTextTextBox.Text, this.ReplacementTextBox.Text, Int32.Parse(this.CountTextBox.Text.Trim()), Int32.Parse(this.StartAtTextBox.Text.Trim()));
            }
            catch (Exception exc)
            {
                this.RegularExpressionCustomValidator.IsValid = false;
                this.RegularExpressionCustomValidator.ErrorMessage = exc.Message;
                this.ResultsHtmlTableRow.Visible = false;
                result = null;
            }

            if (result == null)
                return;

            this.ResultsTextTextBox.Text = result;
            this.RegularExpressionCustomValidator.IsValid = true;
            this.ResultsHtmlTableRow.Visible = true;
        }

        protected void NoneRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (!this.NoneRadioButton.Checked)
                return;

            this.CountTextBox.Enabled = false;
            this.CountRequiredFieldValidator.Enabled = false;
            this.CountRangeValidator.Enabled = false;
            this.CountRegularExpressionValidator.Enabled = false;
            this.StartAtTextBox.Enabled = false;
            this.StartAtRequiredFieldValidator.Enabled = false;
            this.StartAtRangeValidator.Enabled = false;
            this.StartAtRegularExpressionValidator.Enabled = false;
        }

        protected void CountRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (!this.NoneRadioButton.Checked)
                return;

            this.CountTextBox.Enabled = true;
            this.CountRequiredFieldValidator.Enabled = true;
            this.CountRangeValidator.Enabled = true;
            this.CountRegularExpressionValidator.Enabled = true;
            this.StartAtTextBox.Enabled = false;
            this.StartAtRequiredFieldValidator.Enabled = false;
            this.StartAtRangeValidator.Enabled = false;
            this.StartAtRegularExpressionValidator.Enabled = false;
        }

        protected void StartAtRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            this.CountTextBox.Enabled = true;
            this.CountRequiredFieldValidator.Enabled = true;
            this.CountRangeValidator.Enabled = true;
            this.CountRegularExpressionValidator.Enabled = true;
            this.StartAtTextBox.Enabled = true;
            this.StartAtRequiredFieldValidator.Enabled = true;
            this.StartAtRangeValidator.Enabled = true;
            this.StartAtRegularExpressionValidator.Enabled = true;
        }
    }
}