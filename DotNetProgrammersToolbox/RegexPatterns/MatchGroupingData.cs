using System;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [DataObject]
    [Serializable]
    public class MatchGroupingData : MatchData<MatchGroupingItem>
    {
        public MatchGroupingData(GroupCollection groupCollection)
            : base((groupCollection == null) ? new MatchGroupingItem[0] : groupCollection.OfType<Group>().Select(m => new MatchGroupingItem(m)))
        {
        }

        public MatchGroupingData() : base() { }

        public MatchGroupingData(GroupCollection groupCollection, Regex regex)
            : base((groupCollection == null) ? new MatchGroupingItem[0] : groupCollection.OfType<Group>().Select(m => new MatchGroupingItem(m, (regex == null) ? null : regex.GroupNameFromNumber(m.Index))))
        {
        }
    }
}
