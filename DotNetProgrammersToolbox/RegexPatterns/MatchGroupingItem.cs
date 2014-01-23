using System;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [Serializable]
    public class MatchGroupingItem : MatchGroupingItemBase, IComparable<FieldCompare<MatchGroupingItem>>
    {
        [DataObjectField(false, false, true)]
        public string GroupName { get; private set; }

        public MatchGroupingItem() : base() { }

        public MatchGroupingItem(Group group) : base(group) { }

        public MatchGroupingItem(Group group, string groupName)
            : base(group)
        {
            this.GroupName = groupName;
        }

        public override string[] GetSortableFieldNames()
        {
            return base.GetSortableFieldNames().Concat(new string[] { "GroupName" }).ToArray();
        }

        public int CompareTo(FieldCompare<MatchGroupingItem> other)
        {
            if (String.Compare(other.PropertyName, "GroupName", true) == 0)
                return ((this.GroupName == null) ? "0" : "1" + this.GroupName).CompareTo((other.Value.GroupName == null) ? "0" : "1" + other.Value.GroupName);

            return base.CompareTo(new FieldCompare<MatchGroupingItemBase>(other.Value, other.PropertyName));
        }
    }
}
