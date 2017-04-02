<%--
  Created by IntelliJ IDEA.
  User: gao27024037
  Date: 2017/3/31
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>添加教师</title>
    <%@include file="../../common/head.jsp"%>
</head>
<body>
<div class="container" align="center">
    <div class="panel panel-default text-center">
        <div class="panel-heading"><h2>添加教师</h2></div>
    </div>
    <div class="panel-body">
        <form action="" method="" class="form-horizontal" role="form">
            I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D:
            <input type="text" id="id" style="margin:4px" placeholder="10位数字"><br>
            姓&nbsp;&nbsp;&nbsp;名:
            <input type="text" id="name" style="margin:4px" ><br>
            职&nbsp;&nbsp;&nbsp;称:
            <input type="text" id="title" style="margin:4px" ><br>
            <a class="btn btn-info" onclick="insert();">提交增加</a>
        </form>
    </div>
</div>
</body>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function insert(){
        var id = $('#id').val();
        var name = $('#name').val();
        var title = $('#title').val();
        if(id.length != 10 || isNaN(id)){
            alert("ID请输入10位数字");
        }else if(id == "" || name == "" || title == ""){
            alert("输入数据不能为空");
        }else{
            $.ajax({
                type: 'POST',
                url: '/teacher/insert' ,
                dataType: 'json',
                contentType:'application/json;charset=UTF-8',
                data:JSON.stringify({
                    teacherId:id,
                    teacherName:name,
                    teacherTitle:title,
                }),  //提交json字符串数组
                success:function(data){
                    alert("添加数据成功");
                },
                error:function(){
                    alert("添加数据失败！");
                }
            });
        }}
</script>
</html>
