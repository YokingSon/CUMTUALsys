<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userlogin.aspx.cs" Inherits="userlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>userlogin</title>
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
</style>

</head>
<body>
    	<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
                    <div class="pc">
                        <a href="index.html"><img src="images/返回.png" /></a>
                    </div>
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>用户登录</h3>
    <form id="form1" runat="server" action="#" name="f" method="post">
      <div class="input_outer">
		<span class="u_user"></span>
      
          <asp:TextBox ID="TextBox1" runat="server" class="text" 
         style="color: #000000 !important" type="text" placeholder="请输入账户 "></asp:TextBox>
	  </div>
	  <div class="input_outer">
		<span class="us_uer"></span>
          <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" class="text" style="color: #000000 !important "
         placeholder="请输入密码" ></asp:TextBox>
	  </div>
		<div id="LOGIN" class="mb2">
            <asp:Button ID="Button1" runat="server" class="act-but submit" style="color: #FFFFFF" Text="登陆"  OnClick="Button1_Click" />
		</div>

    </form>
      <div class="zhuce">
          <a href="register.aspx"><img src="images/注册.png" /></a><br />
          <b>新用户</b>

      </div>
                	</div>
				</div>
			</div>
		</div><!-- /container -->

    <script src="js/TweenLite.min.js"></script>
    <script src="js/EasePack.min.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/rAF.js"></script>
    <script src="js/demo-1.js"></script>
    <%--<script src="js/jquery.jgrowl.min.js"></script>
    <script src="js/userLongin.js"></script>--%>
    <div style="text-align:center;">
    </div>
</body>
</html>
