using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.ComponentModel;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [Serializable]
    public class RegexOptionItem
    {
        [DataObjectField(true, true, false)]
        public int Value { get; private set; }

        [DataObjectField(false, false, false)]
        public string DisplayText { get; private set; }

        public RegexOptionItem(System.Text.RegularExpressions.RegexOptions value)
        {
            this.Value = (int)(value);
            this.DisplayText = value.ToString("F");
        }
    }
}
