<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加新课程</title>
    <%@include file="../../common/head.jsp" %>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function insertCourse(){
            var id = $('#id').val();
            var name = $('#name').val();
            var credit = $('#credit').val();
            var nature = $('#nature').val();
            var department = $('#department').val();
            if(id == "" || name == "" || nature == "" || department == ""){
                alert("输入数据不能为空");}
            else if(credit >= 10||credit < 0){
                alert("输入数据太大或太小范围0=<x<10");
            }
            else{
                if(credit == ""){
                    credit = -1;
                }
                $.ajax({
                    type: 'POST',
                    url: '/course/insert' ,
                    contentType: 'application/json',
                    dataType: 'json',
                    data:JSON.stringify({
                        id:id,
                        name:name,
                        credit:credit,
                        nature:nature,
                        department:department
                    }),  //提交json字符串数组
                    success:function(){
                            alert("添加成功");
                    },
                    error:function(){
                        alert("添加失败");
                        console.log();

                    }
                });
            }

        }
    </script>
</head>
<body align="center">
<div class="container">
    <div class="panel panel-default">
        <h2>添加新课程</h2>
        <form action="" id="courseInfo" name="f1">
            <br>课程id：  <input name="id" id="id"  type="text" maxlength='10' value=""> <br>
            <br>课程名称：<input name="name" id="name" type="text"maxlength='100' value=""><br>
            <br>课程学分：<input name="credit" id="credit" type="text" maxlength='3'value=""><br>
            <br>课程性质：<input name="nature" id="nature" type="text" maxlength='10'value=""><br>
            <br>开设院系：<input name="department" id="department" type="text"maxlength='20' value=""><br>
            <br><a class="btn btn-info" href="#" onclick="insertCourse();">添加新课程</a>

        </form>
    </div>
</div>
</body>
</html>