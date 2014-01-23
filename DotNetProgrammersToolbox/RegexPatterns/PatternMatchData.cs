using System;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [DataObject]
    [Serializable]
    public class PatternMatchData : MatchData<PatternMatchItem>
    {
        public PatternMatchData() : base() { }

        public void Load(MatchCollection groupCollection)
        {
            base.Load((groupCollection == null) ? new PatternMatchItem[0] : groupCollection.OfType<Match>().Select(m => new PatternMatchItem(m)));
        }

        public void Load(MatchCollection groupCollection, Regex regex)
        {
            base.Load((groupCollection == null) ? new PatternMatchItem[0] : groupCollection.OfType<Match>().Select(m => new PatternMatchItem(m, regex)));
        }

        public void Load(Match match)
        {
            base.Load((match == null) ? new PatternMatchItem[0] : new PatternMatchItem[] { new PatternMatchItem(match) });
        }

        public void Load(Match match, Regex regex)
        {
            base.Load((match == null) ? new PatternMatchItem[0] : new PatternMatchItem[] { new PatternMatchItem(match, regex) });
        }
    }
}