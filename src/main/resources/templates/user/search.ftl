<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="搜索">

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h4 style="height: 60px;line-height: 60px">搜索结果</h4>
    </div>
    <div class="divider-solid"></div>
    <div onclick="" class="search-item col-md-6" style="height:80px; border: 1px solid silver;border-top: 0;padding-top: 10px;cursor: pointer">
        <a href="#">最新苹果手机手机</a>
        <span style="position: absolute; right: 20px;color: red">¥2000</span>
        <span style="position: absolute;right:20px;bottom: 10px;"><a href="#">usher</a>发布于<b>2017-12-12 02:00:12</b></span>
        <span style="position: absolute; left:14px; bottom:10px;color: red">
            闲置
        </span>
    </div>
    <div onclick="" class="search-item col-md-6" style="height:80px; border: 1px solid silver;border-top: 0;padding-top: 10px;cursor: pointer">
        <a href="#">最新苹果手机手机</a>
        <span style="position: absolute;right:20px;bottom: 10px;"><a href="#">usher</a>发布于<b>2017-12-12 02:00:12</b></span>
        <span style="position: absolute; left:14px; bottom:10px;color: red">
            需求
        </span>
    </div>

</div>
<div class="clearfix"></div>
<div class="padding" style="height: 100px"></div>
<div class="back-to-top">
    <a href="#" class="btn btn-default">回到顶部</a>
</div>
<div class="car-maskmagix_vf_car"></div>
</@defaultLayout.layout>