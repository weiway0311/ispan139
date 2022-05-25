<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="com.booksplattform.model.book.UserOrder" %>

<!DOCTYPE html>

<html lang="en">

<head>

<title>以書會友 | 書香閣基金會</title>


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<!-- ===================== 01. 前台套版 import css start ===================== -->
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
		/*輪播測試*/
		.slideshow {
            position: relative;
            margin: auto;
            overflow: hidden;
            height: 500px;
            width: 1250px;
            padding-top:80px;
        }
        .slideshow img {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            padding-top:80px;
        }
        /*熱門討論標題*/
        .hotclub{
        	color:black; 
        	font-size:30px; 
        	text-decoration:none;
        }
        .hotclub:hover {
			color:#e6af41; 
        	font-size:30px; 
        	text-decoration:none;
		}
    </style>
	<!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- import CSS -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- ===================== 01. 前台套版 import css end ===================== -->
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
                        <li><a href="http://localhost:8080/sponsor/goToConfirm">我想捐款</a></li>
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

    <!-- Top banner -->
    <section class="fh5co-top-banner">
        <div class="top-banner__inner site-container">
            <div class="top-banner__image">
                <img src="/storestyle/images/lake.JPG" alt="author image">
            </div>
            <div class="top-banner__text">
                <div class="top-banner__text-up">
                    <span class="brand-span">您好! 這裡是</span>
                    <h2 class="top-banner__h2">書香閣</h2>
                </div>
                <div class="top-banner__text-down">
                    <h2 class="top-banner__h2"></h2>
                    <span class="brand-span">供書, 取書, 知識的傳承</span>
                </div>
                <p>「好友、好書和一顆寧靜的心， 這就是理想的人生。」<br>
                				-- 馬克．吐溫</p>
                <a href="#" class="brand-button">Read bio > </a>
            </div>
        </div>
    </section>
    <!-- Top banner end -->

    <!-- About me -->
<!--     <section class="fh5co-about-me"> -->
<!--         <div class="about-me-inner site-container"> -->
<!--             <article class="portfolio-wrapper"> -->
<!--                 <div class="portfolio__img"> -->
<!--                     <img src="/storestyle/images/about-me.jpg" class="about-me__profile" alt="about me profile picture"> -->
<!--                 </div> -->
<!--                 <div class="portfolio__bottom"> -->
<!--                     <div class="portfolio__name"> -->
<!--                         <span>S</span> -->
<!--                         <h2 class="universal-h2">wapook</h2> -->
<!--                     </div> -->
<!--                     <p>交換書籍交朋友</p> -->
<!--                 </div> -->
<!--             </article> -->
<!--             <div class="about-me__text"> -->
<!--                 <div class="about-me-slider"> -->
<!--                     <div class="about-me-single-slide"> -->
<!--                         <h2 class="universal-h2 universal-h2-bckg">關於我們</h2> -->
<!--                         <p><span>H</span> e has work appearing or forthcoming in over a dozen venues, including Buzzy -->
<!--                             Mag, The Spirit of Poe, and the British Fantasy Society journal Dark Horizons. He is also -->
<!--                             CEO of a company, specializing in custom book publishing and social media marketing -->
<!--                             services, have created a community for authors to learn and connect.He has work appearing or -->
<!--                             forthcoming in over a dozen venues, including Buzzy Mag, The Spirit of Poe, and have created -->
<!--                             a community for authors to learn and connect.</p> -->
<!--                         <h4>Author</h4> -->
<!--                         <p class="p-white">See me</p> -->
<!--                     </div> -->
<!--                     <div class="about-me-single-slide"> -->
<!--                         <h2 class="universal-h2 universal-h2-bckg">經營團隊</h2> -->
<!--                         <p><span>H</span> e has work appearing or forthcoming in over a dozen venues, including Buzzy Mag, The Spirit of Poe, and the British Fantasy Society journal Dark Horizons. He is also CEO of a company, specializing in custom book publishing and social media marketing services, have created a community for authors to learn and connect.He has work appearing or forthcoming in over a dozen venues, including Buzzy Mag, The Spirit of Poe, and have created a community for authors to learn and connect.</p> -->
<!--                         <ul> -->
<!--                             <li> -->
<!--                                 <p><span>小翁</span>總經理 -->
<!--                                 </p> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <p><span>小翔</span>董事長 -->
<!--                                 </p> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <p><span>小楡</span>財務長 -->
<!--                                 </p> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <p><span>小瑋</span>風控長 -->
<!--                                 </p> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <p><span>小昀</span>行銷長 -->
<!--                                 </p> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                         <h4>Swapook(書香閣) team</h4> -->
<!--                         <p class="p-white">See me</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="about-me-bckg"></div> -->
<!--     </section> -->
    <!-- About me end -->

		<!-- 最新出版書籍 -->
