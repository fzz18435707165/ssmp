<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
<script type="text/javascript">

    //修改
    function update() {
        $.post("<%=request.getContextPath()%>/user/updateUser",
            $("#fm").serialize(),
            function(data){
                if(data.code == 200){
                    layer.msg("修改成功");
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

        <input type="hidden" name="id" value="${user.id}"/>
        名字:<input type="text" name= "userName" value="${user.userName}"><br>

        密码:<input type="text" name="userPwd" value="${user.userPwd}"><br>

        年龄:<input type="text" name="age" value="${user.age}"><br>

        性别:
        男<input type="radio" name="sex" value="1" <c:if test="${user.sex == 1}">checked</c:if>/>
        女<input type="radio" name="sex" value="2" <c:if test="${user.sex == 2}">checked</c:if>/><br>

        手机号:<input type="text" name="list[0].phoneNum" value="${user.phoneNum}"><br>

        邮箱:<input type="text" name="email" value="${user.email}"><br>

        爱好:
        运动<input type="radio" name="hobby" value="1" <c:if test="${user.hobby == 1}">checked</c:if>/>
        看书<input type="radio" name="hobby" value="2" <c:if test="${user.hobby == 2}">checked</c:if>/>
        游戏<input type="radio" name="hobby" value="3" <c:if test="${user.hobby == 3}">checked</c:if>/><br>

        <input type="button" value="修改" onclick="update()">
    </form>

</body>
</html>