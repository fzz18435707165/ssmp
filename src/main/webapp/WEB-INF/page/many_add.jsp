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
    function manyAdd() {
        $.post("<%=request.getContextPath()%>/user/addManyUser",
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


    /**
     * 添加
     */
    var i = 0;
    function adds(){
        i++;
        var html = "";
        html += "<div><hr /><input type='button' value='-' onclick='del(this)' />";

        html += "名字:<input type='text' name='list["+i+"].userName' /><br>";

        html += "密码:<input type='text' name='list["+i+"].userPwd' /><br>";

        html += "年龄:<input type='text' name='list["+i+"].age' /><br>";

        html += "性别:";
        html +=    "男<input type='radio' name='list["+i+"].sex' value='1' />";
        html +=    "女<input type='radio' name='list["+i+"].sex' value='2' /><br>";

        html += "手机号:<input type='text' name='list["+i+"].phoneNum' /><br>";

        html += " 邮箱:<input type='text' name='list["+i+"].email' /><br>";

        html += "爱好:";
        html += "运动<input type='radio' name='list["+i+"].hobby' value='1' />";
        html += "看书<input type='radio' name='list["+i+"].hobby' value='2' />";
        html += "游戏<input type='radio' name='list["+i+"].hobby' value='3' /><br>";

        html += "</div>";
        $("#appendDiv").append(html);
    }
    //删除
    function del(obj){
        $(obj).parent().remove();
    }
</script>
</head>
<body style="text-align: center">
<input type="button" value="+" onclick="adds()"/>
    <form id="fm">


        名字:<input type="text" name="list[0].userName"><br>

        密码:<input type="text" name="list[0].userPwd"><br>

        年龄:<input type="text" name="list[0].age"><br>

        性别:
        男<input type="radio" name="list[0].sex" value="1">
        女<input type="radio" name="list[0].sex" value="2"><br>

        手机号:<input type="text" name="list[0].phoneNum"><br>

        邮箱:<input type="text" name="list[0].email"><br>

        爱好:
        运动<input type="radio" name="list[0].hobby" value="1">
        看书<input type="radio" name="list[0].hobby" value="2">
        游戏<input type="radio" name="list[0].hobby" value="3"><br>

        <div id="appendDiv"></div>
        <input type="button" value="添加" onclick="manyAdd()">
    </form>

</body>
</html>