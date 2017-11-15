using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class Complain : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    if ((Session["Utype"].ToString() == "2"))
                    {
                        div_kh.Visible = false;
                        div_ht.Visible = true;
                        string sql = "select * from dyf_Complain where id=" + Request.QueryString["id"] + "";
                        DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            LabTSWT.Text = ds.Tables[0].Rows[0]["tBT"].ToString();
                            LabTSNR.Text = ds.Tables[0].Rows[0]["tQuestion"].ToString();
                        }
                    }
                }
                if (Session["userid"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (Session["Utype"].ToString() == "0")
                {
                    div_kh.Visible = true;
                    div_ht.Visible = false;
                }
                else if ((Session["Utype"].ToString() == "2"))
                {
                    div_kh.Visible = false;
                    div_ht.Visible = true;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
            }
        }

        protected void BtnTS_Click(object sender, EventArgs e)
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
            if (Session["Utype"].ToString() != "0")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            if (string.IsNullOrEmpty(TextTSWT.Text.Trim()))
            {
                MessageBox("请输入投诉标题！");
                return;
            }
            if (string.IsNullOrEmpty(TextTSNR.Value))
            {
                MessageBox("请输入投诉内容");
                return;
            }
            string sql = "insert into dyf_Complain (tUsername,tUserid,tBT,tQuestion,tsDate) values ('" + Session["username"].ToString() + "'," + Session["userid"].ToString() + ",'" + TextTSWT.Text.Trim() + "','" + TextTSNR.Value + "','" + DateTime.Now + "')";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("投诉成功，我们会尽快对您提出的问题进行处理。");
                return;
            }
            else
            {
                MessageBox("系统故障，请稍后重试！");
                return;
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        protected void BtnCL_Click(object sender, EventArgs e)
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

            if (string.IsNullOrEmpty(TextCLJG.Value))
            {
                MessageBox("请输入处理结果");
                return;
            }
            string sql = "update dyf_Complain set tclr='" + Session["username"].ToString() + "',tAnswer='" + TextCLJG.Value + "',clDate='" + DateTime.Now + "',state=1 where id=" + Request.QueryString["id"] + "";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("处理成功！");
                return;
            }
            else
            {
                MessageBox("系统故障，请稍后重试！");
                return;
            }
        }

    }
}