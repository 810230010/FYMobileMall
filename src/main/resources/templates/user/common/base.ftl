<#macro layout base_title >
<html>
<title>${base_title}</title>
<head>
    <link href="${springMacroRequestContext.contextPath}/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="${springMacroRequestContext.contextPath}/css/animate/animate.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/bootstrap/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/buttons/buttons.css"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/wang-editor/wangEditor.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/webuploader/webuploader.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/page/page.css">
    <!-- <link rel="stylesheet" href="css/semantic/semantic.css"> -->
    <script src="${springMacroRequestContext.contextPath}/js/jquery.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap-dropdown-on-hover.js"></script>
<#--layer-->
    <script src="${springMacroRequestContext.contextPath}/js/layer/layer.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/page/page.js"></script>
<#--wang-editor-->
    <script src="${springMacroRequestContext.contextPath}/js/wang-editor/wangEditor.min.js"></script>
<#--七牛-->
    <script src="${springMacroRequestContext.contextPath}/js/qiniu/qiniu.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/plupload/plupload.full.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/plupload/zh_CN.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/webuploader/webuploader.js"></script>
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

    ul li.item{
        transition: all 0.8s;
    }
    .need-item:hover{
        transform: scale(1.1, 1.1);
        transition: all 0.5s;
        background-color: silver;
        z-index:1000;
    }
</style>
<body>
    <#include "${springMacroRequestContext.contextPath}/user/common/head.ftl">

	 <#-- 在这里嵌入main content -->
	 <#nested>
