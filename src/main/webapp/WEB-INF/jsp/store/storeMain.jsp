<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="com.booksplattform.model.book.UserOrder" %>

<!DOCTYPE html>

<html lang="en">

<head>

<title>以書會友 | SWAPOOKS</title>

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
        
    <!-- 測試輪播 start -->
    <div class="slideshow site-container" style="padding-top:75px" align="center">
        <img src="/storestyle/images/banner00.jpg" alt=""/>
        <img src="/storestyle/images/banner01.jpg" alt=""/>
        <img src="/storestyle/images/banner02.jpg" alt=""/>
        <img src="/storestyle/images/banner03.jpg" alt=""/>
        <img src="/storestyle/images/banner04.jpg" alt=""/>
   	</div>
   	<!-- 測試輪播 end -->

    <!-- Top banner -->
<!--     <section class="fh5co-top-banner"> -->
<!--         <div class="top-banner__inner site-container"> -->
<!--             <div class="top-banner__image"> -->
<!--             </div> -->
<!--             <div class="top-banner__text"> -->
<!--                 <div class="top-banner__text-up"> -->
<!--                     <h2 class="top-banner__h2">以書會友 SWAPOOKS</h2> -->
<!--                 </div> -->
<!--                 <div class="top-banner__text-down"> -->
<!--                     <h2 class="top-banner__h2"></h2> -->
<!--                     <span class="brand-span">供書, 取書, 知識的傳承</span> -->
<!--                 </div> -->
<!--                 <br> -->
<!--                 <div align="center"> -->
<!-- 	                <p style="font-size: 20px;">「好友、好書和一顆寧靜的心， 這就是理想的人生。」<br>             -->
<!--                 				-- 馬克．吐溫</p> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Top banner end -->
    
    
        
    <!-- 最新出版書籍 -->
		<section class="fh5co-blog" style="overflow: auto; margin-bottom:10px;">
			<h2 class="universal-h2 universal-h2-bckg" style="font-size:30px; margin-top:50px;">近期上架二手書</h2>			
			<div class="site-container">
				<div class="blog-slider blog-inner" v-for="(item, index) in tableData.slice(0,4)">
				
					<div class="single-blog" width="350px">
						<div class="single-blog__img" width="300px">
							<el-link @click="goToDetails(index ,item)">
								<img :src="item.bookimgsurl" alt="blog image" height="200px">
							</el-link>
						</div>
						<hr>
						<div class="single-blog__text" width="300px" height="300px">
							<h4 style="font-size:20px;">{{item.booksName}}</h4>
							<span>出版日  :  {{item.publishDate}}</span>
							<p class="line-limit-length">{{item.bookDescribe}}</p>
<!-- 							<p>Quisque vel sapi nec lacus adipis cing bibendum nullam porta lites laoreet -->
<!-- 								aliquam.velitest, -->
<!-- 								tempus a ullamcorper et, lacinia mattis mi. Cras arcu nulla, blandit id cursus et, -->
<!-- 								ultricies -->
<!-- 								eu leo.</p> -->
						</div>
						<hr>
						<div class="single-blog__text">
							<el-button type="info" icon="el-icon-more" circle name="todo" id="more" @click="goToDetails(index ,item)"></el-button>	<!-- Detailse -->
							<img src="/storestyle/images/fire-ring.gif" width="45px" height="45px">
						</div>
					</div>	
					
				</div>
			</div>
		</section>
		<!-- Blog end -->
		
		<!-- 最新討論 start -->
		<section class="fh5co-blog" style="overflow: auto;">
			<h2 class="universal-h2 universal-h2-bckg" style="font-size:30px; margin-top:20px;">熱門話題</h2>			
			<div class="container" style="margin-top:-70px;">
				<div class="row row-cols-1 row-cols-md-3 g-5" style="margin: 0px 0px;">
					<c:forEach items="${frontClubs}" var="club" begin="0" end="2">
				  
					  <div class="col">
					    <div class="card h-100">
