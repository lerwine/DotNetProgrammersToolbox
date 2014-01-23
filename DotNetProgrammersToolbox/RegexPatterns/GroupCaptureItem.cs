using System;
using System.ComponentModel;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [Serializable]
    public class GroupCaptureItem : IComparable<FieldCompare<GroupCaptureItem>>
    {
        [DataObjectField(true, true, false)]
        public int Index { get; private set; }

        [DataObjectField(false, false, false)]
        public int Length { get; private set; }

        [DataObjectField(false, false, true)]
        public string Value { get; private set; }

        public virtual string[] GetSortableFieldNames()
        {
            return new string[] { "Index", "Length", "Value" };
        }

        public GroupCaptureItem() { }

        public GroupCaptureItem(Capture capture)
        {
            if (capture == null)
                throw new ArgumentNullException("capture");

            this.Index = capture.Index;
            this.Length = capture.Length;
            this.Value = capture.Value;
        }

        public int CompareTo(FieldCompare<GroupCaptureItem> other)
        {
            if (String.Compare(other.PropertyName, "Length", true) == 0)
                return this.Length.CompareTo(other.Value.Length);

            if (String.Compare(other.PropertyName, "Value", true) == 0)
                return ((this.Value == null) ? "0" : "1" + this.Value).CompareTo((other.Value.Value == null) ? "0" : "1" + other.Value.Value);

            return this.Index.CompareTo(other.Value.Index);
        }

        public override int GetHashCode()
        {
            return this.Index;
        }
    }
}
