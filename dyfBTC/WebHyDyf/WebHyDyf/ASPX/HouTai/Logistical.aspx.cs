using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class Logistical : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
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
            if (!string.IsNullOrEmpty(Request.QueryString["orderid"]))
            {

                string sql = "update dyf_order set  state =3,ltitle='" + txtWLXX.Text.Trim() + "',logistics='" + txtWLZT.Text.Trim() + "' where id=" + Request.QueryString["orderid"] + "";
                int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                if (num > 0)
                {
                    string sql1 = "update dyf_orderDe set bs=3 where orderid=" + Request.QueryString["orderid"] + "";
                    int s = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
                    if (s > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('已发货');location.href='/ASPX/HouTai/AdmOrders.aspx';", true);
                        return;
                    }
                }
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}