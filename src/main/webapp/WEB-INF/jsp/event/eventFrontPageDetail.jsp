<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="com.booksplattform.model.book.UserOrder" %>

<!DOCTYPE html>

<html lang="en">

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/storestyle/css/style.css">
    <link rel="stylesheet" href="/storestyle/css/slick.css">
      <!-- import elementUI CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import font-awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

     <!--<link rel="stylesheet" href="/storestyle/css/elementui.css">-->
    <title>以書會友 | SWAPOOKS</title>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- import bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        .el-table .warning-row {
            background: oldlace;
        }

        .el-table .success-row {
            background: #f0f9eb;
        }

        /* nvbar css */
        .bg-yellow {
            background-color: #110;
        }

        .keyword {
            margin: 30px 0px;
        }
.line-limit-length {
	overflow: hidden;
  	display: -webkit-box;
  	text-overflow: ellipsis;
  	-webkit-line-clamp: 3; /*行數*/
  	-webkit-box-orient: vertical;
  	white-space: normal;
}

.cartQuantity{
  position:absolute;
  width: 20px;
  height: 20px;
  border-radius:50%;
  display: flex;
  justify-content: center;
  align-items: center;
  right:-9px;
  top:-8px;
  color:red;
}

    </style>
	<!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- import CSS -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">


</head>

<body>
<!-- ===================== 02. 前台套版 Header start ===================== -->

<div id="main">
<%
	Integer items = 0;
	UserOrder userOrder = (UserOrder)session.getAttribute("userOrder");
	if( userOrder != null){
		items =	userOrder.getbDetails().size();
	}
%>
        <!-- Navigation -->
        <nav class="site-navigation nav">
            <div class="site-navigation-inner site-container">
                <a href="http://localhost:8080/store/booksMain"><img src="/storestyle/images/logoname-white.png" height="45" alt="site logo"></a>
                <div class="main-navigation">
                    <ul class="main-navigation__ul">
<%--                         <el-avatar style="color:black" v-if="nickName">${userDetail.nickName}</el-avatar> --%>
                        <li><a href="http://localhost:8080/store/booksMain">首頁</a></li>
                        <li><a href="http://localhost:8080/store/memberpage">我的帳戶</a></li> <!-- update by Sean 4/26 -->
                        <li><a href="http://localhost:8080/store/searchAll">我想找書</a></li>
                        <li><a href="http://localhost:8080/store/booksProvider">我想供書</a></li>
                        <li><a href="http://localhost:8080/club/frontclub.controller">我想討論</a></li>
<!--                         <li><a href="#">我想交流</a></li> -->
                        <li><a href="http://localhost:8080/eventfrontpage">我想找活動</a></li>
                        <li><a href="#">我想捐款</a></li>
                    </ul>
                </div>
                <div id="myBtn" class="burger-container" onclick="myFunction(this)" style="flex:1">
                    <div class="bar1"></div>
                    <div class="bar2"></div>
                    <div class="bar3"></div>
                </div>

                <!-- 書香幣starts  el-icon-coin -->
                <i style="color:white; margin-right:25px;" class="el-icon-coin" size="large" v-if="readerCoin">${userDetail.readerCoin}
                </i>
                <!-- 書香幣ends  el-icon-coin -->
                
                <!-- 讀者資訊 starts   先拿掉 -->
                <div style="margin-right:15px;">
                <el-dropdown>
                    <span class="el-dropdown-link">
