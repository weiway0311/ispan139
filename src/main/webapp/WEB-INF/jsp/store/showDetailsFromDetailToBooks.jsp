<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="com.booksplattform.model.book.UserOrder" %>

 
<!DOCTYPE>
<html>

<head>

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

    <title>書本詳細資訊</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/storestyle/css/style.css">
    <link rel="stylesheet" href="/storestyle/css/slick.css">
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import font-awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">


    <!--<link rel="stylesheet" href="/storestyle/css/elementui.css">-->
    <title>書香平台</title>
    <!-- sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <style>
        html,
        body {
            margin: 0;
            padding: 0
        }

/*         body {
             font: 76% arial, sans-serif; 
             text-align: center 
         } */

/*         p {
             margin: 0 10px 10px
         } */

/*         a {
             padding: 5px;
             text-decoration: none; 
             color: #000000; 
         } */

        div#header {
            background-color: #F3F2ED;
        }

        div#header h1 {
            height: 80px;
            line-height: 80px;
            margin: 0;
            padding-left: 10px;
        }
/*
        div#container {
            text-align: center
        }

        div#content p {
            line-height: 1.4
        }

        div#navigation {}

        div#navigation ul {
            margin: 15px 0;
            padding: 0;
            list-style-type: none;
        }

        div#navigation li {
            margin-bottom: 5px;
        }

        div#extra {}

        div#footer {}

        div#footer p {
            margin: 0;
            padding: 5px 10px
        }

        div#container {
            width: 600px;
            margin: 0 auto
        }

        div#wrapper {
            float: left;
            width: 100%
        }

        div#content {
            margin-left: 200px
        }

        div#navigation {
            float: left;
            width: 100px;
            margin-left: -700px
        }

        div#extra {
            float: left;
            width: 150px;
            margin-left: -550px
        }

        div#footer {
            clear: left;
            width: 100%
        }
        */
        
          .line-limit-length {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap; 
}

.cartQuantity{
  position:absolute;
  width: 25px;
  height: 25px;
  border-radius:50%;
  display: flex;
  justify-content: center;
  align-items: center;
  right:-9px;
  top:-8px;
  color:red;
}
    </style>



    <!-- Google Books -->
    <script type="text/javascript" src="https://www.google.com/books/jsapi.js"></script>
    <script type="text/javascript">
        google.books.load();

        function initialize() {
            var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
            console.log('ISBN:' + booksAPI);
            viewer.load(booksAPI);
        }

        google.books.setOnLoadCallback(initialize);
    </script>
    <!-- Google Books end-->
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


        <!-- Top banner 背景黑圖 starts -->
        <section class="fh5co-top-banner">
            <div class="top-banner__inner site-container" style="margin-top:-50px;">
                <div id="container" style="display:flex; margin-bottom:30px;" >               		                   
	                    <div id="navigation" style="flex:30%; width:300px; margin-left:3%;">
<!-- 	                        <p><strong>書籍封面</strong></p> -->
	                        <!-- 
	    <ul>
	      <li><a href="http://www.free-css.com/">Free CSS Templates</a></li>
	      <li><a href="http://www.free-css.com/free-css-layouts.php">Free CSS Layouts</a></li>
	    </ul>
	     -->
	                        <img  :src="details.bookimgsurl" alt="..." width="250px" />
	                        <hr>
	                    	<h3 style="color:black;">{{details.booksName}}</h3>
	                        <hr>
	                    	<p class="lead" style="color:black;">作者: {{details.authorName}}</p>
	                    	
	                        
	                    </div>
	                    <div id="extra" style="flex:30%; margin-left:3%; width:300px;">
	                        <p style="font-size:20px;"><strong>詳細資訊：</strong></p>
	                        <p style="color:black;">書籍編號： BP-{{details.booksId}}</p>
	
	                        <p style="color:black;">ISBN : {{details.isbn}}</p>
	                        <p style="color:black;">出版社 : {{details.publisherName}}</p>
	                        <p style="color:black;">出版日 : {{details.publishDate}}</p>
	                        <p style="color:black;">
	                            <el-button style="color:white;" class="el-icon-info" type="info"
	                                @click="dialogVisibleBD = true">書籍簡介</el-button>
	                        </p>
	
	                        <!-- 書籍簡介開始 -->
	                        <el-dialog title="書籍簡介" :visible.sync="dialogVisibleBD" width="30%">
	                            <p>{{details.bookDescribe}}</p>
	                            <span slot="footer" class="dialog-footer">
	                                <el-button @click="dialogVisibleBD = false">關閉</el-button>
	                            </span>
	                        </el-dialog>
	                        <!-- 書籍簡介結束 -->
	
	
<!-- 	                        <p class="lead" style="color:black;">作者 : {{details.authorName}}</p> -->
	
	                        <p style="color:white;">
	                            <el-button style="color:white;" class="el-icon-info" type="info"
	                                @click="dialogVisibleAD = true">作者簡介</el-button>
	                        </p>
	
	                        <!-- 作者簡介開始 -->
	                        <el-dialog title="作者簡介" :visible.sync="dialogVisibleAD" width="30%">
	                            <p>{{details.authorInfo}}</p>
	                            <span slot="footer" class="dialog-footer">
	                                <el-button @click="dialogVisibleAD = false">關閉</el-button>
	                            </span>
	                        </el-dialog>
	                        <!-- 作者簡介結束 -->
	
	
	                        <div class="fs-5 mb-5">
	                            <span class="text-decoration-line-through"
	                                style="color:black;">{{"$"+ Math.floor(details.price)}}</span>
	                            <span class="lead" style="color:red;">{{"$"+details.price*0.8 }}</span>
	                        </div>
	                        <p style="color:black;">目前庫存 : {{details.quantity}}</p>
	                        <el-input-number v-model="amountShow" controls-position="right" size="small"
	                        @change="quantityChange" :min="1" :max="details.quantity"></el-input-number>
	                        
	                        
	                        <p style="margin-top: 15px;">
	                            <el-button type="primary" @click="prevPage">
	                                <i class="bi-cart-fill me-1"></i>
	                                返回
	                            </el-button>
	                            <!-- addToCart -->
	                            <el-button type="danger" @click="addToOrder(details)">
	                            	加入購物車                    
	                            </el-button>
	                        </p>
	                        
	                    </div>
