<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- google第三方登入 -->
<meta name="google-signin-client_id"
	content="988615800078-17b8ekmm8m3q97rq5s7q120m554tpcc3.apps.googleusercontent.com">

<title>以書會友 SWAPOOKS</title>

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<!-- ==============================下面是套版=============================== -->
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<!-- ==============================上面是套版=============================== -->


<!-- import CSS -->	
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- bootstrap -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->
	
<!-- <link href="css/styles.css" rel="stylesheet" /> -->
<!-- <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script> -->

</head>
<!-- =============================下面是套版============================= -->
<!-- <body class="bg-gradient-primary"> -->
<body>
<!-- =============================上面是套版============================= -->

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
	<!-- google帳號登入登出 ======================================== -->
		<!--
		<img id="img">
		<div class="g-signin2" data-theme="filled_blue" data-size="large"
			data-onsuccess="onSignIn"></div>
		<a href="http://localhost:8080/booksplattform/homepage.html"
			onclick="signOut();">Sign out</a>
		-->
	<!-- ======================================================== -->
	
	<div class="container" id="login">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h3 text-gray-900 mb-4">Hi! 歡迎回來</h1>
                                    </div>
                                    <span id="msgAuth" style='color: rgb(255, 0, 0);'>${msgAuth}</span>
                                    <form class="user" method='post' action='/readerlogin'>
                                        <div class="form-group">
                                            <input id="inputEmail" type="text" name="username"  class="form-control form-control-user"
                                                aria-describedby="emailHelp"
                                                placeholder="請輸入email" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="inputPassword" name="password" class="form-control form-control-user"
                                                placeholder="請輸入密碼" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="inputVerifyCode" name="imageCode" class="form-control form-control-user"
                                                placeholder="請輸入驗證碼" required/>
                                        </div>
                                        <div class="form-group" align="center">
                                           	<img src="/code/image"/>
											<button type="button" onclick="location.reload()" style="border-radius:50%; border: none; color:green; background-color: white;">
												<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
				  									<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
				  									<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
												</svg>
											</button>
                                        </div>
<!--                                         <div class="form-group"> -->
<!--                                             <div class="custom-control custom-checkbox small"> -->
<!--                                                 <input type="checkbox" class="custom-control-input" id="customCheck"> -->
<!--                                                 <label class="custom-control-label" for="customCheck">Remember -->
<!--                                                     Me</label> -->
<!--                                             </div> -->
<!--                                         </div> -->
										<div>
										
										</div>
										<input type='submit' class="btn btn-primary btn-user btn-block" value='登入'>
										<input type='button' class="btn btn-warning btn-user btn-block" onclick="location.href='http://localhost:8080/store/booksMain'" value='返回首頁'>
<!--                                         <a href="index.html" class="btn btn-primary btn-user btn-block"> -->
<!--                                             登入 -->
<!--                                         </a> -->

<!--                                         <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                                             <i class="fab fa-google fa-fw"></i> Login with Google -->
<!--                                         </a> -->
<!--                                         <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                                             <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook -->
<!--                                         </a> -->
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="http://localhost:8080/forgotpwdpage">忘記密碼?</a>
                                    	&emsp;/&emsp;
                                        <a class="small" href="http://localhost:8080/gotoregisterpage">註冊成為書友</a>
                                    </div>
                                    <div class="text-center">
                                    </div>
                                    <hr>
                                    <div class="text-center">
<!--                                     	<button onclick="adminOneClick()">管理員登入</button> -->
<!--                                         <button onclick="readerOneClick()">一般書友登入</button> -->
										<el-button type="info" onclick="adminOneClick()" plain>管理員登入</el-button>
                                        <el-button type="info" onclick="readerOneClick()" plain>一般書友登入</el-button>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
           
            <!-- 回傳登入驗證的錯誤訊息 -->
			<div class="row justify-content-center align-items-center">
				<div class="col-3 cerror">
	<%-- 				<span style='color: rgb(255, 0, 0);'>${errors.msg}</span> --%>
	<%-- 				<input type="hidden" value="${errorCode}" id="errorCode"> --%>
	<%-- 				<span style='color: rgb(255, 0, 0);' id="errorCode">${errorCode}</span> --%>
				</div>
			</div>
            
            <!-- 登入身分的即時驗證 -->
