using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class XiuG : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MMSave_Click(object sender, EventArgs e)
        {
            if (txtNpassWord.Text.Trim() != txtNpassWord2.Text.Trim())
            {
                MessageBox("两次密码输入的不一致！");
                return;
            }
            string sql = "select * from dyf_user where username ='" + Session["username"].ToString() + "'";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["userPassword"].ToString() != MD5(txtOpassWord.Text.Trim(), 16))
                {
                    MessageBox("旧密码输入的不正确！");
                    return;
                }
                else
                {
                    string sql1 = "update dyf_user set mwPassword='" + txtNpassWord.Text.Trim() + "',userPassword='" + MD5(txtNpassWord.Text.Trim(), 16) + "' where username='" + Session["username"].ToString() + "'";
                    int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
                    if (num > 0)
                    {
                        MessageBox("密码修改成功！");
                        return;
                    }
                    else

                    {
                        MessageBox("系统故障，请稍后重试！");
                    }
                }
            }
        }

        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

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
    }
}