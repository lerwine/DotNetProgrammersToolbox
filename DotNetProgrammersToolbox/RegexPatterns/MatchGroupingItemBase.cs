using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [Serializable]
    public class MatchGroupingItemBase : GroupCaptureItem, IComparable<FieldCompare<MatchGroupingItemBase>>
    {
        [DataObjectField(false, false, false)]
        public bool Success { get; private set; }

        [DataObjectField(false, false, true)]
        public GroupCaptureData Captures { get; private set; }

        public MatchGroupingItemBase() { this.Captures = new GroupCaptureData(); }

        public MatchGroupingItemBase(Group group)
            : base(group)
        {
            this.Success = group.Success;
            this.Captures = (group.Success) ? new GroupCaptureData(group.Captures) : new GroupCaptureData();
        }

        public override string[] GetSortableFieldNames()
        {
            return base.GetSortableFieldNames().Concat(new string[] { "Success" }).ToArray();
        }

        public int CompareTo(FieldCompare<MatchGroupingItemBase> other)
        {
            if (String.Compare(other.PropertyName, "Success", true) == 0)
                return this.Success.CompareTo(other.Value.Success);

            return base.CompareTo(new FieldCompare<GroupCaptureItem>(other.Value, other.PropertyName));
        }
    }
}
