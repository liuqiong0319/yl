using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class Login_YJG : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDL_Click(object sender, EventArgs e)
        {
            string sql = "select * from dyf_user where username='" + txtJGUserName.Text.Trim() + "' and userpassword='" + MD5(txtJGPassword.Text, 16) + "' and Utype=3";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DateTime dt = DateTime.Parse(ds.Tables[0].Rows[0]["expireDate"].ToString());
                if (dt < DateTime.Now)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您的账号已经到期，请与我们的工作人员联系！');location.href='/ASPX/Login_YJG.aspx';", true);
                    return;
                }
                if (ds.Tables[0].Rows[0]["state"].ToString() == "1")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您的账号已被禁用！');location.href='/ASPX/Login_YJG.aspx';", true);
                }
                else
                {
                    Session["UserName"] = ds.Tables[0].Rows[0]["username"].ToString();
                    Session["Utype"] = ds.Tables[0].Rows[0]["Utype"].ToString();
                    Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();

                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('登录成功！');location.href='/ASPX/JgAdmin.aspx';", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('用户名或密码不正确！');location.href='/ASPX/Login_YJG.aspx';", true);

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