<!-- 			<div class="row justify-content-center align-items-center"> -->
<!-- 				<div class="col-3 cerror"> -->
<!-- 					<span id="showZone"></span> <span id="showZone"></span> -->
<!-- 				</div> -->
<!-- 			</div> -->
            </div>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="js/vue.js"></script>
		<script src="https://unpkg.com/element-ui/lib/index.js"></script>
		
		<!-- =============================下面是套版============================= -->
        <!-- Bootstrap core JavaScript-->
	    <script src="vendor/jquery/jquery.min.js"></script>
	    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
        <!-- Bootstrap core JavaScript-->
	    <script src="vendor/jquery/jquery.min.js"></script>
	    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="js/sb-admin-2.min.js"></script>
	    <!-- =============================上面是套版============================= -->
	    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="js/sb-admin-2.min.js"></script>
	    <!-- =============================上面是套版============================= -->
               
        
        
        <script>
			// 一鍵輸入 ===============================================================
			function adminOneClick(){
				$("#inputEmail").val("admin@gmail.com");
				$("#inputPassword").val("12345678");
			}

			function readerOneClick(){
				$("#inputEmail").val("kkws1415@gmail.com");
				$("#inputPassword").val("12345678");
			}
        
        	// 重新整理按鈕 ===============================================================
	        $(document).ready(function(){
	    		console.log($('#errorCode').html());
	    	});
	    	
	     	// 登入前驗證 ===============================================================
	    	new Vue ({
	    		el:"#login",
	    		methods: {
	    			check(){
	    				//let i = this.checkAcc;  //test
	    				//console.log(i);  //test
	    			
	    	            var email =  this.checkAcc
	    	            console.log(email);
	    				
	    				if(email != ""){
	    	            
	    				var _this = this;
	    	            axios({
	    					method:"GET",
	    					url:"http://localhost:8080/verifybyemail?email="+ encodeURIComponent(email),
	    				}).then( function(response){
	    					if( response.data != ""){
	    						//var tmp = response.data.fullName;
	    						var tmp = response.data;
	    						if(tmp != undefined ){
	    							console.log(response.data.fullName); //test
	    							document.getElementById("showZone").innerHTML = '<i class="el-icon-check"></i>'+ "  "+ response.data.fullName+"您好<br>請輸入密碼!!";
	    	
	    							
	    						}else{
	    							document.getElementById("showZone").innerHTML = '<i class="el-icon-warning-outline"></i>' + "  " + "無此用戶, 馬上註冊書友吧!";
	    						}
	    					}	
	    				})
	    				}else{
	    					document.getElementById("showZone").innerHTML = '<i class="el-icon-warning-outline"></i>' + "  " + "請輸入書友信箱, 尚未申請的話馬上註冊書友吧!";
	    				}
	    			}
	    	    },
	    		    data() {
	    		      return {
	    		    	  "checkAcc":"",  
	    		      }
	    	   },
	      	})

	    	// Google 第三方登入(初步執行ok，但先暫時關閉) ===============================================================
// 		    function onSignIn(googleUser) {
// 		        var profile = googleUser.getBasicProfile();
// 		        //console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
// 		        //console.log('Name: ' + profile.getName());
// 		        //console.log('Image URL: ' + profile.getImageUrl());
// 		        //console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		       
// 		        document.getElementById("img").src = profile.getImageUrl();
		       
// 		        let obj={
// 		      		  //name : profile.getName(),
// 		      		  fullName : profile.getName(), //try by Sean 3.18
// 		      		  email : profile.getEmail()	  
// 		        }
		       
// 		        axios({
// 		    		method:"POST",
// 		    		url:'http://localhost:8080/booksplattform/readerLoginFromGoogle.controller',
// 		    		data:obj,
// 		    	}).then(function(response){
// 		    		location.replace('http://localhost:8080/booksplattform/gotoMemberPage.controller');
// 		    	})
		       
// 		        //console.log(obj);//test
// 		     }
	
// 		    function signOut() {
// 		        var auth2 = gapi.auth2.getAuthInstance();
// 		        auth2.signOut().then(function () {
// 		          console.log('User signed out.');
// 		          location.replace('http://localhost:8080/booksplattform/readerLoginPage.controller');
// 		      });
// 		    }
        </script>
        
				

</body>
</html>