using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHyDyf.SysCode
{
    public partial class PageLog : System.Web.UI.Page
    {
        public PageLog()
        {
            this.Load += new EventHandler(PageLog_Load);
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }
        protected void PageLog_Load(object sender, EventArgs e)
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsolutePath;//请求URL
                string clientIp = System.Web.HttpContext.Current.Request.UserHostAddress;//客户端IP
                string userid = Session["UserId"] == null ? "error" : Session["UserId"].ToString();//用户ID
                string username = Session["UserName"] == null ? "error" : Session["UserName"].ToString();//用户名称
                string sql = "insert into dyf_Log(username,userid,Lcontent,Lip,inserttime) values ('" + username + "'," + userid + ",'" + url + "','" + clientIp + "','" + DateTime.Now + "')";
                HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                //Response.Write("不需要记录");
            }

        }

    }

}