<%--                         <el-avatar style="color:grey; background-color:white;" v-if="nickName">${userDetail.nickName}</el-avatar> --%>
                        <el-avatar style="color:grey; background-color:white;" v-if="nickName">
                        	<img class="img-profile rounded-circle" src="/showreaderphoto/${userDetail.readerId}">
                        </el-avatar>
                        <el-icon class="el-icon--right">
                            <arrow-down />
                        </el-icon>
                    </span>
                    <template #dropdown>
                        <el-dropdown-menu>
	                    	<el-dropdown-item v-if="${userDetail.authority == 1}"><a @click="adminCheck">管理員首頁</a></el-dropdown-item>
                            <el-dropdown-item><a @click="loginCheck">讀者資訊</a></el-dropdown-item>
                            <el-dropdown-item><a @click="logoutCheck">登出</a></el-dropdown-item>
                        </el-dropdown-menu>
                    </template>
                </el-dropdown>
                </div>
                <div style="color:white; font-size:120%; margin-right:25px;"><span>Hi! ${userDetail.nickName}<span></div>                 	
                <!-- 讀者資訊 ends-->
                
                
                <!-- shoppingCart starts -->
                <a class="position-relative" href="#" @click="carDialogVisible = true">
    			<i class="fas fa-shopping-cart fa-2x" style="color:white;"></i>
                <span class="cartQuantity text-white bg-danger"><%=items %></span>
                </a>
                
                <!-- 購物車內容清單確認 -->
				<el-dialog title="訂單內容確認"  :visible.sync="carDialogVisible" width="50%" >
 
 					<h4>{{nickName}}您好</h4>
					<el-empty v-if="!shoppingCar.length" :image-size="200"></el-empty>
 						<hr>
 							<table v-if="shoppingCar.length" cellspacing="0" class="table table-striped">
									<thead>
										<tr>
											<th>編號</th>
											<th>書名</th>
											<th>數量</th>
											<th>價格</th>
											<th>金額</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${userOrder.bDetails}" var="book">  
											<tr>
												<td>${book.value.booksId}</td>
												<td>${book.value.booksName}</td>
												<td>${book.value.quantity}</td>
												<td>${book.value.price}</td>
												<td>${book.value.itemTotal}</td>
												<td><el-button type="danger" icon="el-icon-delete" circle 
												@click="removeItem(`${book.value.booksId}`)">
												</el-button></td>
											</tr>
									 	</c:forEach>  
									</tbody>
								</table>							
				<hr v-if="shoppingCar.length">
 				<p v-if="shoppingCar.length">訂單總金額為 : ${userOrder.sum}</p>
 				<hr v-if="shoppingCar.length">
    				<el-button type="primary" @click="checkout">訂單確認</el-button>
    				<el-button @click="carDialogVisible=false">返回</el-button>
 
	
  					</span>
				</el-dialog>
				<!-- shoppingCart ends -->
            </div>
        </nav>
        <!-- Navigation end -->
        
<!-- ===================== 02. 前台套版 Header end ===================== -->

<!-- 只能動這裡 start -->  
    
    <input type="button" value="新增活動" id="add"><br>
	<hr>
	
<!-- 	<div class="card shadow mb-4"> -->
<!-- 				<div class="card-header py-3"> -->
<!--                 	<h6 class="m-0 font-weight-bold">活動資訊 | All Events</h6> -->
<!--                 </div> -->
                
                <!-- 
				<div class="card-body">
            		<div class="table-responsive">
            			<table cellspacing="0" class="table table-hover">
							<thead class="table table-dark">
							<tr>
							<th class='col-1'>活動編號</th>
							<th class='col-1'>活動名稱</td>
							<th class='col-1'>活動主題</td>
							<th class='col-1'>活動時間</th>
							<th class='col-2'>活動地點</th>
							<th class='col-1'>參加人數</th>
							<th class='col-3'>活動簡介</th>
							<th class='col-2'>操作</th>
							</tr>
						</thead>
						<tbody>
					
						<c:forEach items="${events}" var="event">
							<tr>
								<td>${event.eventId}</td>
								<td>${event.eventName}</td>
								<td>${event.eventType}</td>
								<td>${event.eventDate}</td>
								<td>${event.eventPlace}</td>
								<td>${event.eventNumber}</td>
								<td>${event.eventBio}</td>
								<td>
									<a href="eventupdatepage?id=${event.eventId}">修改</a>
									<button type="button" onclick="gotoUpdatePage(${event.eventId})">修改</button>
								<span>  |  </span>
									<button type="button" onclick="deleteEvent(${event.eventId})">刪除</button>
								<a href="EventDelete?id=${event.eventId}">刪除</a></td>
							</tr>
						</c:forEach>
						
						
						</tbody>
						</table>
					</div>
				</div>
				 -->
	<div class="container" style="width:1128px; margin-top:50px;">
		<div style="">
			<img src="/showeventphoto/${event.eventId}" class="card-img-top" width="800px" height="333px">
		</div>
		<div>
			<h2 style="margin-top:20px;">${event.eventName}</h2>
			<hr>
			${event.eventBio}
			<hr>
			<table>
				<tr>
					<td>活動類型：</td>
					<td>${event.eventType}</td>
				</tr>
				<tr>
					<td>活動日期：</td>
					<td>${event.eventDate}</td>
				</tr>
				<tr>
					<td>活動地點：</td>
					<td>${event.eventPlace}</td>
				</tr>
				<tr>
					<td>活動人數：</td>
					<td>${event.eventNumber}</td>
				</tr>
				
			</table>
		</div>
		<div align="center" style="margin-bottom:20px;">		
			<a href="http://localhost:8080/eventfrontpage" class="btn btn-primary">返回活動首頁</a>			
		</div>	
	</div>

  <!-- 只能動這裡 end -->   

    <!-- ===================== 03. 前台套版 Footer start ===================== -->

    <!-- Footer -->
    <footer class="site-footer">
        <div class="site-container">
            <div class="footer-inner">
                <div class="footer-info">
                    <div class="footer-info__left">
                        <img src="/storestyle/images/footer-img.jpg" alt="about me image">
                        <p style="color:white">供書，取書，知識的傳承</p>
                    </div>
                    <div class="footer-info__right">
                        <h5 style="color:#e6af41">聯絡我們</h5>
                        <p class="footer-phone">電話: <br>02-1234-5678</p>
                        <p>Email : <br>swapooks2022@gmail.com</p>
                        <div class="social-icons">
                            <a href="#" target="_blank"><img src="/storestyle/images/social-twitter.png" alt="social icon"></a>
                            <a href="#" target="_blank"><img src="/storestyle/images/social-pinterest.png" alt="social icon"></a>
                            <a href="#" target="_blank"><img src="/storestyle/images/social-youtube.png" alt="social icon"></a>
                        </div>
                    </div>
                </div>
				<div class="footer-contact-form" >
                    <h5 style="color:#e6af41">書友專區</h5>
                    <div class="contact-form">
                    	<p><a href="http://localhost:8080/gotoregisterpage" style="color:white; text-decoration:none;">我要註冊</a></p>
                    	<p><a href="http://localhost:8080/store/memberpage" style="color:white; text-decoration:none;">我的訂單</a></p>
                    	<p><a href="http://localhost:8080/store/memberpage" style="color:white; text-decoration:none;">帳戶管理</a></p>
                    	<p><a href="http://localhost:8080/forgotpwdpage" style="color:white; text-decoration:none;">忘記密碼</a></p>
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">二手書架</h5>
                    <div class="contact-form">
                    	<p><a href="http://localhost:8080/store/searchAll" style="color:white; text-decoration:none;">我想找書</a></p>
                    	<p><a href="http://localhost:8080/store/booksProvider" style="color:white; text-decoration:none;">我想供書</a></p>
                    	<p><a href="http://localhost:8080/store/memberpage" style="color:white; text-decoration:none;">我的書架</a></p>
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">社群活動</h5>
                    <div class="contact-form">
                    	<p><a href="http://localhost:8080/club/frontclub.controller" style="color:white; text-decoration:none;">社群討論</a></p>
                    	<p><a href="http://localhost:8080/eventfrontpage" style="color:white; text-decoration:none;">近期活動</a></p>
                    	<p><a href="http://localhost:8080/club/memberclub" style="color:white; text-decoration:none;">我的文章</a></p>
