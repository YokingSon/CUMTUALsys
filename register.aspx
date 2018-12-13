<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>register</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" href="css/jquery.jgrowl.min.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />

     <style>
	input::-webkit-input-placeholder{
		color:rgba(0, 0, 0, 0.726);
	}
	input::-moz-placeholder{   /* Mozilla Firefox 19+ */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
		color:rgba(0, 0, 0, 0.726);
	}
         #form3 {
             height: 496px;
         }
     </style>

</head>
<body>
    <div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
                    <div class="pc">
                        <a href="userlogin.aspx"><img src="images/返回.png" /></a>
                    </div>
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>用户注册</h3>
    <form id="form3" runat="server">

        <div class="input_outer">
		<span class="u_user"></span>
          <asp:TextBox ID="TextBox1" runat="server" class="text" 
         style="color: #000000 !important" type="text" placeholder="请输入账号"></asp:TextBox>
	  </div>
	  <div class="input_outer">
		<span class="us_uer"></span>
          <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"  class="text" style="color: #000000 !important" placeholder="请输入密码" ></asp:TextBox>
	  </div>
        <div class="input_outer">
		<span class="us_uer"></span>
        <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"  class="text" style="color: #000000 !important" placeholder="请输入密码" ></asp:TextBox>
	  </div>
        <div class="input_outer">
		<span class="o_user"></span>
          <asp:TextBox ID="TextBox4" runat="server" class="text" 
         style="color: #000000 !important" type="text" placeholder="请输入手机号"></asp:TextBox>
	  </div>
        <div class="input_outer">
		<span class="s_user"></span>
            <asp:DropDownList ID="DropDownList1" runat="server" class="text" 
         style="color: #000000 !important;bgcolor:#FFFFFF">
                <asp:ListItem Selected="True">杏苑1号楼</asp:ListItem>
                <asp:ListItem>杏苑2号楼</asp:ListItem>
                <asp:ListItem>杏苑3号楼</asp:ListItem>
                <asp:ListItem>桃苑1号楼</asp:ListItem>
                <asp:ListItem>桃苑2号楼</asp:ListItem>
                <asp:ListItem>桃苑3号楼</asp:ListItem>
                <asp:ListItem>桃苑4号楼</asp:ListItem>
                <asp:ListItem>桃苑5号楼</asp:ListItem>
                <asp:ListItem>松苑1号楼</asp:ListItem>
                <asp:ListItem>松苑2号楼</asp:ListItem>
                <asp:ListItem>松苑3号楼</asp:ListItem>
                <asp:ListItem>松苑4号楼</asp:ListItem>
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
	  </div>
		<div id="LOGIN" class="mb2">
            <asp:Button ID="Button1" runat="server" class="act-but submit" style="color: #FFFFFF" Text="注册"  OnClick="Button1_Click" />
    </form>
                     </div>
				</div>
			</div>
		</div><!-- /container -->
    <script src="js/TweenLite.min.js"></script>
    <script src="js/EasePack.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/rAF.js"></script>
    <script src="js/demo-1.js"></script>
    <div style="text-align:center;">
    </div>
</body>
</html>
