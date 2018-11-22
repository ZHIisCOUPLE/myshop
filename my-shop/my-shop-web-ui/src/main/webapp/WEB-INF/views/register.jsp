
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>MyShop——个人注册</title>
    <link rel="stylesheet" type="text/css" href="../../css/index.css">
    <link rel="stylesheet" type="text/css" href="../../css/ziy.css">
    <script src="js/jquery-1.11.3.min.js" ></script>
    <!--
    <script src="js/index.js" ></script>  -->
    <%--<script type="text/javascript" src="js/jquery1.42.min.js"></script>--%>
    <!--
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.source.js"></script> -->

</head>
<body>
<!--dengl-->
<div class="yiny">
    <div class="beij_center">
        <div class="dengl_logo">
            <img src="images/logo_1.png">
            <h1>欢迎注册</h1>
        </div>
    </div>
</div>
<div class="beij_center">

    <div class="ger_zhuc_beij">
                                                                         <form action="/registerLaset" method="post" id="from">
        <div class="ger_zhuc_biaot">
            <ul>
                <li class="ger_border_color"><a href="zhuc.html">个人注册</a></li>
                <i>丨</i>
                <li><a href="shenq_ruz.html">申请入驻</a></li>
                <p>我已经注册，现在就<a class="ftx-05 ml10" href="dengl.html">登录</a></p>
            </ul>
        </div>
        <div class="zhuc_biaod">
            ${message}
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">用户名：</label>
              	</span>
                <input   class="i-text" type="text" name="userName" id="userName">
                <span id="un" style="color: red"></span>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-box" style="display: none;">--%>
                        <%--<div class="msg-weak" style="display: inline-block;"> <i></i>--%>
                            <%--<div class="msg-cont">4-20个字符，支持汉字、字母、数字及“-”、“_”组合</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="msg-weak err-tips"  style="display: inline-block;"><div>请输入用户名</div></div>--%>
                <%--</div>--%>
                <%--<span class="suc-icon"></span>--%>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">设置密码：</label>
              	</span>
                <input   class="i-text" type="password" name="password" id="password">
                <span id="pwd1" style="color: red"></span>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-box" style="display: none;">--%>
                        <%--<div class="msg-weak" style="display: inline-block;"> <i></i>--%>
                            <%--<div class="msg-cont">键盘大写锁定已打开，请注意大小写!</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="msg-weak err-tips"  style="display:none;"><div>请输入密码</div></div>--%>
                <%--</div>--%>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">确认密码：</label>
              	</span>
                <input   class="i-text" type="password" name="pwd" id="password2">
                <span id="pwd2" style="color: red"></span>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-weak err-tips"  style="display: none;"><div>密码不一样</div></div>--%>
                <%--</div>--%>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">手机号码：</label>
              	</span>
                <input   class="i-text" type="number" name="phone" id="phone">
                <span id="ph" style="color: red"></span>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-weak err-tips"  style="display:none;"><div>手机号不能为空</div></div>--%>
                <%--</div>--%>
            </div>

            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">邮箱地址：</label>
              	</span>
                <input   class="i-text" type="text" name="email" id="email">
                <span id="em" style="color: red"></span>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-weak err-tips"  style="display:none;"><div>手机号不能为空</div></div>--%>
                <%--</div>--%>
            </div>

            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name">验证码：</label>
              	</span>
                <input   class="i-text i-short" type="text" name="vCode" id="code">
                <%--*******************************************************************************************--%>
                <img id="vCode">
                <span id="cd" style="color: red"></span>
                <%--<div class="check check-border" style="position:relative;left:0">--%>
                    <%--<a class="check-phone" style="padding:11px 10px 14px 10px;*line-height:60px;">获取短信验证码</a>--%>
                    <%--<span class="check-phone disable" style="display: none;"><em>60</em>秒后重新获取</span>--%>
                    <%--<a class="check-phone" style="display: none;padding:11px 10px 14px 10px">重新获取验证码</a>--%>
                <%--</div>--%>
                <!--备注————display使用 inline-block-->
                <%--<div class="msg-box">--%>
                    <%--<div class="msg-weak err-tips"  style="display:none;"><div>请输入短信验证码</div></div>--%>
                <%--</div>--%>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name"> </label>
              	</span>
                <div class="dag_biaod">
                    <input type="checkbox" value="english" >
                    阅读并同意
                    <a href="#" class="ftx-05 ml10">《MyShop用户注册协议》</a>
                    <a href="#" class="ftx-05 ml10">《隐私协议》</a>
                </div>
            </div>
            <div class="reg-items" >
              	<span class="reg-label">
                	<label for="J_Name"> </label>
              	</span>
                <input class="reg-btn" value="立即注册" type="submit">
            </div>
        </div>
        <div class="xiaogg">
            <img src="../../images/cdsgfd.jpg">
        </div>
        </form>
    </div>
