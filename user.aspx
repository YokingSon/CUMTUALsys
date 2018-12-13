<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
&nbsp;<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width"/><title>欢迎使用</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/addToolbar.js"></script>
<script src="js/menu.js"></script>
<%--<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.8&key=6bee925d9922f64c254c1ed4821f17fe&plugin=AMap.Walking&plugin=AMap.AdvancedInfoWindow"></script>--%>
<script type="text/javascript" src="js/gaodeapi.js"></script>
<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
</head>

<body style="background-image:url(../images/beijing.png)">

<h1 style="text-align:right;margin-right:23%;text-shadow: 2px 2px 2px #666; " >欢迎使用CUMT爱心雨伞与失物管理系统</h1>

<div id="tip" style="line-height: 24px"></div>

<table  width ="50%" border="0" align="right"  cellpadding="0" cellspacing="0" style="font-size:20px;margin-top:10px;margin-right:17%;z-index:1;">
	<tr>
		<td width="25%">
			<div align="center" id="Tdiv_1" class="menubar">
				<div class="header">雨伞服务</div>
				<div align="left" id="Div1" class="menu">
                   <%-- <a href="#" onclick="umsrerch()">雨伞查询</a>--%>
					<a href="#" onclick="broum()">雨伞出借</a><br>
					<a href="#" onclick="retum()">雨伞归还</a><br>
				</div>
			</div>
		</td>
		<td width="25%">
			<div align="center" id="Tdiv_2" class="menubar">
				<div class="header">失物管理</div>
				<div align="left" id="Div2" class="menu">
					<a href="lostquery.aspx">失物查询</a>
				</div>
			</div>
		</td>
		<td width="25%">
			<div align="center" id="Tdiv_3" class="menubar">
				<div class="header">导航服务</div>
				<div align="left" id="Div3" class="menu">
					<a href="#"onclick="daohang1()">站点导航</a><br>
					<a href="#"onclick="daohang2()">校园导航</a>
                    <a href="#"onclick="daohang3()">更多服务</a>
				</div>
			</div>
		</td>
		<td width="25%">
			<div align="center" id="Tdiv_4" class="menubar">
				<div class="header">新鲜一点</div>
				<div align="left" id="Div4" class="menu">
					<a href="howtouse.html">使用规则</a><br>
					<%--<a href="uminfo.aspx">雨伞的信息</a><br>--%>
					<a href="#"onclick="trade()">雨伞的轨迹</a>
				</div>
			</div>
		</td>
	</tr>
</table>
   
<div id="leftcolumn" >

  <p style="text-align:center">失物公告：</p>   
 <div id="scrollDiv">
   <ul id="lostput">
   
   </ul>
 </div></div>
 <div id="searchstyle">
 <form id="form1" runat ="server">
     <p id="rem">所在管理服务点：</p>
     <asp:DropDownList ID="DropDownList1" runat="server" 
         style="color: #000000 !important;bgcolor:#FFFFFF">
                <asp:ListItem>图书馆</asp:ListItem>
                <asp:ListItem>矿业学院</asp:ListItem>
                <asp:ListItem>建筑学院</asp:ListItem>
                <asp:ListItem>计算机学院</asp:ListItem>
                <asp:ListItem>信控学院</asp:ListItem>
                <asp:ListItem>博1楼</asp:ListItem>
                <asp:ListItem>博3楼</asp:ListItem>
                <asp:ListItem>博4楼</asp:ListItem>
                <asp:ListItem>博5楼</asp:ListItem>
                <asp:ListItem>体育馆</asp:ListItem>
                <asp:ListItem>桃苑1号楼</asp:ListItem>
                <asp:ListItem>桃苑2号楼</asp:ListItem>
                <asp:ListItem>桃苑3号楼</asp:ListItem>
                <asp:ListItem>桃苑4号楼</asp:ListItem>
                <asp:ListItem>桃苑5号楼</asp:ListItem>
                <asp:ListItem>松苑1号楼</asp:ListItem>
                <asp:ListItem>松苑2号楼</asp:ListItem>
                <asp:ListItem>松苑3号楼</asp:ListItem>
                <asp:ListItem>松苑4号楼</asp:ListItem>
                <asp:ListItem Selected="True">杏苑1号楼</asp:ListItem>
                <asp:ListItem>杏苑2号楼</asp:ListItem>
                <asp:ListItem>杏苑3号楼</asp:ListItem>
                <asp:ListItem>竹苑1号楼</asp:ListItem>
                <asp:ListItem>竹苑2号楼</asp:ListItem>
                <asp:ListItem>竹苑3号楼</asp:ListItem>
                <asp:ListItem>竹苑4号楼</asp:ListItem>
                <asp:ListItem>梅苑1号楼</asp:ListItem>
                <asp:ListItem>梅苑2号楼</asp:ListItem>
                <asp:ListItem>梅苑3号楼</asp:ListItem>
                <asp:ListItem>研究生1号公寓</asp:ListItem>
                <asp:ListItem>研究生2号公寓</asp:ListItem>
                <asp:ListItem>研究生3号公寓</asp:ListItem>
            </asp:DropDownList>
       <br />
       <asp:Button ID="Button1" runat="server" style="color: #000" Text="租借"  OnClick="Button1_Click" />
       <asp:Button ID="Button2" runat="server" style="color: #000" Text="归还"  OnClick="Button2_Click" />
       <input type="button"id="button3" name="导航" value ="导航" onclick="leadto()"/>
       <input type="text" id="text1" name="text1" placeholder="出发地"/><br/><br/>
       <input type="text" id="text2" name="text2" placeholder="目的地"/><br/><br />
       <input type="button"id="button4" name="导航" value ="导航" onclick="AtoB()"/>
   </form>
  </div>
</div>
<div id="rightcolumn">

</div>
<input type="button" id="clearroute" value="清除规划结果" onclick="qc()" style="position:absolute;top:720px; left:1280px" />
</body>
</html>