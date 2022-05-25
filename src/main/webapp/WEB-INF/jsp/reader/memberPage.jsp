<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="com.booksplattform.model.book.UserOrder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<title>以書會友 | 書友專區</title>

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 
<style>
.bg-yellow {
	background-color: #844200;
}

.edge{
	width: 700px;
	margin-top: 50px;
}
</style> -->

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

.member-top a{
	font-size:18px;
	text-decoration:none;
	font-weight:bold;
	color:black;	
}
.member-top a:hover{
	font-size:18px;
	text-decoration:none;
	font-weight:bold;
	color:#e6af41;
	
}

    </style>

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
        
        <!-- Member top bar start -->
        <section class="fh5co-blog" style="padding-top:100px; margin:0px auto; width:700px;">
        	<div class="container member-top" align="center">
        		<h2 style="margin-bottom:20px;">書友中心</h2>
<!--             	<hr> -->
            	<div class="form-group row">
                    <div class="col-sm-2 mb-3 mb-sm-0">
                    	<a href="http://localhost:8080/store/memberpage">我的帳戶</a>                    	
                    </div>
                    <div class="col-sm-2 mb-3 mb-sm-0">
                    	<a href="">我的二手書</a>
                    </div>
                    <div class="col-sm-2 mb-3 mb-sm-0">
                    	<a href="http://localhost:8080/order/findorderbycustid/${userDetail.readerId}">我的訂單</a>
                    </div>
                    <div class="col-sm-2 mb-3 mb-sm-0">
                    	<a href="http://localhost:8080/club/memberclub">我的文章</a>
                    </div>
            		<div class="col-sm-2 mb-3 mb-sm-0">
            			<a href="http://localhost:8080/store/searchAll">我要找書</a>
                    </div>
                    <div class="col-sm-2 mb-3 mb-sm-0">
                    	<a href="http://localhost:8080/eventfrontpage">查看活動</a>
                    </div>
                </div>
                <hr>
            </div>
        </section>       
        <!-- Member top bar end -->
	
	<!-- 主要內容 start -->
<!-- 	<span id="showZone" style='color: rgb(255, 0, 0); font-size: 80%;'></span> -->
	<section class="fh5co-blog">
	<div class="site-container">
	<div class="container" style="margin: 0px 150px;">
		<!-- try-start -->
		<div class="card o-hidden border-0 shadow-lg my-4">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
<!--                     <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-12">
                        <div class="p-5">
                        	<div id="readerTable">
<!--                             <div class="text-center"> -->
<!--                                 <h1 class="h4 text-gray-900 mb-4">修改基本資料</h1> -->
<!--                             </div> -->
                            
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">書友編號： ${userDetail.readerId}</div>
                                <div class="col-sm-6 mb-3 mb-sm-0" align="right">註冊日期： ${userDetail.registerDate}</div>
                            </div>
                            <hr>
                            
                            <!-- 修改圖片 -->
                            <form action="/uploadreaderphoto/${userDetail.readerId}" enctype="multipart/form-data" method="post" id="changePhoto">
                            	<div class="form-group row">
                                	<div class="col-sm-4" align="center"><img src="/admin/showreaderphoto/${userDetail.readerId}" height="100px"></div>
                                    <div class="col-sm-4" align="center"><input type="file" name="photo" id="photo" class="" class="btn-primary"></div>
<!--                                     <div class="col-sm-4" align="center"><button class="btn btn-primary" type="button" onclick="changePhoto()">變更大頭貼</button></div> -->
                                    <div class="col-sm-4" align="center"><input class="btn btn-primary" type="button" value="變更大頭貼" onclick="changePhoto()"/></div>
                                </div>
                            </form>                            
                            
                            <!-- 修改基本資料 -->
                            <form class="user" method='post' action='' id="updateInfo">
                            	<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
<%--                                         書友編號： ${reader.readerId} --%>
                                        <input type="hidden" name="readerId" id="readerId" value="${userDetail.readerId}">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0" align="right">
<%--                                         註冊日期： ${reader.registerDate} --%>
                                        <input type="hidden" name="registerDate" id="registerDate" value="${userDetail.registerDate}">
                                    </div>
                                </div>
                                <hr>
                            	<div class="form-group" style="margin-bottom:15px;">
                            		<label>email：</label>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email*" value="${userDetail.email}" readonly>
                                </div>
                                <div class="form-group row" style="margin-bottom:15px;">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>姓名：</label>
                                        <input type="text" name="fullName" id="fullName" class="form-control" placeholder="姓名*" value="${userDetail.fullName}" readonly>
