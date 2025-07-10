<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>零件交易中心管理系统 - 注册</title>
    <%@ include file="header.jsp" %>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f0f3f4;
        }

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
            color: #4f566f;
            /*color: #958dc6;*/
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
            <form name="form" id="register_form" method="post" class="form-validation">
                <input type="hidden" name="created" value="<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>">

                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="密码" required>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="confirmPassword" placeholder="确认密码" required>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" name="address" placeholder="住址" required>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" name="telephone" placeholder="电话号码" required pattern="[0-9]{11}" title="请输入11位手机号码">
                </div>

                <div class="form-group">
                    <select class="form-control" name="type" id="chooseIdentify" required>
                        <option value="customer">购买者</option>
                        <option value="supplier">供应商</option>
                    </select>
                </div>

                <button type="submit" class="login-btn">注册</button>
            </form>
            <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
            <script>
                $("#register_form").submit(function () {
                    const password = $("input[name='password']").val();
                    const confirmPassword = $("input[name='confirmPassword']").val();

                    if (password !== confirmPassword) {
                        alert("两次输入的密码不一致，请重新输入！");
                        return false;
                    }

                    $.ajax({
                        url: '/servlet/register',
                        type: 'POST',
                        data: {
                            username: $("input[name='username']").val(),
                            password: password,
                            confirmPassword: confirmPassword,
                            address: $("input[name='address']").val(),
                            telephone: $("input[name='telephone']").val(),
                            type: $("select[name='type']").val(),
                            created: $("input[name='created']").val()
                        },
                        error: function (data) {
                            alert("error" + data);
                            return false;
                        },
                        success: function (data) {
                            var results = $.parseJSON(data);
                            if (results.status === 1) {
                                alert("注册成功，即将为您跳转登录页面");
                                window.location.href="/index.jsp";
                            } else {
                                alert("注册失败，原因：用户名被占用，请更换用户名");
                            }
                        }
                    });
                    return false;
                });
            </script>


            <div class="login-footer">
                <a href="${pageContext.request.contextPath}/index.jsp" class="register-link">已有账号？立即登录</a>
            </div>
            <div >


                <p>北京化工大学 郭连博</p> <p>© <%= new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date()) %></p>
            </div>
        </div>
        </div>


    <script src="./assets/js/function.js"></script>
    <script src="./assets/js/core.js"></script>
</body>
</html>