<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>学生列表</title>
    <%@include file="common/head.jsp" %>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function ahead(){
            if(${page} == 1 ) {
                alert("当前已是第一页");
            }
           else{
                window.location.href="/student/${page-1}/list";
            }
        }
        function behind(){
            if(${pages} == ${page}){
                 alert("当前已是最后一页");
             } else{
                window.location.href="/student/${page+1}/list";
            }
        }
        function delStudent(studentId){
            var page = ${page};
            var id = studentId;
            var url = "/student/delete";
            $.ajax({
                type: 'POST',
                url: url,
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                data:JSON.stringify({
                    id:id,
                    page:page
                }),  //提交json字符串数组
                success:function(){
                        window.location.reload();
                },
                error:function(){
                    console.log(textStatus);
                    alert("删除失败");
                }
            });
        }
    </script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>学生列表</h2>
        </div>
        <div class="panel-body" >
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>班级</th>
                    <th>专业</th>
                    <th> 编辑/删除 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="student">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.className}</td>
                        <td>${student.major}</td>
                        <td><a class="btn btn-info" href="/student/${student.id}/detail" target="_blank">编辑</a>
                            <a class="btn btn-info" onclick="delStudent(${student.id})" target="_blank">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div align="right">
                    <td><a class="btn btn-info" href="/student/1/list" target="_self">首页</a></td>
                    <td><a class="btn btn-info" href="#" onclick="ahead()" target="_self">前一页</a></td>
                    <td><a class="btn btn-info" href="#" onclick="behind()" target="_self">下一页</a></td>
                    <td><a class="btn btn-info" href="/student/insertInfo" target="_blank">添加同学</a></td>
                </tr>
            </div>
        </div>
    </div>
</div>




<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>