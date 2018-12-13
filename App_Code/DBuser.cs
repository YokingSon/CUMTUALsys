using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// DBuser 的摘要说明
/// </summary>
namespace CUMTUAL.App_Code
{
      public class DBuser
   {
        //连接字符串
        private static readonly string connStr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;
        public DBuser() {}
        //建立连接
        public SqlConnection getConn()
        {
            conn = new SqlConnection(connStr);
            return conn;
        }
        //进行数据插入，更新等工作
        public int DBhandle(string sql)
        {
            try
            {
                SqlConnection sqlConn = getConn();
                cmd = new SqlCommand();
                cmd.Connection =sqlConn;
                cmd.CommandText = sql;
                cmd.Connection.Open();
                int res = cmd.ExecuteNonQuery();
                return res;
            }
            catch (Exception e)
            {
                return 0;
            }
            finally
            {
                cmd.Connection.Close();
                cmd.Dispose();
            }
        }
        //数据查询
        public SqlDataReader queryDb(string sql)
        {
            
                SqlConnection sqlConn = getConn();
                cmd = new SqlCommand();
                cmd.Connection = sqlConn;
                cmd.CommandText = sql;
                cmd.Connection.Open();
                return cmd.ExecuteReader();

        }
        public DataTable DTquery(string sql)
        {
            try
            {
                SqlConnection sqlConn = getConn();
                cmd = new SqlCommand();
                cmd.Connection = sqlConn;
                cmd.CommandText = sql;
                cmd.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                cmd.Connection.Close();
                cmd.Dispose();
            }
        }
        //关闭连接
        public void closeDb()
        {
            cmd.Connection.Close();
            cmd.Dispose();
        }

    }
}