</body>
<script>
    var editor;
    var ratio = window.devicePixelRatio || 1;
    var thumbnailWidth = 100 * ratio;
    var thumbnailHeight = 100 * ratio;
    var uploader = "";
    var img_arr = [];
    $list = $('#fileList');
    $(function(){
        editor = new wangEditor('editor');
        editor.config.customUpload = true;  // 设置自定义上传的开关
        editor.config.customUploadInit = uploadInit;  // 配置自定义上传初始化事件，uploadInit方法在上面定义了
        editor.create();
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
    })
    $("#mySellModal").on('shown.bs.modal', function () {
        if (uploader !="") {
            uploader.destroy();    //用于防止每次调用 选择文件框变大 每次调用initUploader（）函数前，一定要将uploader销毁，要不然调用一次，上传文件框就会变大一次
        };
        uploader = WebUploader.create({
            auto: true,
            swf: '${springMacroRequestContext.contextPath}/css/webuploader/Uploader.swf',
            server: "http://up.qiniu.com/",
            fileNumLimit:3,
            fileSingleSizeLimit : 1024*1024,
            thumbnailWidth : 48,
            thumbnailHeight : 48,
            duplicate :true,
            pick: '#filePicker',
            fileVal:'file',
            resize: true,
            accept: {
                title: 'Images',
                extensions: 'jpg,jpeg,bmp,png,ico',
                mimeTypes: 'image/*'
            },
            formData: {
                token:'${tokenInfo.UPLOAD_TOKEN}'//thinkphp传递过来token的值
            }
        });
        // 当有文件添加进来的时候
        uploader.on( 'fileQueued', function( file ) {
            console.log(file.name)
            var $li = $(
                    '<div id="' + file.id + '" class="file-item thumbnail col-md-2">' +
                    '<img>' +
                    '</div>'
                    ),
                    $img = $li.find('img');


            // $list为容器jQuery实例
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr( 'src',  src);

            }, thumbnailWidth, thumbnailHeight );

            $("#clear").click(function () {
                closeUploader();
            })

        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress span');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<p class="progress"><span></span></p>')
                        .appendTo( $li )
                        .find('span');
            }

            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).addClass('upload-state-done');
            img_arr.push('${tokenInfo.BASE_URL}' + file.name);
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            var $li = $( '#'+file.id ),
                    $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').remove();
        });
    });

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
    });
    $("#searchBtn").click(function () {
        window.location.href = "${springMacroRequestContext.contextPath}/page/search?searchWord="+$("#search").val();
    })
    //发布闲置
    $("#publish_sell").click(function () {
        var sell_title = $("#sell-title").val();
        var images = img_arr.join(",");
        var sell_description = $("#sell-description").val();
        var sell_price = $("#sell-price").val();
        var brand_name = $("#brand_name").val();
        $.ajax({
            url: "${springMacroRequestContext.contextPath}/sell/item/publish",
            type: "POST",
            data: {
                sellTitle: sell_title,
                image: images,
                sellDescription: sell_description,
                sellPrice: sell_price,
                brandName: brand_name
            },
            success: function (result) {
                if(result.code == 0){
                    alert("闲置发布成功，请耐心等待管理员审核!");
                    setTimeout(function () {
                        window.location.reload();
                    },1000)
                }
            },
            error: function (result) {
                alert("发布闲置服务出错!");
            }
        });
    })
    //发布需求
    $("#publishNeed").click(function () {
        var title = $("#title").val();
        var description = editor.$txt.html();
        $.ajax({
            url: "/buy/needs",
            type: "POST",
            data: {
                title: title,
                description: description
            },
            success: function (result) {
                if(result.code == 0){
                    alert("发布需求成功!");
                    $("#myNeedModal").modal('hide');
                }
            },
            error: function (result) {
                alert("发布需求服务出错");
            }
        })
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
                        $('#myModal').modal('hide');
                        window.location.reload();
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
    }
    //七牛上传
    // 初始化七牛上传
    function uploadInit() {
        // this 即 editor 对象
        var editor = this;
        // 触发选择文件的按钮的id
        var btnId = editor.customUploadBtnId;
        // 触发选择文件的按钮的父容器的id
        var containerId = editor.customUploadContainerId;

        // 创建上传对象
        var uploader = Qiniu.uploader({
            runtimes: 'html5,flash,html4',    //上传模式,依次退化
            browse_button: btnId,       //上传选择的点选按钮，**必需**
            uptoken : '${tokenInfo.UPLOAD_TOKEN}',
            domain: '${tokenInfo.BASE_URL}',
            container: containerId,           //上传区域DOM ID，默认是browser_button的父元素，
            max_file_size: '100mb',           //最大文件体积限制
            flash_swf_url: '../js/plupload/Moxie.swf',  //引入flash,相对路径
            filters: {
                mime_types: [
                    //只允许上传图片文件 （注意，extensions中，逗号后面不要加空格）
                    { title: "图片文件", extensions: "jpg,jpeg,gif,png,bmp" }
                ]
            },
            max_retries: 3,                   //上传失败最大重试次数
            dragdrop: true,                   //开启可拖曳上传
            drop_element: 'editor-container',        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                //分块上传时，每片的体积
            auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
            init: {
                'FilesAdded': function(up, files) {
                    plupload.each(files, function(file) {
                        // 文件添加进队列后,处理相关的事情
                        printLog('on FilesAdded');
                    });
                },
                'BeforeUpload': function(up, file) {
                    // 每个文件上传前,处理相关的事情
                    printLog('on BeforeUpload');
                },
                'UploadProgress': function(up, file) {
                    // 显示进度条
                    editor.showUploadProgress(file.percent);
                },
                'FileUploaded': function(up, file, info) {
                    printLog(info)
                    var domain = up.getOption('domain');
                    var res = $.parseJSON(info);
                    printLog(res.key);
                    var sourceLink = domain + res.key; //获取上传成功后的文件的Url
                    printLog(sourceLink);

                    editor.command(null, 'insertHtml', '<img src="' + sourceLink + '" style="max-width:100%;"/>')
                },
                'Error': function(up, err, errTip) {
                    printLog('on Error');
                },
                'UploadComplete': function() {
                    printLog('on UploadComplete');
                    // 隐藏进度条
                    editor.hideUploadProgress();
                }
            }
        });
    }
    // 封装 console.log 函数
    function printLog(title, info) {
        window.console && console.log(title, info);
    }
    function closeUploader() {
        // 移除所有缩略图并将上传文件移出上传序列
        for (var i = 0; i < uploader.getFiles().length; i++) {
            // 将图片从上传序列移除
            uploader.removeFile(uploader.getFiles()[i]);
            //uploader.removeFile(uploader.getFiles()[i], true);
            //delete uploader.getFiles()[i];
            // 将图片从缩略图容器移除
            var $li = $('#' + uploader.getFiles()[i].id);
            $li.off().remove();
        }

        $("#mySellModal").modal('show');
    }
</script>
</html>
</#macro>