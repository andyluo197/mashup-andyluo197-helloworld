<%--
  Created by IntelliJ IDEA.
  User: goodjob
  Date: 13-1-23
  Time: 上午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图像</title>
</head>
<body>
<style type="text/css">
    <!--
    .alltipbox {
        width: 610px;
        height: 490px;
        left: 50%;
        top: 50%;
        margin-left: -305px !important;
        margin-top: -237px !important;
    }

    -->
</style>
<%
    StringBuilder flashVarsBuilder = new StringBuilder("locale=zh_CN");
    if(request.getParameter("postURL") != null && !request.getParameter("postURL").equals(""))
    {
        flashVarsBuilder.append("&url=" + request.getParameter("postURL"));
    }
    if(request.getParameter("photoURL") != null && !request.getParameter("photoURL").equals(""))
    {
        flashVarsBuilder.append("&photo=" + request.getParameter("photoURL"));
    }
    if(request.getParameter("photoWidth") != null && !request.getParameter("photoWidth").equals(""))
    {
        flashVarsBuilder.append("&photoWidth=" + request.getParameter("photoWidth"));
    }
    if(request.getParameter("photoHeight") != null && !request.getParameter("photoHeight").equals(""))
    {
        flashVarsBuilder.append("&photoHeight=" + request.getParameter("photoHeight"));
    }
    if(request.getParameter("photoStyle") != null && !request.getParameter("photoStyle").equals(""))
    {
        flashVarsBuilder.append("&photoStyle=" + request.getParameter("photoStyle"));
    }
    if(request.getParameter("photoFormat") != null && !request.getParameter("photoFormat").equals(""))
    {
        flashVarsBuilder.append("&photoFormat=" + request.getParameter("photoFormat"));
    }
    if(request.getParameter("photoQuality") != null && !request.getParameter("photoQuality").equals(""))
    {
        flashVarsBuilder.append("&photoQuality=" + request.getParameter("photoQuality"));
    }
    if(request.getParameter("callback") != null && !request.getParameter("callback").equals(""))
    {
        flashVarsBuilder.append("&callback=" + request.getParameter("callback"));
    }
    if(request.getParameter("photoPathOnServer") != null && !request.getParameter("photoPathOnServer").equals(""))
    {
        flashVarsBuilder.append("&photoPathOnServer=" + request.getParameter("photoPathOnServer"));
    }
    String flashVars = flashVarsBuilder.toString();
//    System.out.println(flashVars);
%>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
        id="PhotoUpload" width="580" height="430"
        codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
    <param name="movie" value="<%=request.getContextPath()%>/common/imgcrop/PhotoUpload.swf" />
    <param name="quality" value="high" />
    <param name="bgcolor" value="#c8c8c8" />
    <param name="allowScriptAccess" value="sameDomain" />
    <embed src="<%=request.getContextPath()%>/common/imgcrop/PhotoUpload.swf" quality="high" bgcolor="#c8c8c8"
           width="580" height="430" name="PhotoUpload" align="middle"
           play="true"
           loop="false"
           quality="high"
           FlashVars="<%=flashVars%>"
           allowScriptAccess="sameDomain"
           type="application/x-shockwave-flash"
           pluginspage="http://www.adobe.com/go/getflashplayer"> <!-- -->
    </embed>
</object>
</body>
</html>