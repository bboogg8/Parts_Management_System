<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Login" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>零件交易中心管理系统</title>
    <%@ include file="header.jsp" %>
    <style>
        html, body {
            /*background-image: url('assets/img/logo.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;*/
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f0f3f4;
        }
        /*.login-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

        }*/
        .login-container {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
            background-image: url('assets/img/background2.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding-right: 180px;
        }



        .login-title {
            margin-bottom: 80px;
            /*color: #d8e1e3;*/
            //color: #958dc6;
            color: #4f566f;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .login-btn {
            width: 50%;
            padding: 10px;
            background: #7266ba;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-footer {
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 12px;
            color: #666;
        }

        .register-link {
            margin-top: 15px;
            color: #7266ba;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%
        HttpSession session2 = request.getSession(true);
        Login loginBean = (Login) session2.getAttribute("login");

        if(loginBean != null) {
            response.sendRedirect("/" + loginBean.getType()+ "/dashboard.jsp");
            return;
        }
    %>

    <div class="login-container">
        <div class="login-box">
            <div class="login-title">
                <h3>零件交易中心管理系统</h3>
            </div>

            <form name="form" id="login_form" method="post" class="form-validation">
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="密码" required>
                </div>

                <div class="form-group">
                    <select class="form-control" name="type" id="chooseIdentify" required>
                        <option value="customer">购买者</option>
                        <option value="supplier">供应商</option>
                        <option value="trader">交易员</option>
                        <option value="maintainer">维护员</option>
                    </select>
                </div>

                <button type="submit" class="login-btn">登录</button>

            </form>

            <div class="login-footer">
                <a href="#" class="register-link">忘记密码？</a>
                <br>
                <a href="register.jsp" class="register-link">还没有账号？注册</a>


            </div>
            <p></p>
            <p>北京化工大学 郭连博</p><p>© <%= new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date()) %></p>
        </div>
    </div>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="./assets/js/core.js"></script>
    <script src="./assets/js/function.js"></script>

</body>
</html>