using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.Drug
{
    public partial class DrugDetails : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }


        public void BindGridView()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string sql = "select * from kcbs where id=" + Request.QueryString["id"] + "";
                DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    spYpmc.InnerText = ds.Tables[0].Rows[0]["ypmc"].ToString();
                    spCdmc.InnerText = ds.Tables[0].Rows[0]["cdmc"].ToString();
                    spGG.InnerText = ds.Tables[0].Rows[0]["gg"].ToString();
                    spBz.InnerText = ds.Tables[0].Rows[0]["bz"].ToString();
                    spZBZ.InnerText = ds.Tables[0].Rows[0]["zbz"].ToString();
                    spPh.InnerText = ds.Tables[0].Rows[0]["ph"].ToString();
                    spLSJ.InnerText = "￥" + ds.Tables[0].Rows[0]["lsj"].ToString();
                    spPzwh.InnerText = ds.Tables[0].Rows[0]["pzwh"].ToString();
                    spYXQ.InnerText = ds.Tables[0].Rows[0]["yxq"].ToString();
                    spSl.InnerText = ds.Tables[0].Rows[0]["sl"].ToString();
                    spDj.InnerText = "￥" + ds.Tables[0].Rows[0]["dj"].ToString();
                    txtSl.Text = ds.Tables[0].Rows[0]["zbz"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["yptp1"].ToString()))
                    {
                        img1.Src = ds.Tables[0].Rows[0]["yptp1"].ToString();
                        dtu.Src = ds.Tables[0].Rows[0]["yptp1"].ToString();
                        MagicZoom.HRef = ds.Tables[0].Rows[0]["yptp1"].ToString();
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["yptp2"].ToString()))
                    {
                        img2.Src = ds.Tables[0].Rows[0]["yptp2"].ToString();
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["yptp3"].ToString()))
                    {
                        img3.Src = ds.Tables[0].Rows[0]["yptp3"].ToString();
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["yptp4"].ToString()))
                    {
                        img4.Src = ds.Tables[0].Rows[0]["yptp4"].ToString();
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["yptp5"].ToString()))
                    {
                        img5.Src = ds.Tables[0].Rows[0]["yptp5"].ToString();
                    }

                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ypxq"].ToString()))
                    {
                        ms.InnerText = ds.Tables[0].Rows[0]["ypxq"].ToString();
                    }
                    string aa = "";
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["xctp1"].ToString()))
                    {
                        aa += "<img src='" + ds.Tables[0].Rows[0]["xctp1"].ToString() + "' width='746' height='425' /><br /><br />";
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["xctp2"].ToString()))
                    {
                        aa += "<img  src='" + ds.Tables[0].Rows[0]["xctp2"].ToString() + "' width='750' height='417' /><br /><br />";
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["xctp3"].ToString()))
                    {
                        aa += "<img  src='" + ds.Tables[0].Rows[0]["xctp3"].ToString() + "' width='750' height='409' /><br /><br />";
                    }
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["xctp4"].ToString()))
                    {
                        aa += "<img  src='" + ds.Tables[0].Rows[0]["xctp4"].ToString() + "' width='750' height='409' />";
                    }
                    if (aa != "")
                    {
                        xq.InnerHtml = aa;
                    }
                }
                else
                {
                    MessageBox("该药品已经下架！");
                }
            }
            else
            {
                MessageBox("您的打开方式不正确！");
            }
        }

        protected void btnJia_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtSl.Text) < int.Parse(spSl.InnerText))
            {
                txtSl.Text = (int.Parse(txtSl.Text) + int.Parse(spZBZ.InnerText)).ToString();
                txtSl.CssClass = "n_ipt";
            }
            else
            {
                txtSl.CssClass = "n_ipt01";
            }
        }

        protected void btnJian_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtSl.Text) > int.Parse(spZBZ.InnerText))
            {
                txtSl.Text = (int.Parse(txtSl.Text) - int.Parse(spZBZ.InnerText)).ToString();
                txtSl.CssClass = "n_ipt";
            }
            else
            {
                txtSl.CssClass = "n_ipt01";
            }
        }

        protected void btnJoin_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (Session["Utype"].ToString() == "0")
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        string sql = "insert into dyf_gwc(ypid,userid,sl,joindate) values (" + Request.QueryString["id"] + "," + Session["userid"].ToString() + "," + txtSl.Text + ",'" + DateTime.Now + "') ";
                        int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                        if (num > 0)
                        {
                            MessageBox("添加成功！");
                        }
                        else
                        {
                            MessageBox("系统故障，请稍后重试！");
                        }
                    }
                    else
                    {
                        MessageBox("您访问的页面不存在！");
                        return;
                    }
                }
                else
                {
                    MessageBox("您没有加入购物车的权限！");
                    return;
                }
            }
            else
            {
                MessageBox("请登录您的账号！");
                return;
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

    }
}