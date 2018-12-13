using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using CUMTUAL.App_Code;
using System.Data.SqlClient;

public partial class managerlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    //登录按钮的单击事件
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断是否非空
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {
            MessageBox.Show("请填写管理员ID或密码!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        else
        {
            DBuser dh = new DBuser();
            string managerid = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string sql = "select 登录密码,管理站点 from 管理员表 where ID='" + managerid + "';";
            SqlDataReader reader = dh.queryDb(sql);
            if (reader.HasRows)
            {
                reader.Read();
                //判断密码是否正确
                if (((string)reader[0]) == password)
                {
                    Response.Cookies["stayid"].Value =reader[1].ToString();
                    dh.closeDb();
                    //转到管理员界面
                    Response.Redirect("manager.aspx");
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
                MessageBox.Show("管理员ID不存在!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            }

        }
    }
}