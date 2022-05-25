<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/sponsorstyle/css/sponsorform.css">
      <!-- import elementUI CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import font-awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<title>Insert title here</title>
</head>
<body>
<%
	//Integer amount = (Integer) session.getAttribute("amount");
%>


<div id="main">


<el-col :sm="12" :lg="6">
    <el-result icon="success" title="贊助成功，可點選右上角esc關閉視窗，感謝您!" subTitle="Please follow the instructions">
      <template slot="extra">
       	<el-image src="/sponsorstyle/images/shakehand.jpg"></el-image>
      </template>
    </el-result>
  </el-col>

</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/storestyle/js/vue.js"></script>
    <!-- import JavaScript 須放在最後面!-->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>

    <script>

    
    new Vue ({
		el:"#main",
		methods: {
			   gotoConfirm(){
			    	console.log("confirmation gotoConfirm() :");
			    	console.log("${id}");
					let _this = this;
					let tmpItem = {};
		        	tmpItem.amount = "120";
					tmpItem.currency = "TWD";  
					
					axios({
						method:"GET",
						url:"http://localhost:8080/sponsor/confirm/" + "${id}"+ "?amount=100&currency=TWD",
						//method:"POST",
						//url:"http://localhost:8080/sponsor/confirm/" + "${id}" ,
						//data:tmpItem,
						//headers: {
    						//'Content-Type': 'application/json', 
    						//'X-CUSTOM-HEADER': '123'
  							//}
					}).then( function(response){ 
					
					console.log(response.data);  //TEST

					//判斷回來的訊息
					if(response.data.returnCode === '0000'){
							//成功狀態  就導向付款畫面
						console.log("付款成功喔!(confirmed)");
						console.log(response.data);
						}else{
					
							console.log("付款失敗喔!");
					}
			  
			        
					})
				}
			},
		data(){
			return{

			}
		},
	    mounted:function(){
			let sessionAmount = "${amount}";
			console.log(sessionAmount);
		    
	    	console.log("confirmation mounted:");
			let _this = this;
			let tmpItem = {};
        	tmpItem.amount = "${sessionScope.amount}";
			tmpItem.currency = "TWD";  
			
			axios({
				method:"GET",
				//url:"http://localhost:8080/sponsor/confirm/" + "${id}"+ "?amount="+ sessionAmount + "&currency=TWD",
				url:"http://localhost:8080/sponsor/confirm/" + "${id}"+ "?amount="+ "${amount}" + "&currency=TWD",
				//method:"POST",
				//url:"http://localhost:8080/sponsor/confirm/" + "${id}" ,
				//data:tmpItem,
			}).then( function(response){ 
			
			console.log(response.data);  //TEST

			//判斷回來的訊息
			if(response.data.returnCode === '0000'){
					//成功狀態  就導向付款畫面
				console.log("付款成功喔!(confirmed)");
				console.log(response.data);
				}else{
			
					console.log("付款失敗喔!");
			}
	  
	        
			})
	    }
    })


    </script>
</body>
</html>