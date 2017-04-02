<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gao27024037
  Date: 2017/3/26
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师列表页</title>
    <%@include file="../../common/head.jsp" %>
</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h3>教师列表</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>职称</th>
                            <th>编辑</th>
                            <th>删除</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="sk" items="${list}">
                            <tr>
                                <td>${sk.teacherId}</td>
                                <td>${sk.teacherName}</td>
                                <td>${sk.teacherTitle}</td>
                                <td>
                                    <a class="btn btn-info" href="/teacher/${sk.teacherId}/edit" target="_blank">编辑</a>
                                </td>
                                <td>
                                    <a class="btn btn-info" href="/teacher/${sk.teacherId}/delete">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="panel-body" align="right">
                    <a class="btn btn-info" href="/teacher/insertPage" target="_blank">添加教师</a>
                </div>
                <div class="panel-button" align="center">
                    <a class="btn btn-info" href="/teacher/pagehome">首页</a>
                    <a class="btn btn-info" href="/teacher/pageup" >上一页</a>
                    <a class="btn btn-info" href="/teacher/pagedown">下一页</a>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>