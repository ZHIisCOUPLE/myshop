<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sys" uri="/WEB-INF/sys.tld"%>
<%@taglib prefix="h" uri="/WEB-INF/hello.tld"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/static/plugins/adminLTE/plugins/iCheck/all.css">
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
                <form action="/user/list" method="get" id="gsou">

                <div class="box box">
                    <div class="box-header with-border">
                        <h3 class="box-title">高级搜索</h3>
                        <input type="hidden" name="current" id="current" value="${pageResult.current}" />

                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-3">
                                <input type="text" name="email" value="${user.email}" class="form-control" placeholder="邮箱">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="phone" value="${user.phone}" class="form-control" placeholder="电话">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="userName" value="${user.userName}" class="form-control" placeholder="用户名">
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
                        <h3 class="box-title">用户列表</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered" id="searchForm">
                            <tr>
                                <th style="width: 10px">序号</th>
                                <th>用户名</th>
                                <th>邮箱</th>
                                <th>电话</th>
                                <th>创建时间</th>
                                <th>修改时间</th>
                                <th>操作</th>
                                <th><input class="minimal" type="checkbox" id="checkAll" >
                                    <button onclick="deleteMutil()" type="button" class="btn btn-danger" data-toggle="modal" data-target="#mutile-modal">
                                        <i class="fa fa-remove"></i> 批量删除
                                    </button>
                                </th>
                            </tr>
                       <c:set var="data" value="${result.data.list}"></c:set>
                       <c:set var="pageResult" value="${result.data}"></c:set>


                            <c:forEach items="${data}" var="user" varStatus="status">
                            <tr>
                                <td>${status.index+1}.</td>
                                <td>${user.userName}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td><fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td><fmt:formatDate value="${user.updated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td>
                                    <button onclick="amand('${user.id}')" class="btn btn-primary">
                                        <i class="fa fa-edit"></i> 编辑
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button onclick="del('${user.id}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger">
                                        <i class="fa fa-remove"></i> 删除
                                    </button>
                                </td>
                                <td>
                                    <input class="minimal" type="checkbox" name="userCheck" value="${user.id}">
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
                <button onclick="deleteUser()" type="button" class="btn btn-outline">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--这是删除前的警告模态框-->
<div class="modal modal-danger fade in" id="mutile-modal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">删除提示</h4>
            </div>
            <div class="modal-body">
                <p>您确定要删除这些数据吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                <button onclick="confirmDeleteMutil()" type="button" class="btn btn-outline">确认</button>
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
        // window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#gsou").submit();
    }
    //根据id进行修改
    function amand(id) {
        window.location.href="/user/adduser?id="+id;
    }
//唤醒警告框把id传入警告框
    function del(id) {

        $("#deleteId").val(id);
    }
    
    function deleteUser() {
        var id=$("#deleteId").val();
        window.location.href="/user/delete?id="+id;
    }

    // function checkAll() {
    //     //在高版本jqeury里面，获取控件自身的属性用prop,自定义的属性用attr
    //     var check=$("#checkAll").prop("checked");
    //     if(check){
    //         $("input[name='userCheck']").prop("checked",true);
    //     }else {
    //         $("input[name='userCheck']").prop("checked",false);
    //     }
    //
    // }

    //要删除的id
    var idArray='';
    function deleteMutil() {
        idArray='';//不加这一条，前面的删除会影响后面的
        $("input[name='userCheck']:checked").each(function () {
            idArray+=","+$(this).val();
        });

    }
    //确认干掉
    function confirmDeleteMutil() {
        $.ajax({
            url:'/user/deleteMutil',
            type:'post',
            data:{ids:idArray},
            success:function () {
                alert("删除成功！");
                window.location.reload();
            }
        });
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
<script type="text/javascript" src="/static/plugins/adminLTE/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">

    //当页面加载完后，searchForm下面所有的input 输入框都加上一个onchange事件，当内容改变的时候，让当前页码改为1
    $(function () {
        $("#searchForm").find("input").change(function () {
            $("#current").val(1);
        });
        //初始化icheck
        $('input[type="checkbox"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        });
        //用icheck全选
        $('#checkAll').on('ifChecked', function(event){
            $("input[name='userCheck']").iCheck('check');
        });
        //用icheck反选
        $('#checkAll').on('ifUnchecked', function(event){
            $("input[name='userCheck']").iCheck('uncheck');
        });
    });
</script>