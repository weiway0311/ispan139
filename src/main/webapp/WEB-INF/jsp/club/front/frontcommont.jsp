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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
		
<!-- 		測試 -->




	<link href="../css/sb-admin-2.css" rel="stylesheet">
	
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>






<!-- 		測試 -->

<title>以書會友 | 書友專區</title>

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
.tb1{
            /* width: 400px; */
            border: 2px solid gray;
            border-collapse: collapse;
        }
        .td1{
            /* border: 1px solid red; */
            background-color:#987456;
            text-align: center;
            /*height: 250px;*/
            width: 170px;
            vertical-align:top;
        }
        .td1comm{
            /* border: 1px solid red; */
            background-color:#f5deb3;
            text-align: center;
            /*height: 250px;*/
            width: 170px;
            vertical-align:top;
        }
        .td2{
            /* border: 1px solid red; */
            /* text-align:center; */
            float: left;
            /*height: 250px;*/
            width: 910px;
        }
        .div1{
            height: 45px;
            width: auto;
            /* background-color: aqua; */
            border-bottom: 1px solid;

        }
        .div1comm{
            height: 45px;
            width: auto;
            /* background-color: aqua; */
			/* border-bottom: 1px solid; */

        }
        .div2{
            word-break:break-all ;
            /* background-color: red; */
            
        }
        .div3{
        	border-top: 1px solid ;
            height: 45px;
            width: 900px;
            /* background-color: aqua; */
        }
        .tb2{
            /*width: 600px;*/
            height: 260px;
        }
        /* 測試 */
        .divright{
            float: right;
            line-height: 40px;
        }
        .divleft{
            float: left;
            /* line-height: 10px; */
            
        }

    </style>

</head>
<body>
<div id="main">
<%
	Integer items = 0;
	UserOrder userOrder = (UserOrder)session.getAttribute("userOrder");
	if( userOrder != null){
		items =	userOrder.getbDetails().size();
	}
%>


	 <!-- Navigation -->
<!--         <nav class="site-navigation"> -->
        <nav class="site-navigation">
            <div class="site-navigation-inner site-container">
                <a href="http://localhost:8080/store/booksMain"><img src="/storestyle/images/logoname-white.png" height="45" alt="site logo"></a>
                <div class="main-navigation">
                    <ul class="main-navigation__ul">
                        <el-avatar style="color:black" v-if="nickName">${userDetail.nickName}</el-avatar>
                        <li><a href="http://localhost:8080/store/booksMain">首頁</a></li>
                        <li><a href="http://localhost:8080/store/searchAll">我想找書</a></li>
                        <li><a href="#">我想供書</a></li>
                        <li><a href="#">我想發表</a></li>
                        <li><a href="#">我想交流</a></li>
                        <li><a href="http://localhost:8080/store/memberpage">我的帳戶</a></li> <!-- update by Sean 4/26 -->
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
        
        <!-- Member top bar start -->
        <section class="fh5co-blog" style="padding-top:100px; margin:0px auto; width:700px;">
        	<div class="container member-top" align="center">
        		<h2 style="margin-bottom:20px;">討論版</h2>

                <hr>
                
            </div>
        </section>       
        <!-- Member top bar end -->
	
	<!-- 主要內容 start -->
	<section class="fh5co-blog">
	<div class="site-container">
	<div class="container" style="margin: 0px 10px;">
		<!-- try-start -->
		<div class="card o-hidden border-0 shadow-lg my-4">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                        		
    <input  type="button" value="返回討論區" id="back" onclick="back()" class="btn btn-primary">
	<input  type="button" value="新建回復" id="add" onclick="add(${userDetail.readerId})" class="btn btn-success">
	<hr>
	
	<table class="tb1">
            <tbody>
                <tr>
                    <td class="td1">
	                    <div >
	                    	<br>
	                    	<img src="/showreaderphoto/${reader.readerId}" width='150'/>
