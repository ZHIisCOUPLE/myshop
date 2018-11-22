<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<link href="/static/plugins/jquery-ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css">
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
                            <h3 class="box-title">分类编辑</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="/category/add" method="post" id="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pname">父级类目</label>
                                    <input type="hidden" class="form-control" value="${category.parent.id}" name="parent.id" id="pid">
                                    <input type="text" readonly="readonly" class="form-control" value="${category.parent.name}" name="parent.name" id="pname" data-toggle="modal" data-target="#modal-default" placeholder="父级类目">

                                    <input type="hidden" id="cid" value="${category.id}" name="id" />

                                </div>
                                <div class="form-group">
                                    <label for="name">分类名称</label>
                                    <input type="text" maxlength="10" minlength="3"  class="form-control" id="name" value="${category.name}"  name="name" placeholder="分类名称">
                                </div>
                                <div class="form-group">
                                    <label for="order">分类排序</label>
                                    <input type="text" type="number" maxlength="1" minlength="1"   class="form-control" id="order" name="order" value="${category.order}" placeholder="分类排序">
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

    <div class="modal fade in" id="modal-default" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">父级类目</h4>
                </div>
                <div class="modal-body">
                    <ul id="category-tree" class="ztree"></ul>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">取消</button>
                    <button onclick="getData()" type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
    <!-- /.content -->

<jsp:include page="/WEB-INF/views/includes/bottom.jsp"></jsp:include>


<jsp:include page="/WEB-INF/views/includes/jspstyle.jsp"></jsp:include>
</body>
</html>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="/static/plugins/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
    $(function () {
        //关键性语句
        // jQuery.noConflict()有个deep参数,如果为true,则不仅可以防止$冲突，还可以防止jQuery这个关键词冲突。
        //var $j = jQuery.noConflict(true);

        //加载ztree
        var setting = {
            view: {
                //是否允许多选
                selectedMulti: false
            },
            //异步
            async: {
                enable: true,
                url: "/category/treeData",
                //autoParam----------》用哪一个属于来请求后台，再拿到数据
                autoParam: ['id']
            }
        };

        $.fn.zTree.init($("#category-tree"), setting);
    });

    function getData() {

        var zTree = $.fn.zTree.getZTreeObj("category-tree");
        var nodes = zTree.getSelectedNodes();//因为ztree允许多选，所以getSelectedNodes返回一个json对象数组
        if(nodes.length==0){
            alert("请选择一条数据");
            return;
        }
        var pname=nodes[0].name;
        var pid=nodes[0].id;


        $("#pid").val(pid);
        $("#pname").val(pname);
        $("#modal-default").modal("hide");//将model隐藏，这是bootstrap自带的方法
        //将model隐藏，这是bootstrap自带的方法
        // $("#modal-default").modal("hide");
        // $(".modal-backdrop").remove();      //去掉遮罩层



    }
</script>

