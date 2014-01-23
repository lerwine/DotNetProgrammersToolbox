using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.ComponentModel;

namespace DotNetProgrammersToolbox.RegexPatterns
{
    public abstract class MatchData<T> : IComparer<FieldCompare<T>>
        where T : GroupCaptureItem, IComparable<FieldCompare<T>>
    {
        private T[] _items = new T[0];

        [DataObjectMethod(DataObjectMethodType.Select)]
        public T[] GetData() { return this._items; }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public T[] GetData(int startRowIndex, int maximumRows, string orderBy)
        {
            if (this._items.Length == 0)
                return this._items;

            string[] sortableFields = this._items[0].GetSortableFieldNames();
            bool isAscending;
            if (String.IsNullOrWhiteSpace(orderBy))
            {
                orderBy = sortableFields.FirstOrDefault();
                isAscending = true;
            }
            else
            {
                Match match = Regex.Match(orderBy, @"^(?<field>\S+)(\s*(?<dir>\S+))?$");
                if (match.Success)
                {
                    orderBy = match.Groups["field"].Value;
                    isAscending = (!match.Groups["dir"].Success || match.Groups["dir"].Value != "DESC");
                }
                else
                    isAscending = true;
            }

            IOrderedEnumerable<FieldCompare<T>> sortedItems = (isAscending) ? this._items.Select(i => new FieldCompare<T>(i, orderBy)).OrderBy(i => i, this) :
                this._items.Select(i => new FieldCompare<T>(i, orderBy)).OrderByDescending(i => i, this);

            return sortedItems.Skip((startRowIndex < 0) ? 0 : startRowIndex).Take((maximumRows < 1) ? this._items.Length : maximumRows).Select(i => i.Value).ToArray();
        }

        protected MatchData() { }

        protected MatchData(IEnumerable<T> items)
        {
            this.Load(items);
        }

        public int Compare(FieldCompare<T> x, FieldCompare<T> y)
        {
            return x.Value.CompareTo(y);
        }

        protected void Load(IEnumerable<T> items)
        {
            this._items = (items == null) ? new T[0] : items.Where(i => i != null).ToArray();
        }
    }
}
