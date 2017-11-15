using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace WebHyDyf.ashx
{
    public class Properties
    {
        private List<string> Lines = new List<string>();

        /// <summary>
        /// 加载配置文件
        /// </summary>
        /// <param name="s1"></param>
        public void load(string s1)
        {
            this.Lines = System.IO.File.ReadAllLines(s1, Encoding.UTF8).ToList();
        }

        /// <summary>
        /// 返回值
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        public string getProperty(string p)
        {
            string value = this.Lines.Where(l => l.StartsWith(p)).FirstOrDefault().ToString();
            if (value.Length > 0)
            {
                value = value.Substring(p.Length + 1);
            }
            return value;
        }
    }
}