<!--                                     	<span id="msgName" style='color: rgb(255, 0, 0);'></span> -->
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>暱稱：</label>
                                        <input type="text" name="nickName" id="nickName" class="form-control" placeholder="暱稱" value="${userDetail.nickName}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom:15px;">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>性別：</label>
                                        <input type="text" name="gender" id="gender" class="form-control" placeholder="性別" value="${userDetail.gender}" readonly>
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>生日：</label>
                                    	<input type="date" name="birth" id="birth" class="form-control" value="${userDetail.birth}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom:15px;">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>電話：</label>
                                        <input type="text" name="phone" id="phone" class="form-control" placeholder="電話" value="${userDetail.phone}" readonly>
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>書友等級：</label>
                                        <input type="text" name="readerLevel" id="readerLevel" class="form-control" placeholder="書友等級" value="${userDetail.readerLevel}" readonly>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom:15px;">
                                	<label>持有書香幣：</label>
                                    <input type="number" name="readerCoin" id="readerCoin" class="form-control" placeholder="持有書香幣" value="${userDetail.readerCoin}" min="0" readonly>
                                </div>
                                <div align="center">
                                	<button class="btn btn-primary btn-block" type="button" onclick="updateData()" align="center">修改個人資料</button>
<!--                                 <button class="btn btn-warning btn-block" type="button" onclick="location.href='http://localhost:8080/admin/allreaderpage'" align="center">返回</button> -->
									<button class="btn btn-primary btn-block" type="button" onclick="changePassword()" align="center">變更密碼</button>
                            	</div>
                            </form>
                            <hr>
                            <div align="right">
<!--                             	<el-button type="info" onclick="oneClick()" plain>一鍵輸入</el-button> -->
<!--                             	<button type="button" onclick="oneClick()" class="btn btn-outline-secondary">一鍵輸入</button> -->
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>	
        <!-- try-end -->
	
		</div>
	</div>
	</section>
