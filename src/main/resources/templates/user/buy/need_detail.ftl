<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="需求详情" base_css=[]>

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h4>发布者：<a href="#">${needDetail.publisherName}</a></h4>
        <p>发布于 ${needDetail.publishTime}</p>
        <div class="divider-solid"></div>
    </div>
    <div style="width: 70%; margin: 0 auto;margin-top: 40px;">
            <h3 class="text-center">${needDetail.needTitle}</h3>
            <div class="divider-solid"></div>
            <div class="need-desc" style="margin-top: 40px;">
                ${needDetail.needDescription}
            </div>
            <div class="padding" style="height: 50px;"></div>
    </div>
    <div class="divider-solid"></div>
    <div class="comment-area" style="margin-top: 30px">
        <h4 style="border-left: 5px solid #dd3333">留言区</h4>
    </div>
    <div class="divider-solid"></div>
    <div class="fill-comment">
        <textarea id="message" class="form-control" style="height: 100px;"></textarea>
        <div class="btn-grp col-md-12" style="margin-top: 10px;padding-left: 0">
            <button id="submitMessage" class="btn btn-primary col-md-1">留言</button>
            <button id="reset" type="reset" class="btn btn-default col-md-1" style="margin-left: 20px">清空</button>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="divider-solid" style="margin-top: 20px"></div>
    <div class="padding" style="height:20px"></div>
    <#list needDetail.messageList as messageItem>
    <div class="comment-item" style="position: relative;padding-bottom: 40px; padding-top: 40px;border-bottom: 1px solid silver">
        <span style="position: absolute; left: 10px; top:10px;">
            <a href="#">${messageItem.messagePublisherName}</a><span style="margin-left: 40px"><b>${messageItem.publishTime}</b></span>
            <p style="margin-top: 10px">${messageItem.message}</p>
        </span>
    </div>
    </#list>
</div>
<div class="clearfix"></div>
<div class="padding" style="height: 300px;"></div>
<div class="back-to-top">
    <a href="#" class="btn btn-default">回到顶部</a>
</div>
<div class="car-maskmagix_vf_car"></div>
<div style="height:100px; background-color: black;color: white" class="text-center";>
    <h4 style="height:100px;line-height: 100px">2006-2090 飞扬版权所有@copyright</h4>
</div>
<script>
    <#--提交留言-->
    $("#submitMessage").click(function () {
        var message = $("#message").val();
        $.ajax({
            url: "/buy/need/message",
            type: "POST",
            data: {
                message: message,
                needSellId: ${needDetail.needId}
            },
            success:function (result) {
                if(result.code == 0){
                    alert("您的留言已提交!");
                    $("#message").val("");
                    window.location.reload();
                }
            },
            error: function (result) {
                alert("提交留言失败!");
            }
        })
    });
    $("#reset").click(function () {
        $("#message").val("");
    });
</script>
</@defaultLayout.layout>