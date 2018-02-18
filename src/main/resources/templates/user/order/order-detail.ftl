<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="订单详情" showLeftNav=false base_css=["${springMacroRequestContext.contextPath}/css/order.css"]>
<div class="container" style="padding-top: 30px">
<#--确认订单信息-->
    <div style="height: 60px;;margin-top: 100px">
        <h4>订单信息(<span style="color:red">${orderDetail.state}</span>)</h4>
        <div class="divider-solid"></div>
    </div>
<#--订单信息表-->
    <div class="order-table">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>标题</th>
                <th>图片</th>
                <th>卖家</th>
                <th>价格</th>
                <th>付款方式</th>
                <th>订单创建时间</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="col-md-2"><a href="/sell/page/publish/detail?itemId=${orderDetail.sellItemId}">${orderDetail.sellTitle}</a></td>
                <td class="col-md-2"><img src="${orderDetail.image}" style="width: 40px;height: 40px" alt=""/></td>
                <td class="col-md-2"><span style="color:red">¥${orderDetail.sellUserName}</span></td>
                <td class="col-md-2">${orderDetail.payPrice}</td>
                <td class="col-md-2">${orderDetail.payType}</td>
                <td class="col-md-2">${orderDetail.createTime}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="order-summary">
        <div class="col-md-3 pull-right" style="border:1px solid #f40;height:180px">
            <p>实付款: <span style="color:#f40;font-size:24px" id="goodsPrice">${orderDetail.payPrice}</span></p>
            <p>寄送至：<b id="goodsAddress">${orderDetail.addressName}</b></p>
            <p>收货人： <b  id="goodsTaker">${orderDetail.goodsTaker}</b></p>
            <p>联系电话： <b>${orderDetail.tel}</b></p>
            <p>付款方式：<b id="payType">${orderDetail.payType}</b></p>
        </div>
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

</script>
</@defaultLayout.layout>