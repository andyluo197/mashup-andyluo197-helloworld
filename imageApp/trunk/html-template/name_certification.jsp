 <input class="v" onclick='uploadSignature(); return false;'  type="button" value="点此上传"/>

<script type="text/javascript">

    function uploadCard(){

        //================================ 定制控件只需拷贝函数后修改data中的值 ===========================================//
        var data = {postURL:'<%= basePath%>imageCropServlet',photoURL:document.getElementById("zc1").src,
            photoWidth:500, photoHeight:300, photoStyle:'ZhiJiaoJuXing', photoFormat:'JPG',
            photoQuality:100, callback:'uploadCardCallback',photoPathOnServer:'UPLOAD_MEMBER_IMG_FILE_PATH'};
        //=======================================================================================================//

        openUploadImageDialog(data);

    }

    var getComponentID2=function()
    {
        // 此方法应该在每个使用控件的地方添加，便于以后追踪控件使用
        return "000004";
    }

    var uploadCardCallback=function(msg){

        //================================ 定制控件只需拷贝函数后修改以下两个变量值 ===========================================//
        var imageFileNameInputID = "#cardImg";  //上传到服务器的图片文件名，提交表单时会用到
        var imageID = "zc1"; //图像控件的ID
        //=======================================================================================================//

        updateFields(msg, imageFileNameInputID, imageID);
    }

    function uploadCardReverse(){

        //================================ 定制控件只需拷贝函数后修改data中的值 ===========================================//
        var data = {postURL:'<%= basePath%>imageCropServlet',photoURL:document.getElementById("zc2").src,
            photoWidth:500, photoHeight:300, photoStyle:'ZhiJiaoJuXing', photoFormat:'JPG',
            photoQuality:100, callback:'uploadCardReverseCallback',photoPathOnServer:'UPLOAD_MEMBER_IMG_FILE_PATH'};
        //=======================================================================================================//

        openUploadImageDialog(data);

    }

    var getComponentID2=function()
    {
        // 此方法应该在每个使用控件的地方添加，便于以后追踪控件使用
        return "000003";
    }

    var uploadCardReverseCallback=function(msg){

        //================================ 定制控件只需拷贝函数后修改以下两个变量值 ===========================================//
        var imageFileNameInputID = "#cardImgReverse";  //上传到服务器的图片文件名，提交表单时会用到
        var imageID = "zc2"; //图像控件的ID
        //=======================================================================================================//

        updateFields(msg, imageFileNameInputID, imageID);
    }

    function uploadSignature(){

        //================================ 定制控件只需拷贝函数后修改data中的值 ===========================================//
        var data = {postURL:'<%= basePath%>imageCropServlet',photoURL:document.getElementById("zc3").src,
            photoWidth:300, photoHeight:300, photoStyle:'ZhiJiaoJuXing', photoFormat:'JPG',
            photoQuality:100, callback:'uploadSignatureCallback',photoPathOnServer:'UPLOAD_MEMBER_IMG_FILE_PATH'};
        //=======================================================================================================//

        openUploadImageDialog(data);
    }

    var getComponentID=function()
    {
        // 此方法应该在每个使用控件的地方添加，便于以后追踪控件使用
        return "000002";
    }

    var uploadSignatureCallback=function(msg){

        //================================ 定制控件只需拷贝函数后修改以下两个变量值 ===========================================//
        var imageFileNameInputID = "#orgImgCert";  //上传到服务器的图片文件名，提交表单时会用到
        var imageID = "zc3"; //图像控件的ID
        //=======================================================================================================//

        updateFields(msg, imageFileNameInputID, imageID);
    }

    updateFields = function(msg, imageFileNameInputID, imageID) {
        if (msg != null && msg != 'error') {
            var fileName = msg;
            $(imageFileNameInputID).val(fileName);
            document.getElementById(imageID).src = "<%=Keys.UPLOAD_MEMBER_IMG_FILE_HTTP_PATH%>" + fileName;
            $.unblockUI();

            // Is this a version of Chrome?
            if(isChrome()){
                // If it is chrome then jQuery thinks it's safari so we have to tell it it isn't
                $.browser.safari = false;
            }
            if($.browser.safari)    //safari弹出提示框会假死，所以直接return
            {
                return;
            }
            alert("上传成功");
        } else {
            alert("服务器错误，请稍候重试。");
        }
    }

    isChrome = function() {
        return /Chrome/.test(navigator.userAgent);
    }

    openUploadImageDialog = function(data) {
        //点击链接弹出窗口
        $.ajax({
            url: '<%=request.getContextPath()%>/common/imgcrop/PhotoUpload.jsp',
            data:data,
            type: 'POST',
            dataType: 'html',
            timeout: 1000,
            cache: false,
            async: false,
            error: function() {
                //alert('Error loading XML document');
            },
            success: function(obj) {
                //                    alert(obj);
                var maxWidth = document.body.clientWidth;
                var maxHeight = document.body.clientHeight;
                var left = maxWidth / 2 - 290
                var top = maxHeight / 2 - 207
                $.blockUI({ message:  obj ,forceIframe :true,  css: {
                    padding:    0,
                    margin:        0,
                    width:        '40%',
                    top:        '200px',
                    left:        left ,
                    textAlign:    'center',
                    color:        '#000'
                    //cursor:		'wait'
                }});
            }
        });
    }
    </script>
</body>
</html>
