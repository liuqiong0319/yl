using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class ZhaoH_2__0 : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ZHSave_Click(object sender, EventArgs e)
        {
            string sql = "select * from dyf_user where 1=1 ";
            if (!string.IsNullOrEmpty(TextYHM.Text.Trim()))
            {
                sql += " and username = '" + TextYHM.Text.Trim() + "'";
            }
            else
            {
                MessageBox("请输入用户名！");
                return;
            }
            if (string.IsNullOrEmpty(TextXM.Text.Trim()) && string.IsNullOrEmpty(TextSJH.Text.Trim()))
            {
                MessageBox("姓名和手机号至少填写一项！");
                return;
            }
            if (!string.IsNullOrEmpty(TextXM.Text.Trim()))
            {
                sql += " and Uname ='" + TextXM.Text.Trim() + "' ";
            }
            if (!string.IsNullOrEmpty(TextSJH.Text.Trim()))
            {
                sql += " and uPhone='" + TextSJH.Text.Trim() + "'";
            }
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                MessageBox("您的密码为：" + ds.Tables[0].Rows[0]["mwPassword"].ToString() + "，请牢记！");
                return;
            }
            else
            {
                MessageBox("您输入的信息不正确！");
                return;
            }

        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}