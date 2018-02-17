<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="编辑个人信息" showLeftNav=true base_css=["${springMacroRequestContext.contextPath}/css/profile.css"]>
<div style="float: left;background-color: #f5f5f5;margin-left: 30px" class="col-md-8">
    <div class="title">
        <h4>基本信息</h4>
    </div>
    <div class="divider-solid"></div>
    <div style="margin-top: 30px">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="title" class="col-md-2 control-label text-center">我的昵称</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="nickName" value="${analysis["nickname"]}" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label text-center">手机号码</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="phone" value="${analysis["tel"]}">
                </div>
            </div>

            <div class="form-group">
                <label for="title" class="col-md-2 control-label text-center">密码</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="oldPass">
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label text-center">新密码</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="newPass">
                </div>
            </div>
            <div class="divider-solid"></div>
            <div class="form-group" style="margin-top: 20px;padding-right: 20px">
                <button id="save" class="btn btn-primary pull-right col-md-3">保存</button>
            </div>
        </form>
    </div>
</div>
<script>
    $("#save").click(function () {

           $.ajax({
               url: "/profile/editBasicInfo",
               data: {
                    tel: $("#phone").val(),
                    newPassword: $("#newPass").val(),
                    oldPassword: $("#oldPass").val()
               },
               success: function (result) {
                    if(result.code == 0){
                        alert("修改信息成功");
                        setTimeout(function () {
                           window.location.reload();
                        }, 1500)
                    }else if(result.code == 1){
                        alert("信息已修改，请重新登录");
                        window.location.reload();
                    } else{
                        alert(result.msg);
                    }
               },
               error: function (result) {
                   alert("修改个人信息服务出错!");
               }
           })
    })
</script>
</@defaultLayout.layout>