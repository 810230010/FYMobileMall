<html>
<head>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${springMacroRequestContext.contextPath}/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="${springMacroRequestContext.contextPath}/css/animate/animate.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/bootstrap/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/buttons/buttons.css"/>
    <!-- <link rel="stylesheet" href="css/semantic/semantic.css"> -->
    <script src="${springMacroRequestContext.contextPath}/js/jquery.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap-dropdown-on-hover.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/layer/layer.js"></script>
    <!-- <script type="text/javascript" src="js/semantic/semantic.js"></script> -->
</head>
<style type="text/css">
    .blur {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.6);
    }
    .header{
        background-color: black;
        height: 60px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #logo{
        height: 40px;
        line-height: 40px;
    }
    ul#navigation {
        list-style: none;
        width: 500px;
        padding-left: 0px;
    }
    li.item{
        float: left;
        color: white;
        width: 100px;
        text-align: center;
        cursor: pointer;
        margin-left: 4px;
        border-radius: 10px;
    }
    li.item a{
        text-decoration: none;
        color: silver;
    }
    li.item a:hover{
        color: black;
        font-size: 16px;
        font-weight: bold;
    }
    li.item.active{
        /*border-bottom: 1px solid white;*/
        background-color: silver;
        color: black;
    }
    a #menu-tital:hover{
        background-color: black;
    }
    .nav .open > a,
    .nav .open > a:hover,
    .nav .open > a:focus {
        background-color: black;
        border-color: #337ab7;
    }
    .login, .register{
        background-color: black;
        color:silver;
        border: 1px solid silver;
        margin-left: 10px;
        margin-right: 10px;
        width: 100px;
    }
    .search-wrapper{
        display: inline;
        float: left;
        position: relative;
        top:10px;
        margin-right: 20px;
    }
    #cart{
        margin-left: 10px
    }
    .carousel-control.left {

        background-image:none;
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
    }
    .carousel-control.right {
        left: auto;
        right: 0;

        background-image:none;
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
    }
    input:focus {
        border: 2px solid #2e82ff;
    }
    .toothbg{width:100%;height:10px;background:silver;
        background-image:-webkit-gradient(linear,50% 0,0 100%,from(transparent), color-stop(.5,transparent),color-stop(.5,#e5e5e5),to(#e5e5e5)),
        -webkit-gradient(linear,50% 0,100% 100%,from(transparent), color-stop(.5,transparent),color-stop(.5,#e5e5e5),to(#e5e5e5));
        background-image:-moz-linear-gradient(50% 0 -45deg,transparent,transparent 50%,#e5e5e5 50%,#e5e5e5),
        -moz-linear-gradient(50% 0 -135deg,transparent,transparent 50%,#e5e5e5 50%,#e5e5e5);
        background-size:30px 15px;
        background-repeat:repeat-x;
        background-position:0 100%;
    }
    .divider-solid{
        height:2px;
        border-bottom: 1px solid #e6e6e6;
    }
    .login.btn-default:focus,.btn-default.focus {
        color: white;
        background-color: black;
        border: none;
    }
    .cart-window{
        right:-360px;
        width: 360px;
        height: 1000px;
        background-color: white;
        position: fixed;
        top: 0;
        bottom: 0;
        z-index: 10000;
    }
    .car-maskmagix_vf_car{
        width:100%;
        height:100%;
        position:fixed;
        z-index:1000;
        left:0;
        top:0;
        background: #444 !important;
        opacity: 0.9 !important;
        display: none;
    }
    .back-to-top{
        position: fixed;
        bottom: 30px;
        right: 30px;
    }
    div.item img{
        width: 100%;
    }

    .empty-cart{

    }
    ul li.item{
        transition: all 0.8s;
    }
</style>
<body>
<!--菜单-->
<div class="header">
    <div class="col-md-2">
        <img id="logo" src="img/icon.jpg" alt="">
    </div>
    <div class="col-md-4 pull-left" id="navigation-wrapper" style="height:40px;line-height: 40px">
        <ul id="navigation">
            <li class="item" activeFlag="true"><a href="#">首页</a></li>
            <li class="item" activeFlag="false"><a href="#">所有发布</a></li>
            <li class="item" activeFlag="false"><a href="#">发布闲置</a></li>
            <li class="item" activeFlag="false"><a href="#">发布需求</a></li>
        </ul>
    </div>
    <div id="operation" style="position: absolute; right:80px">
        <div class="search-wrapper row" style="position:relative;top:4px">
            <input type="text" class="form-control" placeholder="请搜索">
        </div>
        <div id="logined" style="float: left;display: none;">
            <ul id="menu2" class="nav navbar-nav">
                <li class="dropdown" style="background-color: black">
                    <a id="menu-title" style="color: silver;" href="#" data-toggle="dropdown">
                        欢迎您， <span id="nick">Bonjour!</span><b class="caret"></b></a>
                    <ul class="dropdown-menu animated" data-animation="fadeInDown">
                        <li><a href="#">我的信息</a></li>
                        <li><a href="#">我的订单</a></li>
                        <li><a href="#">消息提醒</a></li>
                        <li><a href="#">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="person-info" style="float: left;">
            <button id="login" type="button" class="btn btn-default login" data-toggle="modal" data-target="#myModal">登录</button>
        </div>
        <div id="collect" style="float: left;display: none;">
            <ul id="menu" class="nav navbar-nav">
                <li class="dropdown" style="background-color: black">
                    <a id="menu-title" style="color: silver;" href="#" data-toggle="dropdown">
                        我的闲置<b class="caret"></b></a>
                    <ul class="dropdown-menu animated" data-animation="fadeInDown">
                        <li><a href="#">已收藏宝贝</a></li>
                        <li><a href="#">点赞的宝贝</a></li>
                        <li><a href="#">已发布的闲置</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="cart" style="float: left;">
            <a href="#" style="height: 40px">
                <img id="cart-image" src="${springMacroRequestContext.contextPath}/img/cart.png" style="width: 40px; height: 40px" alt="">
            </a>
        </div>

    </div>
    <!--购物车窗口-->
    <div class="cart-window">
        <h3 style="color: black;padding-left: 10px; padding-right: 20px" class="text-left">我的购物车
            <a href="#" class="pull-right" style="font-size: 14px;color: black;position: relative;"><img src="${springMacroRequestContext.contextPath}/img/sweep.png" style="width: 30px; height:30px;" alt="">一键清除</a>
        </h3>
        <div class="divider-solid"></div>
        <!-- 购物车商品列表 -->
        <div class="cart-content" style="height: 440px">
            <div class="empty-content" style="padding-top: 100px">
                <img src="${springMacroRequestContext.contextPath}/img/empty.png" alt="">
            </div>
        </div>
        <div class="divider-solid"></div>
        <!-- 购物车结算 -->
        <div class="check-out" style="height:200px">
            <div class="checkout-btn col-md-12">
                <button class="btn btn-primary btn-block disabled">结账</button>
            </div>
        </div>
    </div>
    <!--登录模态框-->
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">登录页面</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>
                                <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <a href="#" id="register_href">没有账号?立即注册!</a>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="submit" type="button" class="btn btn-primary">登录</button>
                </div>
            </div>
        </div>
    </div>

    <!--注册模态框-->
    <!-- Modal -->
    <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">注册页面</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-phone"></span></span>
                                <input type="text" class="form-control" id="reg-tel" name="password" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>
                                <input type="text" class="form-control" id="reg-nickname" name="password" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input type="password" class="form-control" id="reg-password" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                                <input type="password" class="form-control" id="conf-password" name="password" placeholder="请确认密码">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="reg-btn" type="button" class="btn btn-primary">注册</button>
                </div>
            </div>
        </div>
    </div>
</div>
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
                    <a style="position: relative;bottom: 10px;right:10px" href="#" class="button button-glow button-border button-rounded button-primary">MORE+</a>
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
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="divider-solid"></div>
    <!--为你推荐-->
    <div class="recommend col-md-10 col-md-offset-1">
        <div class="recommend-title" style="border-left: 4px solid #dd3333;padding-left: 10px">
            <h3>
                猜你喜欢&nbsp;&nbsp;
                <span style="font-size: 14px;">这里应该有你喜欢的。</span>
                <div class="more pull-right">
                    <a style="position: relative;bottom: 10px;right:10px" href="#" class="button button-glow button-border button-rounded button-primary">MORE+</a>
                </div>
            </h3>
        </div>

        <div class="recommend-list">
            <div class="row">
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img src="${springMacroRequestContext.contextPath}/img/MI.jpg" style="height: 300px;" alt="通用的占位符缩略图">
                    </div>
                </div>
                <div class="newest-goods col-md-9">
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>

                    <div class="goods-item col-md-3">
                        <div class="thumbnail">
                            <img src="${springMacroRequestContext.contextPath}/img/goods.jpg"
                                 alt="通用的占位符缩略图" style="width: 75%;height: 140px">
                            <div class="caption text-center" style="position:relative">
                                <span>iPhone 6 苹果6 64G 8.3</span>
                                <span style="position: absolute; right:20px;bottom:0;color: red">$22</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="divider-solid"></div>
<div class="padding" style="height: 200px"></div>
<div class="footer" style="background-color: #F7F7F7;height:200px">
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
        <p>
            本店商品均为易碎品，非质量问题谢绝退货，如有质量问题，本店承担运费调换
        </p>
    </div>
</div>
<div class="back-to-top">
    <a href="#" class="btn btn-default">回到顶部</a>
</div>
<div class="car-maskmagix_vf_car"></div>
</body>
<script>
    $(function(){
        //给导航栏添加active样式
        $("li.item").mouseover(function(event) {
            if(!$(this).hasClass('active')){
                $(this).addClass('active');
            }
        }).mouseleave(function(event) {
            $("li.item").each(function(index, el) {
                $(this).removeClass('active');

            });
        });
        //下拉菜单动画
        $("#menu").bootstrapDropdownOnHover({ mouseOutDelay: 50 });
        $("#menu2").bootstrapDropdownOnHover({ mouseOutDelay: 50 });
        //查询是否登录
        user.getLoginInfo();
    })
    $("#register_href").click(function(event) {
        $("#myModal").modal('hide');
        $("#register").modal();
    });
    //购物车
    $(document).click(function(e){
        e = window.event || e;
        var obj = e.srcElement || e.target;
        if($(obj).is("#cart-image, .cart-window *")) {
            $(".cart-window").animate({right: "0"}, 500);
            $(".car-maskmagix_vf_car").show();
            // $("body").addClass('blur')
        }else{
            $(".cart-window").animate({right: '-360px'}, 500);
            $(".car-maskmagix_vf_car").hide();
            // $("body").removeClass('blur');
        }
    });
    var user = new User();
    $(".back-to-top a").on('click', function(){
        $("html body").animate({scrollTop: 0}, 800);
    })
    $(window).on('scroll', function(){
        if($(window).scrollTop() > 300){
            $(".back-to-top").fadeIn();
        }else{
            $(".back-to-top").fadeOut();
        }
    })
    $(window).trigger('scroll');

    $("#submit").on('click', function () {
        user.login();
    });
    $("#reg-btn").click(function () {
        user.register();
    })
    function Mycart(){
        this.show = function(){
            $(".cart-window").show();
        }
    }
    function User() {
        //登录
        this.login = function () {
            var tel = $("#tel").val();
            var password = $("#password").val();
            //发送登录请求
            $.ajax({
                url: "${springMacroRequestContext.contextPath}/user/login/check",
                data: {
                    tel: tel,
                    password: password
                },
                success: function (result) {
                    if(result.code == 0){
                        alert("登录成功");
                        $("#logined").css('display', 'block');
                        $("#person-info").css('display', 'none');
                        $("#nick").html(result.data.nickname);
                        $('#myModal').modal('hide');
                    }else{
                        alert(result.msg)
                    }
                },
                error: function(result){
                    alert("登录服务出错!");
                }
            })

        }
        //注册
        this.register = function () {
            var tel = $("#reg-tel").val();
            var nickname = $("#reg-nickname").val();
            var password = $("#reg-password").val();
            var confirmPass = $("#conf-password").val();
            if(confirmPass != password){
                alert("请保持两次密码一致!");
                return;
            }
            $.ajax({
                url: "${springMacroRequestContext.contextPath}/user/add",
                type: "POST",
                data: {
                    tel: tel,
                    nickname: nickname,
                    password: password
                },
                success: function (result) {
                    if(result.code == 700){
                        alert("该手机号已注册!");
                    }else if(result.code == 701){
                        alert("该昵称已存在！")
                    }else{
                        alert("恭喜，注册成功,现在可以登陆!");
                        setTimeout(function () {
                            window.location.reload()
                        }, 2000);
                    }
                },
                error: function (result) {
                    alert("注册服务出错!");
                }
            })
        }

        this.getLoginInfo = function(){
            $.ajax({
                url: "${springMacroRequestContext.contextPath}/user/loginInfo",
                type: "GET",
                success: function (result) {
                    alert(JSON.stringify(result))
                    if(result['data'] == null){
                        $("#logined").css('display', 'none');
                        $("#person-info").css('display', 'block');
                    }else{
                        $("#logined").css('display', 'block');
                        $("#person-info").css('display', 'none');
                        $("#nick").html(result.data.nickname);
                    }
                },
                error: function (result) {
                    alert("获取登录信息出错!")
                }
            })
        }
    }
</script>
</html>