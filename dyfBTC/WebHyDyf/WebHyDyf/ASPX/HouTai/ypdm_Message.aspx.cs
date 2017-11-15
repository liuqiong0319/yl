using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class ypdm_Message : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsInt(Request["id"]))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alertShow", "$(function(){alert('参数非法！'); top.window.location.href='/ASPX/Houtai/Review.aspx';});", true);
                    return;
                }
                if (!string.IsNullOrEmpty(Request["id"]))
                {
                    string sql = "select * from dyf_ypdm where id=" + Request["id"] + "";
                    DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        lblYpmc.Text = ds.Tables[0].Rows[0]["ypmc"].ToString();
                        lblCdmc.Text = ds.Tables[0].Rows[0]["cdmc"].ToString();
                        lblGG.Text = ds.Tables[0].Rows[0]["gg"].ToString();
                        lblJx.Text = ds.Tables[0].Rows[0]["jx"].ToString();
                        lblBz.Text = ds.Tables[0].Rows[0]["bz"].ToString();
                        lblZbz.Text = ds.Tables[0].Rows[0]["zbz"].ToString();
                        lblDw.Text = ds.Tables[0].Rows[0]["dw"].ToString();
                        lblPzwh.Text = ds.Tables[0].Rows[0]["pzwh"].ToString();
                        lblLsj.Text = ds.Tables[0].Rows[0]["lsj"].ToString();
                        imgTp1.ImageUrl = ds.Tables[0].Rows[0]["yptp1"].ToString();
                        imgTp2.ImageUrl = ds.Tables[0].Rows[0]["yptp2"].ToString();
                        imgTp3.ImageUrl = ds.Tables[0].Rows[0]["yptp3"].ToString();
                        imgTp4.ImageUrl = ds.Tables[0].Rows[0]["yptp4"].ToString();
                        imgTp5.ImageUrl = ds.Tables[0].Rows[0]["yptp5"].ToString();
                        litSyzl.Text = "<a href='" + ds.Tables[0].Rows[0]["syzl"].ToString() + "'>下载技术资料</a>";
                        lblShbs.Text = ds.Tables[0].Rows[0]["shbs"].ToString();
                        lblTjrq.Text = ds.Tables[0].Rows[0]["tjrq"].ToString();
                        litYpxq.Text = ds.Tables[0].Rows[0]["ypxq"].ToString();
                        imgXc1.ImageUrl = ds.Tables[0].Rows[0]["xctp1"].ToString();
                        imgXc2.ImageUrl = ds.Tables[0].Rows[0]["xctp2"].ToString();
                        imgXc3.ImageUrl = ds.Tables[0].Rows[0]["xctp3"].ToString();
                        imgXc4.ImageUrl = ds.Tables[0].Rows[0]["xctp4"].ToString();
                        ImgSY01.ImageUrl = ds.Tables[0].Rows[0]["syzl1"].ToString();
                        ImgSY02.ImageUrl = ds.Tables[0].Rows[0]["syzl2"].ToString();
                        ImgSY03.ImageUrl = ds.Tables[0].Rows[0]["syzl3"].ToString();
                        ImgSY04.ImageUrl = ds.Tables[0].Rows[0]["syzl4"].ToString();
                        ImgSY05.ImageUrl = ds.Tables[0].Rows[0]["syzl5"].ToString();
                        ImgSY06.ImageUrl = ds.Tables[0].Rows[0]["syzl6"].ToString();
                        ImgSY07.ImageUrl = ds.Tables[0].Rows[0]["syzl7"].ToString();
                        ImgSY08.ImageUrl = ds.Tables[0].Rows[0]["syzl8"].ToString();
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alertShow", "$(function(){alert('服务器故障，请稍后重试！'); top.window.location.href='/ASPX/Houtai/Review.aspx';});", true);
                    return;
                }
            }

        }
        public static bool IsInt(string str)
        {
            bool flog = false;
            string strPatern = @"^([0-9]\d*)$";
            Regex reg = new Regex(strPatern);
            if (reg.IsMatch(str))
            {
                flog = true;
            }
            return flog;
        }
    }
}