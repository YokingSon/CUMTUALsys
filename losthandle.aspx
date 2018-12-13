<%@ Page Language="C#" AutoEventWireup="true" CodeFile="losthandle.aspx.cs" Inherits="losthandle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script>
        function a() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 0;
        }
        function b() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 1;
        }
        function c() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 2;
        }
        function d() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 3;
        }
        function e() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 4;
        }
        function f() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 5;
        }
        function g() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 6;
        }
        function h() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 7;
        }
        function i() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 8;
        }
        function j() {
            var myddl = document.getElementById("DropDownList2");
            myddl.selectedIndex = 9;
        }

    </script>
<body style="background-image:url(../images/beijing.png)">
         <div class="pc">
   <a href="manager.aspx"><img src="images/返回.png" /></a>
    </div>

    <form id="form1" runat="server" style="text-align:center">
    <div>
        <h1>失物登记表</h1>
    <asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="True" Font-Size="Large" Width="80px">
              <asp:ListItem Selected="True">校园卡</asp:ListItem>
              <asp:ListItem>身份证</asp:ListItem>
              <asp:ListItem>钱包</asp:ListItem>
              <asp:ListItem>手机</asp:ListItem>
              <asp:ListItem>U盘</asp:ListItem>
              <asp:ListItem>耳机</asp:ListItem>
              <asp:ListItem>背包</asp:ListItem>
              <asp:ListItem>其它</asp:ListItem>
          </asp:DropDownList>
        <asp:TextBox ID="attributes" runat="server" Height="20px" placeholder="失物属性描述"></asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server"  style="color: #000000 !important;bgcolor:#FFFFFF" Font-Bold="True" Font-Size="Large" Width="100px">
              <asp:ListItem>图书馆</asp:ListItem>
              <asp:ListItem>一食堂区</asp:ListItem>
              <asp:ListItem>二食堂区</asp:ListItem>
              <asp:ListItem>三食堂区</asp:ListItem>
              <asp:ListItem>教学区</asp:ListItem>
              <asp:ListItem>学院区</asp:ListItem>
              <asp:ListItem>第一运动场</asp:ListItem>
              <asp:ListItem>第二运动场</asp:ListItem>
              <asp:ListItem>第三运动场</asp:ListItem>
              <asp:ListItem>不显山区</asp:ListItem>
              <asp:ListItem Selected="True">其他区域</asp:ListItem>   
          </asp:DropDownList>

        <asp:TextBox ID="pickertext" runat="server" Height="20px" placeholder="拾到者登记"></asp:TextBox>

        <asp:Button runat="server" ID="regi" Text="登记" OnClick="lostbtn_Click" Font-Bold="True" Font-Size="Medium" />
    </div>
    <div>
         <asp:TextBox ID="bianhaotext" runat="server" Height="20px" placeholder="编号"></asp:TextBox>
         <asp:TextBox ID="takertext" runat="server" Height="20px" placeholder="领取者登记"></asp:TextBox>
         <asp:Button runat="server" ID="retu" Text="归还" OnClick="returnbtn_Click" Font-Bold="True" Font-Size="Medium" />
    </div>
        <p><big>可单击地图选择区域：</big></p>
          <img src ="images/cumtmap.jpg" alt="cumt" usemap ="#cumtmap" />
<map id ="cumtmap">
 <area shape ="poly" coords ="576,190,576,340,510,342,481,294,458,227,492,191"  alt="图书馆" onclick="a()" />
 <area shape ="poly" coords ="410,144,411,75,568,78,606,112,606,190,492,191"  alt="一食堂" onclick="b()"/>
 <area shape ="poly" coords ="200,30,225,97,234,110,205,141,276,233,367,159,410,144,411,75,413,0" alt="二食堂" onclick="c()" />
 <area shape ="poly" coords ="71,269,122,255,120,222,205,141,276,233,198,298,86,327" alt="三食堂" onclick="d()" />
 <area shape ="poly" coords ="238,266,345,395,439,430,518,415,560,420,560,359,576,359,576,340,510,342,481,294,458,227,492,191,410,144,367,159" alt="教学区" onclick="e()" />
 <area shape ="poly" coords ="576,190,836,190,958,461,958,526,518,521,518,415,560,420,560,359,576,359" alt="学院区" onclick="f()" />
 <area shape ="poly" coords ="612,0,615,97,597,103,606,112,606,190,836,190,771,0" alt="第一运动场" onclick="g()" />
 <area shape ="poly" coords ="411,75,413,0,612,0,615,97,597,103,568,78" alt="第二运动场" onclick="h()" />
 <area shape ="poly" coords ="225,97,48,138,71,269,122,255,120,222,205,141,234,110" alt="第三运动场" onclick="i()" />
 <area shape ="poly" coords ="518,521,119,513,86,327,198,298,238,266,345,395,439,430,518,415" alt="不显山区" onclick="j()" />
</map>
    </form>
   
</body>
</html>
