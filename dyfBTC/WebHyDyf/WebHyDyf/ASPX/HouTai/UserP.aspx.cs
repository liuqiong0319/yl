﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class UserP : WebHyDyf.SysCode.PageLog
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
            if (Session["Utype"].ToString() != "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            string sql = "select * from dyf_user where 1=1 ";
            if (txtUsername.Text != "")
                sql += " and username like '%" + txtUsername.Text.Trim() + "%'";
            if (txtUname.Text != "")
                sql += " and uname like '%" + txtUname.Text.Trim() + "%'";
            if (txtPhone.Text != "")
                sql += " and uPhone like '%" + txtPhone.Text.Trim() + "%'";
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

        protected string GetState(string state)
        {
            string result = "";
            try
            {
                switch (state)
                {
                    case "0":
                        result = "采购用户";
                        break;
                    case "1":
                        result = "资料上传";
                        break;
                    case "2":
                        result = "管理员";
                        break;
                }
                return result;

            }
            catch (Exception ex)
            {
                return result;
            }
        }

        protected string GetsState(string state)
        {
            string result = "";
            try
            {
                switch (state)
                {
                    case "0":
                        result = "正常";
                        break;
                    case "1":
                        result = "停用";
                        break;
                }
                return result;

            }
            catch (Exception ex)
            {
                return result;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            BindGridView();
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
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

        protected void btnT_Click(object sender, EventArgs e)
        {
            Button lb = (Button)sender;
            string sql = "update dyf_user set state=1 where id=" + lb.CommandArgument + "";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("操作成功！");
                BindGridView();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button lb = (Button)sender;
            string sql = "update dyf_user set state=0 where id=" + lb.CommandArgument + "";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("操作成功！");
                BindGridView();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button lb = (Button)sender;
            RepeaterItem rptItem = lb.Parent as RepeaterItem;
            Label txt = rptItem.FindControl("Label2") as Label;
            string sql = "";
            if (DateTime.Parse(txt.Text) >= DateTime.Now)
            {
                sql = sql = "update dyf_user set expireDate='" + DateTime.Parse(txt.Text).AddYears(1) + "' where id=" + lb.CommandArgument + "";
            }
            else
            {
                sql = sql = "update dyf_user set expireDate='" + DateTime.Now.AddYears(1) + "' where id=" + lb.CommandArgument + "";
            }
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                MessageBox("操作成功！");
                BindGridView();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
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
            Response.Redirect("/ASPX/HouTai/AddAdmin.aspx");
        }
    }
}