<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>以書會友 | 管理員專區</title>

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->

<!-- 01. import CSS (Element UI) -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- ==============================下面是套版=============================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- ==============================上面是套版=============================== -->
	

<style>
.head {
	background-color: #F0F0F0;
	font-weight: bold;
	font-size: 110%;
}

.add {
	margin: 15px 0px;
	color: #844200;
	font-weight: bold;
	font-size: 180%;
	float: none;
}
</style>

</head>

<!-- =============================下面是套版============================= -->
<body id="page-top">
<!-- =============================上面是套版============================= -->
	
<!-- =============================下面是套版============================= -->
	<div id="wrapper">
	
		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost:8080/store/booksMain">
                <div class="sidebar-brand-icon rotate-n-15">
<!--                     <i class="fas fa-laugh-wink"></i> -->
                </div>
                <div class="sidebar-brand-text mx-3">SWAPOOKS</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/mainpage">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>管理員首頁</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                功能管理
            </div>

            <!-- Nav Item - 書友管理 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReader"
                    aria-expanded="true" aria-controls="collapseReader">
                    <i class="fas fa-fw fa-user-circle"></i>
                    <span>書友管理</span>
                </a>
                <div id="collapseReader" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="http://localhost:8080/admin/allreaderpage">查詢全部書友</a>
                        <a class="collapse-item" href="http://localhost:8080/admin/createreaderpage">新增書友</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 書架管理 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBooks"
                    aria-expanded="true" aria-controls="collapseBooks">
                    <i class="fas fa-fw fa-book-open"></i>
                    <span>書架管理</span>
                </a>
                <div id="collapseBooks" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="http://localhost:8080/admin/admin.books">查詢全部書籍</a>
                        <a class="collapse-item" href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 訂單管理 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrders"
                    aria-expanded="true" aria-controls="collapseOrders">
                    <i class="fas fa-fw fa-money-check"></i>
                    <span>訂單管理</span>
                </a>
                <div id="collapseOrders" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="http://localhost:8080/order/gotosearchall">查詢全部訂單</a>
                        <a class="collapse-item" href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 社群管理 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClubs"
                    aria-expanded="true" aria-controls="collapseClubs">
                    <i class="fas fa-fw fa-comments"></i>
                    <span>社群管理</span>
                </a>
                <div id="collapseClubs" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="http://localhost:8080/club/clubmain.controller">查詢全部貼文</a>
                        <a class="collapse-item" href="http://localhost:8080/club/addClub.controller">新增貼文</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 活動管理 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvents"
                    aria-expanded="true" aria-controls="collapseEvents">
                    <i class="fas fa-fw fa-calendar-day"></i>
                    <span>活動管理</span>
                </a>
                <div id="collapseEvents" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="http://localhost:8080/searchallevent">查詢全部活動</a>
                        <a class="collapse-item" href="http://localhost:8080/gotoAddPage">建立活動</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                統計管理
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-line"></i>
                    <span>統計圖表</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">書友相關</a>
                        <a class="collapse-item" href="register.html">書籍相關</a>
                        <a class="collapse-item" href="forgot-password.html">訂單相關</a>
                        <a class="collapse-item" href="404.html">社群相關</a>
                        <a class="collapse-item" href="blank.html">活動相關</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
	    <!-- Main Content -->
	    <div id="content">
	    
	    <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${userDetail.fullName}</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/logout">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    管理員資訊
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/logout">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    登出
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

	
		<div class="container-fluid">
<!-- =============================上面是套版============================= -->
<!-- =============================下面是主要內容============================= -->
<div id="create">
		<div class="card o-hidden border-0 shadow-lg my-5" style="margin: 0px 250px;">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">新增書友</h1>
                            </div>
                            <form class="user" method='post' action=''>
                            	<div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="Email*">
                                	<span id="msgEmail" style='color: rgb(255, 0, 0);'></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="username" placeholder="姓名*">
                                    <span id="msgName" style='color: rgb(255, 0, 0);'></span>
                                </div>                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control" id="password" placeholder="密碼* (至少8位數/英數字)">
                                    	<span id="msgPwd" style='color: rgb(255, 0, 0);'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="password2" placeholder="確認密碼*">
                                    	<span id="msgPwd2" style='color: rgb(255, 0, 0);'></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="nickname" placeholder="暱稱">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="phone" placeholder="聯絡電話">
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
                                	<input class="form-control" type='text' id="birth" name='birth' placeholder="生日*" onfocus="(this.type='date')" onblur="(this.type='text')" required />
                                    <span id="msgBirth" style='color: rgb(255, 0, 0);'></span>
                                </div>
<!--                                 <a href="login.html" class="btn btn-primary btn-user btn-block">註冊</a> -->
                                <button class="btn btn-primary btn-block" type="button" onclick="createAccount()" align="center">新增</button>
                                <button class="btn btn-warning btn-block" type="button" onclick="location.href='http://localhost:8080/admin/allreaderpage'" align="center">返回</button>
                                
<!--                                 <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                                     <i class="fab fa-google fa-fw"></i> Register with Google -->
<!--                                 </a> -->
<!--                                 <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                                     <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook -->
<!--                                 </a> -->
                            </form>
                            <div class="text-center">
