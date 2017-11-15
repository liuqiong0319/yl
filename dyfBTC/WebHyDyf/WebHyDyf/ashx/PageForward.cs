using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace WebHyDyf.ashx
{
    public class PageForward
    {
        public static string PostPage(Dictionary<string, string> atrribute, string action)
        {
            Func<string, string> getValue = (s) =>
            {
                return atrribute.Keys.Contains(s) == false ? "" : atrribute[s];
            };

            StringBuilder sb = new StringBuilder();
            sb.Append("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
            sb.Append("<title></title></head>");
            sb.Append("<script LANGUAGE='JavaScript'>function goBocnet() {document.form1.submit();}</script>");
            sb.Append("<body onload='goBocnet();'>");
            sb.Append("<form name='form1' method='post' action='" + action + "'>");
            foreach (string key in atrribute.Keys)
            {
                sb.Append("<input type='hidden' name='" + key + "' value='" + getValue(key) + "' /><br/>");
            }
            sb.Append("</form></body></html>");
            return sb.ToString();
        }
    }
}