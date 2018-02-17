<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="我购买的订单" showLeftNav=true base_css=["${springMacroRequestContext.contextPath}/css/profile.css"]>

</@defaultLayout.layout>