using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class ShangC_YP : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        PagedDataSource pds = new PagedDataSource();
        public void BindGridView()
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
            string sql = "select * from dyf_ypdm where shbs=" + ddlSH.SelectedValue + "";
            if (txtYPMC.Text != "")
                sql += " and ypmc like '%" + txtYPMC.Text.Trim() + "%'";
            if (txtCDMC.Text != "")
                sql += " and cdmc like '%" + txtCDMC.Text.Trim() + "%'";
            if (txtGG.Text != "")
                sql += " and gg like '%" + txtGG.Text.Trim() + "%'";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                pds = new PagedDataSource();
                pds.DataSource = ds.Tables[0].DefaultView;
                //设置允许分页
                pds.AllowPaging = true;
                //每页显示20行
                pds.PageSize = 20;
                //显示总共页数
                lblTotalPage.Text = pds.PageCount.ToString();

                //当前页
                pds.CurrentPageIndex = Convert.ToInt32(lblCurrentPage.Text.ToString()) - 1;
                rp_List.DataSource = pds;
                //如果大于当前页
                if (pds.CurrentPageIndex >= 1)
                {
                    btnPrev.Enabled = true;
                    btnNext.Enabled = true;
                }

                //如果是第一页
                if (pds.CurrentPageIndex == 0)
                {
                    btnPrev.Enabled = false;
                    btnNext.Enabled = true;
                }
                //如果是最后一页，让下一页按钮不起作用
                if (pds.CurrentPageIndex == pds.PageCount - 1)
                {
                    btnNext.Enabled = false;
                }

                rp_List.DataBind();
                //drug_list.DataSource = ds.Tables[0].DefaultView;

                //drug_list.DataBind();
            }
            else
            {
                MessageBox("查不到药品！");
            }

        }
        protected void btnPrev_Click(object sender, EventArgs e)
        {
            lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text.ToString()) - 1).ToString();
            this.BindGridView();
            //this.BindGrid2();
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text.ToString()) + 1).ToString(); ;
            this.BindGridView();
            //this.BindGrid2();
        }
        protected void btnJmp_Click(object sender, EventArgs e)
        {

            lblCurrentPage.Text = txtPageSize.Text.Trim();

            this.BindGridView();
            //this.BindGrid2();
            //}
            //else
            //    MessageBox("请输入正确的页码！");
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        protected void BtnSCYP_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ASPX/HouTai/HouTaiADM.aspx");
        }

        protected void BtnCX_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void lbDelete_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            string sql = "update dyf_ypdm set shbs=3 where id=" + lb.CommandArgument + "";
            int num= HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("删除成功！");
                BindGridView();
            }
        }
    }
}