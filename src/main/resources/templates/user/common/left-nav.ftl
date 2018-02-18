<!--左导航栏-->
<div style="margin-top: 20px">
    <div class="span6">
        <ul class="breadcrumb">
            <li>
                <a href="/index/indexPage">首页</a> <span class="divider"></span>
            </li>
            <li id="breadcrumb" style="font-size: 24px">
                我的基本信息
            </li>
        </ul>
    </div>
    <div class="col-md-3 menu" style="height: 700px;background-color:#f8f8f8;padding-left: 0;padding-right: 0">
        <div style="height:150px;" class="text-center">
            <h4>${analysis["nickname"]}</h4>
            <p>发布闲置：<span style="color:red;font-size: 20px">${analysis["sellCount"]}</span>   发布需求：<span style="color:red;font-size: 20px">${analysis["needCount"]}</span></p>
            <p>卖出：<span style="color:red;font-size: 20px">${analysis["sellSuccessCount"]}</span>   买入：<span style="color:red;font-size: 20px">${analysis["buyCount"]}</span></p>
            <#if currentUser?exists>
                <button class="btn btn-primary" onclick="editBasicInfoPage()">编辑资料</button>
            </#if>
        </div>
        <div class="divider-solid"></div>
        <div style="height:44px;padding-left: 30px">
            <h4>我的闲置</h4>
        </div>
        <div style="height:44px;vertical-align: middle">
            <ul style="list-style: none;padding-left:0">
                <li class="a" style="height:44px;cursor: pointer;text-align: center" onclick="window.location.href='/profile/page/allSellItems'">所有闲置</li>
            </ul>
        </div>
        <div style="height:44px;padding-left: 30px">
            <h4>订单管理</h4>
        </div>
        <div style="height:88px;vertical-align: middle">
            <ul style="list-style: none;padding-left:0">
                <li class="a" onclick="window.location.href='/profile/page/myBuyOrder'" style="height:44px;cursor: pointer;text-align: center">我购买的</li>
                <li class="a" style="height:44px;cursor: pointer;text-align: center" onclick="window.location.href='/profile/page/mySellOrder'">我售出的</li>
            </ul>
        </div>
        <div style="height:44px;padding-left: 30px">
            <h4>我的需求</h4>
        </div>
        <div style="height:44px;">
            <ul style="list-style: none;padding-left: 0">
                <li class="a" onclick="window.location.href='/profile/page/allNeedPublish'" style="height:44px;cursor: pointer;text-align: center">所有需求</li>
            </ul>
        </div>
    </div>
</div>
<script>
    $("div.menu ul li.a").click(function () {
        $("#breadcrumb").text($(this).text());
        $("div.menu ul li.a").each(function () {
            if($(this).hasClass('active')){
                $(this).removeClass('active');
            }
        })
        $(this).addClass('active');
    })

    function editBasicInfoPage(){
        window.location.href = "/profile/page/editBasicInfo";
    }
</script>