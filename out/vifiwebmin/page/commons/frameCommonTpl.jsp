<c:import url="/page/commons/frameBaseTpl.jsp" charEncoding="UTF-8">
	<%--
	因此要扩展什么内容 就可以通过c:import  c:param标签向frameBaseTpl.jsp页面中添加 frameBaseTpl页面就是页面中的主要内容
	c:import  标签的作用  在这个页面导入frameBaseTpl.jsp页面
	c:param   然后把这里的参数 传给frameBaseTpl.jsp页面 则在frameBaseTpl.jsp页面可以通过{param.editModalBodyEx } 参数名获取参数里面的内容
	--%>
	<c:param name="editModalBodyEx">

		<%--普通布局样式--%>
		<div ng-if="!viewCfg.isSplit">
			<div class="form-group" ng-repeat="vc in viewCfg.fields" ng-if="isShowEdit(vc)">
				<div ng-data-input ></div>
			</div>
		</div>

		<%--左右布局的样式--%>
		<div class="form-group row" ng-if="viewCfg.isSplit">
			<div class="col-sm-6">
				<div class="form-group" ng-repeat="vc in viewCfg.fields |filter:{left:true}" ng-if="isShowEdit(vc)">
					<div ng-data-input ></div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group" ng-repeat="vc in viewCfg.fields |filter:{left:false}" ng-if="isShowEdit(vc)">
					<%-- div[ng-data-input] 选择器 --%>
					<div ng-data-input ></div>
				</div>
			</div>
		</div>
		<%--<pre>{{form.copyData|json}}</pre>--%>
	</c:param>
</c:import>
