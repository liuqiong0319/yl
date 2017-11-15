using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.Notice
{
    public partial class SendNotice : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (Session["userid"].ToString() == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (Session["Utype"].ToString() != "2")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    string strSql = "select * from dyf_Notice where id=" + Request.QueryString["id"] + "";
                    DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(strSql);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        txtTitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
                        string content = ds.Tables[0].Rows[0]["tContent"].ToString();
                        SetContent(content, this.Page);
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            string editorContent = GetContent();
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                if (string.IsNullOrEmpty(txtTitle.Text))
                {
                    MessageBox("标题不能为空！");
                    return;
                }
                if (String.IsNullOrEmpty(editorContent))
                {
                    MessageBox("内容为空！");
                    return;
                }
                else
                {
                    string sql = "insert into dyf_Notice(title,tContent,inserttime) values('" + txtTitle.Text.Trim() + "','" + editorContent + "','" + DateTime.Now + "')";
                    int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                    if (num > 0)
                    {
                        MessageBox("发布成功！");
                        return;
                    }
                }
            }
            else
            {
                if (string.IsNullOrEmpty(txtTitle.Text))
                {
                    MessageBox("标题不能为空！");
                    return;
                }
                if (String.IsNullOrEmpty(editorContent))
                {
                    MessageBox("内容为空！");
                    return;
                }
                else
                {
                    string sql = "update dyf_Notice set title='" + txtTitle.Text.Trim() + "',tContent='" + editorContent + "',inserttime='" + DateTime.Now + "' where id=" + Request.QueryString["id"] + "";
                    int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                    if (num > 0)
                    {
                        MessageBox("修改成功！");
                        return;
                    }
                }
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        /// <summary>
        /// 设置百度富文本编辑器的内容
        /// </summary>
        /// <param name="value">设置值</param>
        /// <param name="thisPage">执行的Page</param>
        protected void SetContent(string value, Page thisPage)
        {
            ClientScript.RegisterStartupScript(thisPage.GetType(), "show1", "var ue = UE.getEditor('editor');ue.ready(function () {ue.setContent('" + value + "'); });", true);
        }

        /// <summary>
        /// 获取百度富文本编辑器的内容
        /// </summary>
        /// <returns>获取的内容</returns>
        protected string GetContent()
        {
            return editor.Value;
        }

    }
}