<!--                                 <a class="small" href="http://localhost:8080/forgotpwdpage">忘記密碼?</a> -->
<!--                                 &emsp;/&emsp; -->
<!--                                 <a class="small" href="http://localhost:8080/readerlogin">返回登入頁</a> -->
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
		
		</div>
		</div>
		
<!-- =============================上面是主要內容============================= -->
<!-- =============================下面是套版============================= -->
		  <!-- Footer -->
          <footer class="sticky-footer bg-white">
              <div class="container my-auto">
                  <div class="copyright text-center my-auto">
                      <span>Copyright &copy; SWAPOOKS 2022</span>
                  </div>
              </div>
          </footer>
          <!-- End of Footer -->
	</div>
</div>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- =============================上面是套版============================= -->
	
	<!-- 03. import sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
    <!-- import vue.js -->
    <script src="../js/vue.js"></script>
    <!-- import element ui js -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<!-- =============================下面是套版 import============================= -->
			<!-- Bootstrap core JavaScript-->
		    <script src="../vendor/jquery/jquery.min.js"></script>
		    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		    <!-- Core plugin JavaScript-->
		    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
		
		    <!-- Custom scripts for all pages-->
		    <script src="../js/sb-admin-2.min.js"></script>
		
		    <!-- Page level plugins -->
		    <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
		    <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>
		
		    <!-- Page level custom scripts -->
		    <script src="../js/demo/datatables-demo.js"></script>
	<!-- =============================上面是套版 import============================= -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		new Vue ({
			el:"#create"
		});
		
		// 驗證email是否存在 -----------------------------------------------------------
		$("#email").on("blur", function(){
			var email = $("#email").val();

			var re = /^.+@.+\..{2,3}$/;
			
			if(email != ""){
				if(re.test(email)){
					$.ajax({
						type:'get',
						url:'/admin/verifyemail/' + email,
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
		$("#password").on("blur", function(){
			var password = $("#password").val();
			if(password.length < 8){
				$("#msgPwd").html("密碼不得低於8位數");
			}else{
				$("#msgPwd").empty("");		
			}
			
		});

		// 確認密碼1和密碼2是否相符 -----------------------------------------------------------
		$("#password2").on("blur", function(){
			var password = $("#password").val();
			var password2 = $("#password2").val();
			if(password!=password2){
				$("#msgPwd2").html("請重新確認密碼");
			}else{
				$("#msgPwd2").empty("");
			}					
		});
		
		// 查詢全部
		function searchAll(){
			location.href="http://localhost:8080/admin/allreaderpage";
		}
		
		// 一鍵輸入 -----------------------------------------------------------
		function oneClick(){
			$('#email').val('abc123de@gmail.com');
			$('#password').val('12345678');
			$('#password2').val('12345678');
			$('#username').val('林信良');
			$('#nickname').val('信良');
			$('#phone').val('0987654321');
			$('#birth').val('1975-04-01');
		}

// 		function popup() {
// 			if (window.confirm('確定要新增嗎?') == true) {
// 				return true;
// 			} else {
// 				return false;
// 			}
// 		}

		// 新增會員 -----------------------------------------------------------
		function createAccount(){
// 			var createOrNot = confirm("確定要新增嗎?");

// 			if(createOrNot){

				var email = $('#email').val();
				var password = $('#password').val();
				var password2 = $('#password2').val();
				var username = $('#username').val();
				var nickname = $('#nickname').val();
				var gender = $('#gender:checked').val();
				var phone = $('#phone').val();
				var birth = $('#birth').val();

				if($.trim(email)=='' || $.trim(password)=='' || $.trim(password2)=='' || $.trim(username)=='' || $.trim(birth)==''){
// 					alert("必填欄位不可空白");
					Swal.fire("必填欄位不可空白");
					$('#msgEmail').html('必填');
					$('#msgPwd').html('必填');
					$('#msgPwd2').html('必填');
					$('#msgName').html('必填');
					$('#msgBirth').html('必填');
					return;
				}
				if(password!=password2){
// 					alert("請重新確認密碼");
					Swal.fire("請重新確認密碼");
					$('#msgPwd').html('請重新確認密碼');
					$('#msgPwd2').html('請重新確認密碼');
					return;
				}


				Swal.fire({
	                title: '確定要新增嗎?',
	                icon: 'warning',
	                showCancelButton: true, //是否需要 "取消" 的按鈕
	                confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
	                cancelButtonColor: '#d33', //"取消" 按鈕的顏色
	                confirmButtonText: '確定',
	                cancelButtonText: '取消',
	            }).then((result) => {
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
	    					url:'/admin/createnewaccount',
	    					dataType:'json',
	    					contentType:'application/json',
	    					data:JSON.stringify(params),
	    					success:function(data){
//	     						if(data!=null){
//	     							alert('新增成功');
//	     							window.location.href='/allreaderpage';
//	     						}
	    						if(data=="success"){
	    							Swal.fire(
	    		                        '新增成功!', //大標
	    		                        '成功新增書友', //小標
	    		                        'success', //圖案
	    				            ).then(function(){
	    				            	window.location.href='http://localhost:8080/admin/allreaderpage';
	    					        });						
	    						}else{
	    							Swal.fire(
	    		                        '新增失敗!', //大標
	    		                        '此信箱已有人使用', //小標
	    		                        'error', //圖案
	    				           	)
	    						}
	    					}
	    				});
	            })

				
								
// 			}			
		}
	</script>

</body>


</html>