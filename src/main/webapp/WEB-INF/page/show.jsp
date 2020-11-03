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

    //初始加载函数
    $(function(){
        search();
    })

    //展示
    function search() {
        $.post("<%=request.getContextPath()%>/user/show",
            $("#fm").serialize(),
            function(data){
                if (data.code != 200) {
                    alert(data.msg);
                    return;
                }
                var html = "";
                var pageHtml = "";
                for (var i = 0; i <  data.data.list.length; i++) {
                    var u = data.data.list[i];
                    html += "<tr>";
                    html += "<td><input type = 'checkbox' name = 'proids' value = '"+u.id+"'/></td>"
                    html += "<td>"+u.id+"</td>";
                    html += "<td>"+u.userName+"</td>";
                    html += "<td>"+u.userPwd +"</td>";
                    html += "<td>"+u.age +"</td>";
                    if (u.sex==1){
                        html += "<td>男</td>";
                    }else{
                        html += "<td>女</td>";
                    }
                    html += "<td>"+u.phoneNum +"</td>";
                    html += "<td>"+u.email +"</td>";

                        if (u.hobby==1) {
                            html+="<td>运动</td>";
                        }
                        if (u.hobby==2) {
                        html+="<td>看书</td>";
                        }
                        if (u.hobby==3) {
                        html += "<td>游戏</td>";
                    }
                        html +="<td>";
                        html += "<input type='button' value='删除' onclick='deleteUser("+u.id+")'/>";
                        html += "<input type='button' value='修改' onclick='updateUser("+u.id+")'/>";
                        html +="</td>";
                    html += "</tr>";
                }
                $("#tbd").html(html);
                pageHtml += "<input type = 'button' value='上一页' onclick='page(0, "+data.data.pages+")'/>";
                if (data.data.pages==0) {
                    pageHtml +="第0页";
                }else{
                    pageHtml +="第"+$("#pageNo").val()+"/"+data.data.pages+"页";
                }
                pageHtml += "<input type = 'button' value='下一页' onclick='page(1, "+data.data.pages+")'/>";
                $("#pageDiv").html(pageHtml);
            });
    }

    //分页
    function page(q,pages){
        var page = $("#pageNo").val();
        if (q == 0) {
            if (page == 1) {
                layer.msg("已是首页", {icon: 5, time: 2000});
                return;
            }
            $("#pageNo").val(parseInt(page) - 1);
        }
        if (q == 1) {
            if (parseInt(page) + 1 > pages ) {
                layer.msg("已是尾页", {icon: 5, time: 2000});
                return;
            }
            $("#pageNo").val(parseInt(page) + 1);
        }
        search();
    }


    //赋选中复选框的值
    function selectedValue() {
        proids = $('input[name="proids"]:checked');
        var chk_value = [];
        $.each(proids,function(){
            chk_value.push($(this).val());
        })
        $("#findByIds").val(chk_value);
        //alert(chk_value);
        return chk_value;
    }

    /**
     * 修改
     */
    function updateUser(id) {
        var index = layer.load(0,{shade:0.3});
        layer.open({
            type: 2,
            title: '修改',
            shadeClose: true,
            shade: 0.8,
            area: ['480px', '90%'],
            content:"<%=request.getContextPath() %>/user/toUpdate/"+id ,
        });
        layer.close(index);
    }

    //删除批量
    function deleteManyUser(){
        if(selectedValue().length == 0){
            alert("无法进行删除操作");
            return;
        }
        $.post("<%=request.getContextPath()%>/user/deleteManyUser",
            {"ids":selectedValue()},
            function(data){
                if(data.code == 200){
                    alert("删除成功");
                    window.location.href ="<%=request.getContextPath()%>/user/toShow";
                }
            })
    }

    //删除
    function deleteUser(id){
        $.post("<%=request.getContextPath()%>/user/deleteUser/"+id,
            {},
            function(data){
                if(data.code == 200){
                    alert("删除成功");
                    window.location.href ="<%=request.getContextPath()%>/user/toShow";
                }
            })
    }

    //批量新增
    function addManyUser() {
        var index = layer.load(0,{shade:0.3});
        window.location.href="<%=request.getContextPath()%>/user/toManyAdd",
        layer.close(index);
    }

    //新增
    function addUser() {
        var index = layer.load(0,{shade:0.3});
        layer.open({
            type: 2,
            title: '新增',
            shadeClose: true,
            shade: 0.8,
            area: ['480px', '90%'],
            content:"<%=request.getContextPath()%>/user/toAdd",
        });
        layer.close(index);
    }

    //条件查询要重新分页
    function selectBy(){
        $("#pageNo").val(1);
        search();
    }

</script>
</head>
<body style="text-align: center">
<input type="button" value="批量删除" onclick="deleteManyUser()"/>
<input type="button" value="批量新增" onclick="addManyUser()"/>
<input type="button" value="新增" onclick="addUser()"/>
    <form id="fm">
        <input type="hidden" value="1"  id="pageNo" name ="pageNo">

        名字:<input type="text" name="userName">

        爱好:
        运动<input type="checkbox" name="hobbys" value="1">
        看书<input type="checkbox" name="hobbys" value="2">
        游戏<input type="checkbox" name="hobbys" value="3">

        性别:
        <input type="radio" name="sex" value="1">男
        <input type="radio" name="sex" value="2">女

        <input type="button" value="查询" onclick="selectBy()">
    </form>

    <table align="center">
        <tr>
            <td></td>
            <td>id</td>
            <td>用户名</td>
            <td>密码</td>
            <td>年龄</td>
            <td>性别</td>
            <td>手机号</td>
            <td>邮箱</td>
            <td>爱好</td>
        </tr>
        <tbody id ="tbd">

        </tbody>
     </table>

    <div id = "pageDiv"></div>
</body>
</html>