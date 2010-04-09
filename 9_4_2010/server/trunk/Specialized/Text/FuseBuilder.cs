using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ion.Specialized.Encoding;

namespace Ion.Specialized.Text
{
    class FuseBuilder
    {
        internal StringBuilder Builder;
        internal FuseBuilder(string text)
        {
            Builder = new StringBuilder(text);
        }
        internal FuseBuilder()
        {
            Builder = new StringBuilder();
        }
        internal void AppendBoolean(bool b)
        {
            if (b)
                Builder.Append(WireEncoding.EncodeInt32(1));
            else
                Builder.Append(WireEncoding.EncodeInt32(0));
        }
        internal void AppendWired(object o)
        {
            try
            {
                Builder.Append(WireEncoding.EncodeInt32(int.Parse(Convert.ToString(o))));
            }
            catch { }
        }
        internal void Append(string s)
        {
            Builder.Append(s);
        }
        internal void Append(object o)
        {
            Builder.Append(o);
        }
        internal void AppendString(object o)
        {
            Builder.Append(o.ToString() + Convert.ToChar(2));
        }
        internal void AppendString(object o, int breaker)
        {
            Builder.Append(o.ToString() + Convert.ToChar(breaker));
        }
        internal void AppendChar(int c)
        {
            Builder.Append(Convert.ToChar(c));
        }
        internal string ToString()
        {
            return Builder.ToString();
        }
    }
}
