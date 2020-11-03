<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
<script type="text/javascript">

    //添加
    function addUser() {
        $.post("<%=request.getContextPath()%>/user/addUser",
            $("#fm").serialize(),
            function(data){
                if(data.code == 200){
                    layer.msg("添加成功");
                    parent.location.href ="<%=request.getContextPath()%>/user/toShow";
                }else{
                    layer.msg(data.msg)
                }
            });
    }


</script>
</head>
<body style="text-align: center">

    <form id="fm">

        名字:<input type="text" name="userName"><br>

        密码:<input type="text" name="userPwd"><br>

        年龄:<input type="text" name="age"><br>

        性别:
        男<input type="radio" name="sex" value="1">
        女<input type="radio" name="sex" value="2"><br>

        手机号:<input type="text" name="phoneNum"><br>

        邮箱:<input type="text" name="email"><br>

        爱好:
        运动<input type="radio" name="hobby" value="1">
        看书<input type="radio" name="hobby" value="2">
        游戏<input type="radio" name="hobby" value="3"><br>

        <input type="button" value="添加" onclick="addUser()">
    </form>

</body>
</html>