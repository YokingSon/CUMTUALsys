<%@ WebHandler Language="C#" Class="init" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class init : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        DBuser dh = new DBuser();
        //选择最新的8个失物，可以更改数量
        string sql = "select top 8 * from 失物登记表 where 失物状态= 'Y' order by 编号 DESC";
        SqlDataReader reader = dh.queryDb(sql);
        List<lost> lostlist = new List<lost>();
         if (reader.HasRows==true)
        //datareader.HasRows 只是检则库中是否有记录,如果有则返回true,还得再用read()读取.
        {
            while (reader.Read())
            {
                lost outp = new lost();
                outp.type=(string)reader[1];
                outp.attribute=(string)reader[3];
                outp.location=(int)reader[2];
                outp.getlocation=(string)reader[4];
                lostlist.Add(outp);
            }
            dh.closeDb();
            string res = JsonConvert.SerializeObject(lostlist);
            //JOSN格式实例化
            context.Response.Write(res);
        }
        else
        {
            context.Response.Write("error");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}