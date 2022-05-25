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
<title>以書會友 | 書友註冊</title>

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

<!-- import element ui css -->	
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->
	
<!-- <link href="css/styles.css" rel="stylesheet" /> -->
<!-- <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script> -->

</head>
<!-- <body class="bg-gradient-primary"> -->
<body>

	<div class="container" id="register">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">註冊成為書友</h1>
                            </div>
                            <form class="user" method='post' action=''>
                            	<div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="inputEmail" placeholder="Email*">
                                	<span id="msgEmail" style='color: rgb(255, 0, 0);'></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="inputFullName" placeholder="姓名*">
                                    <span id="msgName" style='color: rgb(255, 0, 0);'></span>
                                </div>                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="inputPassword" placeholder="密碼* (至少8位數/英數字)">
                                    	<span id="msgPwd" style='color: rgb(255, 0, 0);'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" id="inputPasswordConfirm" placeholder="確認密碼*">
                                    	<span id="msgPwd2" style='color: rgb(255, 0, 0);'></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="nickname" placeholder="暱稱">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="phone" placeholder="聯絡電話">
                                </div>
                                <div class="row mb-3">
                                	<div class="col-md-6">
                                    	<div class="form-check mb-3 mb-md-0">
                                    		<input class="form-check-input" type="radio" name='gender' value='男' id="gender" checked />
						    				<label class="form-check-label" for="flexRadioDefault1">男性讀者</label>
                                		</div>
                                    </div>
                                    <div class="col-md-6">
                                    	<div class="form-check mb-3 mb-md-0">
                                        	<input class="form-check-input" type="radio" name='gender' value='女' id="gender" />
				  							<label class="form-check-label" for="flexRadioDefault2">女性讀者</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                	<input class="form-control form-control-user" type='text' id="birth" name='birth' placeholder="生日*" onfocus="(this.type='date')" onblur="(this.type='text')" required />
                                    <span id="msgBirth" style='color: rgb(255, 0, 0);'></span>
                                </div>
<!--                                 <a href="login.html" class="btn btn-primary btn-user btn-block">註冊</a> -->
                                <button class="btn btn-primary btn-user btn-block" type="button" onclick="createAccount()" align="center">註冊</button>
                                
<!--                                 <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                                     <i class="fab fa-google fa-fw"></i> Register with Google -->
<!--                                 </a> -->
<!--                                 <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                                     <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook -->
<!--                                 </a> -->
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="http://localhost:8080/forgotpwdpage">忘記密碼?</a>
                                &emsp;/&emsp;
                                <a class="small" href="http://localhost:8080/readerlogin">返回登入頁</a>
                            </div>
                            <hr>
                            <div align="right">
<!--                             	<button type="button" onclick="oneClick()" class="btn btn-outline-dark">一鍵輸入</button> -->
                            	<el-button type="info" onclick="oneClick()" plain>一鍵輸入</el-button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
	
		
	<!-- =============================下面是套版============================= -->
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    <!-- =============================上面是套版============================= -->
    
    <!-- 03. import sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
    <!-- import vue.js -->
    <script src="js/vue.js"></script>
    <!-- import element ui js -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
	
	<script>
		new Vue ({
			el:"#register"
		});
	
		// 驗證email是否存在 -----------------------------------------------------------
		$("#inputEmail").on("blur", function(){
			var email = $("#inputEmail").val();

			var re = /^.+@.+\..{2,3}$/;
			
			if(email != ""){
				if(re.test(email)){
					$.ajax({
						type:'get',
						url:'/verifyemail/' + email,
						dataType:'json',
						contentType:'application/json',
						success:function(data){
							if(data != null){
								$("#msgEmail").html("此信箱已存在，請使用其他信箱");
							}else{
								$("#msgEmail").empty("");
							}
						}
					});
				}else{
					$("#msgEmail").html("信箱格式不符");
				}
				
			}			
		});

		// 確認密碼是否有8位數 -----------------------------------------------------------
		$("#inputPassword").on("blur", function(){
			var password = $("#inputPassword").val();
			if(password.length < 8){
				$("#msgPwd").html("密碼不得低於8位數");
			}else{
				$("#msgPwd").empty("");		
			}
			
		});

		// 確認密碼1和密碼2是否相符 -----------------------------------------------------------
		$("#inputPasswordConfirm").on("blur", function(){
			var password = $("#inputPassword").val();
			var password2 = $("#inputPasswordConfirm").val();
			if(password!=password2){
				$("#msgPwd2").html("請重新確認密碼");
			}else{
				$("#msgPwd2").empty("");
			}					
		});
		
		// 一鍵輸入 -----------------------------------------------------------
		function oneClick(){
			$('#inputEmail').val('kkws1415@gmail.com');
			$('#inputPassword').val('12345678');
			$('#inputPasswordConfirm').val('12345678');
			$('#inputFullName').val('柯瑋翔');
			$('#nickname').val('瑋翔');
			$('#phone').val('0987654321');
			$('#birth').val('1992-01-01');
		}

		// 新增會員 -----------------------------------------------------------
		function createAccount(){
			var email = $('#inputEmail').val();
			var password = $('#inputPassword').val();
			var password2 = $('#inputPasswordConfirm').val();
			var username = $('#inputFullName').val();
			var nickname = $('#nickname').val();
			var gender = $('#gender:checked').val();
			var phone = $('#phone').val();
			var birth = $('#birth').val();

			if($.trim(email)=='' || $.trim(password)=='' || $.trim(password2)=='' || $.trim(username)=='' || $.trim(birth)==''){
// 				alert("必填欄位不可空白");
				Swal.fire("必填欄位不可空白");
				$('#msgEmail').html('必填');
				$('#msgPwd').html('必填');
				$('#msgPwd2').html('必填');
				$('#msgName').html('必填');
				$('#msgBirth').html('必填');
				return;
			}
			if(password!=password2){
				$('#msgPwd').html('請重新確認密碼');
				$('#msgPwd2').html('請重新確認密碼');
				return;
			}

			var params = {
				"email":email,
				"password":password,
				"fullName":username,
				"nickName":nickname,
				"gender":gender,
				"phone":phone,
				"birth":birth
			}
			
			$.ajax({
				type:'post',
				url:'/createnewaccount',
				dataType:'json',
				contentType:'application/json',
				data:JSON.stringify(params),
				success:function(data){
					console.log(data);
					if(data=="success"){
// 						alert('註冊成功!請返回登入頁進行登入');
						Swal.fire(
	                        '註冊成功!', //大標
	                        '請返回登入頁進行登入', //小標
	                        'success', //圖案
			            ).then(function(){
			            	window.location.href='/readerlogin';
				        });						
					}else{
// 						alert('註冊失敗!此信箱已有人使用');
						Swal.fire(
	                        '註冊失敗!', //大標
	                        '此信箱已有人使用', //小標
	                        'error', //圖案
			           	)
					}
				}
			});
		}
	</script>

</body>
</html>