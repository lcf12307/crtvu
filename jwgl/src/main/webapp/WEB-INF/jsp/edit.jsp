<%--
  Created by IntelliJ IDEA.
  User: gao27024037
  Date: 2017/3/26
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑教师页</title>
    <%@include file="common/head.jsp"%>
</head>
<body>
        <div class="container" align="center">
            <div class="panel panel-default text-center">
            <div class="panel-heading"><h2>修改教师信息</h2></div>
        </div>
        <div class="panel-body">
            <form action=""  class="form-horizontal">
                I&nbsp;&nbsp;D:<input type="text" id="id" style="margin:4px" value=${teacher.teacherId} disabled="true" title="教师id不可修改"><br>
                姓&nbsp;&nbsp;&nbsp;名:<input type="text" id="name" style="margin:4px" value=${teacher.teacherName}><br>
                职&nbsp;&nbsp;&nbsp;称:<input type="text" id="title" style="margin:4px" value=${teacher.teacherTitle}><br>
                密&nbsp;&nbsp;&nbsp;码:<input type="password" id="password" style="margin:4px" >
                <input type="checkbox" id="show" onclick="showpw();">显示<br>
                <a class="btn btn-info" onclick="update();">提交修改</a>
            </form>
        </div>
    </div>
</body>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    //显示密码
    function showpw() {
        var oBox = document.getElementById('show');
        var pw = document.getElementById('password');
        if(oBox.checked) {
            pw.type = "text";
        } else {
            pw.type = "password";
        }
    }

    //提交修改
    function update(){
        var id = $('#id').val();
        var name = $('#name').val();
        var title = $('#title').val();
        var password = $('#password').val();
        if(id == "" || name == "" || title == ""|| password == ""){
            alert("输入数据不能为空");
        }else{
        $.ajax({
            type: 'POST',
            url: '/teacher/updateInformation' ,
            dataType: 'json',
            contentType:'application/json;charset=UTF-8',
            data:JSON.stringify({
                teacherId:id,
                teacherName:name,
                teacherTitle:title,
                teacherPassword:password
            }),  //提交json字符串数组
            success:function(data){
                alert("修改数据成功");
            },
            error:function(){
                alert("修改数据失败！");
            }
        });
    }}
</script>
</html>