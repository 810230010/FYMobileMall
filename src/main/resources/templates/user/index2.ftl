<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="首页" showLeftNav=false base_css=[]>

<!--轮播图-->
<div class="body">
    <div id="myCarousel" class="carousel slide col-md-12" style="margin-top: 10px">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="${springMacroRequestContext.contextPath}/img/carousel_img1.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="${springMacroRequestContext.contextPath}/img/carousel_img1.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="${springMacroRequestContext.contextPath}/img/carousel_img1.jpg" alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;</a>
    </div>
    <div class="clearfix"></div>
    <div class="toothbg" style="margin-top: 10px"></div>

    <div class="feature col-md-10 col-md-offset-1">
        <div class="feature-title" style="border-left: 4px solid #dd3333;padding-left: 10px">
            <h3>平台特色</h3>
        </div>
        <div class="feature-list">
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/feature1.jpg" style="width: 100%;" alt="通用的占位符缩略图">
                        <div class="caption text-center">
                            <h3>卖家实名认证</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/feature2.jpg"
                             alt="通用的占位符缩略图" style="width: 100%;">
                        <div class="caption text-center">
                            <h3>支付宝担保交易</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/feature3.jpg"
                             alt="通用的占位符缩略图" style="width: 100%;">
                        <div class="caption text-center">
                            <h3>专业团队支撑</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/feature4.jpg"
                             alt="通用的占位符缩略图" style="width: 100%;">
                        <div class="caption text-center">
                            <h3>官方微博</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
    <div class="divider-solid"></div>
    <!--最新发布-->
    <div class="newest col-md-10 col-md-offset-1">
        <div class="newest-title" style="border-left: 4px solid #dd3333;padding-left: 10px">
            <h3>
                最新发布&nbsp;&nbsp;
                <span style="font-size: 14px;">最新的在这里。</span>
                <div class="more pull-right">
                    <a href="/page/sell/more" style="position: relative;bottom: 10px;right:10px" href="#" class="button button-glow button-border button-rounded button-primary">MORE+</a>
                </div>
            </h3>
        </div>

        <div class="newest-list">
            <div class="row">
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/MI.jpg" style="height: 300px;" alt="通用的占位符缩略图">
                    </div>
                </div>
                <div class="newest-goods col-md-9">
                    <#list sellItems as sellItem>
                        <a href="/sell/page/publish/detail?itemId=${sellItem.sellId}">
                            <div class="goods-item col-md-3">
                                <div class="thumbnail" style="padding-left: 0; padding-right: 0">
                                    <div style="padding-left: 10;">
                                        <img src="${sellItem.image}"
                                             alt="通用的占位符缩略图" style="height: 140px">
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
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="divider-solid"></div>
    <!--最新需求-->
    <div class="recommend col-md-10 col-md-offset-1">
        <div class="recommend-title" style="border-left: 4px solid #dd3333;padding-left: 10px">
            <h3>
                最新需求&nbsp;&nbsp;
                <span style="font-size: 14px;">这里应该有你喜欢的。</span>
                <div class="more pull-right">
                    <a style="position: relative;bottom: 10px;right:10px" href="/page/need/more" class="button button-glow button-border button-rounded button-primary">MORE+</a>
                </div>
            </h3>
        </div>
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
</@defaultLayout.layout>