<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" media="all"
          href="../../css/gtvg.css" th:href="@{/css/gtvg.css}"/>
    <title>Title</title>
</head>
<body>
    <h1>Upload file</h1>
    <h3 style="color: red">${message}</h3>
    <img src="data:image/png;base64, ${base64Image}"/>
    <form action="/upload" method="post" enctype="multipart/form-data">
        Image:
        <input type="file" name="image" />
        <input type="submit" value="Upload"/>
    </form>
</body>
</html>