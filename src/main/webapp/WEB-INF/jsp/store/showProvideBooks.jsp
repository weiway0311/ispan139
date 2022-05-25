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
    <!-- import elementUI CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import font-awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<link
  rel="stylesheet"
  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
/>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!--<link rel="stylesheet" href="/storestyle/css/elementui.css">-->
    <title>書香平台</title>
    <!-- sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- import bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <style>
.el-table .warning-row {
	background: oldlace;
}

.el-table .success-row {
	background: #f0f9eb;
}

/* nvbar css */
.bg-yellow {
	background-color: #844200;
}

.keyword {
	margin: 30px 0px;
}
 .time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 150px;
    heigh:200px;
    display:block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
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
        .avatar-uploader .el-upload {
            border: 1px dashed #d9d9d9;
            border-radius: 6px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .avatar-uploader .el-upload:hover {
            border-color: #409EFF;
        }

        .avatar-uploader-icon {
            font-size: 28px;
            color: #8c939d;
            width: 178px;
            height: 178px;
            line-height: 178px;
            text-align: center;
        }

        .avatar {
            width: 178px;
            height: 178px;
            display: block;
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


        <!-- Top banner 背景黑圖 starts -->
        <!--
        <section class="fh5co-top-banner">
            <div class="site-container">
            		
            </div>
        </section>
        -->
        <!-- Top banner 背景黑圖 ends -->

	 <!-- 兩邊留白 -->
	        <div class='container' style="padding-top:120px; width:1000px; margin-bottom:50px;">
	            <div>
	                <!-- 新增書籍內容表單 -->
	                <el-form label-width="120px" class="demo-ruleForm">
	                    <div v-if="step === 1">
	                        <!--     <h1>第一部分</h1>  -->
	
	                        <el-steps :active="1" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                        </el-steps>
	
	                        <div>
	                            <legend for="booksName">書名:</legend>
	                            <input id="booksName" name="booksName" v-model="registration.booksName" />
	                        </div>
	                        <hr />
	                        <legend for="booksVarieties">書籍類別:</legend>
	                        <br />
	                        <div>
	                            <table>
	                                <tr>
	                                    <td> <input type="radio" id="b10" value="10" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b10">商業理財</label>
	                                    </td>
	                                    <td><input type="radio" id="b20" value="20" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b20">語言學習</label>
	                                    </td>
	                                    <td> <input type="radio" id="b30" value="30" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b30">電腦程式</label></td>
	
	                                </tr>
	                                <tr>
	                                    <td> <input type="radio" id="b40" value="40" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b40">藝術設計</label></td>
	
	                                    <td>
	                                        <input type="radio" id="b50" value="50" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b50">現代小說</label>
	                                    </td>
	                                    <td><input type="radio" id="b60" value="60" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b60">中文古典</label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td> <input type="radio" id="b70" value="70" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b70">外文小說</label>
	                                    </td>
	                                    <td>
	                                        <input type="radio" id="b80" value="80" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b80">親子教育</label>
	                                    </td>
	                                    <td>
	                                        <input type="radio" id="b90" value="90" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b90">生活風格</label>
	                                    </td>
	                                </tr>
	                            </table>
	
	                        </div>
	
	                        <hr />
	                        <!-- 圖片上傳 -->
	                        <div>
	                            <el-upload action="http://localhost:8080/admin/BookCoverAddController" list-type="picture-card"
	                                :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-change="show">
	                                <i class="el-icon-plus"></i>
	                            </el-upload>
	                            <el-dialog :visible.sync="dialogVisible">
	                                <img width="100%" :src="dialogImageUrl" alt="">
	                            </el-dialog>
	                            <hr />
	                            <!-- TEST -->
	                            <!-- 
	                            <div border="solid red">
	                                <img v-if="imageUrl" :src="imageUrl">
	                            </div>
	                            
	                            <hr>
	                             -->
	                            <legend for="publisherName">出版社:</legend>
	                            <input id="publisherName" name="publisherName" v-model="registration.publisherName" />
								<hr>
	                            <div>
	                                <el-button type="primary" icon="el-icon-arrow-right" @click.prevent="next()">下一頁
	                                </el-button>
	                                <button type="button" @click="oneClick()" class="btn">一鍵輸入</button>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div v-if="step === 2">
	                        <!--    <h1>第二部分</h1>  -->
	
	                        <el-steps :active="2" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                        </el-steps>
	
	                        <el-descriptions title="書籍資訊">
	                        	<el-descriptions-item label="國際標準書號(ISBN)"> <input id="isbn" name="isbne"
	                                    v-model="registration.isbn" /> </el-descriptions-item>
	                            <el-descriptions-item label="書籍簡介" prop="bookDescribe" label="書籍簡介">
	                                <el-input type="textarea" id="bookDescribe" name="bookDescribe"
	                                    v-model="registration.bookDescribe" />
	                            </el-descriptions-item>
	                        
	                        
<!-- 	                            <el-descriptions-item label="國際標準書號(ISBN)"> <input id="isbn" name="isbne" -->
<!-- 	                                    v-model="registration.isbn"> -->
<!-- 	                            </el-descriptions-item> -->
<!-- 	                            <el-descriptions-item label="書籍簡介" prop="bookDescribe" label="書籍簡介"> -->
<!-- 	                                <el-input type="textarea" id="bookDescribe" name="bookDescribe" -->
<!-- 	                                    v-model="registration.bookDescribe" style="width:300px;"/> -->
<!-- 	                            </el-descriptions-item> -->
	                        
	                        </el-descriptions>
	                        <hr>
	                        <el-descriptions title="出版日期">
	                            <el-descriptions-item label="選擇日期">                               		
	                                		<el-date-picker
      										v-model="registration.publishDate"
     										type="date"
      										placeholder="Pick a date"
      										default-value="2010-10-01">
    										</el-date-picker>
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <br />
	                        <hr>
	
	                        <el-button type="primary" icon="el-icon-arrow-left" @click.prevent="prev()">上一頁</el-button>
	                        <el-button type="primary" icon="el-icon-arrow-right" @click.prevent="next()">下一頁</el-button>
	                    </div>
	
	                    <div v-if="step === 3">
	                        <!--    <h1>第三部分</h1>  -->
	
	                        <el-steps :active="3" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>	                          
	                        </el-steps>
	
	                        <el-descriptions title="作者資訊">
	                            <el-descriptions-item label="作者"> <input id="authorName" name="authorName"
	                                    v-model="registration.authorName" /> </el-descriptions-item>
	                            <el-descriptions-item label="作者簡介" prop="authorInfo" label="書籍簡介">
	                                <el-input type="textarea" id="authorInfo" name="authorInfo"
	                                    v-model="registration.authorInfo" />
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <hr>
	                        <!-- 
	                        <el-descriptions title="其他資訊">
	                            <el-descriptions-item label="價格">
	                                <el-input-number v-model="registration.price" :min="1" :max="999"></el-input-number>
	                            </el-descriptions-item>
	                            <el-descriptions-item label="數量">
	                                <el-input-number v-model="registration.quantity" :min="1" :max="99">
	                                </el-input-number>
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <hr>
	                         -->
	                        <el-button type="primary" icon="el-icon-arrow-left" @click.prevent="prev()">上一頁</el-button>
	                        <el-button type="primary" icon="el-icon-check" @click.prevent="submit()">完成</el-button>
	                    </div>
	

	                </el-form>
	            </div>
	        </div>
	    </div>
	    </div>
    	</div>
	    </div>

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
        };
        //訂單
        var order = new Array();
      	//初始化分頁
    	var indexPage = 1;
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
                //加入購物車
                addToOrder() {},
                reset() {
                    window.location.href = "http://localhost:8080/store/searchAll";
                },
                handleClose(done) {
                    this.$confirm('Are you sure to close this dialog?')
                        .then(_ => {
                            done();
                        })
                        .catch(_ => {});
                },
    			goToDetails(index ,row){
    		        let booksid = row.booksId;
                	console.log(row.booksId); //Test
                	let	url="http://localhost:8080/store/store.booksDetailsToBooks";
                	window.location.href= url+"?id="+ booksid
    		    },
                //快速查詢用
                onSubmit() {
                    var _this = this;
                    //初步判斷
                    if (this.formInline.bookKeyWord == "") {
                        _this.searchResults = "";
                        document.getElementById("showZone").innerHTML = "請輸入查詢關鍵字...";
                    } else {
                        //清空
                        document.getElementById("showZone").innerHTML = "";

                        var keyword = this.formInline.bookKeyWord;

                        axios({
                            method: "GET",
                            url: "http://localhost:8080/admin/books/" + encodeURIComponent(keyword),
                        }).then(function (response) {

                            if (response.data != "") {
                                _this.tableData = response.data;
                                //修改 url 為完整路徑
                                _this.tableData.forEach((item) => {
                                    console.log(item.bookimgsurl);
                                    let url = item.bookimgsurl;
                                    let newUrl = "http://localhost:8080/static/uploads/" + url;

                                })
                            } else {
                                document.getElementById("showZone").innerHTML = "查無此書!!";
                            }
                            //_this.searchResults = response.data;
                            let num = response.data.length;
                            document.getElementById("showZone").innerHTML = "有 " + num + " 筆相符";
                            console.log(_this.searchResults);
                            //console.log(response.data); //test
                        })
                    }
                },
                //在主頁將物品加入訂單 
		        addToOrder(item){
	            	let _this = this;
	            	let tmpItem = {};
	            	//先加入readerID (custId)
	            	//console.log("${userDetail.readerId}");//test
	            	tmpItem.custId = "${userDetail.readerId}";
	            	tmpItem.booksId = item.booksId;
					tmpItem.booksName= item.booksName;
					tmpItem.price= item.price;
					tmpItem.quantity = 1;  //預設為1個
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
	            		//console.log("${userOrder.bDetails}"); //TEST
	            		//console.log("${userOrder.sum}"); //TEST
	            		location.replace('http://localhost:8080/store/searchAll');
	            	
	            	})
	            	
	            },
	            checkout(){
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
			      	prev() {
	                    if (this.step > 2 && this.step <= 6) {
	                        this.step = 2;
	                    } else {
	                        this.step--;
	                    }
	                },
	                next() {
	                    if (this.step === 2 && this.registration.qPicked === "1") {
	                        this.step++;
	                    } else if (this.step === 2 && this.registration.qPicked === "2") {
	                        this.step += 2;
	                    } else if (this.step === 2 && this.registration.qPicked === "3") {
	                        this.step += 3;
	                    } else if (this.step > 2 && this.registration.qPicked !== "NULL") {
	                        this.step = 6;
	                    } else {
	                        this.step++;
	                    }
	                },
	                submit() {
	                	//確認有無null
	           		 if(this.registration.authorName==null|| this.registration.booksName==null){
	           			 Swal.fire({
	           				  icon: 'error',
	           				  title: '必要欄位未填寫',
	           				  text: '書名及作者名為填寫(必填)',
	           				})
	                    }else{
	                	Swal.fire({
	                		  title: '確定要新增嗎?',
	                		  icon: 'warning',
	                		  showCancelButton: true,
	                		  confirmButtonColor: '#3085d6',
	                		  cancelButtonColor: '#d33',
	                		  confirmButtonText: '確定',
	                		  cancelButtonText: '取消',
	                		}).then((result) => {
	                		  if (result.isConfirmed) {
	                    		 
	                		    Swal.fire(
	                		      '新增成功!',
	                		      '書籍已成功上架!',
	                		      'success',
	                		    );
	                            console.log(this.registration);
	                            _this = this;
	                            axios({
	                                method: "POST",
	                                url: "http://localhost:8080/store/addbook",
	                                data: _this.registration
	                            }).then(function (response) {

	                                console.log(response.data);
	                                if (response.data) {
	                                    console.log("OK")
	                                    window.location.href =
	                                        "http://localhost:8080/store/searchAll";
	                                }
	                                
	                            })
	                		    
	                		  
	                		  }
	                		})
	                		
	                    }	
	                },
	                //及時預覽作用
	                handleRemove(file, fileList) {
	                    console.log(file, fileList);
	                    this.registration.bookimgsurl = '';
	                    this.imageUrl = ''; //清空
	                    //console.log(this.bookimgsurl)
	                },
	                handlePictureCardPreview(file) {
	                    this.dialogImageUrl = file.url;
	                    this.dialogVisible = true;
	                    console.log(file)

	                },
	                show(file, fileList) {
	                    let _this = this;
	                    let fileRaw = file.raw;
	                    //console.log(file.raw);//
	                    //console.log(fileList);    
	                    return new Promise(function (resolve, reject) {
	                        const reader = new FileReader();
	                        let imgUrlBase64 = '';
	                        reader.readAsDataURL(fileRaw);
	                        reader.onload = function () {
	                            imgUrlBase64 = reader.result;
	                            //console.log(imgUrlBase64);
	                            _this.registration.bookimgsurl = imgUrlBase64;

	                        }
	                        reader.onerror = (e) => {
	                            reject(e)
	                        }
	                        reader.onloadend = () => {
	                            resolve(imgUrlBase64);
	                            _this.imageUrl = imgUrlBase64;
	                            //console.log(_this.registration.bookimgsurl)
	                        }

	                    })
	                },
	                oneClick(){
					//一鍵輸入
					this.registration.booksName = '劉墉談親子教育的40堂課';
					this.registration.booksVarieties = '80';
					this.registration.publisherName = '臺灣商務';
					this.registration.isbn = '9570532033';
					this.registration.bookDescribe = '劉墉老師首次集結一生的教育心得！與我們一起進入「斜槓教養」時代。沒有高深的理論，但有實用的方法；沒有狼爸虎媽的怒吼，但有寬容諒解的叮嚀。劉墉老師結合心理學與諮商經驗，唯一專門講給父母，從全方面談親子教育的40堂課！ 邁入斜槓世代，親子互動的創意與智慧──父母該如何引導孩子發揮天賦，培養多元力？從學齡前的大腦開發、入學後的同儕競爭，到出社會後適應多職人生，劉墉老師從自身的教養、諮商經驗談起，結合心理學及特教概念，突破教養成規、探討青春期的腦內風暴，提供斜槓世代親子相處的創意與技巧！';
					const pDate = new Date();
					pDate.setFullYear(2019,6.1);
					this.registration.publishDate = pDate;
					this.registration.authorName = '劉墉';
					this.registration.authorInfo = '畫家、作家。在世界各地舉行過三十多次個展，在兩岸出版文學著作、繪畫理論、工具書及畫冊一百餘種，被譯為英、韓、泰、越等各國文字。是一個以自由的心情在生活，認真的態度在學習的人。有一顆很熱的心用來體會，一對很冷的眼用來辨別、一雙很勤的手用來分享、兩條很忙的腿用來超越。';
						

	 		       }
			      	

            },
            data() {
                return {
                	step: 1,
                	registration: {
                        name: null,
                        email: null,
                        qPicked: null,
                        booksName: null,
                        booksVarieties: null,
                        publisherName: null,
                        bookimgsurl: null,
                        bookDescribe: null,
                        isbn: null,
                        publishDate: null,
                        authorName: null,
                        authorInfo: null,
                        price: null,
                        quantity: null,
                        providerId :"${userDetail.readerId}",
                    },
                    num: 1,
                    imageUrl: "",
                    dialogImageUrl: '',
                    dialogVisible: false,
                    tableData: [],
                    //詳細資料
                    details: {},
                    formInline: {
                        bookKeyWord: ''
                    },
                    //快速查詢結果用
                    searchResults: [],
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
    				//分頁
    				bookTotalPages:'',
    				bookTotalElements:'',
    				currentPage:indexPage,


    		        
                }
            },
    	    mounted:function(){
				if(this.registration.providerId ==''){
					 alert("請先登入");
					 window.location.href = "http://localhost:8080/readerlogin";
					}
				console.log(this.registration.providerId );
    	    	var swiper = new Swiper(".mySwiper", {
    	            effect: "cards",
    	            grabCursor: true,
    	            autoplay: {
    	                delay: 1000,
    	                disableOnInteraction: false,
    	              }
    	          });

  	          
    			let _this = this;
    			axios({
    				method:"POST",
    				// 原本url:"http://localhost:8080/admin/books"
    				url:"http://localhost:8080/admin/findBooksByPage/"+indexPage
    			}).then( function(response){

				//=========================================TEST 用, 只先存三筆資料===================
        		//_this.tableData.push(response.data[0]);
        		//_this.tableData.push(response.data[1]);
        		//_this.tableData.push(response.data[2]);
    			//_this.tableData = response.data;	
    			//console.log(_this.tableData);
    			
    	        _this.tableData.forEach((item)=>{
    	        	let oldPublishDate = item.publishDate
    	        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
    	        	let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日
    	        	
    	        	//response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
    	        	item.publishDate = newPublishDate //換成只有年月日     
       			})
				_this.tableData = response.data;
       			 //Session 取值
   		         _this.bookTotalPages = Number("${bookTotalPages}"),  // typeof 為String => 轉int
   		         _this.bookTotalElements = Number("${bookTotalElements}"),   // typeof 為String => 轉int
       	        //console.log(_this.tableData);
       	        console.log("${userDetail.nickName}");  //測試印出Session資料 userDetail.nickName
       	        console.log("${userOrder.sum}");  //測試印出Session資料 訂單總額
       	        console.log("${userDetail.readerCoin}");  //測試印出Session資料 訂單總額
       	        console.log(_this.shoppingCar);  //測試印出Session資料
       	        console.log(_this.bookTotalPages);  //測試印出Session資料
       	        console.log(_this.bookTotalElements);  //測試印出Session資料
       	     	console.log(_this.currentPage);
    	        
    	        })
    	            
    	    }
        })
    </script>
</body>

</html>