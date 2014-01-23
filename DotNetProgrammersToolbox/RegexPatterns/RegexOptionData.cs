using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.ComponentModel;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    [DataObject]
    [Serializable]
    public class RegexOptionData
    {
        private RegexOptionItem[] _items = null;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public RegexOptionItem[] GetData()
        {
            if (this._items == null)
                this._items = Enum.GetValues(typeof(RegexOptions)).OfType<RegexOptions>()
                    .Where(o => o != RegexOptions.None).Select(o => new RegexOptionItem(o)).ToArray();

            return this._items;
        }
    }
}