<!-- 		<section class="fh5co-blog"> -->
<!-- 			<div class="site-container"> -->
			<div class="container">
				<h2 class="universal-h2 universal-h2-bckg">贊助資訊</h2>
				<div class="blog-slider blog-inner" >
				
<el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm">
  
  <el-form-item label="您是否需要收據">
  	<el-checkbox v-model="ruleForm.isReceipt" ></el-checkbox>
  </el-form-item>
  
  <p v-if="ruleForm.isReceipt" style="color:red">目前以電子收據為主唷，環保愛地球</p>
   <el-form-item label="收據資訊" v-if="ruleForm.isReceipt">
  	<el-checkbox v-model="ruleForm.checked" @change="samseAsMember">同會員資料</el-checkbox>
  </el-form-item>
  
  
  <el-form-item label="您的大名" prop="name">
    <el-input v-model.number="ruleForm.name"></el-input>
  </el-form-item>
  
  <el-form-item label="您的電話"  prop="phone">
    <el-input v-model="ruleForm.phone"></el-input>
  </el-form-item>
  
  <el-form-item label="您的e-mail" prop="mail">
    <el-input v-model.number="ruleForm.mail"></el-input>
  </el-form-item>
  
  <el-form-item label="您的生日" prop="birth">
   <!-- <div class="block">  -->
   <!-- <span class="demonstration">您的生日</span> -->
    <el-date-picker
      v-model="ruleForm.birth"
      type="date"
      placeholder="您的生日"
      default-value="2010-10-01">
    </el-date-picker>
 <!-- </div> -->
  </el-form-item>
  
    <el-form-item label="捐款金額(自訂)" prop="amount">
    <el-input v-model.number="ruleForm.amount" @blur="checkAmount"></el-input>
    </el-form-item>
   
  <el-form-item label="捐款金額" >  
    <el-button type="warning" @click="setAmount200">200</el-button>
    <el-button type="warning" @click="setAmount500">500</el-button>
    <el-button type="danger" @click="setAmount1000">1000</el-button>
    <el-button type="danger" @click="setAmount2000">2000</el-button>   
  </el-form-item>
  
  <!-- 
  <el-form-item label="Age" prop="age">
    <el-input v-model.number="ruleForm.age"></el-input>
  </el-form-item>
   -->
  <el-form-item>
    <el-button type="primary" @click="gotoConfirm">確認</el-button>
    <el-button @click="resetForm('ruleForm')">重新設定</el-button>
  </el-form-item>
</el-form>
						
					
				</div>
			</div>
		</section>
		<!-- Blog end -->
 
