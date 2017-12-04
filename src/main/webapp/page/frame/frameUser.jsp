<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
	<c:param name="actionScopeEx">
        <div class="btn darkorange f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="isDsbEditBtn()"  ng-click="modifyPassword()">
            <i class="fa fa-asterisk" ng-class="{'tpl_gray':isDsbDtlBtn()}"></i>
            <div class="f-t-tips"><spring:message code="menu.frame_password"/></div>
        </div>&nbsp;&nbsp;

	</c:param>
	<c:param name="footScopeEx">
		<div class="modal fade modal-primary" id="modifyPassword" tabindex="-1" role="dialog" aria-hidden="true">
		    <div class="modal-dialog" ng-class="{'modal-lg':viewCfg.isSplit}">
		        <div class="modal-content">
		            <form class="form-horizontal">
		                <div class="modal-header">
		                    <button type="button" class="close" ng-click="closemodal('modifyPassword')"><span aria-hidden="true">&times;</span></button>
		                    <h4 class="modal-title text-success"><i class="fa fa-bar-chart-o"></i>
		                        <spring:message code="menu.modify_selected_user_psw"/>
		                    </h4>
		                </div>
		                <div class="modal-body">
		                   <div class="form-group ng-scope">
		                    <div data-input="">
		                    	<label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
		                    	<spring:message code="page.login.password"/>:<span class="required" style="color:red;width:8px;display:inline-block;margin:0 5px 0 10px;">
		                    	<b class="ng-scope">*</b></span></label>
		                    	<div class="col-sm-8" style="padding-left:0;padding-right:0;"><div class="ng-scope">
		                    	<input type="password" id="passwordConfirm" value="" placeholder="" 
		                    	class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" data-bv-field="idxCallPrefix" />
		                    	</div>
		                    </div></div></div>
		                    
		                    <div class="form-group ng-scope">
		                    <div data-input="">
		                    	<label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
		                    	<spring:message code="frame.password.confirm_password"/>:<span class="required" style="color:red;width:8px;display:inline-block;margin:0 5px 0 10px;">
		                    	<b class="ng-scope">*</b></span></label>
		                    	<div class="col-sm-8" style="padding-left:0;padding-right:0;"><div class="ng-scope">
		                    	<input type="password" id="password" name="password" value="" placeholder="" 
		                    	class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" data-bv-field="idxCallPrefix" />
		                    	</div>
		                    </div></div></div>

		                    
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-primary" ng-click="savePassword()"><spring:message code="save"/></button>
		                    <a class="btn btn-danger" ng-click="closemodal('modifyPassword')"><spring:message code="cancel"/></a>
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
	</c:param>
</c:import>