<!--                     	<p><a href="#" style="color:white; text-decoration:none;">我的活動</a></p> -->
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">公益閱讀</h5>
                    <div class="contact-form">
                    	<p><a href="#" style="color:white; text-decoration:none;">捐贈書籍</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">捐款贊助</a></p>
                    	
                    </div>
                </div>
<!--                 <div class="footer-contact-form"> -->
<!--                     <h5>Contact Form</h5> -->
<!--                     <form class="contact-form"> -->
<!--                         <div class="contact-form__input"> -->
<!--                             <input type="text" name="name" placeholder="Name"> -->
<!--                             <input type="email" name="email" placeholder="Email"> -->
<!--                         </div> -->
<!--                         <textarea></textarea> -->
<!--                         <input type="submit" name="submit" value="Submit" class="submit-button"> -->
<!--                     </form> -->
<!--                 </div> -->
            </div>
        </div>
        <div class="footer-bottom">
            <div class="site-container footer-bottom-inner">
                <p>© 2019 Author | Design by <a href="https://freehtml5.co/" target="_blank">freehtml5.co</a> | All
                    rights Reserved.</p>
                <span style="color:white;">Copyright &copy; SWAPOOKS 2022</span>
<!--                 <div class="footer-bottom__img"> -->
<!--                     <img src="/storestyle/images/footer-mastercard.png" alt="footer image"> -->
<!--                     <img src="/storestyle/images/footer-paypal.png" alt="footer image"> -->
<!--                     <img src="/storestyle/images/footer-visa.png" alt="footer image"> -->
<!--                     <img src="/storestyle/images/footer-fedex.png" alt="footer image"> -->
<!--                     <img src="/storestyle/images/footer-dhl.png" alt="footer image"> -->
<!--                 </div> -->
            </div>
        </div>
    </footer>
    <!-- Footer end -->

<!-- ===================== 03. 前台套版 Footer end ===================== -->
    
