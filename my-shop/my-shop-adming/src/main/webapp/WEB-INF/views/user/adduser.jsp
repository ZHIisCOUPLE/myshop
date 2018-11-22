<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <jsp:include page="/WEB-INF/views/includes/top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/includes/left.jsp"></jsp:include>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <c:if test="${not empty errorMessage }">
                <br>
                <div class="alert alert-danger alert-dismissible ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${errorMessage}
                </div>
            </c:if>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">用户编辑</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="/user/add" method="post" id="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="Email1">邮件地址</label>
                                    <input type="email" class="form-control" value="${user.email}" name="email" id="Email1" placeholder="电子邮件">

                                    <input type="hidden" value="${user.id}" name="id" />

                                </div>
                                <c:if test="${empty user}">
                                <div class="form-group">
                                    <label for="Password1">密码</label>
                                    <input type="password" minlength="6" maxlength="18" required class="form-control" name="password" id="Password1" placeholder="密码">
                                </div>
                                </c:if>
                                <div class="form-group">
                                    <label for="userName">用户名</label>
                                    <input type="text" maxlength="10" minlength="3" required class="form-control" id="userName" value="${user.userName}" name="userName" placeholder="用户名">
                                </div>
                                <div class="form-group">
                                    <label for="phone">电话号码</label>
                                    <input type="text"     class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="电话号码">
                                </div>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->

                </div>

            </div>

        </section>
        <!-- /.content -->
    </div>

    <!-- /.content -->

    <jsp:include page="/WEB-INF/views/includes/bottom.jsp"></jsp:include>

    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <%--<div class="control-sidebar-bg"></div>--%>
</div>

</div>

<script type="text/javascript">
    function page(current) {
        var pageSize=$("#pageSize").val();
        window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
    }
</script>
<jsp:include page="/WEB-INF/views/includes/jspstyle.jsp"></jsp:include>
</body>
</html>

