using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public class FieldCompare<T>
        where T : GroupCaptureItem
    {
        public T Value { get; private set; }
        public string PropertyName { get; private set; }

        public FieldCompare(T value, string propertyName)
        {
            this.Value = value;
            this.PropertyName = propertyName;
        }
    }
}
