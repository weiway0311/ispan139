<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    
    <!-- 套版不要動 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
		
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	
	    <!-- =================== 01. 套版 import CSS start =================== -->
    <!-- Custom fonts for this template -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- =================== 01. 套版 import CSS end =================== -->
	
	<script src="../js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../assets/demo/chart-area-demo.js"></script>
	<script src="../assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
	<!-- ======= -->
    
    <title>新增書籍</title>
    
    <!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

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
    <!-- sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--<link rel="stylesheet" href="sweetalert2.min.css">-->

    <!-- import bootstrap -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--         integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

    <!-- import JavaScript -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<!-- =================== 03. body加上id start =================== -->
<body id="page-top">
<!-- =================== 03. body加上id end =================== -->

    <%
	Integer totalAmount = 0;
	String role = "";
	if (session.getAttribute("login") != null) {
		role = (String) session.getAttribute("login");
		System.out.println("===================================" + role);
		if (role.equals("admin")) {
			role = "管理";
		}
	}
	if (!role.isEmpty()) {
		role = role.substring(role.length() - 2, role.length());
	} else {
		role = "Hello!";
	}
	%>
	
	<!-- =================== 04. 套版 Top & Side bar start =================== -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="http://localhost:8080/store/booksMain">
				<div class="sidebar-brand-icon rotate-n-15">
					<!--                     <i class="fas fa-laugh-wink"></i> -->
				</div>
<!-- 				<div class="sidebar-brand-text mx-3">SWAPOOKS</div> -->
				<div class="sidebar-brand-text mx-3"><img src="/img/logoname-white.png" width="180px"></div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="/mainpage"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>管理員首頁</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">功能管理</div>

			<!-- Nav Item - 書友管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseReader"
				aria-expanded="true" aria-controls="collapseReader"> <i
					class="fas fa-fw fa-user-circle"></i> <span>書友管理</span>
			</a>
				<div id="collapseReader" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/admin/allreaderpage">查詢全部書友</a> <a
							class="collapse-item"
							href="http://localhost:8080/admin/createreaderpage">新增書友</a>
					</div>
				</div></li>

			<!-- Nav Item - 書架管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBooks"
				aria-expanded="true" aria-controls="collapseBooks"> <i
					class="fas fa-fw fa-book-open"></i> <span>書架管理</span>
			</a>
				<div id="collapseBooks" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/admin/admin.books">查詢全部書籍</a> <a
							class="collapse-item"
							href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
					</div>
				</div></li>

			<!-- Nav Item - 訂單管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseOrders"
				aria-expanded="true" aria-controls="collapseOrders"> <i
					class="fas fa-fw fa-money-check"></i> <span>訂單管理</span>
			</a>
				<div id="collapseOrders" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/order/gotosearchall">查詢全部訂單</a> <a
							class="collapse-item"
							href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
					</div>
				</div></li>

			<!-- Nav Item - 社群管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseClubs"
				aria-expanded="true" aria-controls="collapseClubs"> <i
					class="fas fa-fw fa-comments"></i> <span>社群管理</span>
			</a>
				<div id="collapseClubs" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/club/clubmain.controller">查詢文章</a>
						<a class="collapse-item"
							href="http://localhost:8080/club/creport.controller">檢舉明細</a>
					</div>
				</div></li>

			<!-- Nav Item - 活動管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEvents"
				aria-expanded="true" aria-controls="collapseEvents"> <i
					class="fas fa-fw fa-calendar-day"></i> <span>活動管理</span>
			</a>
				<div id="collapseEvents" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/searchallevent">查詢全部活動</a> <a
							class="collapse-item" href="http://localhost:8080/gotoAddPage">建立活動</a>
					</div>
				</div></li>
			
			<!-- 下面的註解內容請先保留，不要刪除 -->>
			<!-- Divider -->
<!-- 			<hr class="sidebar-divider"> -->

			<!-- Heading -->
<!-- 			<div class="sidebar-heading">統計管理</div> -->

			<!-- Nav Item - Pages Collapse Menu -->
<!-- 			<li class="nav-item"><a class="nav-link collapsed" href="#" -->
<!-- 				data-toggle="collapse" data-target="#collapsePages" -->
<!-- 				aria-expanded="true" aria-controls="collapsePages"> <i -->
<!-- 					class="fas fa-fw fa-chart-line"></i> <span>統計圖表</span> -->
<!-- 			</a> -->
<!-- 				<div id="collapsePages" class="collapse" -->
<!-- 					aria-labelledby="headingPages" data-parent="#accordionSidebar"> -->
<!-- 					<div class="bg-white py-2 collapse-inner rounded"> -->
<!-- 						<a class="collapse-item" href="login.html">書友相關</a> <a -->
<!-- 							class="collapse-item" href="register.html">書籍相關</a> <a -->
<!-- 							class="collapse-item" href="forgot-password.html">訂單相關</a> <a -->
<!-- 							class="collapse-item" href="404.html">社群相關</a> <a -->
<!-- 							class="collapse-item" href="blank.html">活動相關</a> -->
<!-- 					</div> -->
<!-- 				</div></li> -->

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
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${userDetail.fullName}</span>
								<img class="img-profile rounded-circle"
								src="/showreaderphoto/${userDetail.readerId}">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 管理員資訊
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- 主要內容請包在這個div裡面 -->
				<div class="container-fluid">  
	<!-- =================== 04. 套版 Top & Side bar end =================== -->


	<!-- =================== 05. 主要內容 start =================== -->
				<div id="app">

    <div class='container'>

	        <!-- 兩邊留白 -->
	        <div class='container'>
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
	                            <el-descriptions-item label="書籍簡介" prop="bookDescribe" label="書籍簡介">
	                                <el-input type="textarea" id="bookDescribe" name="bookDescribe"
	                                    v-model="registration.bookDescribe" />
	                            </el-descriptions-item>
	                        
	                            <el-descriptions-item label="國際標準書號(ISBN)"> <input id="isbn" name="isbne"
	                                    v-model="registration.isbn" />
	                            </el-descriptions-item>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
	<!-- =================== 06. 套版 footer end =================== -->

	  <!-- =================== 07. 套版 import js start =================== -->
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
	<!-- =================== 07. 套版 import js end =================== -->


    <script>
        new Vue({
            el: "#app",
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
                    },
                    num: 1,
                    imageUrl: "",
                    dialogImageUrl: '',
                    dialogVisible: false,
                };
            },
            methods: {
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
                                url: "http://localhost:8080/admin/books",
                                data: _this.registration
                            }).then(function (response) {

                                console.log(response.data);
                                if (response.data) {
                                    console.log("OK")
                                    window.location.href =
                                        "http://localhost:8080/admin/admin.books";
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
            },
        });
    </script>




</body>

</html>