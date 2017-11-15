using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.Shop
{
    public partial class Submit : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    if (Session["Utype"].ToString() == "2")
                    {
                        BindGridView1();
                    }
                    if (Session["Utype"].ToString() == "0")
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

        public void BindGridView()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["orderid"]))
            {
                hiddOid.Value = Request.QueryString["orderid"];
                string sql = "select * from (select * from dyf_orderDe where orderid =" + hiddOid.Value + " and userid=" + Session["userid"].ToString() + ") a left join (select yptp1,id as cpid from kcbs )b on a.ypid=b.cpid";
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
                    txtShr.Text = ds1.Tables[0].Rows[0]["uname"].ToString();
                    txtAdd.Text = ds1.Tables[0].Rows[0]["adress"].ToString();
                    txtBz.Text = ds1.Tables[0].Rows[0]["beizhu"].ToString();
                    txtMobile.Text = ds1.Tables[0].Rows[0]["gdphone"].ToString();
                    txtPhone.Text = ds1.Tables[0].Rows[0]["Phone"].ToString();
                    txtPose.Text = ds1.Tables[0].Rows[0]["code"].ToString();
                    if (ds1.Tables[0].Rows[0]["state"].ToString() != "0")
                    {
                        btnSave.Visible = false;
                    }
                    if (!string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["ltitle"].ToString()) && !string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["logistics"].ToString()))
                    {
                        DivWuLiu.Visible = true;
                        LabWLXX.Text = ds1.Tables[0].Rows[0]["ltitle"].ToString();
                        LabWLZT.Text = ds1.Tables[0].Rows[0]["logistics"].ToString();
                    }

                }
            }
        }

        public void BindGridView1()
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
                    txtShr.Text = ds1.Tables[0].Rows[0]["uname"].ToString();
                    txtAdd.Text = ds1.Tables[0].Rows[0]["adress"].ToString();
                    txtBz.Text = ds1.Tables[0].Rows[0]["beizhu"].ToString();
                    txtMobile.Text = ds1.Tables[0].Rows[0]["gdphone"].ToString();
                    txtPhone.Text = ds1.Tables[0].Rows[0]["phone"].ToString();
                    txtPose.Text = ds1.Tables[0].Rows[0]["code"].ToString();
                    btnSave.Visible = false;
                    if (!string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["ltitle"].ToString()) && !string.IsNullOrEmpty(ds1.Tables[0].Rows[0]["logistics"].ToString()))
                    {
                        DivWuLiu.Visible = true;
                        LabWLXX.Text = ds1.Tables[0].Rows[0]["ltitle"].ToString();
                        LabWLZT.Text = ds1.Tables[0].Rows[0]["logistics"].ToString();
                    }

                }
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(hiddOid.Value))
            {
                string sql = "update dyf_order set uname='" + txtShr.Text.Trim() + "',gdPhone='" + txtMobile.Text.Trim() + "',phone='" + txtPhone.Text.Trim() + "',adress='" + txtAdd.Text.Trim() + "',code='" + txtPose.Text.Trim() + "',beizhu='" + txtBz.Text + "'  where id=" + Request.QueryString["orderid"] + "";
                int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                if (num > 0)
                {
                    Response.Redirect("/ashx/RecvOrder.ashx?merchantNo=104310145113333&payType=1&orderNo=" + hiddOid.Value.Trim() + "&curCode=001&orderAmount=" + lblZje.Text.Trim() + "&orderTime=" + DateTime.Now.ToString("yyyyMMddHHmmss") + "&orderNote=中行测试&orderTimeoutDate=" + DateTime.Now.AddMinutes(30).ToString("yyyyMMddHHmmss") + "&signData=&orderUrl=http://220.179.91.16/ashx/ReceiveB2CNoticePage.ashx");
                }
            }

        }
    }
}