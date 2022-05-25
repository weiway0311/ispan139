<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF8">
    
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
    
    <title>書籍管理</title>
    
    <!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >
    
    <!-- sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- import bootstrap -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--         integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->


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
    </style>
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>
<!-- =================== 03. body加上id start =================== -->
<body id="page-top">
<!-- =================== 03. body加上id end =================== -->

    <%
Integer totalAmount = 0;
String role = "";
if( session.getAttribute("login") != null){
	role= (String) session.getAttribute("login");
	System.out.println("==================================="+role);
	if(role.equals("admin")){
		role="管理";
	}
}
if(!role.isEmpty()){
	role = role.substring(role.length()-2, role.length());
}else{
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
<div id="main">

    <div class='container'>
        <!-- navbar -->
<!--         <nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg"> -->
<%--             <el-avatar><%=role%></el-avatar> --%>
<!--             <div class='container'> -->
<!--                 <div class="collapse navbar-collapse"> -->

<!--                 </div> -->

<!--                 <a href="http://localhost:8080/admin/admin.books" class='navbar-brand'>回上一頁</a> -->
<%--                 <a href="Logout" class='navbar-brand'>登出 ${sessionScope.login}</a> --%>
<!--             </div> -->
<!--         </nav> -->

        <!-- 兩邊留白 -->
        <div class='container'>
            <h2>{{details.booksName+"->資料修改"}} </h2>
            <el-form :model="details" ref="details" label-width="120px" class="demo-ruleForm">
                <el-form-item label="書名" prop="booksName">
                    <el-input v-model="details.booksName" :placeholder="[[details.booksName]]"></el-input>
                </el-form-item>

                <el-form-item label="種類" prop="booksVarieties">
                    <!--  <el-radio-group > -->
                    <el-radio label="10" v-model="details.booksVarieties">商業理財</el-radio>
                    <el-radio label="20" v-model="details.booksVarieties">語言學習</el-radio>
                    <el-radio label="30" v-model="details.booksVarieties">電腦程式</el-radio>
                    <el-radio label="40" v-model="details.booksVarieties">藝術設計</el-radio>
                    <el-radio label="50" v-model="details.booksVarieties">現代小說</el-radio>
                    <el-radio label="60" v-model="details.booksVarieties">中文古典</el-radio>
                    <el-radio label="70" v-model="details.booksVarieties">外文小說</el-radio>
                    <el-radio label="80" v-model="details.booksVarieties">親子教育</el-radio>
                    <el-radio label="90" v-model="details.booksVarieties">生活風格</el-radio>
                    <el-radio label="100" v-model="details.booksVarieties">美食旅遊</el-radio>
                    <!--</el-radio-group>-->
                </el-form-item>

                <el-form-item label="圖片" prop="bookimgsurl">
                    <el-upload action="" list-type="picture-card" :on-preview="handlePictureCardPreview"
                        :on-remove="handleRemove" :on-change="show">
                        <i class="el-icon-plus"><img :src="details.bookimgsurl" width="100px"></i>
                    </el-upload>
                </el-form-item>
                </el-form-item>
                <el-form-item label="出版社" prop="publisherName">
                    <el-input v-model="details.publisherName" :placeholder="[[details.publisherName]]"></el-input>
                </el-form-item>

                <el-form-item label="書籍簡介" prop="bookDescribe">
                    <el-input type="textarea" v-model="details.bookDescribe" :placeholder="[[details.bookDescribe]]">
                    </el-input>
                </el-form-item>
                <el-form-item label="ISBN" prop="isbn">
                    <el-input v-model="details.isbn" :placeholder="[[details.isbn]]"></el-input>
                </el-form-item>
                <el-form-item label="出版日" prop="publishDate">
               <!--   <el-input v-model="details.publishDate" :placeholder="[[details.publishDate]]"></el-input>     -->      
                        <el-date-picker
     					v-model="details.publishDate"
      					type="date"
      					placeholder="[[details.publishDate]]"
      					default-value="2010-10-01">
    					</el-date-picker>                
                <!--    <el-calendar v-model="details.publishDate"></el-calendar> -->    
                </el-form-item>
                <el-form-item label="作者" prop="authorName">
                    <el-input v-model="details.authorName" :placeholder="[[details.authorName]]"></el-input>
                </el-form-item>
                <el-form-item label="作者簡介" prop="authorInfo">
                    <el-input type="textarea" v-model="details.authorInfo" :placeholder="[[details.authorInfo]]">
                    </el-input>
                </el-form-item>
                <el-form-item label="提供者" prop="providerId">
                    <el-input v-model="details.providerId" :placeholder="[[details.providerId]]"></el-input>
                </el-form-item>
                <el-form-item label="價格" prop="price">
                    <el-input v-model="details.price" :placeholder="[[details.price]]"></el-input>
                </el-form-item>
                <el-form-item label="數量" prop="quantity">
                    <el-input v-model="details.quantity" :placeholder="[[details.quantity]]"></el-input>

                    <el-form-item>
                        <el-button type="primary" @click="submitUpdateForm">確定</el-button>
                        <el-button @click="reset">返回</el-button>
                    </el-form-item>
            </el-form>

            <hr>

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
	

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

    <!-- import JavaScript -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>



    <script>
        new Vue({
            el: "#main",
            methods: {
                submitUpdateForm() {

                    Swal.fire({
                        title: '您確定要修改嗎?',
                        showDenyButton: true,
                        showCancelButton: false,
                        confirmButtonText: '確定',
                        denyButtonText: '取消',
                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        if (result.isConfirmed) {
                            Swal.fire('修改成功!', '', 'success')
                            //alert("TEST!!!");
                            let _this = this;
                            axios({
                                method: "PUT",
                                url: "http://localhost:8080/admin/books/" +
                                    `${id}`,
                                data: _this.details
                            }).then(function (response) {

                                console.log(response.data);
                                window.location.href =
                                    "http://localhost:8080/admin/admin.books";
                            })
                        } else if (result.isDenied) {
                            Swal.fire('資料未修改', '', 'error')
                        }
                    })


                },
                reset() {
                    window.location.href = "http://localhost:8080/admin/admin.books";
                },
                handleRemove(file, fileList) {
                    console.log(file, fileList);
                    this.details.bookimgsurl = '';
                    this.imageUrl = ''; //清空
                    console.log(this.bookimgsurl)
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
                            _this.details.bookimgsurl = imgUrlBase64;

                        }
                        reader.onerror = (e) => {
                            reject(e)
                        }
                        reader.onloadend = () => {
                            resolve(imgUrlBase64);
                            _this.imageUrl = imgUrlBase64;
                            console.log(_this.details.bookimgsurl)
                        }

                    })
                },
            },
            data() {
                return {
                    //詳細資料
                    details: {},
                    imageUrl: "",
                    dialogImageUrl: '',
                    dialogVisible: false,
                }
            },
            mounted: function () {

                let _this = this;
                axios({
                    method: "GET",
                    url: "http://localhost:8080/admin/searchbooks/" + `${id}`,
                }).then(function (response) {

                    console.log(response.data);

                    //不改url
                    //let url = response.data.bookimgsurl;
                    //let newUrl = "http://localhost:8080/booksplattform/static/uploads/"+url;
                    let oldPublishDate = response.data.publishDate
                    let idx_T = oldPublishDate.indexOf("T"); //取出年月日 用T去拆分字串
                    let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日

                    //response.data.bookimgsurl = newUrl;  //換成完整路徑
                    response.data.publishDate = newPublishDate //換成只有年月日
                    _this.details = response.data;

                    console.log(newPublishDate);
                })
            }
        })
    </script>


</body>

</html>