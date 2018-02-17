<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="闲置详情" base_css=[]>

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h4>发布者：<a href="#">${sellDetail.publisherName}</a></h4>
        <p>发布于 ${sellDetail.publishTime}</p>
        <div class="divider-solid"></div>
    </div>
    <div style="width: 70%; margin: 0 auto;margin-top: 40px;">
        <h3 class="text-center">${sellDetail.sellTitle}<span style="color:red;float:right">¥${sellDetail.sellPrice}</span></h3>
        <div class="divider-solid"></div>
        <div class="need-desc" style="margin-top: 40px;">
            ${sellDetail.sellDescription}
        </div>
        <div class="padding" style="height: 50px;"></div>
    </div>
    <div class="divider-solid"></div>
    <div class="comment-area" style="margin-top: 30px">
        <h4 style="border-left: 5px solid #dd3333">商品图片</h4>
    </div>
    <div class="divider-solid"></div>
    <div class="item-pictures" style="margin-top: 20px">
        <#list sellDetail.images as image>
        <div class="col-md-1">
            <img src="${image}" alt="商品图片" style=" height: 100px"/>
        </div>
        </#list>
    </div>
    <div class="clearfix"></div>
    <div class="divider-solid" style="margin-top: 20px"></div>
    <div class="buy" style="margin-top: 30px">
        <button id="buy" class="btn btn-primary pull-right col-md-2">购买</button>
    </div>

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
$("#buy").click(function () {
    window.location.href = "/order/page/confirm?sellItemId=${sellDetail.sellId}";
})
</script>
</@defaultLayout.layout>