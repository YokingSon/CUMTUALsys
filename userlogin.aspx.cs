using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using CUMTUAL.App_Code;
using System.Data.SqlClient;

public partial class userlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //登录按钮单击事件
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")//判断是否非空
        {
            MessageBox.Show("请填写学工号或密码!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        else
        {
            DBuser dh = new DBuser();
            string userid = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string sql = "select 密码,借伞状态 from 用户表 where 学工号='" + userid + "';";
            SqlDataReader reader = dh.queryDb(sql);
            if (reader.HasRows)
            {
                reader.Read();
                //判断密码是否正确
                if (((string)reader[0]) == password)
                {
                    Response.Cookies["userid"].Value= userid;
                    dh.closeDb();
                    //转到用户界面
                    Response.Redirect("user.aspx");
                }
                else
                {
                    dh.closeDb();
                    MessageBox.Show("密码错误!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                }
            }
            else
            {
                dh.closeDb();
                MessageBox.Show("学工号不存在!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            }

        }

    }
}