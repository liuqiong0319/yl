using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class Regist : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool IsChineseCh(string input)
        {
            return IsMatch(@"^[\u4e00-\u9fa5]+$", input);
        }
        public bool IsDxx(string input)
        {
            return IsMatch(@"^(?=.{8,10})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", input);
        }
        public bool IsMatch(string pattern, string input)
        {
            if (input == null || input == "") return false;
            Regex regex = new Regex(pattern);
            return regex.IsMatch(input);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtUsername.Text.Trim()))
            {
                MessageBox("请输入用户名！");
                return;
            }
            if (string.IsNullOrEmpty(txtuserpassword.Text.Trim()))
            {
                MessageBox("请输入密码！");
                return;
            }
            if (txtuserpassword.Text.Trim().Length < 8)
            {
                MessageBox("密码不能小于8位！");
                return;
            }
            if (!IsDxx(txtuserpassword.Text.Trim()))
            {
                MessageBox("密码必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间！");
                return;
            }
            if (IsChineseCh(txtuserpassword.Text.Trim()))
            {
                MessageBox("密码不能为汉字！");
                return;
            }
            if (string.IsNullOrEmpty(txtuserpassword2.Text.Trim()))
            {
                MessageBox("请输入确认密码！");
                return;
            }

            if (string.IsNullOrEmpty(txtUname.Text.Trim()))
            {
                MessageBox("请输入姓名！");
                return;
            }
            if (string.IsNullOrEmpty(txtPhone.Text.Trim()))
            {
                MessageBox("请输入手机！");
                return;
            }
            if (txtuserpassword2.Text.Trim() != txtuserpassword.Text.Trim())
            {
                MessageBox("两次输入的密码不一致！");
                return;
            }


            string sql1 = "select * from dyf_user where username='" + txtUsername.Text.Trim() + "'";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql1);
            if (ds.Tables.Count == 1 && ds.Tables[0].Rows.Count == 0)
            {
                string sql = "insert into dyf_user (username,userpassword,mwpassword,uname,uphone,inserttime,expireDate) values('" + txtUsername.Text + "','" + MD5(txtuserpassword.Text, 16) + "','" + txtuserpassword.Text + "','" + txtUname.Text + "','" + txtPhone.Text + "','" + DateTime.Now + "','" + DateTime.Now.AddYears(1) + "')";

                int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                if (num > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('注册成功！您的账号到期日期为：" + DateTime.Now.AddYears(1).ToString() + "');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                else
                {
                    MessageBox("系统故障，请稍后重试！");
                }
            }
            else
            {
                MessageBox("此用户名已经被占用！");
                return;
            }
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
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}