using System;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [DataObject]
    [Serializable]
    public class GroupCaptureData : MatchData<GroupCaptureItem>
    {
        public GroupCaptureData(CaptureCollection captureCollection)
            : base((captureCollection == null) ? new GroupCaptureItem[0] : captureCollection.OfType<Capture>().Select(m => new GroupCaptureItem(m)))
        {
        }

        public GroupCaptureData() : base() { }
    }
}
