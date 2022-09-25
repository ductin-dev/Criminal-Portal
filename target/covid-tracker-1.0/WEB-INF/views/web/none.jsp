<div class="col-lg-12 col-md-12">
    <div class="form-element-list">
        <div class="basic-tb-hd">
            <h2 style="color:darkorange;font-size: 32px;font-weight: 700;text-align: center;">Please input
                information</h2>
            <h3 style="color:green;font-size: 25px;font-weight: 700;text-align: center;">${s_sucess}</h3>
        </div>
        <div class="row" style="    background: white; margin: 15px;border-radius: 10px;">
            <div class="col-9 panel-body-map"
                 style="position: absolute;background-color: white;left:3%;border-radius: 10px;width: 960px">
                <div class="embed-responsive" style="position:absolute;left:64%;">
                    <iframe src="https://public.domo.com/cards/wppvw" width="600" height="600" marginheight="0"
                            marginwidth="0" frameborder="0"></iframe>

                </div>

            </div>
            <br><br>
            <div style="left: 10%;position: absolute;width: 521px;">
                <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                    <div class="nk-int-st">
                        <h3 style="font-size: 22px;font-weight: 600;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-laughing"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd"
                                      d="M12.331 9.5a1 1 0 0 1 0 1A4.998 4.998 0 0 1 8 13a4.998 4.998 0 0 1-4.33-2.5A1 1 0 0 1 4.535 9h6.93a1 1 0 0 1 .866.5z"/>
                                <path d="M7 6.5c0 .828-.448 0-1 0s-1 .828-1 0S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 0-1 0s-1 .828-1 0S9.448 5 10 5s1 .672 1 1.5z"/>
                            </svg>&nbsp;FULL NAME &nbsp;&nbsp;&nbsp;<input id="check_fullname" name="name" placeholder="Full Name"
                                                                           class="form-control" />
                        </h3>

                    </div>
                </div>
            </div>
            <br><br><br><br><br>
            <div style="left: 10%;position: absolute;width: 521px;">
                <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                    <div class="nk-int-st">
                        <h3 style="font-size: 22px;font-weight: 600;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z"/>
                            </svg>&nbsp;PHONE NUMBER&nbsp;&nbsp;&nbsp;<input id="check_phone" name="phone"
                                                                             placeholder="Phone Number"
                                                                             class="form-control"/>
                        </h3>

                    </div>
                </div>
            </div>
            <br><br><br><br><br>

            <div style="left: 10%;position: absolute;width: 521px;">
                <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                    <div class="nk-int-st">
                        <h3 style="font-size: 22px;font-weight: 600;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-back"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"/>
                                <path d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1zM1 9h14v2H1V9z"/>
                            </svg>&nbsp;ADDRESS&nbsp;&nbsp;&nbsp;<input cssStyle="width: 94%;display: inline" onfocus="enterLocation()" required="required" id="check_address" name="address"
                                                                        placeholder="Address"
                                                                        class="form-control"/></h3>
                        <span><img onclick="chooseLocation()"  class="buttonSearch" src="/template/web/img/icons/choose.png"/></span>
                        <style> .buttonSearch:hover{ cursor: pointer } </style>
                        <div id="charityMap" style="display:none;width:100%; height:50vh"></div>

                    </div>


                </div>
            </div>
            <br><br><br><br><br>
            <div style="left: 10%;position: absolute;width: 521px;">
                <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                    <div class="nk-int-st">
                        <h3 style="font-size: 22px;font-weight: 600;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd"
                                      d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                                <path fill-rule="evenodd"
                                      d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg>&nbsp;DETAIL&nbsp;&nbsp;&nbsp;<input id="check_detail" name="detail"
                                                                       placeholder="Infomation Charity"
                                                                       class="form-control"/></h3>

                    </div>
                </div>
            </div>
            <br><br><br>
            <hr>
            <br><br>

            <div style="left: 10%;position: absolute;width: 521px;">
                <div class="form-group float-lb" style="font-size: 35px;width: 74%">
                    <div class="nk-int-st">
                        <h3 style="font-size: 22px;font-weight: 600;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle"
                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd"
                                      d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                                <path fill-rule="evenodd"
                                      d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg>&nbsp;IMAGE&nbsp;&nbsp;&nbsp;<input type="file" id="image" name="image"
                                                                      placeholder="Infomation Charity"
                                                                      class="form-control"/></h3>
                    </div>
                </div>
            </div>
            <br><br><br>
            <hr>
            <br><br>

            <input onclick="processing()" id="btnSign" class="btn btn-warning notika-btn-warning" style="    padding: 8px 15px 8px 15px;position:absolute;left:29%;font-size: 25px" type="submit" value="ASSIGN"/>


            <br><br><br><br><br><br><br>

        </div>

    </div>
    <br>

</div>

