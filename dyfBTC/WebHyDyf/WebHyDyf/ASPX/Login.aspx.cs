using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class Login : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDL_Click(object sender, EventArgs e)
        {
            string sql2 = "select count(*) from dyf_UserLogin where username='" + txtUserName.Text.Trim() + "' and eNum=1 ";
            DataSet ds2 = HyeyClass.DBUtility.DbHelperSQL.Query(sql2);
            if (ds2 != null && ds2.Tables.Count > 0 && ds2.Tables[0].Rows.Count > 0)
            {
                if (int.Parse(ds2.Tables[0].Rows[0][0].ToString()) > 10)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您的账号连续输入错误密码10次，已被限制登录，请联系客服人员找回密码！');location.href='/ASPX/Login.aspx';", true);
                }
            }
            string sql = "select * from dyf_user where username='" + txtUserName.Text.Trim() + "' and userpassword='" + MD5(txtPassword.Text, 16) + "'";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DateTime dt = DateTime.Parse(ds.Tables[0].Rows[0]["expireDate"].ToString());
                if (dt < DateTime.Now)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您的账号已经到期，请与我们的工作人员联系！');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (ds.Tables[0].Rows[0]["state"].ToString() == "1")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您的账号已被禁用！');location.href='/ASPX/Login.aspx';", true);
                }
                else
                {
                    Session["UserName"] = ds.Tables[0].Rows[0]["username"].ToString();
                    Session["Utype"] = ds.Tables[0].Rows[0]["Utype"].ToString();
                    Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
                    string sql3 = "update dyf_UserLogin set eNum=0 where username='" + txtUserName.Text.Trim() + "'";
                    HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql3);
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('登录成功！');location.href='/ASPX/index.aspx';", true);
                }
            }
            else
            {
                string sql1 = "insert into dyf_UserLogin(username,inserttime) values ('" + txtUserName.Text.Trim() + "','" + DateTime.Now + "')";
                HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('用户名或密码不正确！');location.href='/ASPX/Login.aspx';", true);

            }

        }

        #region MD5
        public string MD5(string str, int code)
        {
            //16位MD5加密（取32位加密的9~25字符）
            if (code == 16)
            {
                return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower().Substring(8, 16);
            }
            else
            {
                //32位加密 
                return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower();
            }
        }
        #endregion
    }
}