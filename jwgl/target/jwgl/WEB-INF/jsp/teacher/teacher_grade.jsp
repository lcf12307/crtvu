<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>教务管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css">
    <%@include file="../common/head.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!--页首-->
    <header class="main-header">
        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">导航开关</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">

                <ul class="nav navbar-nav">
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/dist/img/avatar_ani.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${sessionScope.get("userid")}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="/dist/img/avatar_ani.jpg" class="img-circle" alt="User Image">
                                <p>
                                    Talk is cheap show me the code.
                                </p>
                            </li>
                            <!-- Menu Body -->

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat" onclick="location.href='http://localhost:8080'">登出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!--侧边-->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/dist/img/avatar_ani.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${sessionScope.get("userid")}</p>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu" id="sidebraMenu">
                <li class="header">查询系统</li>
                <li><a href="/teacher/${sessionScope.get("userid")}/teacherinfo"><i class="fa fa-link"></i><span>查看课表</span></a></li>
                <li><a href="/teacher/${sessionScope.get("userid")}/grade/list"><i class="fa fa-link"></i><span>查看成绩</span></a></li>
                <li class="header">毕设系统</li>
                <li><a href="/teacher/insertSubject.action"><i class="fa fa-link"></i><span>添加新课题</span> </a></li>
                <li><a href="/teacher/${sessionScope.get("userid")}/subjects"><i class="fa fa-link"></i><span>查看已发布课题</span> </a></li>
                <li class="header">选课系统</li>
                <li><a href="/teacher/${sessionScope.get("userid")}/tchcourselist"><i class="fa fa-link"></i><span>查看课表</span></a></li>
                <li><a href="/teacher/${sessionScope.get("userid")}/coursestulist"><i class="fa fa-link"></i><span>查看学生信息</span></a></li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!--核心-->
    <div class="content-wrapper">
        <!--标题-->
        <section class="content-header">
            <h1>
                北京化工大学教务管理系统
                <small>后台系统</small>
            </h1>
            <!--位置导航-->
            <ol class="breadcrumb">
                <li><a href="#">Level</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <!--网页正文-->
        <section class="content">
            <div id="defaultDiv" >
                <div>
                    <div>
                        <h2 align="center">成绩列表</h2>
                    </div>
                    <table class="table table-bordered" >
                        <thead>
                        <tr>
                            <th>课程ID</th>
                            <th>开设ID</th>
                            <th>课程名称</th>
                            <th>学分</th>
                            <th>性质</th>
                            <th>开设院系</th>
                            <th>学年</th>
                            <th>学期</th>
                            <th>人数上限</th>
                            <th>输入/修改</th>
                            <th>成绩汇总</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courseList.courseOpenInfoList}" var="course">
                            <tr>
                                <td>${course.courseId}</td>
                                <td>${course.openId}</td>
                                <td>${course.courseName}</td>
                                <td>${course.credit}</td>
                                <td>${course.nature}</td>
                                <td>${course.department}</td>
                                <td>${course.schoolYear}</td>
                                <td>${course.term}</td>
                                <td>${course.peopleNum}</td>
                                <td><a id="defaultBtn" class="btn btn-info" href="/teacher/${courseList.teacherId}/grade/${course.openId}/insert">选择</a></td>
                                <td><a class="btn btn-info" href="/teacher/${courseList.teacherId}/grade/${course.openId}/download">下载</a></td>
                                <!--href="/teacher/${courseList.teacherId}/grade/${course.openId}/download"-->
                                <!--    href="/download/hehe.zip"-->
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!--页脚-->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            各位大佬强力驱动
        </div>
        <strong>Copyright &copy; 2017 <a href="#">CS1404</a>.</strong> All rights reserved.
    </footer>


</div>

<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/dist/js/app.min.js"></script>

</body>
</html>
