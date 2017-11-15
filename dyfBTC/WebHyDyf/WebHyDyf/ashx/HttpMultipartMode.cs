using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHyDyf.ashx
{
    public class HttpMultipartMode
    {
        public static readonly HttpMultipartMode STRICT;
        public static readonly HttpMultipartMode BROWSER_COMPATIBLE;
        public static readonly HttpMultipartMode RFC6532;
        private static readonly HttpMultipartMode[] VALUES;

        static HttpMultipartMode()
        {
            HttpMultipartMode.STRICT = new HttpMultipartMode("STRICT", 0);
            HttpMultipartMode.BROWSER_COMPATIBLE = new HttpMultipartMode("BROWSER_COMPATIBLE", 1);
            HttpMultipartMode.RFC6532 = new HttpMultipartMode("RFC6532", 2);
            HttpMultipartMode.VALUES = (new HttpMultipartMode[] { STRICT, BROWSER_COMPATIBLE, RFC6532 });
        }

        public HttpMultipartMode(string type, int value)
        {

        }
    }
}