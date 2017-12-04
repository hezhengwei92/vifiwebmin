<body>
	<style>
		@media only screen and (max-width:880px){
			.modal-body{
				width: 100% !important;
				padding-right: 15px !important;
			}
			.modal-footer{
				width: 80px !important;
			}
			.form-horizontal{
				margin-top: 80px !important;
			}
		}
	
		
	</style>
	
    <script>
        g_var.userName = "<shiro:principal property="userName" />";
    </script>

	<div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <!-- tab标签组 -->
		                  <li class="flag-tabs-btn active" id="passwordBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)"><i class="fa fa-th font14"></i><spring:message code="menu.frame_password"/></a> 
		                  </li>
		                  
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
						<div id="passwordTab1" class="flag-tabs tab-pane  in active" style="border-radius:0;">
							<form class="form-horizontal" style="margin-top:150px;">
		                        <div class="modal-body" style="margin:0 auto;width:620px;padding-right:100px;">
		                        	<div class="form-group">
		                        		<label id="formTitle" class="control-label" style="padding-left:16px;font-size:15px;">
		                        		<spring:message code="modify"/>&nbsp;<span style="color:blue;">{0}</span>&nbsp;<spring:message code="page.login.password"/></label>
		                        	</div>
		                            <div class="form-group">
		                                <label class="col-sm-3 control-label" ><spring:message code="frame.password.old_password"/>:</label>
		                                <div class="col-sm-9">
		                                    <input class="form-control input-sm" type="password" name="old_psw" ng-model="form.oldPsw" />
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <label class="col-sm-3 control-label" ><spring:message code="frame.password.new_password"/>:</label>
		                                <div class="col-sm-9">
		                                    <input class="form-control input-sm" type="password" name="new_psw" ng-model="form.newPsw"/>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <label class="col-sm-3 control-label" ><spring:message code="frame.password.confirm_new_password"/>:</label>
		                                <div class="col-sm-9">
		                                    <input class="form-control input-sm" type="password" name="cfm_psw" ng-model="form.cfmPsw"/>
		                                </div>
		                            </div>
		                        </div>
								<div class="modal-footer" style="width:360px;margin:0 auto;background-color:#FBFBFB;">
									<button type="submit" class="btn btn-primary"><spring:message code="menu.frame_password"/></button>
								</div>
							</form>
						</div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  
</div>
</body>
