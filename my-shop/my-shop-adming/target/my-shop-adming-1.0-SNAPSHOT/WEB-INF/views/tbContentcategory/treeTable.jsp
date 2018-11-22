<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sys" uri="/WEB-INF/sys.tld"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/static/plugins/treeTable/themes/vsStyle/treeTable.min.css" >
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <jsp:include page="/WEB-INF/views/includes/top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/includes/left.jsp"></jsp:include>

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                分类管理
            </h1>
            <c:if test="${not empty message }">
                <br>
                <div class="alert alert-success alert-dismissible ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${message}
                </div>
            </c:if>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <%--高级搜索框--%>
                    <form action="/category/list" method="get" id="gsou">

                        <div class="box box">
                            <div class="box-header with-border">
                                <h3 class="box-title">高级搜索</h3>
                                <%--<input type="hidden" name="current" id="current" value="${pageResult.current}" />--%>

                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <input type="text" name="name" value="${category.name}" class="form-control" placeholder="用户名">
                                    </div>
                                    <div class="col-xs-3">
                                        <button type="submit"  class="btn btn-block btn-primary"><i class="fa fa-fw fa-search"></i>搜索</button>
                                    </div>

                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </form>
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">分类列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-bordered" id="treeTable">
                                <tr>
                                    <th style="width: 10px">序号</th>
                                    <th>名称</th>
                                    <th>父类名称</th>
                                    <th>是否夫节点</th>
                                    <th>创建时间</th>
                                    <th>修改时间</th>
                                    <th>操作</th>
                                </tr>

                                <c:set var="pageResult" value="${result.data}"></c:set>


                                <c:forEach items="${list}" var="category" varStatus="status">
                                    <tr pId="${category.parent.id}" id="${category.id}">
                                        <td>${status.index+1}.</td>
                                        <td>${category.name}</td>
                                        <td>${category.parent.name}</td>
                                        <td>${category.isParent>0?"是":"否"}</td>
                                        <td><fmt:formatDate value="${category.created}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                        <td><fmt:formatDate value="${category.updated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                        <td>
                                            <button onclick="amand('${category.id}')" class="btn btn-primary">
                                                <i class="fa fa-edit"></i> 编辑
                                            </button>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button onclick="del('${category.id}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger">
                                                <i class="fa fa-remove"></i> 删除
                                            </button>
                                            <button onclick="addCh('${category.id}')" type="button" class="btn btn-default">
                                                <i class="fa fa-plus"></i> 添加子节点
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">

                            <%--<input type="hidden" name="current" id="current" value="${pageResult.current}" />--%>
                            <%--<input type="hidden" name="pageSize" id="pageSize" value="${pageResult.pageSize}" />--%>

                            <ul class="pagination pagination-sm no-margin pull-right">

                                <%--<sys:page count="${pageResult.count}" current="${pageResult.current}" pageSize="${pageResult.pageSize}"></sys:page>--%>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>

    <!-- /.content -->

    <jsp:include page="/WEB-INF/views/includes/bottom.jsp"></jsp:include>


    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <%--<div class="control-sidebar-bg"></div>--%>
</div>
<!--这是删除前的警告模态框-->
<div class="modal modal-danger fade in" id="modal-danger" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">删除警告！</h4>
            </div>
            <div class="modal-body">
                <p>您确定要删除这条数据吗？</p>
                <input type="hidden" id="deleteId" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                <button onclick="deletecategory()" type="button" class="btn btn-outline">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</div>

<script type="text/javascript">
    function page(current) {
        // var pageSize=$("#pageSize").val();
        $("#current").val(current);
        // window.location.href="/category/list?current="+current+"&pageSize="+pageSize;
        $("#gsou").submit();
    }
    //根据id进行修改
    function amand(id) {
        window.location.href="/category/addcategory?id="+id;
    }
    //唤醒警告框把id传入警告框
    function del(id) {

        $("#deleteId").val(id);
    }

    function deletecategory() {
        var id=$("#deleteId").val();
        window.location.href="/category/delete?id="+id;
    }

    function addCh(id) {
        window.location.href="/category/addCh?id="+id;
    }
</script>
<jsp:include page="/WEB-INF/views/includes/jspstyle.jsp"></jsp:include>
<script
        src="http://code.jquery.com/jquery-1.9.1.js"
        integrity="sha256-e9gNBsAcA0DBuRWbm0oZfbiCyhjLrI6bmqAl5o+ZjUA="
        crossorigin="anonymous"></script>
<script type="text/javascript" src="/static/plugins/treeTable/jquery.treeTable.min.js"></script>

</body>
</html>
<script type="text/javascript">
    $(function () {
        // $("#gsou").find("input").change(function () {
        //     $("#current").val(1);
        // });

    //    treeTable
        $("#treeTable").treeTable({
            column:1,
            expandLevel:1
        });
    })
</script>
