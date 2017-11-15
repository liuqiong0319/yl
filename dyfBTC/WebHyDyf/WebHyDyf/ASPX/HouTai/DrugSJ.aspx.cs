using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class DrugSJ : WebHyDyf.SysCode.PageLog
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
                if (Session["Utype"].ToString() != "1")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                string sql = "select * from dyf_ypdm where id=" + Request["id"] + " and shbs=1";
                DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                lblYpmc.Text = ds.Tables[0].Rows[0]["ypmc"].ToString();
                lblCdmc.Text = ds.Tables[0].Rows[0]["cdmc"].ToString();
                lblGG.Text = ds.Tables[0].Rows[0]["gg"].ToString();
                lblBz.Text = ds.Tables[0].Rows[0]["bz"].ToString();
                lblZbz.Text = ds.Tables[0].Rows[0]["zbz"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                MessageBox("请登录您的账号！");
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                MessageBox("请登录您的账号！");
                return;
            }
            if (Session["Utype"].ToString() != "1")
            {
                MessageBox("您没有权限访问这个页面！");
                return;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtSL.Text.Trim(), @"^\+?[1-9][0-9]*$"))
            {
                MessageBox("药品数量只能为正整数！");
                return;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtDj.Text.Trim(), @"^\d+(\.\d*)?$"))
            {
                MessageBox("药品单价只能为数字！");
                return;
            }
            string sql = "insert into dyf_kc(ypid,sl,ph,dj,cl,scrq,yxq,sjrq,yksl) values(" + Request["id"] + "," + txtSL.Text.Trim() + ",'" + txtPh.Text.Trim() + "'," + txtDj.Text.Trim() + ",0,'" + txtScrq.Text.Trim() + "','" + txtYxq.Text.Trim() + "','" + DateTime.Now + "',0)";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("上传成功！");
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}