<%-- 	                    	<p  style="color:white;">暱稱:${reader.nickName}</p> --%>
	                    	<br>
	                    	<span style="color:white;">暱稱:${reader.nickName}</span>
	                    	<br>
	                    	<span style="color:white;">LV:${reader.readerLevel}</span>
	                    	
	                    </div>
                    </td>
                    <td class="td2">
                        <table class="tb2">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="div1" id="articleHeader">
                                            <p>標題：${club.articleHeader}</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div1comm" id="articleHeader">
                                            文章：
                                            
                                            <c:if test="${userDetail.readerId != null}">
                                            <c:if test="${reader.readerId != userDetail.readerId}">
                                           	 	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal0" style="float:right;">檢舉</button>
                                            </c:if>	
                                            </c:if>	

												  <div class="modal fade" id="myModal0" role="dialog">
												    <div class="modal-dialog">
									
												      <div class="modal-content">
												        <div class="modal-header" style="vertical-align:text-bottom;">
												          <h4 class="modal-title">檢舉內容</h4>
												          <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
												        </div>
												        <div class="modal-body">
												        	<form action="/club/crepofrontAddController" method="post" class="divright">
												        		<input type="hidden" name="clubId" value="${club.clubId}" />
												        		<input type="hidden" name="commentId" value="0" />
												        		<input type="hidden" name="articleBody" value='${club.articleBody}' />
												        		<input type="hidden" name="reportWho" value='${reader.nickName}' />
												        		<textarea rows="4" cols="53" name="reportartcle" style="resize: none;"></textarea>
												        		<hr>
												        		<button type="submit" id="submit" class="btn btn-danger">檢舉</button>
												        	</form>
												        </div>
												      </div>     
												    </div>
												  </div>

                                            
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div2" id="articleBody" style="padding:15px 20px;">
                                            ${club.articleBody}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="vertical-align:bottom;" valign="bottom">
                                        <div class="div3">
                                            <div class="divleft">
                                                <p id="clubDate">日期：${club.clubDate}</p>
                                            </div>
                                            <div class="divright">
                                            <c:if test="${reader.readerId ==userDetail.readerId}">
                                            	<button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='/club/clubfrontSearchById?id=${club.clubId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>
												<span> | </span>
												<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteclub(${club.clubId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>
											</c:if>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    
	
	<c:forEach items="${comms}" var="comms">
		<table class="tb1" >
            <tbody>
            	
                    <td class="td1comm">
	                    <div>
	                    	<br>
	                    	<img src="/showreaderphoto/${comms[1].readerId}" width='150'/>
	                    	<br>
	                    	<span style="color:black;">暱稱:${comms[1].nickName}</span>
	                    	<br>
	                    	<span style="color:black;">LV:${comms[1].readerLevel}</span>
	                    </div>
                    </td>
                    
                    <td class="td2">
                        <table class="tb2" style="vertical-align:bottom;" valign="bottom">
                            <tbody>
                            	
                			<tr>
                                <tr>
                                    <td>
                                        <div class="div1comm" id="articleHeader">
                                            文章：
                                            <c:if test="${userDetail.readerId != null}">
                                            <c:if test="${comms[1].readerId !=userDetail.readerId}">
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal${comms[0].commentId}" style="float:right;">檢舉</button>
											</c:if>                                            
											</c:if>                                            

												<!-- Modal -->
												  <div class="modal fade" id="myModal${comms[0].commentId}" role="dialog">
												    <div class="modal-dialog">
									
												<!--       Modal content -->
												      <div class="modal-content">
												        <div class="modal-header" style="vertical-align:text-bottom;">
												          <h4 class="modal-title">檢舉內容</h4>
												          <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
												        </div>
												        <div class="modal-body">
												        	<form action="/club/crepofrontAddController" method="post" class="divright">
												        		<input type="hidden" name="clubId" value="${comms[0].clubId}" />
												        		<input type="hidden" name="commentId" value="${comms[0].commentId}" />
												        		<input type="hidden" name="articleBody" value='${comms[0].articleBody}' />
												        		<input type="hidden" name="reportWho" value='${comms[1].nickName}' />
												        		<textarea rows="4" cols="53" name="reportartcle" style="resize: none;"></textarea>
												        		<hr>
												        		<button type="submit" id="submit" class="btn btn-danger">檢舉</button>
												        	</form>
												        </div>
												      </div>     
												    </div>
												  </div>

                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div2" id="articleBody" style="padding:25px 20px">
                                            ${comms[0].articleBody}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:bottom;" valign="bottom">
                                        <div class="div3">
                                            <div class="divleft">
                                                <span id="clubDate">日期：${comms[0].clubDate}</span>
                                            </div>
                                            <div class="divright">
                                            <c:if test="${comms[1].readerId ==userDetail.readerId}">
                                            	<button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='/club/CommentfrontInsertById?id=${comms[0].commentId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>
												<span> | </span>
												<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deletecomm(${comms[0].commentId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>
                                            </c:if>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
	</c:forEach>
                        		
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>	
        <!-- try-end -->
			
		</div>
	</section>
	
</div>

	<!-- 主要內容 end -->
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
                    	<p><a href="#" style="color:white; text-decoration:none;">我要註冊</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">我的訂單</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">帳戶管理</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">忘記密碼</a></p>
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">二手書架</h5>
                    <div class="contact-form">
                    	<p><a href="#" style="color:white; text-decoration:none;">瀏覽書架</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">我的書架</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">我的收藏</a></p>
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">社群活動</h5>
                    <div class="contact-form">
                    	<p><a href="#" style="color:white; text-decoration:none;">社群討論</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">近期活動</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">我的文章</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">我的活動</a></p>
                    	
                    </div>
                </div>
                <div class="footer-contact-form" style="margin-left: 100px;">
                    <h5 style="color:#e6af41">公益閱讀</h5>
                    <div class="contact-form">
                    	<p><a href="#" style="color:white; text-decoration:none;">捐贈書籍</a></p>
                    	<p><a href="#" style="color:white; text-decoration:none;">捐款贊助</a></p>
                    	
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="site-container footer-bottom-inner">
                <p>© 2019 Author | Design by <a href="https://freehtml5.co/" target="_blank">freehtml5.co</a> | All
                    rights Reserved.</p>
                <span style="color:white;">Copyright &copy; SWAPOOKS 2022</span>
            </div>
        </div>
    </footer>
    <!-- Footer end -->
    
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
	function add(readerId){
		if(readerId == null){
			location.href = "/readerlogin";
		}else{
			location.href = "/club/CommentfrontAddById?clubId=${club.clubId}";
		}
		
	}

	function deleteclub(clubid){
		console.log('123');
		Swal.fire({
			title: '確定要刪除嗎?',
            icon: 'warning',
            showCancelButton: true, //是否需要 "取消" 的按鈕
            confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
            cancelButtonColor: '#d33', //"取消" 按鈕的顏色
            confirmButtonText: '確定',
            cancelButtonText: '取消',
		}).then((result) => {
				if(result.isConfirmed){
					$.ajax({
						type:'delete',
						url:'/club/clubDeleteById2/'+clubid,
						datatype:'json',
						contentType:'application/json',
						success:function(data){
							if(data!=null){
								Swal.fire(
									'刪除成功!', //大標
   			                        '已成功刪除文章!', //小標
   			                        'success', //圖案
								).then(function(){
									location.href="/club/frontclub.controller";
								});
							}
						},complete:function(){}
					});
				}
			})
	}

	function deletecomm(commid){
		console.log('123');
		Swal.fire({
			title: '確定要刪除嗎?',
            icon: 'warning',
            showCancelButton: true, //是否需要 "取消" 的按鈕
            confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
            cancelButtonColor: '#d33', //"取消" 按鈕的顏色
            confirmButtonText: '確定',
            cancelButtonText: '取消',
		}).then((result) => {
				if(result.isConfirmed){
					$.ajax({
						type:'delete',
						url:'/club/CommDeleteById2/'+commid,
						datatype:'json',
						contentType:'application/json',
						success:function(data){
							if(data!=null){
								Swal.fire(
									'刪除成功!', //大標
   			                        '已成功刪除文章!', //小標
   			                        'success', //圖案
								).then(function(){
									location.reload();
								});
							}
						},complete:function(){}
					});
				}
			})
	}
	
	function back(){		
		location.href = "/club/frontclub.controller";
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