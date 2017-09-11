<%@ page language="Java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
  	<!-- 日期控件 -->
  	<script src="${pageContext.request.contextPath}/laydate/laydate.js"></script> <!-- 改成你的路径 -->
  	<!-- 富文本编辑器 -->
  	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
  	
  	<style type="text/css">
  		spand{
  			color: red;
  			font-size: 80%;
  		}
  		 #textarea{
            width:30%;
            height: 100%
        }
  		  body{padding: 20px;}
		  .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
		  .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
		  .demo-footer a{padding: 0 5px; color: #01AAED;}
  	</style>
  	<script type="text/javascript">
  		$(function(){
  		var bname=false;
  		var busername=false;
  		var bpassword=false;
  		var bbirthday=false;
  		var bphonenumber=false;
  		var bemail=false;
  		var bcardID=false;
  		
  			//点击注册
  			$("#bu").click(function(){
	  			var name=$("#name").val();
	  			var username=$("#username").val();
	  			var password=$("#password").val();
	  			if(name!=null&&name!=""){
	  				bname = true;
	  			}
	  			$.post("${pageContext.request.contextPath}/user/addUser",{"name":name,"username":username,"password":password},function(str){
	  				if(str=="ok"){
	  					alert("注册成功")
	  					location.href="${pageContext.request.contextPath}/index.jsp";
	  				}
	  			},"json")
  			});
  			
  			//用户名
  			$("#username").blur(function(){
  				var username=$("#username").val();
  				$(".s1").empty();
  				//只能输入汉字或英文
  				var isPhone=/^[A-Za-z\u4e00-\u9fa5]+$/
				if(!isPhone.test($("#username").val())){
					$("#username").val("");
					$("#username").after("<spand class='s1'>用户名只能输入汉字或英文</spand>");
			        return false;
			     }else{
  						busername=true;
  					}
  				$.post("${pageContext.request.contextPath}/user/selectUser",{"username":username},function(str){
  					if(str=="no"){
  						$("#username").after("<spand class='s1'>用户名存在</spand>");
  						busername=false;
  					}else{
  						busername=true;
  					}
	  			},"json")
  			});
  			//验证密码
  			$("#password").blur(function(){
  				$("#s2").empty();
  				var password = $("#password").val();
  				 if(password.length<6||password.length>10){
  					$("#password").after("<spand id='s2'>6到10位的数字与字母组合</spand>");
  				}else{
  					bpassword=true;
  				} 
  			});
  			//确认密码
  			$("#newpassword").blur(function(){
  				$("#s3").empty();
  				var password = $("#password").val();
  				var newpassword = $("#newpassword").val();
  				if(password!=newpassword){
  					$("#newpassword").after("<spand id='s3'>两次密码不一致</spand>");
  					bpassword=false;
  				}else{
  					bpassword=true;
  				}
  			});
  			//邮箱
  			$("#email").blur(function(){
  			$("#s4").empty();
			var isPhone=/^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/; 
			if(!isPhone.test($("#email").val())){
				$("#email").after("<spand id='s4'>邮箱格式不正确</spand>");
				$("#email").val(""); 
				bemail =true;
			}else{
				bemail = false;
			}
			});
			//电话
			$("#phonenumber").blur(function(){
				$("#s5").empty();
				var isPhone=/^1[3|4|5|7|8][0-9]{9}$/; 
				if(!isPhone.test($("#phonenumber").val())){
					   $("#phonenumber").val("");
					   $("#phonenumber").after("<spand id='s5'>号码格式不正确</spand>");
			           bphonenumber = false;
			     }else{
			     	bphonenumber = true;
			     }
			})
			//cardID
			$("#cardID").blur(function(){
				$("#s6").empty();
				var isPhone=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/; 
				if(!isPhone.test($("#cardID").val())){
					$("#cardID").val("");
					$("#cardID").after("<spand id='s6'>省份证号不正确</spand>");
					bcardID = false
			     }else{
			     	bcarID=true;
			     }
			});
			
			//提交
			$("form").submit(function(){
	   			return(bname&&busername&&bpassword&&bbirthday&&bphonenumber&&bemail&&bcardID);
    		});
    		
			//导入富文本编辑器
			 var ue = UE.getEditor('editor');
			
  		}); 
  		
  	</script>
  	<!-- 日期控件 -->
	<script>
		lay('#version').html('-v'+ laydate.v);
		//执行一个laydate实例
		laydate.render({
		  elem: '#birthday' //指定元素
		});
	</script>
  </head>
  
  <body onload="full_city();selectedValue()">
  <center>
  <form action="${pageContext.request.contextPath}/user/register" enctype="multipart/form-data" name="shareip" method="post">
  <table height="1200px" border="0">
  <tr>
  		<td>头像 </td>
		<td><input type="file" name="source"></td>
  	</tr>
  	<tr>
		    <td>姓名:</td>
		    <td><input type="text" class="form-control" placeholder="Name" name="name" id="name"></td>
  	</tr>
  	
  	<tr>
		    <td>用户名</td>
		    <td><input type="text" class="form-control"  placeholder="Username" name="username" id="username"></td>
  	</tr>
  	
  	<tr>
  	  <td>密码</td>
	  <td>  <input type="password" class="form-control"  placeholder="Password" name="password" id="password"> </td>
  	</tr>
  	
  	<tr>
	    <td>确认密码</td>
	    <td><input type="password" class="form-control"  placeholder="Password" name="newpassword" id="newpassword"></td>
  	</tr>
	<tr>
  	 	<td>
  			性别
  		</td>
  		<td>
	  		<input type="radio" name="sex" value="男" checked="checked">男
	  		<input type="radio" name="sex" value="男">女
	    </td>
  	</tr>
  	<tr>
  	 	<td>
  			爱好
  		</td>
  		<td>
	  		<input type="checkbox" name="hobby" value="听音乐">听音乐
	  		<input type="checkbox" name="hobby" value="打篮球">打篮球
	  		<input type="checkbox" name="hobby" value="读书">读书
	  		<input type="checkbox" name="hobby" value="玩游戏">玩游戏
	    </td>
  	</tr>
  	<tr>
  		<td>生日</td>
	     <td><input type="text" class="form-control demo-input" placeholder="Birthday" name="birthday" id="birthday"></td> 
	    <!-- <td><input type="text" class="demo-input" placeholder="请选择日期" id="test1"></td> -->
  	</tr>
  	
  	<tr>
  	     <td>电话号码</td>
	    <td><input type="text" class="form-control"  placeholder="Phonenumber" name="phonenumber" id="phonenumber"></td>
  	</tr>
  	
  	<tr>
  	 	 <td>邮箱</td>
	     <td> <input type="text" class="form-control" name="email" id="email" placeholder="Email"></td>
  	</tr>
  	
  	 
  	
  	<tr>
  		<td>身份证号码</td>
  		<td><input type="textfi" class="form-control"  placeholder="cardId" name="cardID" id="cardID"></td>
  	</tr>
  	
  	<tr>
  		<td>
             	地址
        </td>     
        <td>
                 <select id="province" runat="server" name="address">
                 </select>
                 <select id="city" runat="server"  name="address">
                 </select>
                 <select id="county" runat="server" name="address">
                 </select>
                 <script type="text/javascript">
                     setup();
                 </script>
         </td>
  	</tr>
  	
  	<tr>
  		<td>简介</td>
  		<td height="450px">
	  		<div id="textarea">
	  		 <textarea cols="1" rows="1" id="editor"  name="myshow"></textarea>
			</div>
		</td>	
  	</tr>
  	
  	<tr>
  		<td colspan="2" align="center">　
  		    <input type="submit" class="btn btn-default" value="注册" />
  		</td>
  	</tr>
  </table>
  </form>
  </center>
  </body>

</html>
