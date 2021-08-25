<%--
  Created by IntelliJ IDEA.
  User: 网中鱼
  Date: 2021/8/23
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addEmp_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="edit_modal_Label">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateEmp_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_select_update">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary" id="addEmp_btn">新增</button>
            <button class="btn btn-danger delEmps_btn" id="delEmps_btn">批量删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table" id="emps_table">
                <thead>
                <tr>
                    <th class="checkBox_th"></th>
                    <th>编号</th>
                    <th>名字</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>

                </tr>
                </tbody>

            </table>
        </div>
    </div>
        <div class="row" id="pageMes">
        </div>
    <div class="row col-md-offset-6">
        <nav aria-label="Page navigation" id="page_nav">

        </nav>
    </div>

    <script type="text/javascript">
        var totalPage,currentPageNum;
        $(function () {
            getAll(1);
        });
        // 传入页数构建页面
        function getAll(pn) {
            $.ajax({
                url:"${PATH}/getAll",
                data:"pn="+pn,
                type:"get",
                success:function (data) {
                    // 显示员工信息
                    empsMes(data);
                    // 显示分页信息
                    pageMes(data);
                    // 显示分页条信息
                    page_nav(data);

                }
            })
        };

        // 获取员工信息以供分页
        function empsMes(data) {
            $("#emps_table tbody").empty();
            var emps = data.res.pageInfo.list;
            $.each(emps,function (index,item) {
                var box = $("<td></td>").addClass("checkbox_td");
                var id = $("<td></td>").append(item.id);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender=="1"?"男":"女");
                var email = $("<td></td>").append(item.email);
                var deptName = $("<td></td>").append(item.department.deptName);
                var addbtn = $("<button></button>").addClass("edit_btn btn-primary btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                addbtn.attr("edit_id",item.id);

                var delbtn = $("<button></button>").addClass("del_btn btn-danger btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                var btn = $("<td></td>").append(addbtn).append(" ").append(delbtn);

                $("<tr></tr>").append(box).append(id).append(empName).append(gender)
                            .append(email).append(deptName).append(btn).appendTo($("#emps_table tbody"));

            })
        };
        // 添加分页信息
        function pageMes(data) {
            $("#pageMes").empty();
            totalPage = data.res.pageInfo.pages;
                $("<div></div>").append("当前在"+data.res.pageInfo.pageNum+"页 总共"+
                totalPage+"页 共有"+data.res.pageInfo.total+"条信息")
            .appendTo($("#pageMes"));

            currentPageNum = data.res.pageInfo.pageNum
        };
        // 添加分页条
        function page_nav(data) {
            $("#page_nav").empty();
            var pageInfo = data.res.pageInfo;

            var ul = $("<ul></ul>").addClass("pagination");

            var first = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            var last = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));

            var previous = $("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>")).append("&laquo;"));
            var next = $("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>")).append("&raquo;"));

            if (!pageInfo.hasPreviousPage){
                first.addClass("disabled");
                previous.addClass("disabled");
            }else {
                first.click(function () {
                getAll(1);
                });
                previous.click(function () {
                getAll(pageInfo.pageNum-1);
                });
            }
            if (!pageInfo.hasNextPage){
                last.addClass("disabled");
                next.addClass("disabled");
            }else {
                last.click(function () {
                    getAll(pageInfo.pages);
                });
                next.click(function () {
                    getAll(pageInfo.pageNum+1);
                });
            }
            ul.append(first).append(previous);
            $.each(pageInfo.navigatepageNums,function (index,item) {
                var page = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                if (pageInfo.pageNum==item){
                    page.addClass("active");
                }else {
                    page.click(function () {
                        getAll(item);
                    });
                };
                ul.append(page);
            });
            ul.append(next).append(last).appendTo($("#page_nav"));
        };
        // 弹出添加员工的模态框
        $("#addEmp_btn").click(function () {
            $('#myModal').modal({
                backdrop:"static"
            });
            getDept("#dept_select")
        });

        // 弹出修改员工信息的模态框
        $(document).on("click",".edit_btn",function (){
            $('#edit_modal').modal({
                backdrop:"static"
            });
            getDept("#dept_select_update");

            getEmp($(this).attr("edit_id"))
        });
        // 点击删除指定id的员工
        $(document).on("click",".del_btn",function (){
           var empName = $(this).parents("tr").find("td:eq(2)").text();
           if (!confirm("你确定要删除员工【"+empName+"】吗？")){
               return false;
           };
            var id = $(this).parents("tr").find("td:eq(1)").text();

            deleteEmp(id)

        });
        // 发送ajax请求删除员工
        function deleteEmp(id) {
            $.ajax({
                url:"${PATH}/emp/"+id,
                data:"_method=delete",
                type:"post",
                success:function (data) {
                    alert(data.mes);
                    getAll(currentPageNum)
                }
            })
        }

        function getEmp(id) {
            $("#emp_update_btn").attr("edit_id",id);
            $.ajax({
                url:"${PATH}/emp/"+id,
                type:"get",
                success:function (date) {
                    var emp = date.res.emp;
                    $("#empName_update").attr("value",emp.empName);
                    $("#email_update").attr("value",emp.email);
                    $("#edit_modal input[name=gender]").val([emp.gender]);
                    $("#edit_modal select").val([emp.dId])
                }
            })
        }

        // 点击修改员工
        $("#emp_update_btn").click(function () {
            $.ajax({
                url:"${PATH}/emp/"+$(this).attr("edit_id"),
                data:$("#updateEmp_form").serialize()+"&_method=put",
                type:"post",
                success:function (data) {
                    if (data.code==200){
                        alert(data.mes);
                        return false;
                    };
                    $("#edit_modal").modal('hide');
                    getAll(currentPageNum)
                }
            })
        })

        //获取部门信息供传入的元素使用
        function getDept(ele){
            $.ajax({
                url:"${PATH}/getDepts",
                type:"get",
                success:function (date) {
                    $(ele).empty();
                    var depts = date.res.depts;
                    $.each(depts,function (index,item) {
                        var options = $("<option></option>")
                            .append(item.deptName).attr("value",item.deptId);
                        $(ele).append(options);
                    })
                }
            })
        };
        // 保存新增用户
        $("#emp_save_btn").click(function () {
            // if (!validate_add_form()){
            //     return false;
            // };
            $.ajax({
                url:"${PATH}/emp",
                data: $("#addEmp_form").serialize(),
                type:"post",
                success:function (date) {
                    if (date.code==100){
                        $("#myModal").modal('hide');
                        getAll(totalPage+1);
                    };
                    if (date.code==200){
                        show_validate_msg("#empName_add", "error", date.mes);
                    }
                    if (date.code==201){
                        show_validate_msg("email_add", "error", date.mes);
                    }
                    if(date.code==300){
                        if (undefined != date.res.resultMap.email){
                            show_validate_msg("#email_add", "error", date.res.resultMap.email);
                        }
                        if (undefined != date.res.resultMap.empName){
                            show_validate_msg("#empName_add", "error", date.res.resultMap.empName);
                        }
                    }
                }
            })
        });

        // 失去焦点校验用户名
        $("#empName_add").blur(function () {
            //1、拿到要校验的数据，使用正则表达式
            var empName = $("#empName_add").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                //alert("用户名必须是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            }else{
                show_validate_msg("#empName_add", "success", "");
            }
        });
        // 失去焦点校验邮箱格式
        $("#email_add").blur(function () {
            //2、校验邮箱信息
            var email = $("#email_add").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                //应该清空这个元素之前的样式
                show_validate_msg("#email_add", "error", "邮箱格式不正确");
                /* $("#email_add_input").parent().addClass("has-error");
                $("#email_add_input").next("span").text("邮箱格式不正确"); */
            }else{
                show_validate_msg("#email_add", "success", "");
            }
        });

        // 处理批量删除
        $(".delEmps_btn").click(function () {

            if ($(this).attr("value")=="check"){
                var empNames="";
                var ids="";
                $.each($(".check_item:checked"),function () {
                    empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                    ids += $(this).parents("tr").find("td:eq(1)").text()+",";
                });
                empNames = empNames.substring(0,empNames.length-1);
                ids = ids.substring(0,ids.length-1);



                if (confirm("确认删除【"+empNames+"】员工")){
                    deleteEmp(ids);
                    $(this).text("批量删除");
                    $(this).attr("value","delete");
                    $(".checkbox_td").empty();
                    $(".checkBox_th").empty();
                };
                return false;
            }
            $(".checkbox_td").empty().append($("<input type=\"checkbox\" class=\"check_item\"/>"));
            $(".checkBox_th").empty().append($("<input type=\"checkbox\" id=\"check_all\"/>"));
            $(this).text("确定删除");
            $(this).attr("value","check");
        });

        $(document).on("click","#check_all",function () {
            $(".check_item").prop("checked",$(this).prop("checked"));
        });
        $(document).on("click",".check_item",function () {
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
        });



        //校验表单数据
        function validate_add_form(){
            //1、拿到要校验的数据，使用正则表达式
            var empName = $("#empName_add").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add", "success", "");
            };

            //2、校验邮箱信息
            var email = $("#email_add").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                //应该清空这个元素之前的样式
                show_validate_msg("#email_add", "error", "邮箱格式不正确");
                /* $("#email_add_input").parent().addClass("has-error");
                $("#email_add_input").next("span").text("邮箱格式不正确"); */
                return false;
            }else{
                show_validate_msg("#email_add", "success", "");
            }
            return true;
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        };

        //清空表单样式及内容
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }


    </script>
</div>

</body>
</html>
