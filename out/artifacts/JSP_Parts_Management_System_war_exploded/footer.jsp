<%--
  Created by IntelliJ IDEA.
  User: tiramisu
  Date: 2024/12/7
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer id="footer" class="app-footer" role="footer">
    <div class="wrapper b-t bg-light">
        <span class="pull-left">© <%= new java.util.Date().getYear() + 1900 %> Copyright.</span>
        <span class="pull-right"> created by 郭连博</span>
    </div>
</footer>
</div>

<style>
    @media (max-width: 767px) {
        footer{
            display: none;
        }
    }
</style>

<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../assets/js/jquery.bootstrap-touchspin.min.js"></script>
<script src="../assets/js/function.js"></script>
<script src="../assets/js/core.js"></script>

<script>
    $.ajax({
        url: '../servlet/showTable',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            results = $.parseJSON(data);
            $('#buyNum').html(results.buyNum);
            $('#transactionNum').html(results.transactionNum);
            $('#supplierNum').html(results.supplierNum);
            $('#traderNum').html(results.traderNum);

        }
    });
</script>

</body>
</html>