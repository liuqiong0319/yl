using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class JgIn : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {

                    if (Session["Utype"].ToString() == "3")
                    {
                        BindGridView();
                    }
                    else
                    {
                        MessageBox("您没有权限访问这个页面！");
                        return;
                    }
                }
                else
                {
                    MessageBox("请登录您的账号！");
                }
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        public void BindGridView()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["orderid"]))
            {
                hiddOid.Value = Request.QueryString["orderid"];
                string sql = "select * from (select * from dyf_orderDe where orderid =" + hiddOid.Value + ") a left join (select yptp1,id as cpid from kcbs )b on a.ypid=b.cpid";
                DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    rp_list.DataSource = ds.Tables[0].DefaultView;
                    rp_list.DataBind();
                }
                string sql1 = "select * from dyf_order where id=" + hiddOid.Value + "";
                DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query(sql1);
                if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    lblZje.Text = ds1.Tables[0].Rows[0]["je"].ToString();
                    labShr.Text = ds1.Tables[0].Rows[0]["uname"].ToString();
                    labAdd.Text = ds1.Tables[0].Rows[0]["adress"].ToString();
                    labBz.Text = ds1.Tables[0].Rows[0]["beizhu"].ToString();
                    labMobile.Text = ds1.Tables[0].Rows[0]["phone"].ToString();
                    labPhone.Text = ds1.Tables[0].Rows[0]["gdPhone"].ToString();
                    labPose.Text = ds1.Tables[0].Rows[0]["code"].ToString();
                    if (!string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["ltitle"].ToString()) && !string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["logistics"].ToString()))
                    {
                        DivWuLiu.Visible = true;
                        LabWLXX.Text = ds1.Tables[0].Rows[0]["ltitle"].ToString();
                        LabWLZT.Text = ds1.Tables[0].Rows[0]["logistics"].ToString();
                    }

                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ASPX/JgAdmin.aspx");
        }
    }
}