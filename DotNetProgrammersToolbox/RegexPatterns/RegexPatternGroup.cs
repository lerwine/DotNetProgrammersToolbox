using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public class RegexPatternGroup : RegexPatternItem
    {
        public string GroupOpenText { get; set; }

        public string GroupCloseText { get; set; }

        public string GroupName { get; set; }

        public RegexPatternCollection[] LogicalGroupings { get; set; }
    }
}