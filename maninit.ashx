<%@ WebHandler Language="C#" Class="maninit" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class maninit : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string stayid = context.Request.Cookies["stayid"].Value.ToString();
        List<string> mlistinfo = new List<string>();
        mlistinfo.Add(stayid);
        DBuser dh = new DBuser();
        string sql1 = "select count(*) from 失物登记表 where 失物状态='Y'";
        string sql2 = "select count(*) from 雨伞归还表 where 归还站点='"+stayid + "'";
        string sql3 = "select count(*) from 雨伞借出表 where 借出站点='"+stayid + "'";
        string sql4 = "select 雨伞余量 from 站点雨伞情况表 where 站点='"+stayid + "'";
        SqlDataReader reader1 = dh.queryDb(sql1);
        SqlDataReader reader2 = dh.queryDb(sql2);
        SqlDataReader reader3 = dh.queryDb(sql3);
        SqlDataReader reader4 = dh.queryDb(sql4);
        if (reader1.HasRows==true && reader2.HasRows==true && reader3.HasRows==true && reader4.HasRows==true)
        {
            reader1.Read();
            string lostall=reader1[0].ToString();
            mlistinfo.Add(lostall);
            reader2.Read();
            string reall=reader2[0].ToString();
            mlistinfo.Add(reall);
            reader3.Read();
            string outall=reader3[0].ToString();
            mlistinfo.Add(outall);
            reader4.Read();
            string umall=reader4[0].ToString();
            mlistinfo.Add(umall);
            string res = JsonConvert.SerializeObject(mlistinfo);
            //JOSN格式实例化
            context.Response.Write(res);     
        }
        else
        {
            context.Response.Write("error");
        }
       dh.closeDb();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}