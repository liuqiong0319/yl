using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class HouTaiADM : WebHyDyf.SysCode.PageLog
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
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    string sql = "select * from dyf_ypdm where id=" + Request.QueryString["id"] + "";
                    DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                    if (ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                    {
                        txtYPMC.Text = ds1.Tables[0].Rows[0]["ypmc"].ToString();
                        txtCDMC.Text = ds1.Tables[0].Rows[0]["cdmc"].ToString();
                        txtGG.Text = ds1.Tables[0].Rows[0]["gg"].ToString();
                        txtJX.Text = ds1.Tables[0].Rows[0]["jx"].ToString();
                        txtBZ.Text = ds1.Tables[0].Rows[0]["bz"].ToString();
                        txtZBZ.Text = ds1.Tables[0].Rows[0]["zbz"].ToString();
                        txtDW.Text = ds1.Tables[0].Rows[0]["dw"].ToString();
                        txtPZWH.Text = ds1.Tables[0].Rows[0]["pzwh"].ToString();
                        txtLSJ.Text = ds1.Tables[0].Rows[0]["lsj"].ToString();
                        ImgSY01.ImageUrl = ds1.Tables[0].Rows[0]["syzl1"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl1"].ToString();
                        ImgSY02.ImageUrl = ds1.Tables[0].Rows[0]["syzl2"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl2"].ToString();
                        ImgSY03.ImageUrl = ds1.Tables[0].Rows[0]["syzl3"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl3"].ToString();
                        ImgSY04.ImageUrl = ds1.Tables[0].Rows[0]["syzl4"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl4"].ToString();
                        ImgSY05.ImageUrl = ds1.Tables[0].Rows[0]["syzl5"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl5"].ToString();
                        ImgSY06.ImageUrl = ds1.Tables[0].Rows[0]["syzl6"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl6"].ToString();
                        ImgSY07.ImageUrl = ds1.Tables[0].Rows[0]["syzl7"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl7"].ToString();
                        ImgSY08.ImageUrl = ds1.Tables[0].Rows[0]["syzl8"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["syzl8"].ToString();
                        SyImg01.Value = ds1.Tables[0].Rows[0]["syzl1"].ToString();
                        SyImg02.Value = ds1.Tables[0].Rows[0]["syzl2"].ToString();
                        SyImg03.Value = ds1.Tables[0].Rows[0]["syzl3"].ToString();
                        SyImg04.Value = ds1.Tables[0].Rows[0]["syzl4"].ToString();
                        SyImg05.Value = ds1.Tables[0].Rows[0]["syzl5"].ToString();
                        SyImg06.Value = ds1.Tables[0].Rows[0]["syzl6"].ToString();
                        SyImg07.Value = ds1.Tables[0].Rows[0]["syzl7"].ToString();
                        SyImg08.Value = ds1.Tables[0].Rows[0]["syzl8"].ToString();
                        Image1.ImageUrl = ds1.Tables[0].Rows[0]["yptp1"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["yptp1"].ToString();
                        Image2.ImageUrl = ds1.Tables[0].Rows[0]["yptp2"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["yptp2"].ToString();
                        Image3.ImageUrl = ds1.Tables[0].Rows[0]["yptp3"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["yptp3"].ToString();
                        Image4.ImageUrl = ds1.Tables[0].Rows[0]["yptp4"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["yptp4"].ToString();
                        Image5.ImageUrl = ds1.Tables[0].Rows[0]["yptp5"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["yptp5"].ToString();
                        hfImg1.Value = ds1.Tables[0].Rows[0]["yptp1"].ToString();
                        hfImg2.Value = ds1.Tables[0].Rows[0]["yptp2"].ToString();
                        hfImg3.Value = ds1.Tables[0].Rows[0]["yptp3"].ToString();
                        hfImg4.Value = ds1.Tables[0].Rows[0]["yptp4"].ToString();
                        hfImg5.Value = ds1.Tables[0].Rows[0]["yptp5"].ToString();
                        TextArea1.InnerText = ds1.Tables[0].Rows[0]["ypxq"].ToString();
                        Image6.ImageUrl = ds1.Tables[0].Rows[0]["xctp1"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["xctp1"].ToString();
                        Image7.ImageUrl = ds1.Tables[0].Rows[0]["xctp2"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["xctp2"].ToString();
                        Image8.ImageUrl = ds1.Tables[0].Rows[0]["xctp3"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["xctp3"].ToString();
                        Image9.ImageUrl = ds1.Tables[0].Rows[0]["xctp4"].ToString() == "" ? "/images/SCT_01.jpg" : ds1.Tables[0].Rows[0]["xctp4"].ToString();
                        xcImg1.Value = ds1.Tables[0].Rows[0]["xctp1"].ToString();
                        xcImg2.Value = ds1.Tables[0].Rows[0]["xctp2"].ToString();
                        xcImg3.Value = ds1.Tables[0].Rows[0]["xctp3"].ToString();
                        xcImg4.Value = ds1.Tables[0].Rows[0]["xctp4"].ToString();
                        string sql1 = "select * from dyf_fl";
                        DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql1);
                        DropDownList1.DataSource = ds.Tables[0].DefaultView;
                        DropDownList1.DataValueField = ds.Tables[0].Columns[0].ToString();
                        DropDownList1.DataTextField = ds.Tables[0].Columns[1].ToString();
                        DropDownList1.DataBind();
                        DropDownList1.SelectedValue = ds1.Tables[0].Rows[0]["lx"].ToString();
                    }
                }
                else
                {
                    string sql = "select * from dyf_fl";
                    DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                    DropDownList1.DataSource = ds.Tables[0].DefaultView;
                    DropDownList1.DataValueField = ds.Tables[0].Columns[0].ToString();
                    DropDownList1.DataTextField = ds.Tables[0].Columns[1].ToString();
                    DropDownList1.DataBind();
                }
            }
        }




        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtBZ.Text.Trim(), @"^\+?[1-9][0-9]*$"))
            {
                MessageBox("包装只能为正整数！");
                return;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtZBZ.Text.Trim(), @"^\+?[1-9][0-9]*$"))
            {
                MessageBox("中包装只能为正整数！");
                return;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtLSJ.Text.Trim(), @"^\d+(\.\d*)?$"))
            {
                MessageBox("最高零售价只能为数字！");
                return;
            }

            #region 图片
            string tupian1 = "";
            string tupian2 = "";
            string tupian3 = "";
            string tupian4 = "";
            string tupian5 = "";
            if ((hfImg1.Value != "/images/SCT_01.jpg") && (hfImg1.Value != ""))
            {
                tupian1 = hfImg1.Value;//Image1.ImageUrl;
            }
            else
            {
                tupian1 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }

            if ((hfImg2.Value != "/images/SCT_01.jpg") && (hfImg2.Value != ""))
            {
                tupian2 = hfImg2.Value;//Image2.ImageUrl;
            }
            else
            {
                tupian2 = "";
                //qxfll_cpM.CP_TUPIAN2_BZ = 0;
            }

            if ((hfImg3.Value != "/images/SCT_01.jpg") && (hfImg3.Value != ""))
            {
                tupian3 = hfImg3.Value;//Image3.ImageUrl;
            }
            else
            {
                tupian3 = "";
            }

            if ((hfImg4.Value != "/images/SCT_01.jpg") && (hfImg4.Value != ""))
            {
                tupian4 = hfImg4.Value;//Image4.ImageUrl;
            }
            else
            {
                tupian4 = "";
            }

            if ((hfImg5.Value != "/images/SCT_01.jpg") && (hfImg5.Value != ""))
            {
                tupian5 = hfImg5.Value;//Image5.ImageUrl;
            }
            else
            {
                tupian5 = "";
            }
            #endregion

            #region 宣传图片
            string xcTupian1 = "";
            string xcTupian2 = "";
            string xcTupian3 = "";
            string xcTupian4 = "";
            if ((xcImg1.Value != "/images/SCT_01.jpg") && (xcImg1.Value != ""))
            {
                xcTupian1 = xcImg1.Value;//Image1.ImageUrl;
            }
            else
            {
                xcTupian1 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((xcImg2.Value != "/images/SCT_01.jpg") && (xcImg2.Value != ""))
            {
                xcTupian2 = xcImg2.Value;//Image1.ImageUrl;
            }
            else
            {
                xcTupian2 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((xcImg3.Value != "/images/SCT_01.jpg") && (xcImg3.Value != ""))
            {
                xcTupian3 = xcImg3.Value;//Image1.ImageUrl;
            }
            else
            {
                xcTupian3 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((xcImg4.Value != "/images/SCT_01.jpg") && (xcImg4.Value != ""))
            {
                xcTupian4 = xcImg4.Value;//Image1.ImageUrl;
            }
            else
            {
                xcTupian4 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            #endregion

            #region 首营资料
            string syzl1 = "";
            string syzl2 = "";
            string syzl3 = "";
            string syzl4 = "";
            string syzl5 = "";
            string syzl6 = "";
            string syzl7 = "";
            string syzl8 = "";
            if ((SyImg01.Value != "/images/SCT_01.jpg") && (SyImg01.Value != ""))
            {
                syzl1 = SyImg01.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl1 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg02.Value != "/images/SCT_01.jpg") && (SyImg02.Value != ""))
            {
                syzl2 = SyImg02.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl2 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg03.Value != "/images/SCT_01.jpg") && (SyImg03.Value != ""))
            {
                syzl3 = SyImg03.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl3 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg04.Value != "/images/SCT_01.jpg") && (SyImg04.Value != ""))
            {
                syzl4 = SyImg04.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl4 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg05.Value != "/images/SCT_01.jpg") && (SyImg05.Value != ""))
            {
                syzl5 = SyImg05.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl5 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg06.Value != "/images/SCT_01.jpg") && (SyImg06.Value != ""))
            {
                syzl6 = SyImg06.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl6 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg07.Value != "/images/SCT_01.jpg") && (SyImg07.Value != ""))
            {
                syzl7 = SyImg07.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl7 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            if ((SyImg08.Value != "/images/SCT_01.jpg") && (SyImg08.Value != ""))
            {
                syzl8 = SyImg08.Value;//Image1.ImageUrl;
            }
            else
            {
                syzl8 = "";
                //qxfll_cpM.CP_TUPIAN1_BZ = 0;
            }
            #endregion
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string sql = "update dyf_ypdm set ypmc='" + txtYPMC.Text.ToString().Trim() + "',cdmc='" + txtCDMC.Text.ToString().Trim() + "',gg='" + txtGG.Text.ToString().Trim() + "',jx='" + txtJX.Text.ToString().Trim() + "',bz=" + int.Parse(txtBZ.Text.ToString().Trim()) + ",zbz=" + int.Parse(txtZBZ.Text.ToString().Trim()) + ",dw='" + txtDW.Text.ToString().Trim() + "',pzwh='" + txtPZWH.Text.ToString().Trim() + "',lx='" + DropDownList1.SelectedValue + "',lsj=" + float.Parse(txtLSJ.Text.ToString().Trim()) + ",yptp1='" + tupian1 + "',yptp2='" + tupian2 + "',yptp3='" + tupian3 + "',yptp4='" + tupian4 + "',yptp5='" + tupian5 + "',ypxq='" + TextArea1.Value + "',xctp1='" + xcTupian1 + "',xctp2='" + xcTupian2 + "',xctp3='" + xcTupian3 + "',xctp4='" + xcTupian4 + "',tjrq='" + DateTime.Now + "',syzl1='" + syzl1 + "',syzl2='" + syzl2 + "',syzl3='" + syzl3 + "',syzl4='" + syzl4 + "',syzl5='" + syzl5 + "',syzl6='" + syzl6 + "',syzl7='" + syzl7 + "',syzl8='" + syzl8 + "',shbs=0 where id=" + Request.QueryString["id"] + "";
                int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                if (num > 0)
                {
                    MessageBox("修改成功！");
                    return;
                }
            }
            else
            {
                string sql = @"insert into dyf_ypdm(ypmc,cdmc,gg,jx,bz,zbz,dw,pzwh,lx,lsj,yptp1,yptp2,yptp3,yptp4,yptp5,ypxq,xctp1,xctp2,xctp3,xctp4,tjrq,syzl1,syzl2,syzl3,syzl4,syzl5,syzl6,syzl7,syzl8) values
('" + txtYPMC.Text.ToString().Trim() + "','" + txtCDMC.Text.ToString().Trim() + "','" + txtGG.Text.ToString().Trim() + "','" + txtJX.Text.ToString().Trim() + "',";
                sql += "" + int.Parse(txtBZ.Text.ToString().Trim()) + "," + int.Parse(txtZBZ.Text.ToString().Trim()) + ",'" + txtDW.Text.ToString().Trim() + "','" + txtPZWH.Text.ToString().Trim() + "','" + DropDownList1.SelectedValue + "'," + float.Parse(txtLSJ.Text.ToString().Trim()) + "";
                sql += ",'" + tupian1 + "','" + tupian2 + "','" + tupian3 + "','" + tupian4 + "','" + tupian5 + "','" + TextArea1.Value + "','" + xcTupian1 + "','" + xcTupian2 + "','" + xcTupian3 + "','" + xcTupian4 + "','" + DateTime.Now + "','" + syzl1 + "','" + syzl2 + "','" + syzl3 + "','" + syzl4 + "','" + syzl5 + "','" + syzl6 + "','" + syzl7 + "','" + syzl8 + "')";
                int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                if (num > 0)
                {
                    MessageBox("上传成功！");
                    return;
                }
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}