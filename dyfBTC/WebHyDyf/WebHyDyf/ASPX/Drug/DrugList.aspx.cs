using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.Drug
{
    public partial class DrugList : WebHyDyf.SysCode.PageLog
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


            string sql = "select * from  kcbs where 1=1 ";
            if (!string.IsNullOrEmpty(Request.QueryString["key"]))
            {
                string keywords = Request.QueryString["key"];
                if (keywords.Length > 0)
                {
                    string[] keys = keywords.ToUpper().Split(' ');
                    foreach (string key in keys)
                    {
                        sql += " and ( ypmc like '%" + key + "%' or cdmc like '%" + key + "%'  or gg like '%" + key + "%')  ";
                    }
                }
            }
            sql += " order by dj desc";
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
                rp_drug.DataSource = pds;
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

                rp_drug.DataBind();
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

        protected void btnJoin_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            string sql = "insert into dyf_gwc(ypid,userid,joindate) values (" + bt.CommandArgument + "," + Session["userid"].ToString() + ",'" + DateTime.Now + "') ";
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

        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}