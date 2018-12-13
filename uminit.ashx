<%@ WebHandler Language="C#" Class="uminit" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class uminit : IHttpHandler {

       public void ProcessRequest (HttpContext context) {
        DBuser dh = new DBuser();
        string sql = "select * from 站点雨伞情况表 order by 站点 ASC";
        SqlDataReader reader = dh.queryDb(sql);
        List<ZDstate> zdstatelist = new List<ZDstate>();
        if (reader.HasRows)
        //datareader.HasRows 只是检则库中是否有记录,如果有则返回true,还得再用read()读取.
        {
            while (reader.Read())
            {
                ZDstate zd = new ZDstate();
                zd.zhandian = (int)reader[0];
                zd.umnum = (int)reader[1];
                zdstatelist.Add(zd);
            }
            dh.closeDb();
            string res = JsonConvert.SerializeObject(zdstatelist);
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