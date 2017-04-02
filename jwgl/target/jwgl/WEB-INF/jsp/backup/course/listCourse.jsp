<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>课程列表</title>
    <%@include file="../../common/head.jsp" %>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function ahead(){
            if(${page} == 1 ) {
                alert("当前已是第一页");
            }
        else{
                window.location.href="/course/${page-1}/list";
            }
        }
        function behind(){
            if(${pages} == ${page}){
                alert("当前已是最后一页");
            } else{
                window.location.href="/course/${page+1}/list";
            }
        }
        function delCourse(courseId){
            var page = ${page};
            var id = courseId;
            var url = "/course/delete";
            $.ajax({
                type: 'POST',
                url: url,
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                data:JSON.stringify({
                    id:id,
                    page:page,
                }),  //提交json字符串数组
                success:function(){
                    window.location.reload();
                },
                error:function(textStatus, errorThrown){
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
            <h2>课程列表</h2>
        </div>
        <div class="panel-body" >
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>课程id</th>
                    <th>课程名称</th>
                    <th>课程学分</th>
                    <th>课程性质</th>
                    <th>开设院系</th>
                    <th> 编辑/删除 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="course">
                    <tr>
                        <td>${course.id}</td>
                        <td>${course.name}</td>
                        <td>${course.credit}</td>
                        <td>${course.nature}</td>
                        <td>${course.department}</td>
                        <td><a class="btn btn-info" href="/course/${course.id}/detail" target="_blank">编辑</a>
                            <a class="btn btn-info" onclick="delCourse('${course.id}')" target="_blank">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div align="right">
                <td><a class="btn btn-info" href="/course/1/list" target="_self">首页</a></td>
                <td><a class="btn btn-info" href="#" onclick="ahead()" target="_self">前一页</a></td>
                <td><a class="btn btn-info" href="#" onclick="behind()" target="_self">下一页</a></td>
                <td><a class="btn btn-info" href="/course/insertInfo"   target="_blank">添加课程</a></td>
                </tr>
            </div>
        </div>
    </div>
</div>





<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>