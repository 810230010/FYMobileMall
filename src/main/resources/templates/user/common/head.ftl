<!--菜单-->
<div class="header">
    <div class="col-md-2">
        <img style="cursor: pointer" onclick="window.location.href='/page/index'" id="logo" src="${springMacroRequestContext.contextPath}/img/icon.jpg" alt="">
    </div>
    <div class="col-md-4 pull-left" id="navigation-wrapper" style="height:40px;line-height: 40px">
        <ul id="navigation">
            <li class="item"><a href="#">所有闲置</a></li>
            <li class="item"><a href="#">所有需求</a></li>
            <li class="item"><a data-toggle="modal" data-target="#mySellModal">发布闲置</a></li>
            <li class="item"><a href="#" data-toggle="modal" data-target="#myNeedModal">发布需求</a></li>
        </ul>
    </div>
    <div id="operation" style="position: absolute; right:80px;">
        <div class="search-wrapper row" style="position:relative;top:4px">
            <button id="searchBtn" class="btn btn-primary" style="position: absolute; right:0px;bottom: 0">搜索</button>
            <input id="search" type="text" class="form-control" placeholder="请搜索">
        </div>
    <#if currentUser?exists>
        <div id="logined" style="float: left">
            <ul id="menu2" class="nav navbar-nav">
                <li class="dropdown" style="background-color: black">
                    <a id="menu-title" style="color: silver;" href="#" data-toggle="dropdown">
                        欢迎您， <span id="nick">${currentUser.nickname}!</span><b class="caret"></b></a>
                    <ul class="dropdown-menu animated" data-animation="fadeInDown">
                        <li><a href="/profile/page/myBasicProfileInfo">我的信息</a></li>
                        <li><a href="/profile//page/myBuyOrder">我的订单</a></li>
                        <li><a href="/profile/page/myBasicProfileInfo">消息提醒</a></li>
                        <li><a href="/profile/page/allNeedPublish">我的需求</a></li>
                        <li><a href="${springMacroRequestContext.contextPath}/user/logout">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    <#else>
        <div id="person-info" style="float: left;margin-top: 4px">
            <button id="login" type="button" class="btn btn-default login" data-toggle="modal" data-target="#myModal">登录</button>
        </div>
    </#if>

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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
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
    <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
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

    <!--发布闲置-->
    <!-- Modal -->
    <div class="modal fade" id="mySellModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">发布闲置页面</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" onsubmit="return false">
                        <div class="form-group">
                            <label for="sell-title" class="col-md-2 control-label text-center">标题</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="sell-title" placeholder="请输入标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label text-center"></label>
                            <div class="col-md-10">
                                <div id="uploader-demo" class="col-md-2" style="padding-left: 0">
                                    <div id="filePicker" style="height: 40px;">选择图片</div>
                                </div>
                                <div class="col-md-2">
                                    <button id="clear" class="btn btn-primary" style="width:100%;height:40px">清空</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label text-center"></label>
                            <div class="col-md-10">
                                <!--用来存放item-->
                                <div id="fileList" class="uploader-list"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sell-description" class="control-label col-md-2">描述</label>
                            <div class="col-md-10">
                                <textarea class="form-control" id="sell-description" style="height:200px"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="brand_name" class="control-label col-md-2">品牌</label>
                            <div class="col-md-10">
                                <input id="brand_name" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sell-price" class="control-label col-md-2">出价</label>
                            <div class="col-md-10">
                                <input id="sell-price" type="text" class="form-control"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-block" id="publish_sell">发布闲置</button>
                </div>
            </div>
        </div>
    </div>

    <!--发布需求-->
    <!-- Modal -->
    <div class="modal fade" id="myNeedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">发布需求页面</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="title" class="col-md-2 control-label text-center">标题</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="title" placeholder="请输入标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-md-2 control-label text-center">描述</label>
                            <div class="col-md-10">
                                <textarea id="editor" style="height:300px"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="publishNeed" class="btn btn-primary btn-block">发布需求</button>
                </div>
            </div>
        </div>
    </div>
</div>