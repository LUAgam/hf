<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在线支付</title>
  </head>
  <link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css" />
  <script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
  <script src="../asset/layui/layui.js" type="text/javascript" charset="utf-8"></script>
  
  <body>
       	 <form class="layui-form" action="${pageContext.request.contextPath }/servlet/PayRequestServlet" method="post">
	      	<table width="80%" style="margin-left: 100PX">
				<input type="hidden" name="orderid" value="${orderid}">
	    		<input type="hidden" name="money" value="${money}">
				<tr><td><br/></td></tr>
				<tr>
					<td>请您选择在线支付银行</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET" title=" ">招商银行 </td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET" title=" ">工商银行&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  &nbsp;&nbsp;&nbsp;&nbsp;</td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET" title=" ">农业银行</td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET" title=" ">建设银行 </td>
				</tr>
				<tr>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET" title=" ">中国民生银行总行</td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET"  title=" ">光大银行 </td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET" title=" ">交通银行</td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET" title=" ">深圳发展银行</td>
				</tr>
				<tr>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET" title=" ">北京银行</td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET" title=" ">兴业银行 </td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET" title=" ">上海浦东发展银行 </td>
				  <td><INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET" title=" ">中信银行</td>
				</tr>
				<tr><td><br/></td></tr>
				<tr>
				<td></td><td></td><td></td>
				  <td><INPUT class="layui-btn layui-btn-big layui-btn-normal" TYPE="submit" value="确定支付"></td>
				</tr>
	     	</table>
	   		</form>
  </body>
  <script>
		layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form(),
		  layer = layui.layer
		});
	</script>
</html>
