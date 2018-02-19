<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="卖家信息" showLeftNav=false base_css=[]>

<div class="container">
    <div class="search-title" style="height: 60px;">
        <h3 style="height: 60px;line-height: 60px">卖家信息</h3>
    </div>
    <div class="divider-solid"></div>
    <div class="padding" style="height:40px"></div>
    <div style="clear: both"></div>
    <div class="basic">
        <h4 style="border-left: 5px solid #dd3333">基本信息</h4>
        <div class="divider-solid"></div>
        <div class="basic-area col-md-4" style="border:1px solid silver">
            <p>
                昵称:   <span style="color: red;font-weight: bold">${seller.nickname}</span>
            </p>
            <p>
                发布闲置:   <span style="color: red;font-weight: bold">${seller.sellCount}</span>
            </p>
            <p>
                发布需求:   <span style="color: red;font-weight: bold">${seller.sellCount}</span>
            </p>
            <p>
                售出:   <span style="color: red;font-weight: bold">${seller.sellSuccessCount}</span>
            </p>
            <p>
                买入:   <span style="color: red;font-weight: bold">${seller.buyCount}</span>
            </p>
        </div>
    </div>
    <div style="clear: both"></div>
    <div class="divider-solid" style="margin-top: 30px"></div>
    <div class="sells">
        <h4 style="border-left: 5px solid #dd3333">ta发布的闲置</h4>
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
                                        <span style="position: absolute; left:20px;bottom:0;color: red">${sellItem.state}</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </#list>
            </table>
        </div>
    </div>

    <div style="clear: both"></div>
    <div class="divider-solid" style="margin-top: 30px"></div>
    <div class="sells">
        <h4 style="border-left: 5px solid #dd3333">ta发布的需求</h4>
        <div class="recommend-list">
            <div class="row">
                <div class="col-md-12" style="position: relative;">
                    <#list buyNeeds as needItem>
                        <div class="need-item col-md-6" style="height: 70px;padding-top: 10px;border: 1px solid silver;">
                            <a href="/buy/page/need/detail?itemId=${needItem.needId}">${needItem.title}</a>
                            <span style="position: absolute;right:20px;bottom: 10px;"><a href="/profile/page/sellerInfo?userId=${needItem.publisherId}">${needItem.publisherName}</a>发布于<b>${needItem.publishTime}</b></span>
                            <span style="position: absolute; left:14px; bottom:10px;">
                                <i class="fa fa-comment"></i>${needItem.commentNo}
                                <i class="fa fa-eye" style="margin-left:20px">30</i>
                            </span>
                        </div>
                    </#list>
                </div>

            </div>
        </div>
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