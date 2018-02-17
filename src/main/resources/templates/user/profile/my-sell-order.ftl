<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="我售出的订单" showLeftNav=true base_css=["${springMacroRequestContext.contextPath}/css/profile.css"]>
<div class="table-responsive" style="font-size: 14px">
    <table id="dataTable" class="table table-striped table-bordered table-hover dataTables-example" >
        <thead>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
</@defaultLayout.layout>