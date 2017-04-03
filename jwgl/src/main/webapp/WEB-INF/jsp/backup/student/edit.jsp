<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>编辑同学</title>
    <%@include file="../../common/head.jsp" %>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        function insertStudent(){
            var id = ${studentId};
            var name = $('#name').val();
            var className = $('#className').val();
            var major = $('#major').val();
            if(id == "" || name == "" || className == "" || major == ""  )
                alert("输入数据不能为空");
            else{
                $.ajax({
                    type: 'POST',
                    url: '/student/updateStudent' ,
                    dataType: 'json',
                    contentType:'application/json;charset=UTF-8',
                    data:JSON.stringify({
                        id:id,
                        name:name,
                        className:className,
                        major:major
                    }),  //提交json字符串数组
                    success:function(data){
                        alert("修改数据成功");
                    },
                    error:function(){
                        alert("修改数据失败！");
                    }
                });
            }

        }
        function showModal() {
            var password=$('#passwordModal');
            password.modal({
                    show:true
                } );
        }
        function changePassword() {
            var id = ${studentId};
            var newpassword = $('#newPassword').val();
            if(newpassword.length < 8){
                alert("密码长度至少为八位");
            }else {
                $.ajax({
                    type: 'POST',
                    url: '/student/changepassword' ,
                    dataType: 'json',
                    contentType:'application/json;charset=UTF-8',
                    data:JSON.stringify({
                        id: id,
                        newPassword: newpassword
                    }),  //提交json字符串数组
                    success:function(){
                        alert("修改密码成功！");
                    },
                    error:function(){

                        alert("修改密码失败！");
                    }
                });
            }
        }
    </script>
</head>
<body align="center">
<%--登录弹出层 输入电话--%>
<div id="passwordModal" class="modal fade">

    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-phone"> </span>请输入新密码:
                </h3>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-8 col-xs-offset-2">
                        <input type="password" name="newPassword" id="newPassword"
                               placeholder="填写新密码^o^" class="form-control">
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <%--验证信息--%>
                <span id="passwordMessage" class="glyphicon"> </span>
                <button type="button" id="changeBtn" class="btn btn-success" onclick="changePassword()">
                    <span class="glyphicon glyphicon-phone"></span>
                    Submit
                </button>
            </div>

        </div>
    </div>

</div>
<div class="container" align="center">
    <div class="panel panel-default" style="width: 400px">
    <h2>编辑学号为${student.id}的同学资料</h2>
    <form action="" id="studentInfo" name="studentinfo" >
        <br>姓名：<input name="name" id="name" type="text" value="${student.name}"> <br>
        <br>班级：<input name="className" id="className" type="text" value="${student.className}"><br>
        <br>专业：<input name="major" id="major" type="text" value="${student.major}"><br>
        <br><a class="btn btn-info" onclick="insertStudent();">确认编辑</a>
        <a class="btn btn-info" onclick="showModal()">修改密码</a>
    </form>
</div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>