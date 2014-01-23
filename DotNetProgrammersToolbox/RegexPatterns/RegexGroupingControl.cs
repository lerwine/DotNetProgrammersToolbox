using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:RegexGroupingControl runat=server></{0}:RegexGroupingControl>")]
    public class RegexGroupingControl : WebControl
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Text
        {
            get
            {
                String s = (String)ViewState["Text"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Text"] = value;
            }
        }

        public RegexPatternGroup Group { get; set; }

        protected override void RenderContents(HtmlTextWriter output)
        {
            if (this.Group == null || (String.IsNullOrEmpty(this.Group.GroupOpenText) && String.IsNullOrEmpty(this.Group.GroupCloseText))
                return;

            output.AddAttribute(HtmlTextWriterAttribute.Class, "grouping");
            output.RenderBeginTag(HtmlTextWriterTag.Table);

            this.RenderHeadingRow(output);
            this.RenderMainRow(output);

            output.RenderEndTag();
        }

        private void RenderHeadingRow(HtmlTextWriter output)
        {
            output.AddAttribute(HtmlTextWriterAttribute.Class, "expandContract");
            output.RenderBeginTag(HtmlTextWriterTag.Tr);

            for (int i = 0; i < this.Group.LogicalGroupings.Length; i++)
            {
                if (i > 0)
                {
                    output.AddAttribute("class", "logicalSeparator");
                    output.RenderBeginTag(HtmlTextWriterTag.Th);
                    output.RenderEndTag();
                }

                output.AddAttribute(HtmlTextWriterAttribute.Colspan, "2");
                output.RenderBeginTag(HtmlTextWriterTag.Th);
                output.AddAttribute(HtmlTextWriterAttribute.Class, "toggleButton");
                output.RenderBeginTag(HtmlTextWriterTag.Div);
                output.WriteEncodedText("[-]");
                output.RenderEndTag();
                output.RenderEndTag();
            }

            output.RenderEndTag();
        }

        private void RenderMainRow(HtmlTextWriter output)
        {
            output.RenderBeginTag(HtmlTextWriterTag.Tr);

            for (int i = 0; i < this.LogicallySeparatedGroupCount; i++)
            {
                if (i > 0)
                {
                    output.AddAttribute("class", "logicalSeparator");
                    output.RenderBeginTag(HtmlTextWriterTag.Td);
                    output.WriteEncodedText("|");
                    output.RenderEndTag();
                }

                output.AddAttribute(HtmlTextWriterAttribute.Class, "openGroup");
                output.RenderBeginTag(HtmlTextWriterTag.Td);
                output.RenderEndTag();
                output.AddAttribute(HtmlTextWriterAttribute.Class, "groupContent");
                output.RenderBeginTag(HtmlTextWriterTag.Td);
                output.RenderEndTag();
            }

            output.RenderEndTag();
        }
    }
}
