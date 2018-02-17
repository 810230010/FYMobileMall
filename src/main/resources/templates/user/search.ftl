<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="搜索" showLeftNav=false base_css=[]>

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h4 style="height: 60px;line-height: 60px">搜索结果</h4>
    </div>
    <div class="divider-solid"></div>
    <#list searchResult as searchItem>
        <#if searchItem.type == '闲置'>
            <div onclick="window.location.href='/sell/page/publish/detail?itemId=${searchItem.id}'" class="search-item col-md-6" style="height:80px; border: 1px solid silver;border-top: 0;padding-top: 10px;cursor: pointer">
            <#else>
            <div onclick="window.location.href='/buy/page/need/detail?itemId=${searchItem.id}'" class="search-item col-md-6" style="height:80px; border: 1px solid silver;border-top: 0;padding-top: 10px;cursor: pointer">
        </#if>
            <a href="#">${searchItem.title}</a>
            <#if searchItem.type == '闲置'>
                <span style="position: absolute; right: 20px;color: red">¥${searchItem.price}</span>
            </#if>
            <span style="position: absolute;right:20px;bottom: 10px;"><a href="#">${searchItem.publisherName}</a>发布于<b>${searchItem.publishTime}</b></span>
            <span style="position: absolute; left:14px; bottom:10px;color: red">
                ${searchItem.type}
            </span>
        </div>
    </#list>
</div>
<div class="clearfix"></div>
<div class="padding" style="height: 100px"></div>
<div class="back-to-top">
    <a href="#" class="btn btn-default">回到顶部</a>
</div>
<div class="car-maskmagix_vf_car"></div>
    <div class="footer" style="background-color: #F7F7F7;height:200px;">
        <div class="col-md-4 text-center">
            <h3>教你怎么卖</h3>
            <caption>how to sell</caption>
            <div class="divider-solid"></div>
            <p>
            <ul style="list-style: none">
                <li>个人闲置卖家如何发布拍卖商品</li>
                <li>个人闲置卖家如何发布拍卖商品</li>
                <li>个人闲置卖家如何发布拍卖商品</li>
            </ul>
            </p>
        </div>
        <div class="col-md-4 text-center">
            <h3>教你怎么买</h3>
            <caption>how to buy</caption>
            <div class="divider-solid"></div>
            <p>
            <ul style="list-style: none">
                <li>个人闲置卖家如何发布拍卖商品</li>
                <li>个人闲置卖家如何发布拍卖商品</li>
                <li>个人闲置卖家如何发布拍卖商品</li>
            </ul>
            </p>
        </div>
        <div class="col-md-4 text-center">
            <h3>责任声明</h3>
            <caption>responsibility declaration</caption>
            <div class="divider-solid"></div>
            <ul style="list-style: none">
                <li>本店商品均为易碎品，非质量问题谢绝退货，如有质量问题，本店承担运费调换</li>
            </ul>
        </div>
    </div>
    <div style="height:100px; background-color: black;color: white" class="text-center";>
        <h4 style="height:100px;line-height: 100px">2006-2090 飞扬版权所有@copyright</h4>
    </div>
<script>

</script>
</@defaultLayout.layout>