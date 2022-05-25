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

<!-- 01. import CSS (Element UI) -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- ==============================下面是套版=============================== -->
<!-- Custom fonts for this template -->
<link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- ==============================上面是套版=============================== -->

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->

<style>
.bg-yellow {
	background-color: #844200;
}

table {
	border-collapse: collapse;
}

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
                                    src="../img/undraw_profile.svg">
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
<div id="updatePwd">		
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5" style="margin: 0px 250px;">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">修改密碼</h1>
                                    </div>
                                    <form class="user" action="" method="post">
                                    	<div class="form-group">書友編號： ${reader.readerId}</div>
                                    	<div class="form-group">書友姓名： ${reader.fullName}</div>
                                    	<div class="form-group">書友信箱： ${reader.email}</div>
                                        <div class="form-group" align="center">
                                            <input type="password" class="form-control" id="newPwd"
                                                placeholder="新密碼" name='newPassword'>
                                        </div>
                                        <div class="form-group" align="center">
                                            <input type="password" class="form-control" id="newPwd2"
                                                placeholder="確認新密碼" name='newPassword2'>
                                        </div>
                                        <input type="button" onclick="save()" name='changePW' id="changePW" value="確認修改" class="btn btn-primary btn-block">
                                    </form>
                                    <hr>
                                    <input type="button" value="返回" class="btn btn-warning btn-block" onclick="location.href='http://localhost:8080/admin/allreaderpage'">
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="http://localhost:8080/gotoregisterpage">註冊成為書友</a> -->
<!--                                     </div> -->
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="http://localhost:8080/readerlogin">返回登入頁</a> -->
<!--                                     </div> -->
									<br>
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
		
		
		<!-- old -->
<!-- 		<div class='container'> -->
	
	<%-- 		<form action="/updatepassword/${reader.readerId}" method="post" class="col-4" onSubmit='save()'> --%>
<!-- 			<form action="" method="post" class="col-4"> -->
<!-- 					<p class="add">修改密碼</p> -->
<!-- 					<span id="msg" style='color: rgb(255, 0, 0);'></span> -->
								
<!-- 					<table class="table table-borderless"> -->
<!-- 						<tr> -->
<!-- 							<td>書友編號:</td> -->
<%-- 							<td id="showId">${reader.readerId}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>書友信箱:</td> -->
<%-- 							<td>${reader.email}</td> --%>
<!-- 						</tr> -->
	<!-- 					<tr> -->
	<!-- 						<td>舊密碼:</td> -->
	<!-- 						<td><input type='password' name='oldPassword' size='25' maxlength='16' id="oldPwd" required></td> -->
	<!-- 					</tr> -->
<!-- 						<tr> -->
<!-- 							<td>新密碼:</td> -->
<!-- 							<td><input type='password' name='newPassword' size='25' maxlength='16' id="newPwd" required></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>確認新密碼:</td> -->
<!-- 							<td><input type='password' name='newPassword2' size='25' maxlength='16' id="newPwd2" required></td> -->
<!-- 						</tr> -->
	<!-- 					<tr> -->
	<!-- 						<td colspan='2' align='center'> -->
	<!-- 							<input type='submit' name='changePW' value='送出' id="changePW"> -->
	<!-- 						</td> -->
	<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</form> -->
<!-- 				<button type='button' onclick="oneclick()">一鍵輸入</button> -->
<!-- 				<button type='button' onclick="save()" name='changePW' value='送出' id="changePW">送出</button> -->
			
<!-- 		</div> -->
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
    <script src="../../js/vue.js"></script>
    <!-- import element ui js -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
	
	<!-- =============================下面是套版 import============================= -->
			<!-- Bootstrap core JavaScript-->
		    <script src="../../vendor/jquery/jquery.min.js"></script>
		    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		    <!-- Core plugin JavaScript-->
		    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>
		
		    <!-- Custom scripts for all pages-->
		    <script src="../../js/sb-admin-2.min.js"></script>
		
		    <!-- Page level plugins -->
		    <script src="../../vendor/datatables/jquery.dataTables.min.js"></script>
		    <script src="../../vendor/datatables/dataTables.bootstrap4.min.js"></script>
		
		    <!-- Page level custom scripts -->
		    <script src="../../js/demo/datatables-demo.js"></script>
	<!-- =============================上面是套版 import============================= -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		new Vue ({
			el:"#updatePwd"
		});
	
		function oneClick(){
// 			$('#oldPwd').val("12345678");
			$('#newPwd').val("87654321");
			$('#newPwd2').val("87654321");
		}
	
		function save(){
// 			var updateOrNot = confirm('確定要修改嗎?');
// 			if(updateOrNot){
				var readerId = ${reader.readerId};
// 				var oldPassword = $('#oldPwd').val();
				var newPassword = $('#newPwd').val();
				var newPassword2 = $('#newPwd2').val();

				if(newPassword == ""){
// 					alert('欄位不可空白');
					Swal.fire('欄位不可空白');
					return;
				}
				
				if( newPassword != newPassword2){
// 					alert('請重新確認密碼');
					Swal.fire('請重新確認密碼');
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
//	         					"oldPassword":oldPassword,
	        					"newPassword":newPassword,
	        				}
	        				
	        				$.ajax({
	        					type:'put',
	        					url:'/admin/updatepassword/' + readerId,
	        					dataType:'json',
	        					contentType:'application/json',
	        					data:JSON.stringify(params),
	        					success:function(data){
	        						if(data == 'failed'){
	        							Swal.fire('請重新確認密碼');
	        						}else{
	        							Swal.fire(
            		                        '修改成功!', //大標
            		                        '密碼已更新', //小標
            		                        'success', //圖案
            				            ).then(function(){
            				            	window.location.href='http://localhost:8080/admin/allreaderpage';
            					        });
	        						}
	        					}
	        				});                 	                		                 
	                }
	            })				
// 			}			
		}
	</script>
	
</body>
</html>