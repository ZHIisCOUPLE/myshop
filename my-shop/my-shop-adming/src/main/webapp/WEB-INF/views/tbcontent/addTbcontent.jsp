<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/includes/head.jsp"></jsp:include>
<link href="/static/plugins/jquery-ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css">
<link href="/static/plugins/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" >
<link href="/static/plugins/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css">
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
                            <h3 class="box-title">内容编辑</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="/content/addAndUpLast" method="post" id="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pid">父节点</label>
                                    <input type="hidden" class="form-control" value="${content.parent.id}" name="parent.id" id="pid" placeholder="父id">
                                    <input type="text" readonly="readonly" class="form-control" value="${content.parent.name}" name="parent.name" id="pname" placeholder="父节点" data-toggle="modal" data-target="#modal-default">
                                    <input type="hidden" name="id" value="${content.id}">
                                </div>
                                <div class="form-group">
                                    <label for="title">标题</label>
                                    <input type="text"   value="${content.title}"  class="form-control" id="title" name="title" placeholder="标题">
                                </div>
                                <div class="form-group">
                                    <label for="subTitle">子标题</label>
                                    <input type="text"   value="${content.subTitle}"  class="form-control" id="subTitle" name="subTitle" placeholder="子标题">
                                </div>
                                <div class="form-group">
                                    <label for="titleDesc">标题描述</label>
                                    <input type="text"   value="${content.titleDesc}"  class="form-control" id="titleDesc" name="titleDesc" placeholder="标题描述">
                                </div>
                                <div class="form-group">
                                    <label for="url">链接</label>
                                    <input type="text"   value="${content.url}"  class="form-control" id="url" name="url" placeholder="链接">
                                </div>
                                <div class="form-group">
                                    <label for="picture1">图片1</label>
                                    <input type="text" readonly="readonly"   value="${content.picture1}"  class="form-control" id="picture1" name="picture1" placeholder="图片1">
                                    <div class="dropzone" id="pic1upload"></div>
                                </div>
                                <div class="form-group">
                                    <label for="picture2">图片2</label>
                                    <input type="text" readonly="readonly"   value="${content.picture2}"  class="form-control" id="picture2" name="picture2" placeholder="图片2">
                                    <div class="dropzone" id="pic2upload"></div>
                                </div>
                                <div class="form-group">
                                    <label for="detail">描述</label>
                                    <input type="hidden"    class="form-control" id="detail" name="detail" placeholder="描述">
                                    <div id="editor" >${content.detail}</div>
                                </div>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button id="btnSubmit" type="submit" class="btn btn-primary">提交</button>
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


</div>

</div>

<%--<script type="text/javascript">--%>
<%--function page(current) {--%>
<%--var pageSize=$("#pageSize").val();--%>
<%--window.location.href="/category/list?current="+current+"&pageSize="+pageSize;--%>
<%--}--%>
<%--</script>--%>
<jsp:include page="/WEB-INF/views/includes/jspstyle.jsp"></jsp:include>
</body>
</html>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="/static/plugins/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/static/plugins/dropzone/min/dropzone.min.js"></script>
<script type="text/javascript" src="/static/plugins/wangEditor/wangEditor.min.js"></script>
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

        initWangEditor();//在初始化完成后初始化wangeditor
    });

    function getData() {

        var zTree = $.fn.zTree.getZTreeObj("category-tree");
        var nodes = zTree.getSelectedNodes();//因为ztree允许多选，所以getSelectedNodes返回一个json对象数组
        if (nodes.length == 0) {
            alert("请选择一条数据");
            return;
        }
        var pname = nodes[0].name;
        var pid = nodes[0].id;
        $("#pid").val(pid);
        $("#pname").val(pname);
        $("#modal-default").modal("hide");//将model隐藏，这是bootstrap自带的方法
    }
        //new Dropzone一定要放到jquery的外面，不要在里面初始化
        //加载dropzone
        // 默认的 Dropzone 参数
        var defaultDropzoneOpts = {
            url: "",
            paramName: "dropFile",
            maxFiles: 1, // 一次性上传的文件数量上限
            maxFilesize: 2, // 文件大小，单位：MB
            acceptedFiles: ".jpg,.gif,.png,.jpeg", // 上传的类型
            addRemoveLinks: true,
            parallelUploads: 1, // 一次上传的文件数量
            dictDefaultMessage: '拖动文件至此或者点击上传',
            dictMaxFilesExceeded: "您最多只能上传 1 个文件！",
            dictResponseError: '文件上传失败!',
            dictInvalidFileType: "文件类型只能是*.jpg,*.gif,*.png,*.jpeg",
            dictFallbackMessage: "浏览器不受支持",
            dictFileTooBig: "文件过大上传文件最大支持",
            dictRemoveLinks: "删除",
            dictCancelUpload: "取消"
        };


        var opts={
            //id指的放我们 上传控件的那个div的id
            id: "#pic1upload",
            //上传的路径
            url: "/content/upload",
            paramName: "dropFile",//指的是上传到后台，用来获取这个上传文件的表单名
            init: function () {
                //这是当上传完成后回调这个函数
                this.on("success", function (file, data) {
                    // $("#pic").val(data.fileName);
                    $("#picture1").val(data.path);
                });
            }
        }

        // 关闭 Dropzone 的自动发现功能
        Dropzone.autoDiscover = false;
        // 继承
        //$.extend(）jquery内部的函数，将后面的（opts）覆盖到前面的(defaultDropzoneOpts)
        $.extend(defaultDropzoneOpts, opts);
        //创建一个上传控件
        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);

        //再创建一个  pic2upload
        var opts2={
            //id指的放我们 上传控件的那个div的id
            id: "#pic2upload",
            //上传的路径
            url: "/content/upload",
            paramName: "dropFile",//指的是上传到后台，用来获取这个上传文件的表单名
            init: function () {
                //这是当上传完成后回调这个函数
                this.on("success", function (file, data) {
                    // $("#pic").val(data.fileName);
                    $("#picture2").val(data.path);
                });
            }
        };
        $.extend(defaultDropzoneOpts, opts2);
        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);
</script>
<script type="text/javascript">

    function checkPhone(str){
        var re = /^1\d{10}$/;
        if(re.test(str)){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 初始化富文本编辑器
     */
    function initWangEditor () {
        var E = window.wangEditor;
        var editor = new E('#editor');
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/content/upload';//上传图片的url
        editor.customConfig.uploadFileName = 'dropFile';//上传图片的时候，用表单域的名称
        editor.create();

        $("#btnSubmit").bind("click", function() {
            var contentHtml = editor.txt.html();
            $("#detail").val(contentHtml);
        });
    }
</script>
