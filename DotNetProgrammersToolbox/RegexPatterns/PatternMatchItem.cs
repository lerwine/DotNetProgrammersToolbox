using System;
using System.ComponentModel;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [Serializable]
    public class PatternMatchItem : MatchGroupingItemBase, IComparable<FieldCompare<PatternMatchItem>>
    {
        [DataObjectField(false, false, true)]
        public MatchGroupingData Groups { get; private set; }

        public PatternMatchItem() { this.Groups = new MatchGroupingData(); }

        public PatternMatchItem(Match match)
            : base(match)
        {
            if (match == null)
                throw new ArgumentNullException("match");

            this.Groups = (match.Success) ? new MatchGroupingData(match.Groups) : new MatchGroupingData();
        }

        public PatternMatchItem(Match match, Regex regex)
            : base(match)
        {
            if (match == null)
                throw new ArgumentNullException("match");

            this.Groups = (match.Success) ? new MatchGroupingData(match.Groups, regex) : new MatchGroupingData();
        }

        public int CompareTo(FieldCompare<PatternMatchItem> other)
        {
            return base.CompareTo(new FieldCompare<MatchGroupingItemBase>(other.Value, other.PropertyName));
        }
    }
}
