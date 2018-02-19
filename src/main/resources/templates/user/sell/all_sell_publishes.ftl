<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="所有闲置发布" showLeftNav=false base_css=[]>

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h4 style="height: 60px;line-height: 60px">所有闲置</h4>
    </div>
    <div class="divider-solid"></div>
    <div class="padding" style="height: 40px"></div>
    <div>
        <table id="table">
                <div class="row">
                        <#list sellItems as sellItem>
                            <a href="/sell/page/publish/detail?itemId=${sellItem.sellId}">
                                <div class="goods-item col-md-3">
                                    <div class="thumbnail" style="padding-left: 0; padding-right: 0">
                                        <div style="text-align: center">
                                            <img src="${sellItem.image}"
                                                 alt="通用的占位符缩略图" style="width:100%;height: 140px">
                                        </div>
                                        <div class="caption text-center" style="position:relative;height:60px">
                                            <span>${sellItem.sellTitle}</span>
                                            <span style="position: absolute; right:20px;bottom:0;color: red">¥${sellItem.sellPrice}</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </#list>
                </div>
        </table>
    </div>
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