<%-- 					      <a href="/eventfrontpagedetail/${club.eventId}"> --%>
<%-- 					      	<img src="${club.clubImg}" class="card-img-top" width="350px"> --%>
<!-- 					      </a> -->
					      <div class="card-body">
					      	<a href="/club/CommentfrontSearchById?id=${club.clubId}" class="hotclub">
					        	<h5 class="card-title"><b>${club.articleHeader}</b></h5>
					        </a>			        
							${club.clubclass}
					      </div>
					      <div class="card-footer">
					        <small class="text-muted">發布日期：${club.clubDate}</small>
					      </div>
					    </div>
					  </div>
				  
					</c:forEach>
				</div>
					
			</div>	
		</section>
		<!-- 最新討論 end -->
		
		<!-- 近期活動 start -->
		<section class="fh5co-blog" style="overflow: auto; margin-bottom:150px;">
			<h2 class="universal-h2 universal-h2-bckg" style="font-size:30px; margin-top:0px;">近期活動</h2>			
			<div class="container" style="margin-top:-70px;">
				<div class="row row-cols-1 row-cols-md-3 g-5" style="margin: 0px 0px;">
				
					<c:forEach items="${frontEvents}" var="event" begin="1" end="3">
				  
					  <div class="col">
					    <div class="card h-100">
					      <a href="/eventfrontpagedetail/${event.eventId}">
					      	<img src="/showeventphoto/${event.eventId}" class="card-img-top" width="350px" height="200px">
					      </a>
					      <div class="card-body">
					        <h5 class="card-title"><b>${event.eventName}</b></h5>
<%-- 					        <p class="card-text line-limit-length">${event.eventBio}</p> --%>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted">活動日期：${event.eventDate}</small>
					      </div>
					    </div>
					  </div>
				  
					</c:forEach>
				</div>
					
			</div>	
		</section>
		<!-- 近期活動 end -->

    <!-- About me -->
    <section class="fh5co-about-me">
        <div class="about-me-inner site-container">
            <article class="portfolio-wrapper">
                <div class="portfolio__img">
                    <img src="/storestyle/images/logo-2color-2.png" class="about-me__profile" alt="about me profile picture">
                </div>
                <div class="portfolio__bottom">
                    <div class="portfolio__name">
                        <span style="color:#e6af41;">S</span>
                        <h2 class="universal-h2">wapooks</h2>
                    </div>
                    <hr width="300px" align="center">
                    <h2>以書會友</h2>
                    <p>換書 / 交朋友</p>
                    <p>供書，取書，知識的傳承</p>
                </div>
            </article>
            <div class="about-me__text">
                <div class="about-me-slider">
                    <div class="about-me-single-slide" align="left">
                        <h2 class="universal-h2 universal-h2-bckg" style="font-size:40px;">關於我們</h2>
                        <p style="font-size:25px; color:white;"><span style="font-size:30px; color:#e6af41;">二</span> 手書交換</p>
                        <p style="font-size:20px; color:white;">提供一個友善方便的平台給使用者，將身邊使用不到、仍具有閱讀價值的書籍轉手給有需要的人或單位。</p>
