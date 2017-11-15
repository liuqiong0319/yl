using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class AdmOrders : WebHyDyf.SysCode.PageLog
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
            string sql = "select * from dyf_order where 1=1";
            if (txtDDH.Text != "")
                sql += " and id like '%" + txtDDH.Text.Trim() + "%'";
            if (txtSHR.Text != "")
                sql += " and uname like '%" + txtSHR.Text.Trim() + "%'";
            if (txtLXDH.Text != "")
                sql += " and phone like '%" + txtLXDH.Text.Trim() + "%'";
            if (ddlSH.SelectedValue != "-1")
                sql += " and state=" + ddlSH.SelectedValue + "";
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
                MessageBox("查不到订单！");
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
                        result = "未付款";
                        break;
                    case "1":
                        result = "已付款";
                        break;
                    case "2":
                        result = "取消订单";
                        break;
                    case "3":
                        result = "已发货";
                        break;
                }
                return result;

            }
            catch (Exception ex)
            {
                return result;
            }
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
        protected void rp_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblWc = (Label)e.Item.FindControl("lblWc");
                LinkButton lbQxdd = (LinkButton)e.Item.FindControl("LinkButton3");
                LinkButton lbFh = (LinkButton)e.Item.FindControl("clickhere");
                HiddenField hiddState = (HiddenField)e.Item.FindControl("hiddState");
                switch (hiddState.Value)
                {
                    case "0":
                        lbQxdd.Visible = true;
                        lbFh.Visible = false;
                        lblWc.Visible = false;
                        break;
                    case "1":
                        lbQxdd.Visible = false;
                        lbFh.Visible = true;
                        lbFh.Visible = true;
                        lblWc.Visible = false;
                        break;
                    case "2":
                        lbQxdd.Visible = false;
                        lbFh.Visible = false;
                        lblWc.Visible = false;
                        break;
                    case "3":
                        lbQxdd.Visible = false;
                        lbFh.Visible = true;
                        lbFh.Text = "更新物流";
                        lblWc.Visible = true;
                        break;
                }
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
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
            LinkButton lb = (LinkButton)sender;
            string sql = "update dyf_order set  state =2 where id=" + lb.CommandArgument + "";
            int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            if (num > 0)
            {
                string sql1 = "update dyf_orderDe set bs=2 where orderid=" + lb.CommandArgument + "";
                int s = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
                if (s > 0)
                {
                    MessageBox("订单取消成功！");
                    BindGridView();
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
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
            LinkButton lb = (LinkButton)sender;
            Response.Redirect("/ASPX/Shop/Submit.aspx?orderid=" + lb.CommandArgument + "");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
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

            LinkButton lb = (LinkButton)sender;

            Response.Redirect("/ASPX/HouTai/Logistical.aspx?orderid=" + lb.CommandArgument + "");
            //string sql = "update dyf_order set  state =3 where id=" + lb.CommandArgument + "";
            //int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
            //if (num > 0)
            //{
            //    string sql1 = "update dyf_orderDe set bs=3 where orderid=" + lb.CommandArgument + "";
            //    int s = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
            //    if (s > 0)
            //    {
            //        MessageBox("已发货！");
            //        BindGridView();
            //    }
            //}
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            BindGridView();
        }
    }
}