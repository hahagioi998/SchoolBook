<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xjk
  Date: 17-3-14
  Time: 上午8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>校园二手交易 | 后台管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/bootstrap.min.css'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/font-awesome.min.css'>
    <!-- Ionicons -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/ionicons.min.css'>
    <!-- Theme style -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/AdminLTE.min.css'>
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/zoom.css'>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href='<%=request.getContextPath()%>/css/_all-skins.min.css'>
    <link rel="shortcut icon" href='<%=request.getContextPath()%>/img/favicon.ico' type="image/x-icon">
    <link rel="Bookmark" href='<%=request.getContextPath()%>/img/favicon.ico'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">

<!-- Site wrapper -->
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>校园二手书交易</b></span>
            <!-- logo for regular state and Jianyumobile devices -->
            <span class="logo-lg"><b>校园二手书交易</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <a type="button" class="btn btn-info" href="<%=request.getContextPath()%>/backend/logOut">登出</a>
                </ul>
            </div>
        </nav>
    </header>
    <!-- =============================================== -->
    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="active">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>用户管理</span>
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/backend/book/getAllBook">
                        <i class="fa fa-th"></i> <span>商品管理</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- =============================================== -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <c:if test="${msg!=null}">
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert">×</a>
                <strong>${msg}</strong>
            </div>
        </c:if>
        <!-- Main content -->
        <section class="content">
            <div class="box box-info">
                <div class="box-body" style="display: block;">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>用户名</th>
                                <th>头像</th>
                                <th>国家</th>
                                <th>省份</th>
                                <th>城市</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <c:if test="${empty user.name}">
                                        <td>${String.format("%05d", user.id)}</td>
                                    </c:if>
                                    <c:if test="${not empty user.name}">
                                        <td>${user.name}</td>
                                    </c:if>
                                    <c:if test="${empty user.avatar}">
                                        <c:if test="${user.sex=='F'}">
                                            <td><img src="<%=request.getContextPath()%>/img/defaultF.jpg" style="width: 45px;height: 80px;"
                                                     onclick='showimage("<%=request.getContextPath()%>/img/defaultF.jpg")'/></td>
                                        </c:if>
                                        <c:if test="${user.sex=='M'}">
                                            <td><img src="<%=request.getContextPath()%>/img/defaultM.jpg" style="width: 45px;height: 80px;"
                                                     onclick='showimage("<%=request.getContextPath()%>/img/defaultM.jpg")'/></td>
                                        </c:if>
                                        <%--<td><img src="<%=request.getContextPath()%>/img/defaultAva.png" style="width: 45px;height: 80px;"--%>
                                        <%--onclick='showimage("<%=request.getContextPath()%>/img/defaultAva.png")'/></td>--%>
                                    </c:if>

                                    <c:if test="${not empty user.avatar}">
                                        <td><img src="${user.avatar}" style="width: 45px;height: 80px;"
                                                 onclick='showimage("${user.avatar}")'/></td>
                                    </c:if>
                                    <td>${user.country}</td>
                                    <td>${user.province}</td>
                                    <td>${user.city}</td>
                                    <td>
                                        <a type="button" class="btn btn-info" href="/user/updateInfoPage?userId=${user.id}">更新用户信息</a>
                                        <a type="button" class="btn btn-danger" href="deleteOneUser?userId=${user.id}">删除</a>
                                    </td>
                                </tr>
                                <tr>
                                <td>${item.id}</td>
                                <c:if test="${empty item.name}">
                                <td>${String.format("%05d", item.id)}</td>
                                </c:if>
                                <c:if test="${not empty item.name}">
                                <td>${item.name}</td>
                                </c:if>
                                <c:if test="${empty item.avatar}">
                                <c:if test="${item.sex=='F'}">
                                <td><img src="<%=request.getContextPath()%>/img/defaultF.jpg" style="width: 45px;height: 80px;"
                                onclick='showimage("<%=request.getContextPath()%>/img/defaultF.jpg")'/></td>
                                </c:if>
                                <c:if test="${item.sex=='M'}">
                                <td><img src="<%=request.getContextPath()%>/img/defaultM.jpg" style="width: 45px;height: 80px;"
                                onclick='showimage("<%=request.getContextPath()%>/img/defaultM.jpg")'/></td>
                                </c:if>
                                </c:if>
                                <c:if test="${not empty item.avatar}">
                                <td><img src="${item.avatar}" style="width: 45px;height: 80px;"
                                onclick='showimage("${item.avatar}")'/></td>
                                </c:if>
                                <td>${item.sex}</td>
                                <td>${item.city}</td>
                                <td>${item.province}</td>
                                <td>${item.country}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                    <div class="col-sm-offset-7 col-sm-5">
                        <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                            <ul class="pagination">
                                <c:if test="${pageNo==0}" >
                                    <li class="paginate_button previous disabled" id="example2_previous">
                                        <a aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageNo!=0}" >
                                    <li class="paginate_button previous" id="example2_previous">
                                        <a href="accusationPage?pageNo=${pageNo-1}" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
                                    </li>
                                </c:if>
                                <c:if test="${accusations.size()<5}" >
                                    <li class="paginate_button next disabled" id="example2_next">
                                        <a aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
                                    </li>
                                </c:if>
                                <c:if test="${accusations.size()>=5}" >
                                    <li class="paginate_button next" id="example2_next">
                                        <a href="accusationPage?pageNo=${pageNo+1}" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<div class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                        onclick="closeModel()">&times;</button>
            </div>
            <div class="modal-body">
                <img id="imgInModalID" style="width:100%;height: auto;max-height: 800px;">
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.0 -->
<script src='<%=request.getContextPath()%>/js/jquery-2.2.3.min.js'></script>
<!-- Bootstrap 3.3.6 -->
<script src='<%=request.getContextPath()%>/js/bootstrap.min.js'></script>
<!-- SlimScroll -->
<script src='<%=request.getContextPath()%>/js/jquery.slimscroll.min.js'></script>
<!-- FastClick -->
<script src='<%=request.getContextPath()%>/js/fastclick.js'></script>
<!-- AdminLTE App -->
<script src='<%=request.getContextPath()%>/js/app.min.js'></script>
<!-- AdminLTE for demo purposes -->
<script src='<%=request.getContextPath()%>/js/demo.js'></script>

<script src='<%=request.getContextPath()%>/js/zoom.js'></script>

<script src='<%=request.getContextPath()%>/js/transition.js'></script>

<script>
    function showimage(source) {
        $("#imgInModalID").attr("src", source);
        $('.modal').show();
    }
    function closeModel() {
        $('.modal').hide();
    }
</script>
</body>
</html>
