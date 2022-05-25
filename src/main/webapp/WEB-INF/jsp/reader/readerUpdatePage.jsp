<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                    src="/admin/showreaderphoto/${userDetail.readerId}">
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
	<div id="update">	
		<!-- try-start -->
		<div class="card o-hidden border-0 shadow-lg my-5" style="margin: 0px 250px;">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
<!--                     <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">修改基本資料</h1>
                            </div>
                            
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">書友編號： ${reader.readerId}</div>
                                <div class="col-sm-6 mb-3 mb-sm-0" align="right">註冊日期： ${reader.registerDate}</div>
                            </div>
                            <hr>
                            
                            <!-- 修改圖片 -->
                            <form action="/admin/uploadreaderphoto/${reader.readerId}" enctype="multipart/form-data" method="post" id="changePhoto">
                            	<div class="form-group row">
                                	<div class="col-sm-4" align="center"><img src="/admin/showreaderphoto/${reader.readerId}" height="100px"></div>
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
                                        <input type="hidden" name="readerId" id="readerId" value="${reader.readerId}">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0" align="right">
<%--                                         註冊日期： ${reader.registerDate} --%>
                                        <input type="hidden" name="registerDate" id="registerDate" value="${reader.registerDate}">
                                    </div>
                                </div>
<!--                                 <div class="form-group row"> -->
<%--                                 	<div class="col-sm-4" align="center"><img src="/showreaderphoto/${reader.readerId}" height="100px"></div> --%>
<!--                                     <div class="col-sm-4" align="center"><input type="file" name="photo" id="photo" class="" class="btn-primary"></div> -->
<!--                                     <div class="col-sm-4" align="center"><button class="btn btn-primary" type="button" onclick="changePhoto()">變更大頭貼</button></div> -->
<!--                                 </div> -->
                                <hr>
                            	<div class="form-group">
                            		<label>email：</label>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email*" value="${reader.email}" readonly>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>姓名：</label>
                                        <input type="text" name="fullName" id="fullName" class="form-control" placeholder="姓名*" value="${reader.fullName}">
                                    	<span id="msgName" style='color: rgb(255, 0, 0);'></span>
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>暱稱：</label>
                                        <input type="text" name="nickName" id="nickName" class="form-control" placeholder="暱稱" value="${reader.nickName}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>性別：</label>
                                        <input type="text" name="gender" id="gender" class="form-control" placeholder="性別" value="${reader.gender}" readonly>
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>生日：</label>
                                    	<input type="date" name="birth" id="birth" class="form-control" value="${reader.birth}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label>電話：</label>
                                        <input type="text" name="phone" id="phone" class="form-control" placeholder="電話" value="${reader.phone}">
                                    </div>
                                    <div class="col-sm-6">
                                    	<label>書友等級：</label>
                                        <input type="text" name="readerLevel" id="readerLevel" class="form-control" placeholder="書友等級" value="${reader.readerLevel}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label>持有書香幣：</label>
                                    <input type="number" name="readerCoin" id="readerCoin" class="form-control" placeholder="持有書香幣" value="${reader.readerCoin}" min="0">
                                </div>
<!--                                 <div class="form-group"> -->
<!--                                 	<label>角色權限：</label> -->
<%--                                     <input type="email" name="authority" id="authority" class="form-control" placeholder="角色權限" value="${reader.authority}"> --%>
<!--                                 	<span id="msgEmail" style='color: rgb(255, 0, 0);'></span> -->
<!--                                 </div> -->
                                <div class="form-group">
                                	<label>角色權限：</label>
                                	<select class="form-control" name="authority" id="authority">
                                		<option>
                                			<c:choose>
                                				<c:when test="${reader.authority == 1}">(1)管理員</c:when>
                                				<c:otherwise>(2)一般書友</c:otherwise>
                                			</c:choose>
<%--                                 			${reader.authority} --%>
                                		</option>
                                		<option>(1)管理員</option>
                                		<option>(2)一般書友</option>
                                		<option>(3)停權中</option>
                                	</select>
                                </div>

                                <button class="btn btn-primary btn-block" type="button" onclick="submitUpdate()" align="center">確認修改</button>
                                <button class="btn btn-warning btn-block" type="button" onclick="location.href='http://localhost:8080/admin/allreaderpage'" align="center">返回</button>
                            </form>
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
        <!-- try-end -->
	
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
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
	
	<script>
		new Vue ({
			el:"#update"
		});

		// 一鍵輸入
		function oneClick(){
			$('#fullName').val("Sean Ko");
			$('#nickName').val("KK");
			$('#phone').val("03-1234567");
			$('#readerCoin').val("500");
		}
	
		// 姓名欄位不得為空
		$("#fullName").on("blur", function(){
			var fullName = $("#fullName").val();
			if($.trim(fullName)==''){
				$("#msgName").html("此欄位不可空白");
			}			
		});

	
		function submitUpdate(){
				var readerId = $('#readerId').val();
				var registerDate = $('#registerDate').val();
				var email = $('#email').val();
				var fullName = $('#fullName').val();
				var nickName = $('#nickName').val();
				var gender = $('#gender').val();
				var phone = $('#phone').val();
				var birth = $('#birth').val();
				var readerLevel = $('#readerLevel').val();
				var readerCoin = $('#readerCoin').val();

				var authority = $('#authority').val();
				var auth;
				if(authority == "(1)管理員"){
					auth=1;
				}else if((authority == "(2)一般書友")){
					auth=2;
				}else{
					auth=3;
				}

				if($.trim(fullName)=='' || $.trim(phone)=='' || $.trim(readerLevel)=='' || $.trim(readerCoin)=='' || $.trim(authority)==''){
					alert("欄位不可空白");
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
        					"authority":auth
        				}
	        				
        				$.ajax({
        					type:'put',
        					url:'/admin/updatereader',
        					dataType:'json',
        					contentType:'application/json',
        					data:JSON.stringify(params),
        					success:function(data){
        						if(data!=null){
        							Swal.fire(
        		                        '修改成功!', //大標
        		                        '書友資料已更新', //小標
        		                        'success', //圖案
        				            ).then(function(){
        				            	window.location.href='http://localhost:8080/admin/allreaderpage';
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

</body>
</html>