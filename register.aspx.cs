using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using CUMTUAL.App_Code;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //注册按钮的单击事件
    protected void Button1_Click(object sender, EventArgs e)
    {
        string userid = TextBox1.Text.Trim();//学号
        string pwd = TextBox2.Text.Trim();//密码
        string phonenum = TextBox4.Text.Trim();//手机号
        string address = DropDownList1.Text;//地址
        string pn = @"^0?1[3|4|5|8][0-9]\d{8}$";//手机号的正则表达式
        Regex reg = new Regex(pn);
        string un = @"^\d{8}$";//学号的正则表达式
        Regex reg1 = new Regex(un);
        //判断非空
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "")
        {
            MessageBox.Show("请填写全部信息!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        else
        {
            if(TextBox3.Text!=TextBox2.Text)//判断两次输入密码是否一致
            {
                MessageBox.Show("两次密码不一致!请确认!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                return;
            }
            if (!reg.IsMatch(phonenum))//判断手机号格式是否正确
            {
                MessageBox.Show("手机号格式不正确!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                return;
            }
            if (!reg1.IsMatch(userid))//判断学号是否是8位
            {
                MessageBox.Show("请输入8位学号!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                return;
            }
             userid = TextBox1.Text.Trim();
             pwd = TextBox2.Text.Trim();
             phonenum = TextBox4.Text.Trim();
             address = DropDownList1.Text;
            DBuser dh = new DBuser();
            string sql = "select 学工号 from 用户表 where 学工号='" + userid + "';";
            SqlDataReader reader = dh.queryDb(sql);
            //判断用户是否已经存在
            if (reader.HasRows)
            {
                reader.Read();
                dh.closeDb();
                MessageBox.Show("用户已存在!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                return;
            }
            string sql1 = "insert into 用户表 (学工号,密码,手机号,住址) values ('" + userid + "','" + pwd+ "','" + phonenum+ "','" + address+ "')";
            int res = dh.DBhandle(sql1);
            //插入注册信息
            if (res > 0)
            {
                MessageBox.Show("注册成功!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                dh.closeDb();
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                dh.closeDb();
                MessageBox.Show("注册失败!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            }

        }
    }
}