<!--                         <h4>Author</h4> -->
<!--                         <p class="p-white">See me</p> -->
						<hr style="color:white;">
                        <p style="font-size:25px; color:white;"><span style="font-size:30px; color:#e6af41;">書</span> 籍交流</p>
                        <p style="font-size:20px; color:white;">提供平台讓共同類別的書籍愛好者能夠分享與討論；或是舉行實體讀書會或講座，藉由書籍喜好拉近人與人間的距離。</p>
                    </div>
                    <div class="about-me-single-slide">
                        <h2 class="universal-h2 universal-h2-bckg">經營團隊</h2>
                        <!-- <p><span>H</span> e has work appearing or forthcoming in over a dozen venues, including Buzzy Mag, The Spirit of Poe, and the British Fantasy Society journal Dark Horizons. He is also CEO of a company, specializing in custom book publishing and social media marketing services, have created a community for authors to learn and connect.He has work appearing or forthcoming in over a dozen venues, including Buzzy Mag, The Spirit of Poe, and have created a community for authors to learn and connect.</p> -->
                        <ul>
                            <li>
                                <p><span>小翁</span>總經理
                                </p>
                            </li>
                            <li>
                                <p><span>小翔</span>董事長
                                </p>
                            </li>
                            <li>
                                <p><span>小楡</span>財務長
                                </p>
                            </li>
                            <li>
                                <p><span>小瑋</span>風控長
                                </p>
                            </li>
                            <li>
                                <p><span>小昀</span>行銷長
                                </p>
                            </li>
                        </ul>
                        <h4>Swapooks team</h4>
                        <!-- <p class="p-white">See me</p> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="about-me-bckg"></div>
    </section>
    <!-- About me end -->

		

    <!-- Counter -->
    <div class="fh5co-counter counters">
        <div class="counter-inner site-container">
            <div class="single-count">
                <span class="count" data-count="1266">0</span>
                <img src="/storestyle/images/counter-1.png" alt="counter icon"><hr>
                <div class="single-count__text">
                    <p style="font-size:24px;">書籍總量</p>
                </div>
            </div>
            <div class="single-count">
                <span class="count" data-count="374">0</span>
                <img src="/storestyle/images/counter-2.png" alt="counter icon"><hr>
                <div class="single-count__text">
                    <p style="font-size:24px;">成功交換</p>
                </div>
            </div>
            <div class="single-count">
                <span class="count" data-count="526">0</span>
                <img src="/storestyle/images/counter-3.png" alt="counter icon"><hr>
                <div class="single-count__text">
                    <p style="font-size:24px;">捐贈偏鄉</p>
                </div>
            </div>
            <div class="single-count">
                <span class="count" data-count="11">0</span>
                <img src="/storestyle/images/counter-4.png" alt="counter icon"><hr>
                <div class="single-count__text">
                    <p style="font-size:24px;">獲得獎項</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Counter -->



    <!-- Quotes -->
<!--     <section class="fh5co-quotes"> -->
<!--         <div class="site-container"> -->
<!--             <div class="about-me-slider"> -->
<!--                 <div> -->
<!--                     <h2 class="universal-h2 universal-h2-bckg">What People Are Saying</h2> -->
<!--                     <p>“Pudding croissant cake candy canes fruitcake sweet roll pastry gummies sugar plum. Tart pastry -->
<!--                         danish soufflé donut bear claw chocolate cake marshmallow chupa chups. Jelly danish gummi bears -->
<!--                         cake donut powder chocolate cake. Bonbon soufflé lollipop biscuit dragée jelly-o. Wafer pastry -->
<!--                         pudding tiramisu chocolate bar croissant cake. Pie caramels gummies danish.”</p> -->
<!--                     <img src="/storestyle/images/quotes.svg" alt="quotes svg"> -->
<!--                     <h4>David Dixon</h4> -->
<!--                     <p>Reader</p> -->
<!--                 </div> -->
<!--                 <div> -->
<!--                     <h2 class="universal-h2 universal-h2-bckg">What People Are Saying 2</h2> -->
<!--                     <p>“Pudding croissant cake candy canes fruitcake sweet roll pastry gummies sugar plum. Tart pastry -->
<!--                         danish soufflé donut bear claw chocolate cake marshmallow chupa chups. Jelly danish gummi bears -->
<!--                         cake donut powder chocolate cake. Bonbon soufflé lollipop biscuit dragée jelly-o. Wafer pastry -->
<!--                         pudding tiramisu chocolate bar croissant cake. Pie caramels gummies danish.”</p> -->
<!--                     <img src="/storestyle/images/quotes.svg" alt="quotes svg"> -->
<!--                     <h4>David Dixon</h4> -->
<!--                     <p>Reader</p> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Quotes end -->

    <!-- Social -->
<!--     <section class="fh5co-social"> -->
<!--         <div class="site-container"> -->
<!--             <div class="social"> -->
<!--                 <h5>Follow me!!</h5> -->
<!--                 <div class="social-icons"> -->
<!--                     <a href="#" target="_blank"><img src="/storestyle/images/social-twitter.png" alt="social icon"></a> -->
<!--                     <a href="#" target="_blank"><img src="/storestyle/images/social-pinterest.png" alt="social icon"></a> -->
<!--                     <a href="#" target="_blank"><img src="/storestyle/images/social-youtube.png" alt="social icon"></a> -->
<!--                     <a href="#" target="_blank"><img src="/storestyle/images/social-twitter.png" alt="social icon"></a> -->
<!--                 </div> -->
<!--                 <h5>Share it!</h5> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Social -->

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