</div>


<div class="jianj_dib jianj_dib_1">
    <div class="beia_hao">
        <p>京ICP备：123456789号  </p>
        <p class="gonga_bei">京公网安备：123456789号</p>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    $(function () {
var un=1;
var pd=1;
var pd2=1;
var ph=1;
var em=1;
var cd=1;


 // 验证手机号正则表达式
        function isPhoneNo(phone) {
            var pattern = /^1[34578]\d{9}$/;
            return pattern.test(phone);
        }
 // 验证密码正则表达式
        function isPassword(pwd) {
            //输入6到18个数子
            var pattern = /^\d{6,16}$/;
            return pattern.test(pwd);
        }
 // 验证邮箱正则表达式
        function isEmail(email) {
            //输入6到18个数子
            var pattern = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
            return pattern.test(email);
        }
//用户名前验证
        $("#userName").blur(function() {
            var userName = $(this).val();
            if ($.trim(userName) == null || $.trim(userName)=="") {
                $("#un").html("用户名不能为空！");
                un=0;
            }else {
                $("#un").html("");
                un=1;
            }
        })
  //密码验证
        $("#password").blur(function() {
            var pwd = $(this).val();
            if ($.trim(pwd) == null || $.trim(pwd)=="") {
                $("#pwd1").html("密码不能为空！");
                pd=0;
            }else {
                if (isPassword(pwd)){
                    $("#pwd1").html("");
                    pd=1;
                }else {
                    $("#pwd1").html("密码格式不对!请输入至少6位，最多18位数字作为密码");
                    pd=0;
                }

            }

    //确认密码验证
            $("#password2").blur(function() {
                var pwd2 = $(this).val();
                if ($.trim(pwd2) == null || $.trim(pwd2)=="") {
                    $("#pwd2").html("确认密码不能为空！");
                    pd2=0;
                }else {
                    if ($.trim(pwd2)==$.trim(pwd)){
                        $("#pwd2").html("");
                        pd2=1;
                    }else {
                        $("#pwd2").html("确认密码与密码不一致!");
                        pd2=0;
                    }

                }
            })
        })

//手机号码验证
        $("#phone").blur(function() {
            var phone = $(this).val();
            if ($.trim(phone) == null || $.trim(phone)=="") {
                $("#ph").html("用户名不能为空！");
                ph=0;
            }else {
                if (isPhoneNo(phone)){
                    $("#ph").html("");
                    ph=1;
                }else {
                    $("#ph").html("电话号码格式不对");
                    ph=0;
                }

            }
        })

 //邮箱地址验证
        $("#email").blur(function() {
            var email = $(this).val();
            if ($.trim(email) == null || $.trim(email)=="") {
                $("#em").html("邮箱不能为空！");
                em=0;
            }else {
                if (isEmail(email)){
                    $("#em").html("");
                    em=1;
                }else {
                    $("#em").html("邮箱格式不对");
                    em=0;
                }

            }
        })

  //验证码验证
        $("#code").blur(function() {
            var code = $(this).val();
            if ($.trim(code) == null || $.trim(code)=="") {
                $("#cd").html("验证码不能为空！");
                cd=0;
            }else {
                    cd=1;

            }
        })

        //判断是否可以提交
        $("#from").submit(function () {
            // return false;
            if (un>0&&pd>0&&pd2>0&&ph>0&&em>0&&cd>0){
                // $("#from").submit();
                return true;
            } else {
                return false;
            }
        })
   //初始时的验证码
        $("#vCode").attr("src","/kaptcha?d+"+new Date());
  //点击刷新
        $("#vCode").click(function () {
            $("#vCode").attr("src","/kaptcha?d+"+new Date());
        })

    })
</script>