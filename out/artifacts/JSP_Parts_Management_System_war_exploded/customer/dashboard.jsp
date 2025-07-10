<%--
  Created by IntelliJ IDEA.
  User: tiramisu
  Date: 2024/12/26
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Login" %>
<%
    // 如果用户名已经存在，说明已经登录，跳转到主页

    HttpSession session4 = request.getSession(true);
    Login loginBean = (Login) session4.getAttribute("login");

    if(loginBean == null){%>
<script>
    window.location="../index.jsp";
</script>

<% }
%>

<style>
    /*.dashboard-container {
        min-height: 100vh;
        width: 100%;
        background-image: url('../assets/img/background2.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }*/
</style>

<html>
<head>
    <title>零件交易中心管理系统——用户页面</title>

    <%@ include file="../header.jsp" %>

</head>
<body>
<div class="dashboard-container">


<div class="app app-aside-fixed container app-header-fixed">

    <!-- header -->
    <%@ include file="header.jsp" %>
    <!-- / header -->


    <!-- aside -->
    <%@ include file="leftSide.jsp" %>
    <!-- / aside -->


    <!-- content -->
    <%@ include file="content.jsp" %>
    <!-- /content -->

    <!-- footer -->
    <%@ include file="../footer.jsp"%>
    <!-- / footer -->

</div>
</div>

</body>
</html>
