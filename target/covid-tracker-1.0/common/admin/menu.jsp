<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Main Menu area start-->
<div class="main-menu-area mg-tb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="tab-content custom-menu-content">
                    <div id="Home" class="tab-pane active in notika-tab-menu-bg animated flipInX">

                        <%-- START MANAGER --%>
                        <ul class="notika-main-menu-dropdown" style="font-size: 28px;text-align: center;">
                            <li style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;" id="li1" onmouseenter="changeColor1A()" onmouseleave="changeColor1B()"><a id="a1" href="<c:url value='/admin/charity/list'/>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-archive-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM6 7a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1H6zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z"/>
                            </svg>&nbsp;&nbsp;Charity Management</a>
                            </li>
                            <li style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;" id="li2" onmouseenter="changeColor2A()" onmouseleave="changeColor2B()"><a id="a2" href="<c:url value='/admin/patient/list'/>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-dizzy" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M9.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm-5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708z"/>
                                <path d="M10 11a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                            </svg>&nbsp;&nbsp;Patient Management</a>
                            </li>
                            <li style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;" id="li3" onmouseenter="changeColor3A()" onmouseleave="changeColor3B()"><a id="a3" href="<c:url value='/admin/area/list'/>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-mailbox2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M12 3H4a4 4 0 0 0-4 4v6a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V7a4 4 0 0 0-4-4zM8 7a3.99 3.99 0 0 0-1.354-3H12a3 3 0 0 1 3 3v6H8V7zm1 1.5h2.793l.853.854A.5.5 0 0 0 13 9.5h1a.5.5 0 0 0 .5-.5V8a.5.5 0 0 0-.5-.5H9v1zM4.585 7.157C4.836 7.264 5 7.334 5 7a1 1 0 0 0-2 0c0 .334.164.264.415.157C3.58 7.087 3.782 7 4 7c.218 0 .42.086.585.157z"/>
                            </svg>&nbsp;&nbsp;Area Management</a>
                            </li>
                            <li style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;" id="li4" onmouseenter="changeColor4A()" onmouseleave="changeColor4B()"><a id="a4" href="<c:url value='/admin/user/list'/>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                            </svg>&nbsp;&nbsp;User Management</a>
                            </li>
                            <li style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;" id="li5" onmouseenter="changeColor5A()" onmouseleave="changeColor5B()"><a id="a5" href="<c:url value='/admin/poor/list'/>"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hdd-stack" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M14 10H2a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-1a1 1 0 0 0-1-1zM2 9a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2z"/>
                                <path d="M5 11.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                <path fill-rule="evenodd" d="M14 3H2a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"/>
                                <path d="M5 4.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                            </svg>&nbsp;Poor Management</a>
                            </li>
                        </ul>

                            <%-- END MANAGER --%>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Menu area End-->

<script>
    var s = document.title;
    function changeColor1A(){
        if (s !== "Charity List") {
            document.getElementById("li1").style = "padding:2px;background-image: linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;"
        }
    }
    function changeColor1B(){
        if (s !== "Charity List") {
            document.getElementById("li1").style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor2A(){
        if (s !== "Patient Management") {
            document.getElementById("li2").style="padding:2px;background-image: linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor2B(){
        if (s !== "Patient Management") {
            document.getElementById("li2").style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor3A(){
        var s = document.title;
        if (s !== "Area List") {
            document.getElementById("li3").style="padding:2px;background-image: linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor3B(){
        var s = document.title;
        if (s !== "Area List") {
            document.getElementById("li3").style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor4A(){
        var s = document.title;
        if (s !== "User List") {
            document.getElementById("li4").style="padding:2px;background-image: linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor4B(){
        var s = document.title;
        if (s !== "User List") {
            document.getElementById("li4").style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor5A(){
        var s = document.title;
        if (s !== "Role List") {
            document.getElementById("li5").style="padding:2px;background-image: linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }
    function changeColor5B(){
        var s = document.title;
        if (s !== "Role List") {
            document.getElementById("li5").style="padding: 2px;background-color: white;background-image: linear-gradient(rgb(233, 233, 233) 0%, rgb(233, 233, 233) 100%), linear-gradient(rgb(240, 40, 40) 0%, rgb(240, 181, 40) 100%);background-clip: content-box, padding-box;";
        }
    }

</script>

