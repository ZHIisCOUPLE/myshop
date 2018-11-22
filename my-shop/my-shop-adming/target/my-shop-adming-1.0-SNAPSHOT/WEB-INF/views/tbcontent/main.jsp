<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sys" uri="/WEB-INF/sys.tld"%>
<%@taglib prefix="h" uri="/WEB-INF/hello.tld"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <jsp:include page="/WEB-INF/views/includes/top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/includes/left.jsp"></jsp:include>

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                用户管理:<h:page maam="hello word!!!!!!!!!"></h:page>
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
                <form action="/content/main" method="get" id="gsou">
                <div class="box box">
                    <div class="box-header with-border">
                        <h3 class="box-title">高级搜索</h3>
                        <input type="hidden" name="current" id="current" value="${pageResult.current}" />

                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-3">
                                <input type="text" name="title" class="form-control" value="${content.title}" placeholder="标题">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="subTitle" class="form-control" value="${content.subTitle}" placeholder="子标题">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="titleDesc" class="form-control" value="${content.titleDesc}" placeholder="标题描述">
                            </div>
                            <div class="col-xs-3">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-info"><i class="fa fa-search"></i> 搜索</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                </form>
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">用户列表</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 10px">序号</th>
                                <th>类型</th>
                                <th>标题</th>
                                <th>子标题</th>
                                <th >标题描述</th>
                                <th >链接</th>
                                <th >图片1</th>
                                <th >图片2</th>
                                <th >创建时间</th>
                                <th >更新时间 </th>
                                <th >操作</th>
                            </tr>
                            <!--data 对象 -->


                            <c:forEach items="${list}" var="content" varStatus="status">
                                <tr>
                                    <td>${status.index+1}.</td>
                                    <td>${content.parent.name}</td>
                                    <td>${content.title}</td>
                                    <td>${content.subTitle}</td>
                                    <td>${content.titleDesc}</td>
                                    <td><a href="${content.url}" target="_blank">查看</a></td>
                                    <td><a href="http://localhost:8080/content/picShow?fileName=${content.picture1}" target="_blank">查看</a></td>
                                    <td><a href="http://localhost:8080/content/picShow?fileName=${content.picture2}" target="_blank">查看</a></td>
                                    <td><fmt:formatDate value="${content.created}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                                    <td><fmt:formatDate value="${content.updated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                                    <td>
                                        <button onclick="amand('${content.id}')" class="btn btn-primary">
                                            <i class="fa fa-edit"></i> 编辑
                                        </button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="del('${content.id}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger">
                                            <i class="fa fa-remove"></i> 删除
                                        </button>

                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix">

                        <%--<input type="hidden" name="current" id="current" value="${pageResult.current}" />--%>
                        <input type="hidden" name="pageSize" id="pageSize" value="${pageResult.pageSize}" />

                        <ul class="pagination pagination-sm no-margin pull-right">

                            <sys:page count="${pageResult.count}" current="${pageResult.current}" pageSize="${pageResult.pageSize}"></sys:page>

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
                <button onclick="deletecontent()" type="button" class="btn btn-outline">确认</button>
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
        // window.location.href="/content/list?current="+current+"&pageSize="+pageSize;
        $("#gsou").submit();
    }
    //根据id进行修改
    function amand(id) {
        window.location.href="/content/addAndUpFirst?id="+id;
    }
//唤醒警告框把id传入警告框
    function del(id) {

        $("#deleteId").val(id);
    }
    
    function deletecontent() {
        var id=$("#deleteId").val();
        window.location.href="/content/delete?id="+id;
    }
</script>
<jsp:include page="/WEB-INF/views/includes/jspstyle.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#gsou").find("input").change(function () {
           $("#current").val(1);
        });
    })
</script>
