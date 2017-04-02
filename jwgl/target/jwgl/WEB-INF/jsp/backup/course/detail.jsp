<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>编辑课程</title>
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
            if(id == "" || name == "" || nature == "" || department == ""  )
                alert("输入数据不能为空");
            else{
                if(credit == ""){
                    credit = -1;}
                $.ajax(
                    {
                        type: 'POST',
                        url: '/course/updatecourse' ,
                        dataType: 'json',
                        contentType:'application/json;charset=UTF-8',
                        data:JSON.stringify({
                            id:id,
                            name:name,
                            credit:credit,
                            nature:nature,
                            department:department
                        }),  //提交json字符串数组
                        success:function(){
                            alert("修改数据成功");
                        },
                        error:function(){
                            alert("修改数据失败");
                        }
                    });
            }

        }
    </script>
</head>
<body align="center">
<div class="container">
    <div class="panel panel-default">
        <h2>编辑资料</h2>
        <form action="" id="studentInfo" name="studentinfo" >
            <br>课程号：<input name="id" id="id"  type="text"  value="${course.id}" readonly> </pname><br>
            <br>课程名：<input name="name" id="name" type="text" value="${course.name}"> <br>
            <br>课程学分：<input name="credit" id="credit" type="text" value="${course.credit}"><br>
            <br>课程性质：<input name="nature" id="nature" type="text" value="${course.nature}"><br>
            <br>开设院系：<input name="department" id="department" type="text" value="${course.department}"><br>
            <br><a class="btn btn-info" onclick="insertCourse();">确认编辑</a>
        </form>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>