<!-- ===================== 04. 前台套版 import js start ===================== -->
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

// 	window.onload(function(){
// 		$.ajax({
// 			type:'get',
// 			url:'/club/findallclubsfront'
//     	});

//     	$.ajax({
// 			type:'get',
// 			url:'/eventforfrontpage'
//     	});
// 	});
	
	
	//載入討論版文章、活動 update by Sean 05.09
    $(document).ready(function(){
    	$.ajax({
			type:'get',
			url:'/club/findallclubsfront'
    	});

    	$.ajax({
			type:'get',
			url:'/eventforfrontpage'
    	});
	});
    
    new Vue ({
		el:"#main",
		methods: {
			//確認是否為管理員(update by Sean 5.6)
			adminCheck(){
				window.location.href= "http://localhost:8080/mainpage";
			},			
			goToDetails(index ,row){
		        let booksid = row.booksId;
            	console.log(row.booksId); //Test
            	let	url="http://localhost:8080/store/store.booksDetailsToBooks";
            	window.location.href= url+"?id="+ booksid
				
		    },
		    loginCheck(){    
		    	console.log(this.userId.length);
		    	console.log("${userDetail.readerId}");
			    if(this.userId.length < 1){
				    console.log(this.userId);
					alert("請登入喔");
					window.location.href= "http://localhost:8080/readerlogin";
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

			   },
			 //==== 尚未更新 ====
		        clearOrder(){
		            	//發出指令
		            	axios({
		            		method:"GET",
		            		url:'http://localhost:8080/projectimprovement/CleanShoppingCar?todo=clean',	
		            	}).then(function(response){
		            		location.replace('http://localhost:8080/projectimprovement/MemberPageVue.jsp');
		            	})
		            },
		          //載入分頁
					loadPage(indexPage){
							let _this = this;
							axios({
								method:"POST",
								url:"http://localhost:8080/admin/findBooksByPage/"+indexPage
							}).then( function(response){
							_this.tableData = response.data;	
							console.log(_this.tableData);
							
					        _this.tableData.forEach((item)=>{
					        	console.log(item.bookimgsurl);
					        	//let url = item.bookimgsurl;
					        	//let newUrl = "http://localhost:8080/static/uploads/"+url;
					        	//_this.imgUrl.push(newUrl);
					        	//console.log(_this.imgUrl);
					        	//item.bookimgsurl = newUrl ;
					            })
					        console.log(_this.tableData);
							console.log(_this.bookTotalPages);
							console.log(_this.bookTotalElements);
							})
					},
					//改變分頁
					handleSizeChange(val) {				
	        				indexPage = val;
	        				console.log(`items per page` + val);
	      			},
	      			handleCurrentChange(val) {
	      					indexPage = val;
	       					console.log(`current page: ` + val);
	       					this.loadPage(indexPage)
	      			},
	      			removeItem(booksId){
	      					let _this = this;
							console.log(booksId);
							//發出請求
							axios({
   						method:"GET",
   						// 原本url:"http://localhost:8080/admin/books"
   						url:"http://localhost:8080/store/removeFromOrder/"+booksId
   			}).then( function(response){
							console.log(response.data);
							console.log(_this.shoppingCar.length);
							if(_this.shoppingCar.length <= 2){
								_this.shoppingCar = "";
							}
							location.replace('http://localhost:8080/store/searchAll');	

       			})
			      	},
   
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
				orderDetails:[]
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
<!-- ===================== 04. 前台套版 import js end ===================== -->

<script>
	//輪播測試
	$('.slideshow').each(function(){
	    
	    let slideImgs = $(this).find('img'),
	        slideImgsCount = slideImgs.length,
	        currentIndex = 0;
	    
	    slideImgs.eq(currentIndex).fadeIn();
	    
	    setInterval(showNextSlide, 3000);
	    
	    function showNextSlide(){
	        let nextIndex = (currentIndex + 1) % slideImgsCount;
	        console.log(nextIndex)
	        slideImgs.eq(currentIndex).fadeOut();
	        slideImgs.eq(nextIndex).fadeIn();
	        currentIndex = nextIndex;
	    }
	})	
</script>

</body>

</html>