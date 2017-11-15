using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class JgAdmin : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                rp_LeftBind();
            }
        }
        PagedDataSource pds = new PagedDataSource();

        public void BindGridView()
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login_YJG.aspx';", true);
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
            if (start.Text != "")
            {
                sql += " and inserttime>='" + start.Text + "'";
            }
            if (end.Text != "")
            {
                sql += " and inserttime<='" + end.Text + "'";
            }

            sql += " order by inserttime desc";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                string sql1 = "select sum(je) from dyf_order where 1=1 ";
                if (txtDDH.Text != "")
                    sql1 += " and id like '%" + txtDDH.Text.Trim() + "%'";
                if (txtSHR.Text != "")
                    sql1 += " and uname like '%" + txtSHR.Text.Trim() + "%'";
                if (txtLXDH.Text != "")
                    sql1 += " and phone like '%" + txtLXDH.Text.Trim() + "%'";
                if (ddlSH.SelectedValue != "-1")
                    sql1 += " and state=" + ddlSH.SelectedValue + "";
                if (start.Text != "")
                {
                    sql1 += " and inserttime>='" + start.Text + "'";
                }
                if (end.Text != "")
                {
                    sql1 += " and inserttime<='" + end.Text + "'";
                }
                DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query(sql1);
                if (ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                {
                    lblHj.Text = ds1.Tables[0].Rows[0][0].ToString();
                }
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

        public void rp_LeftBind()
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            string sql = "select * from dyf_minLeft where bs=" + Session["Utype"].ToString() + "";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                rp_Left.DataSource = ds.Tables[0].DefaultView;
                rp_Left.DataBind();
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            LinkButton lb = (LinkButton)sender;
            Response.Redirect("/ASPX/JgIn.aspx?orderid=" + lb.CommandArgument + "");
        }

        decimal ta;
        protected void rp_cart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label lblje = (Label)e.Item.FindControl("lblje");
                //DataRowView drv = (DataRowView)e.Item.DataItem;
                ta = ta + Convert.ToDecimal(lblje.Text);
            }
            lblsumje.Text = ta.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        public void CreateExcel(DataSet ds, string FileName)
        {
            HttpResponse resp;
            resp = Page.Response;
            resp.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            resp.AppendHeader("Content-Disposition", "attachment;filename=" + FileName);
            string colHeaders = "", ls_item = "";

            //定义表对象与行对象，同时用DataSet对其值进行初始化 
            DataTable dt = ds.Tables[0];
            DataRow[] myRow = dt.Select();//可以类似dt.Select("id>10")之形式达到数据筛选目的
            int i = 0;
            int cl = dt.Columns.Count;

            //取得数据表各列标题，各标题之间以t分割，最后一个列标题后加回车符 
            for (i = 0; i < cl; i++)
            {
                if (i == (cl - 1))//最后一列，加n
                {
                    colHeaders += dt.Columns[i].Caption.ToString() + "\n";
                }
                else
                {
                    colHeaders += dt.Columns[i].Caption.ToString() + "\t";
                }

            }
            resp.Write(colHeaders);
            //向HTTP输出流中写入取得的数据信息 

            //逐行处理数据   
            foreach (DataRow row in myRow)
            {
                //当前行数据写入HTTP输出流，并且置空ls_item以便下行数据     
                for (i = 0; i < cl; i++)
                {
                    if (i == (cl - 1))//最后一列，加n
                    {
                        ls_item += "'" + row[i].ToString() + "\n";
                    }
                    else
                    {
                        ls_item += "'" + row[i].ToString() + "\t";
                    }

                }
                resp.Write(ls_item);
                ls_item = "";

            }
            resp.End();
        }

        protected void btnDc_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "3")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login_YJG.aspx';", true);
                return;
            }
            string sql = "select a.id as 订单号,a.uname as 买方,a.gdPhone as 固定电话,a.phone as 手机号,a.adress as 收货地址,a.code as 邮政编码,a.ltitle as 物流,a.logistics as 物流信息,b.ypmc as 药品名称,b.cdmc as 产地名称,b.gg as 规格,b.bz as 包装,b.zbz as 中包装,b.ph as 批号,b.dj as 单价,b.sl as 数量,b.je as 金额,b.inserttime as 采购日期,b.bs as 订单状态,'安徽华源大药房连锁有限公司' as 供货方 from ((select * from dyf_order) a left join (select * from dyf_orderDe) b on a.id=b.orderid) where 1=1 ";
            if (txtDDH.Text != "")
                sql += " and a.id like '%" + txtDDH.Text.Trim() + "%'";
            if (txtSHR.Text != "")
                sql += " and a.uname like '%" + txtSHR.Text.Trim() + "%'";
            if (txtLXDH.Text != "")
                sql += " and a.phone like '%" + txtLXDH.Text.Trim() + "%'";
            if (ddlSH.SelectedValue != "-1")
                sql += " and a.state=" + ddlSH.SelectedValue + "";
            if (start.Text != "")
            {
                sql += " and a.inserttime>='" + start.Text + "'";
            }
            if (end.Text != "")
            {
                sql += " and a.inserttime<='" + end.Text + "'";
            }
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            CreateExcel(ds, "report.xls");
        }

    }
}