</div>

	<!-- 主要內容 end -->
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
    
    <!-- 03. import sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

	<!-- import jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous">		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="js/vue.js"></script>
	
	<!-- Scripts -->
    <script src="/storestyle/js/jquery.min.js"></script>
    <script src="/storestyle/js/slick.min.js"></script>
    <script src="/storestyle/js/main.js"></script>
    <script src="/storestyle/js/vue.js"></script>
    
    <!-- import JavaScript 須放在最後面!-->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	
	<script>
		// 一鍵輸入修改資料
		function oneClickInfo(){
			$('#fullName').val("Sean Ko");
			$('#nickName').val("KK");
			$('#phone').val("03-1234567");
		}

		// 一鍵輸入密碼
		function oneClick(){
			$('#newPwd').val("87654321");
			$('#newPwd2').val("87654321");
		}

		// 姓名欄位不得為空
		$("#fullName").on("blur", function(){
			var fullName = $("#fullName").val();
			if($.trim(fullName)==''){
				$("#msgName").html("此欄位不可空白");
			}			
		});

		// 進入修改頁面
		function updateData(userDetail){
			$('#readerTable').empty();

// 			var test = `<tr><td>hi</td></tr>`;

			var updateInput = `<form class="user" method='post' action='' id="updateInfo">
            				   		<div class="form-group row" style="margin-bottom:15px;">
                						<div class="col-sm-6 mb-3 mb-sm-0">
                							<label>書友編號： ${userDetail.readerId}</label>
                    						<input type="hidden" name="readerId" id="readerId" value="${userDetail.readerId}">
                						</div>
                						<div class="col-sm-6 mb-3 mb-sm-0" align="right">
                							<label>註冊日期： ${userDetail.registerDate}</label>
                    						<input type="hidden" name="registerDate" id="registerDate" value="${userDetail.registerDate}">
                						</div>
            						</div>
            						<hr>
        							<div class="form-group" style="margin-bottom:15px;">
						        		<label>email：</label>
						                <input type="email" name="email" id="email" class="form-control" placeholder="Email*" value="${userDetail.email}" readonly>
						            </div>
						            <div class="form-group row" style="margin-bottom:15px;">
						                <div class="col-sm-6 mb-3 mb-sm-0">
						                	<label>姓名：</label>
						                    <input type="text" name="fullName" id="fullName" class="form-control" placeholder="姓名*" value="${userDetail.fullName}">
						                	<span id="msgName" style='color: rgb(255, 0, 0);'></span>
						                </div>
						                <div class="col-sm-6">
						                	<label>暱稱：</label>
						                    <input type="text" name="nickName" id="nickName" class="form-control" placeholder="暱稱" value="${userDetail.nickName}">
						                </div>
						            </div>
						            <div class="form-group row" style="margin-bottom:15px;">
						                <div class="col-sm-6 mb-3 mb-sm-0">
						                	<label>性別：</label>
						                    <input type="text" name="gender" id="gender" class="form-control" placeholder="性別" value="${userDetail.gender}" readonly>
						                </div>
						                <div class="col-sm-6">
						                	<label>生日：</label>
						                	<input type="date" name="birth" id="birth" class="form-control" value="${userDetail.birth}" readonly>
						                </div>
						            </div>
						            <div class="form-group row" style="margin-bottom:15px;">
						                <div class="col-sm-6 mb-3 mb-sm-0">
						                	<label>電話：</label>
						                    <input type="text" name="phone" id="phone" class="form-control" placeholder="電話" value="${userDetail.phone}">
						                </div>
						                <div class="col-sm-6">
						                	<label>書友等級：</label>
						                    <input type="text" name="readerLevel" id="readerLevel" class="form-control" placeholder="書友等級" value="${userDetail.readerLevel}" readonly>
						                </div>
						            </div>
						            <div class="form-group" style="margin-bottom:15px;">
						            	<label>持有書香幣：</label>
						                <input type="number" name="readerCoin" id="readerCoin" class="form-control" placeholder="持有書香幣" value="${userDetail.readerCoin}" min="0" readonly>
						            </div>
						            <div align="center">
							            <input type="button" onclick="saveUpdate()" value="送出" class="btn btn-primary"/>
		 								<input type="button" onclick="cancel()" value="取消" class="btn btn-primary"/>
	 								</div>
						        </form>
						        <hr>
						        <div align="right">
						        	<el-button type="info" onclick="oneClickInfo()" plain class="btn btn-outline-secondary">一鍵輸入</el-button>
						        </div>`;			
			$('#readerTable').append(updateInput);
		}

		function cancel(){
			location.href='/store/memberpage';
		}

		//儲存修改
		function saveUpdate(){
// 			var updateOrNot = confirm('確定要修改嗎?');
// 			if(updateOrNot){
				var readerId = $('#readerId').val(); //readonly
				var registerDate = $('#registerDate').val(); //readonly
				var email = $('#email').val(); //readonly
				var fullName = $('#fullName').val();
				var nickName = $('#nickName').val();
				var gender = $('#gender').val(); //readonly
				var phone = $('#phone').val();
				var birth = $('#birth').val(); //readonly
				var readerLevel = $('#readerLevel').val();
				var readerCoin = $('#readerCoin').val();
				var authority = $('#authority').val();

				if($.trim(fullName)=='' || $.trim(nickName)=='' || $.trim(phone)==''){
					Swal.fire("姓名欄位不可空白");
					$('#showZone').html('不可空白');
					return;
				}

				Swal.fire({
	                title: '確定要修改嗎?',
	                icon: 'warning',
	                showCancelButton: true, //是否需要 "取消" 的按鈕
	                confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
	                cancelButtonColor: '#d33', //"取消" 按鈕的顏色
	                confirmButtonText: '確定',
	                cancelButtonText: '取消',
	            }).then((result) => {
	                if (result.isConfirmed) { 
	                	var params = {
	        					"readerId":readerId,
	        					"registerDate":registerDate,
	        					"email":email,
	        					"fullName":fullName,
	        					"nickName":nickName,
	        					"gender":gender,
	        					"phone":phone,
	        					"birth":birth,
	        					"readerLevel":readerLevel,
	        					"readerCoin":readerCoin,
	        					"authority":authority,
	        				}
	        				
	        				$.ajax({
	        					type:'put',
	        					url:'/updatebasicdata',
	        					dataType:'json',
	        					contentType:'application/json',
	        					data:JSON.stringify(params),
	        					success:function(data){
	        						if(data!=null){
	        							Swal.fire(
            		                        '修改成功!', //大標
            		                        '密碼已更新', //小標
            		                        'success', //圖案
            				            ).then(function(){
            				            	window.location.href='http://localhost:8080/store/memberpage';
            					        });
	        						}				
	        					}
	        				});                	                		                 
	                }
	            })

								
// 			}
		}

		// 修改密碼
		function changePassword(){
			$('#readerTable').empty();

			var updateInput = `<form class="user" method='post' action='' id="updateInfo">
						   			<div class="form-group row" style="margin-bottom:15px;">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label>書友編號： ${userDetail.readerId}</label>
											<input type="hidden" name="readerId" id="readerId" value="${userDetail.readerId}">
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0" align="right">
												<label>註冊日期： ${userDetail.registerDate}</label>
												<input type="hidden" name="registerDate" id="registerDate" value="${userDetail.registerDate}">
										</div>
									</div>
									<hr>
									<div class="form-group" style="margin-bottom:15px;">
				        				<label>email：</label>
				                		<input type="email" name="email" id="email" class="form-control" placeholder="Email*" value="${userDetail.email}" readonly>
				           			</div>
				           			<div class="form-group" style="margin-bottom:15px;">
				        				<label>新密碼：</label>
				                		<input type="password" name="newPassword" id="newPwd" class="form-control" placeholder="請輸入新密碼">
				           			</div>
				           			<div class="form-group" style="margin-bottom:15px;">
				        				<label>確認新密碼：</label>
				                		<input type="password" name="newPassword2" id="newPwd2" class="form-control" placeholder="請確認新密碼">
				           			</div>
				           			<div align="center">
					            		<input type="button" onclick="savePwd(${userDetail.readerId})" value="送出" class="btn btn-primary"/>
										<input type="button" onclick="cancel()" value="取消" class="btn btn-primary"/>
									</div>
						        </form>
						        <hr>
						        <div align="right">
						        	<el-button type="info" onclick="oneClick()" plain class="btn btn-outline-secondary">一鍵輸入</el-button>
						        </div>`;
		   						
			$('#readerTable').append(updateInput);
		}

		//送出修改密碼
		function savePwd(readerId){
				var newPassword = $('#newPwd').val();
				var newPassword2 = $('#newPwd2').val();

				if(newPassword == ""){
					Swal.fire("欄位不可空白");
					return;
				}
				
				if( newPassword != newPassword2){
					Swal.fire("請重新確認密碼");
					return;
				}

				Swal.fire({
	                title: '確定要修改嗎?',
	                icon: 'warning',
	                showCancelButton: true, //是否需要 "取消" 的按鈕
	                confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
	                cancelButtonColor: '#d33', //"取消" 按鈕的顏色
	                confirmButtonText: '確定',
	                cancelButtonText: '取消',
	            }).then((result) => {
	                if (result.isConfirmed) { 
	                	var params = {
        					"newPassword":newPassword,
        				}
        				
        				$.ajax({
        					type:'put',
        					url:'/updatepassword/' + readerId,
        					dataType:'json',
        					contentType:'application/json',
        					data:JSON.stringify(params),
        					success:function(data){
        						if(data == 'failed'){
        							Swal.fire("請重新確認密碼");
        						}else{
        							Swal.fire(
           		                        '修改成功!', //大標
           		                        '密碼已更新', //小標
           		                        'success', //圖案
           				            ).then(function(){
           				            	window.location.href='http://localhost:8080/store/memberpage';
           					        });
        						}
        					}
        				});                 	                		                 
	                }
	            })
		}

		// 變更大頭貼
		function changePhoto(){
			var photo = $("#photo").val();
			console.log(photo);
			if(photo == ""){
				Swal.fire(
	                '沒有圖片喔', //大標
	                '請重新上傳圖片', //小標
	                'error', //圖案
	            )           
				return;
			}
						
			Swal.fire({
                title: '確定要變更大頭貼嗎?',
                icon: 'warning',
                showCancelButton: true, //是否需要 "取消" 的按鈕
                confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
                cancelButtonColor: '#d33', //"取消" 按鈕的顏色
                confirmButtonText: '確定',
                cancelButtonText: '取消',
            }).then((result) => {
                if (result.isConfirmed) { 
                	Swal.fire(
                       '修改成功!', //大標
                       '大頭貼已變更', //小標
                       'success', //圖案
		            ).then(function(){
                   		$("#changePhoto").submit();			            
			        });
                }
            })
		}	
	</script>
	
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

</body>
</html>