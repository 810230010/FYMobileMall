<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="下单成功" base_css=["${springMacroRequestContext.contextPath}/css/order.css"]>

<div class="container" style="padding-top: 30px">
   <h3>恭喜，下单成功!</h3>
    <p><a href="/">返回首页</a></p>
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
$(".address-item").click(function () {
    $(this).addClass('address-selected');
    $(this).children('.mark').css('visibility', 'visible');
    $(this).siblings().removeClass('address-selected');
    $(this).siblings().children('.mark').css('visibility','hidden');
})
</script>
</@defaultLayout.layout>