</div>

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
					window.location.href= "http://localhost:8080/readerlogin";
			    }
			},
			//購物車確認訂單
			checkout(){

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

			   }, 
			   gotoConfirm(){
				   	console.log(this.ruleForm);
					let _this = this;
					let tmpItem = {};
		        	//先加入readerID (custId)
		        	//console.log("${userDetail.readerId}");//test
		        	tmpItem.amount = this.ruleForm.amount;
		        	tmpItem.productName = "Sponsor Swapook";  //書香贊助

		        	//encode
		        	const encodedStr = encodeURIComponent('你好');
		        	//const decodedStr = decodeURI(encodedStr);
		        	//tmpItem.productName = encodedStr ;
		        	//console.log(decodedStr);
		        	
					tmpItem.productImageUrl = "https://img.lovepik.com/free-png/20210918/lovepik-handshake-png-image_400182473_wh1200.png";
					tmpItem.confirmUrl = "http://127.0.0.1:8080/sponsor/goToConfirm";
					//tmpItem.orderId = "${amount}";
					tmpItem.currency = "TWD";  
					
					
					axios({
						method:"POST",
						url:"http://localhost:8080/sponsor/reserve",
						headers: {'content-type': 'application/json;charset=UTF-8'},
						data:tmpItem,
					}).then( function(response){
					
					console.log(response.data);  //TEST

					//判斷回來的訊息
					if(response.data.returnCode === '0000'){
							//成功狀態  就導向付款畫面
							//window.open(response.data.info.paymentUrl.web, 'Payment', config='height=800px,width=800px');
							let sponsor = {};
							sponsor.amount = tmpItem.amount;
							sponsor.status = 'checking';  //一開始先設為checking
							//再將transactionId設定至sponsor
							//sponsor.transactionId = response.data.info.transactionId;  //這裡的transactionId是錯的(browser印出的) 要用controller的
							_this.goCheckingStatus(sponsor);
							//重導付款頁面
							window.open(response.data.info.paymentUrl.web, 'Payment', config='height=800px,width=800px');

						}else{
							alert("請輸入完整資料!");
							console.log("付款失敗喔!");
					}		  		        
					})
				},
				//送出資料
				submitForm(formName) {
        			this.$refs[formName].validate((valid) => {
          			if (valid) {
            		alert('submit!');
            		console.log(formName);
          			} else {
           				 console.log('error submit!!');
            			return false;
          			}
        			});
      				},
      			resetForm(formName) {
       				this.$refs[formName].resetFields();
      			},
      			//確認贊助金額不為負數
      			checkAmount(){
					if(this.ruleForm.amount < 0){
						alert("贊助金額不能負數阿~~");
					}
          		},
          		//發出Reserve時回傳再發出checking 並純入資料庫status: checking
          		goCheckingStatus(sponsor){
          			axios({
						method:"POST",
						url:"http://localhost:8080/sponsor/checking",
						headers: {'content-type': 'application/json;charset=UTF-8'},
						data:sponsor,
					}).then( function(response){
							if(response.data != ''){
								//重導付款畫面
								//window.open(response.data.info.paymentUrl.web, 'Payment', config='height=800px,width=800px');
								console.log('checking ok!!');
							}
						})

                  	},
                samseAsMember(){	
                        if(this.ruleForm.checked){
						//先判斷會員有無登入了
                        	if(this.userId.length < 1){
        					    console.log(this.userId);
        						alert("請登入喔");
        						window.location.href= "http://localhost:8080/readerlogin";
        				    }else{    
                        		//帶出會員資料 (session)
                  				this.ruleForm.name = '${userDetail.fullName}';
                  				this.ruleForm.phone = '${userDetail.phone}';
                  				this.ruleForm.mail = '${userDetail.email}';
                  				this.ruleForm.birth = '${userDetail.birth}'; 
                        	}    
                        console.log(this.ruleForm);	
                        }  
                },
                setAmount200(){this.ruleForm.amount = 200},
                setAmount500(){this.ruleForm.amount = 500},
                setAmount1000(){this.ruleForm.amount = 1000},
                setAmount2000(){this.ruleForm.amount = 2000},

				
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
				//捐贈表單
				ruleForm: {
          			name: '',
          			phone:'',
          			mail:'',
          			birth:'',
          			amount:'',
          			isReceipt:false,
          			checked:'',
				},
          		
				//姓名檢核
				rules: {
			          name: [
			            { required: true, message: '請輸入您的大名', trigger: 'blur' },
			          ],
					  phone: [
		                { required: true, message: '請輸入您的電話', trigger: 'blur' },
		              ],
		              amount: [
			            { required: true, message: '請輸入您的贊助額', trigger: 'blur' },
			            { type: 'number', message: '贊助金額要是數字呀~'},
			          ],
				},
				//birth:'',
			}	
		}

    })


    </script>
</body>

</html>