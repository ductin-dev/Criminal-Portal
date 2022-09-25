<%--
  Created by IntelliJ IDEA.
  User: MrEnd
  Date: 10/9/2020
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Upload-test</title>
</head>

<body>
    <h1>${message}</h1>
    <form action="upload-test" method="post" enctype="multipart/form-data">
        <input type="file" id="image" name="image">
        <img id="image-preview" src="">
        <input type="hidden" name="imgBase64" id="imgBase64">
        <input type="submit" value="Upload">
    </form>

<script>
    var input = document.getElementById("image");
    input.onchange = function() {
        var file = input.files[0],
            reader = new FileReader();

        reader.onloadend = function() {
            var b64 = reader.result.replace(/^data:.+;base64,/, '');
            console.log(b64);
            document.getElementById("imgBase64").value = b64;
            document.getElementById("image-preview").src = "data:image/png;base64,"+b64;
        };

        reader.readAsDataURL(file);
    };
</script>

</body>

</html>