</div>

    <!-- Scripts -->
    <script src="/storestyle/js/jquery.min.js"></script>
    <script src="/storestyle/js/slick.min.js"></script>
    <script src="/storestyle/js/main.js"></script>
    <script src="/storestyle/js/vue.js"></script>
    <!-- import JavaScript 須放在最後面!-->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	
	

    <script>
    //選單 三 -> X
    function myFunction(x) {
        x.classList.toggle("change");
    }
    
    new Vue ({
		el:"#main",
		methods: {
			goToDetails(index ,row){
		        let booksid = row.booksId;
            	console.log(row.booksId); //Test
            	let	url="http://localhost:8080/store/store.booksDetails";
            	window.location.href= url+"?id="+ booksid
				
		    },
		    loginCheck(){    
		    	console.log(this.userId.length);
		    	console.log("${userDetail.readerId}");
			    if(this.userId.length < 1){
				    console.log(this.userId);
					alert("請登入喔");
					window.location.href= "http://localhost:8080/users";
			    }else{
			    	window.location.href= "http://localhost:8080/store/memberpage"; //update by Sean 4/26
				}
			},
			//購物車確認訂單
			checkout(){
				console.log(this.userId.length);
		    	console.log("${userDetail.readerId}");
			    if(this.userId.length < 1){
				    console.log(this.userId);
					alert("您尚未登入 , 請先登入喔");
					window.location.href= "http://localhost:8080/users";
			    }

				
            	console.log("sum is : "+this.sum ); //TEST
	            console.log("coin is : "+this.readerCoin); //TEST
	            console.log(this.sum - this.readerCoin); //TEST
            	//判斷書像幣是否足夠支付
	            if(this.sum - this.readerCoin > 0){
	            	alert("書香幣不足!!");
		         }else if(this.shoppingCar.length < 1){
		        	alert("目前沒有任何商品喔!!");
		        }else{
				//console.log("TEST--check out");
				let tmpItem = {};
				tmpItem.status = "approveadd"  //判別是否新增訂單
				axios({
            		method:"POST",
            		url:'http://localhost:8080/store/order',
            		data:tmpItem,		//不須再轉為JSON字串, 否則須加上header設定Content type 'application/json"...
            	}).then(function(response){
            		//將資料加入確認清單 orderDetails

            		//console.log("_this.orderDetailsis");  //test
	            	console.log(response.data);  //test
            		console.log("${userOrder.bDetails}"); //TEST
            		console.log("${userOrder.sum}"); //TEST

            		//let	url="http://localhost:8080/store/store.booksDetailsToBooks";
                	//window.location.href= url+"?id="+ booksid
            		location.replace('http://localhost:8080/store/booksMain');	
            	})
		        }
		       },
		       logoutCheck(){
		    	   console.log(this.userId.length);
			    	console.log("${userDetail.readerId}");
				    if(this.userId.length < 1){
					    console.log(this.userId);
						alert("請登入喔");
						window.location.href= "http://localhost:8080/users";
				    }else{
				    	window.location.href= "http://localhost:8080/logout";
					}

			   } 
   
			},
		data(){
			return{
				tableData:[],
				//確定user有無登入 Session
				userId:"${userDetail.readerId}",
				//查詢訂單內容視窗狀態
		        carDialogVisible: false,
		        //使用者頭像name
		        nickName:"${userDetail.nickName}",
		      	//使用者頭像$$
		        readerCoin:"${userDetail.readerCoin}",
		        //確認購物車有無內容
		        shoppingCar:"${userOrder.bDetails}",
		        //單品項購買金額總和
				itemTotal:"",
				//整筆訂單總額
				sum:"${userOrder.sum}",
				//訂單內容確認
				orderDetails:[],
			}
		},
	    mounted:function(){
			let _this = this;
			axios({
				method:"GET",
				url:"http://localhost:8080/admin/books"
			}).then( function(response){
			_this.tableData = response.data;	
			//console.log(_this.tableData);  //TEST
			
	        _this.tableData.forEach((item)=>{
	        	let oldPublishDate = item.publishDate
	        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
	        	let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日
	        	
	        	//response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
	        	item.publishDate = newPublishDate //換成只有年月日
		        
	            })
	        //console.log(_this.tableData); //TEST
	        
			})
	    }
    })
    </script>
    
    <script>
   
		document.getElementById("add").onclick = function(){
			location.href = "gotoAddPage";
		}

		function gotoUpdatePage(id){
			location.href = "eventupdatepage/"+id;
		}
		
		//刪除
		function deleteEvent(id){
			var deleteOrNot = confirm("是否要刪除");
			console.log(id);
			if(deleteOrNot){
				$.ajax({
					type:'post',
				    url:'/eventdelete/' + id,
//	 			    dataType:'json',
				    contentType: 'application/json',
				    success:function(data){
						if(data == "success"){
							alert("已成功刪除");
							location.reload();
						}
					}				
				});
			}
			
		}
	
	</script>
    
</body>

</html>