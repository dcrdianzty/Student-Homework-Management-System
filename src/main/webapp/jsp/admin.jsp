<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生作业管理系统-后台管理</title>
    <link rel="shortcut icon" href="${basePath }img/favicon.ico"/>
    <link rel="bookmark" href="${basePath }img/favicon.ico"/>
    <link href="${basePath }weblib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }weblib/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${basePath }css/base.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .userinfo {
            line-height: 48px;
        }

        .userinfo img {
            margin-right: 10px;
        }

        #bs-collapse {
            line-height: 48px;
        }

        tr > td > p {
            margin-top: 8px;
            margin-bottom: 8px;
        }

        .equal {
            display: flex;
            display: -webkit-flex;
            flex-wrap: wrap;
        }

    </style>
</head>
<body>
<!--头部-->
<header>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="userinfo">
                        <img src="${basePath }img/headdefault.jpg" alt="headImg" class="img-circle" style="width: 30px">
                        <span>登录用户：${user.name }</span>
                    </div>
                </div>
                <div class="collapse navbar-collapse navbar-right" id="bs-collapse">
                    <span><a href="${basePath }logout" class="btn btn-danger">退出登录</a></span>
                    <span><a href="${basePath }cpasswd" class="btn btn-primary">修改密码</a></span>
                </div>
            </div>
        </div>
    </nav>
</header>
<!--/头部-->

<section class="hidden">
    <div class="container">
        <h1>角色权限与用户管理</h1>
        <div class="table-responsive">
            <table class="table table-hover">
                <tr>
                    <td>教师账户</td>
                    <td>教师姓名</td>
                    <td>所属课程</td>
                    <td>账户状态</td>
                    <td>操作</td>
                </tr>
                <tr class="">
                    <td><p>201601010317</p></td>
                    <td><p>王宁</p></td>
                    <td><p>啊啊</p></td>
                    <td><p>已关闭</p></td>
                    <td>
                        <button type="button" class="btn btn-info btn-primary">启用</button>
                        <button type="button" class="btn btn-info btn-warning">编辑</button>
                        <button type="button" class="btn btn-info btn-danger">删除</button>
                    </td>
                </tr>
                <tr class="">
                    <td><p>201601010317</p></td>
                    <td><p>王宁</p></td>
                    <td><p>啊啊</p></td>
                    <td><p>已启用</p></td>
                    <td>
                        <button type="button" class="btn btn-info btn-primary">关闭</button>
                        <button type="button" class="btn btn-info btn-warning">编辑</button>
                        <button type="button" class="btn btn-info btn-danger">删除</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</section>

<!--添加课程或者作业名称-->
<section>
    <div class="container">
        <div class="row equal">
<%--            <div class="col-md-12 d-flex">--%>
            <div class="col-xs-12 col-sm-6 col-md-8">
                <h1 style="display: inline-block;" >课程和作业名称管理</h1>
            </div>

            <div class="col-xs-6 col-md-4">
                <button type="button" id="upfilebutton_id" class="btn btn-primary" style="position:absolute; margin-bottom:10px; bottom: 0 !important;"
                        data-toggle="modal" data-remote="${basePath }jsp/addsubjectui.jsp" data-target=".bs-modal-lg">添加课程或作业名称
                </button>
            </div>

        </div>
        <div class="modal fade bs-modal-lg" id="addmodel" tabindex="-1" role="dialog"
             aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"></div>
            </div>
        </div>
        <div id="loadsubject"></div>
    </div>
</section>
<!--/添加课程或者作业名称-->

<!--内容-->
<section>
    <div class="container">
        <div>
            <h1>下载已上传的文件</h1>
            <label for="subject_ID">
                <select name="subject" id="subject_ID" class="form-control">
                    <option value="none">请选择课程...</option>
                    <c:forEach items="${orderInfoList }" var="orderInfo">
                        <option value="${orderInfo }">${orderInfo }</option>
                    </c:forEach>
                </select>
            </label>
            <label for="oid_id">
                <select name="oid" id="oid_id" class="form-control">
                    <option value="none">请选择作业名称...</option>
                </select>
            </label>
        </div>
        <div id="fileList">

        </div>
    </div>
    <p></p>
    </div>
</section>
<!--/内容-->

<%@include file="footer.jsp" %>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${basePath }weblib/jquery/jquery-3.2.1.min.js"></script>
<%--moment need to before bootstrap--%>
<script src="${basePath }weblib/moment/moment.min.js"></script>
<script src="${basePath }weblib/moment/zh-cn.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${basePath }weblib/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath }weblib/bootstrap/js/bootstrap-datetimepicker.min.js "></script>

<script src="${basePath }js/base.js"></script>
<script src="${basePath }js/filterurl.js "></script>


<script>
    function add() {
        var osubject = $("#osubject").val();
        var oname = $("#oname").val();
        var ostate = $("#ostate").val();
        // here need to convert js data-localtime to
        // var odeadline = $("#odeadline").data("DateTimePicker").date().toDate().getTime(); // this gets wrong timestamp
        var odeadline = $("#odeadline").data("DateTimePicker").date().unix();
        //console.log('odeadline string from JS: ', odeadline);

        // url can contain invalid character need encode
        var url = "${basePath }addOrderInfo?osubject=" + osubject + "&oname=" + oname + "&ostate=" + ostate + "&odeadlinestr=" + odeadline ;

        $.get(encodeURI(url), function (data) {
            if (data) {
                $('#addmodel').modal('hide');
                $("#loadsubject").load("${basePath}subjectui");
            } else {
                $("#adderrormessage").removeClass("hidden");
            }
        });
    }

    function changeState(oid, ostate) {
        var value = true;
        if (ostate) {
            value = false;
        }
        $.get("${basePath }changeKeyByOID?oid=" + oid + "&key=ostate&value=" + value, function () {
            $("#loadsubject").load("${basePath}subjectui");
        });
    }

    function del(oid) {
        // make a confirm here
        if (confirm("确定删除名称吗？")){
            if (confirm("一定要删除名称吗")){
                $.get("${basePath }delOrderinfoByOID?oid=" + oid, function (data) {
                    if (data) {
                        window.location.reload();
                    }
                });
            }
        }
    }



    $(function () {
        $("#loadsubject").load("${basePath}subjectui");
        var file_subject = "";
        var file_oid = "";
        $("#subject_ID").change(function () {
            file_subject = $(this).val();
            $.get("${basePath }getOnameBysubjectOfAll?subject=" + file_subject, function (data) {
                $("#oid_id").empty();
                $("#upfilebutton_id").removeAttr("disabled");
                $.each(data, function (key, value) {
                    if (key === 0) {
                        file_oid = value.oid;
                        flushFileList();
                    }

                    // append the deadline label
                    var ct = Date.now();
                    var givenDeadline = new Date(value.odeadline).getTime();

                    var appendString = "";
                    if (ct >= givenDeadline){
                        appendString = "(已截止)";
                    }

                    var checkResult = checkSetURLGivenStr(value.oname) ;
                    if ( checkResult != null ){
                        $("#oid_id").append("<option value=" + value.oid + ">" + checkResult + " " + appendString + "</option>");
                    } else {
                        $("#oid_id").append("<option value=" + value.oid + ">" + value.oname + " " + appendString + "</option>");
                    }

                });
            });
        });
        $("#oid_id").change(function () {
            file_oid = $(this).val();
            //console.log("file_oid" + file_oid);
            flushFileList();
        });

        function flushFileList() {
            $("#fileList").load("${basePath }getFileList?hoid=" + file_oid);
        }
    });
</script>
</body>
</html>