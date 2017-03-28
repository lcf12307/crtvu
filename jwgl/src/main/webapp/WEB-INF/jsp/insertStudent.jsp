<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加新同学</title>
    <%@include file="common/head.jsp" %>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function insertStudent(){
            var id = $('#id').val();
            var name = $('#name').val();
            var className = $('#className').val();
            var major = $('#major').val();
            var password = $('#password').val();
            if(id == "" || name == "" || className == "" || major == "" || password == "" )
                alert("输入数据不能为空");
            else{
                $.ajax({
                    type: 'POST',
                    url: '/student/insert' ,
                    contentType: 'application/json',
                    dataType: 'json',
                    data:JSON.stringify({
                        id:id,
                        name:name,
                        className:className,
                        major:major,
                        password:password
                    }),  //提交json字符串数组
                    success:function(data){
                        alert("添加同学success");
                    },
                    error:function(textStatus, errorThrown){

                        window.location.reload(true);

                        console.log(textStatus);
                        alert("添加同学成功");

                    }
                });
            }

        }
    </script>
</head>
<body align="center">
<div class="container">
    <div class="panel panel-default">
    <h2>添加新同学</h2>
    <form action="" id="studentInfo" name="f1">
        <br>学号：<input name="id" id="id"  type="text"  value=""> <br>
        <br>姓名：<input name="name" id="name" type="text" value=""><br>
        <br>班级：<input name="className" id="className" type="text" value=""><br>
        <br>专业：<input name="major" id="major" type="text" value=""><br>
        <br>密码：<input name="password" id="password" type="password" value=""><br>
        <br><a class="btn btn-info" href="#" onclick="insertStudent();">添加新同学</a>
    </form>
</div>
</div>
</body>
</html>