<!-- 	                    <div id="footer"> -->
<!-- 	                        <p> -->
<!-- 	                            <el-button type="primary" @click="prevPage"> -->
<!-- 	                                <i class="bi-cart-fill me-1"></i> -->
<!-- 	                                返回 -->
<!-- 	                            </el-button> -->
<!-- 	                            addToCart -->
<!-- 	                            <el-button type="danger" style="float:right" @click="addToOrder(details)"> -->
<!-- 	                            	加入                     -->
<!-- 	                            </el-button> -->
<!-- 	                        </p> -->
<!-- 	                    </div> -->
	                    
	                    <div id="wrapper" style="flex:30%; margin-left:4%;">
			                 <div id="content">
			                     <!-- Books API -->
			                     <div id="viewerCanvas" style="width: 600px; height: 530px"></div>
			                 </div>
			             </div>
                </div>        
            </div>
        </section>
        <!-- Top banner 背景黑圖 ends -->

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
    <!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
        //選單 三 -> X
        function myFunction(x) {
            x.classList.toggle("change");
        }
        var booksAPI = '';
        //訂單
        var order =  new Array();
        
        new Vue({
            el: "#main",
            methods: {
            	//確認是否為管理員(update by Sean 5.6)
    			adminCheck(){
    				window.location.href= "http://localhost:8080/mainpage";
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
                addToCart() {},
                prevPage() {
                    window.location.href = "http://localhost:8080/store/searchAll";
                },
                handleCloseBD(done) {
                    this.$confirm('Are you sure to close this dialog?')
                        .then(_ => {
                            done();
                        })
                        .catch(_ => {});
                },
                quantityChange(details) {
                    console.log(details)
                },
              //在Details將物品加入訂單 
		      addToOrder(item){
		            	let _this = this;
		            	let tmpItem = {};
		            	//先加入readerID (custId)
		            	//console.log("${userDetail.readerId}");//test
		            	tmpItem.custId = "${userDetail.readerId}";
		            	tmpItem.booksId = item.booksId;
						tmpItem.booksName= item.booksName;
						tmpItem.price= item.price;
						tmpItem.quantity = _this.amountShow;
						tmpItem.itemTotal = item.price * tmpItem.quantity;          	
		            	//ajax傳回後端servlet
		            	axios({
		            		method:"POST",
		            		url:'http://localhost:8080/store/addToOrder',
		            		data:tmpItem,		//不須再轉為JSON字串, 否則須加上header設定Content type 'application/json"...
		            	}).then(function(response){
		            		//將資料加入確認清單 orderDetails
		            		_this.orderDetails = response.data

		            		//console.log("_this.orderDetailsis");  //test
			            	//console.log(_this.orderDetails);  //test
		            		console.log("${userOrder.bDetails}"); //TEST
		            		console.log("${userOrder.sum}"); //TEST
		            		let	url="http://localhost:8080/store/store.booksDetailsToBooks";
		                	window.location.href= url+"?id="+ item.booksId;
		            		//location.replace(url);
		            	
		            	})
		            	
		            },
		            checkout(){
			            console.log(this.sum ); //TEST
			            console.log(this.readerCoin); //TEST
			            //判斷書像幣是否足夠支付  Q:為何不能直接相比呢? readerCoin > sun
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
		            		location.replace('http://localhost:8080/store/searchAll');
		            	
		            	})

				       }
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
            data() {
                return {
                    tableData: [],
                    //詳細資料
                    details: {},
                    dialogVisibleBD: false,
                    dialogVisibleAD: false,
                    //商品加減數量預設1個
                    amountShow: 1,
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
            mounted: function () {
                //console.log(`${isbn}`); //TEST OK
                let _this = this;
                axios({
                    method: "GET",
                    url: "http://localhost:8080/store/searchbooks/" + `${id}`,
                }).then(function (response) {

                    console.log(response.data);

                    //let url = response.data.bookimgsurl;
                    //let newUrl = "http://localhost:8080/static/uploads/"+url;
                    let oldPublishDate = response.data.publishDate
                    let idx_T = oldPublishDate.indexOf("T"); //取出年月日 用T去拆分字串
                    let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日

                    //response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
                    response.data.publishDate = newPublishDate //換成只有年月日
                    _this.details = response.data;

                    console.log(newPublishDate);
                    //console.log("${userDetail.nickName}");  //TEST
                    booksAPI = response.data.isbn;

                    console.log("${userDetail.nickName}");  //測試印出Session資料 userDetail.nickName
        	        console.log("${userOrder.sum}");  //測試印出Session資料 訂單總額
        	        console.log("${userDetail.readerCoin}");  //測試印出Session資料 訂單總額
        	        console.log(_this.shoppingCar);  //測試印出Session資料
                })
            }
        })
    </script>
</body>

</html>