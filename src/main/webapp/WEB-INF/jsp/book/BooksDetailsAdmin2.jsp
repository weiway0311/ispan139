<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>

	!-- 套版不要動 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
		
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../assets/demo/chart-area-demo.js"></script>
	<script src="../assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
	<!-- ======= -->

<title>書籍管理</title>

<!-- import bootstrap -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->


<style>
.el-table .warning-row {
	background: oldlace;
}

.el-table .success-row {
	background: #f0f9eb;
}

/* nvbar css */
.bg-yellow{
    	background-color: #844200;
}
.keyword{
	margin: 30px 0px;
}

</style>
<!-- import CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	
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

</head>
<body class="sb-nav-fixed">

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
 
	<!-- 上方區塊 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
    	<!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/mainpage">以書會友 SWAPOOKS</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="hidden" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <!-- <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <!-- <li><a class="dropdown-item" href="#!">設定</a></li> -->
                    <!-- <li><hr class="dropdown-divider" /></li> -->
                    <li><a class="dropdown-item" href="/logout">登出 ${userDetail.fullName}</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    
    <!-- 左邊區塊 -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading"></div>
                        <a class="nav-link" href="/mainpage">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            管理員首頁
                        </a>
                        
                        <div class="sb-sidenav-menu-heading"></div>

                        <!-- 會員(書友) -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-circle-user"></i></div>
                            書友管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/allreaderpage">查詢書友</a>
                                <a class="nav-link" href="http://localhost:8080/createreaderpage">新增書友</a>
                            </nav>
                        </div>

                        <!-- 書架(商品) -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            書架管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/admin/admin.books">查詢書籍</a>
                                <a class="nav-link" href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
                            </nav>
                        </div>
                        
                        <!-- 訂單 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrder" aria-expanded="false" aria-controls="collapseOrder">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-money-check"></i></div>
                            訂單管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseOrder" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/order/gotosearchall">查詢訂單</a>
                                <a class="nav-link" href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
                            </nav>
                        </div>

                        <!-- 討論版 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseClub" aria-expanded="false" aria-controls="collapseClub">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-comments"></i></div>
                            討論版管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseClub" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/club/clubmain.controller">查詢文章</a>
                                <a class="nav-link" href="http://localhost:8080/club/addClub.controller">新增文章</a>
                            </nav>
                        </div>

                        <!-- 活動 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEvent" aria-expanded="false" aria-controls="collapseEvent">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar-days"></i></div>
                            活動管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEvent" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/searchallevent">查詢活動</a>
                                <a class="nav-link" href="http://localhost:8080/gotoAddPage">新增活動</a>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    SWAPOOKS
                </div>
            </nav>
        </div>


	<!-- 中央區塊 -->
	<div id="layoutSidenav_content">

		<div id="main">
				<!-- navbar -->
		<!-- 	<nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg"> -->
		<%-- 		<el-avatar><%=role%></el-avatar> 	 --%>
		<!-- 		<div class='container'>		 -->
		<!-- 			<div class="collapse navbar-collapse"> -->
						
		<!-- 			</div> -->
						
		<!-- 				<a href="http://localhost:8080/admin/admin.books" class='navbar-brand'>回上一頁</a> -->
		<%-- 				<a href="/logout" class='navbar-brand'>登出 ${userDetail.fullName}</a> --%>
		<!-- 		</div> -->
		<!-- 	</nav> -->
		
		<!-- 兩邊留白 -->
		<div class='container'>
		
			 <!-- Product section-->
		        <section class="py-5">
		            <div class="container px-4 px-lg-5 my-5">
		                <div class="row gx-4 gx-lg-5 align-items-center">
		                    <div class="col-md-3"><img class="card-img-top mb-5 mb-md-0" :src="details.bookimgsurl" alt="..." /></div>                   
		                    <div class="col-md-6">
		                        <div class="small mb-1">BP-{{details.booksId}}</div>
		                        <h1 class="display-5 fw-bolder">{{details.booksName}}</h1>
		                        <div class="fs-5 mb-5">
		                            <!-- <span class="text-decoration-line-through">{{"$"+ Math.floor(details.price)}}</span> -->
		                           <span>{{"$"+details.price }}</span>     
		                        </div>
		                        <p>ISBN : {{details.isbn}}</p>
		                        <p>出版社 : {{details.publisherName}}</p>
		                        <p>出版日 : {{details.publishDate}}</p>
		                        <p>目前庫存 : {{details.quantity}}</p>
		                        <p class="lead">{{details.bookdescribe}}</p>
		                        <p>作者 : {{details.authorName}}</p>
		                        <p class="lead">{{details.authorInfo}}</p>
		                    	<div id="viewerCanvas" float="flex" style="width: 600px; height: 500px"></div>
		                        <div class="d-flex">
		                          <!--   <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />  -->
		                            <button class="btn btn-outline-dark flex-shrink-0" type="button" @click="goToUptate">
		                                <i class="bi-cart-fill me-1"></i>
		                                修改
		                            </button>
		                            <button class="btn btn-outline-dark flex-shrink-0" type="button" @click="reset">
		                                <i class="bi-cart-fill me-1"></i>
		                                返回
		                            </button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </section>	
			</div>
		</div>
		
		<!-- footer -->
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; SWAPOOKS 2022</div>
                    <!-- <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div> -->
                </div>
            </div>
        </footer>
		
	</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

	<!-- import JavaScript -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	


	<script>
	var booksAPI = '';
	new Vue ({
		el:"#main",
		methods: {
			goToUptate(){
			
			//alert("TEST!!!"); //Test
			let booksid = this.details.booksId;
         	console.log(booksid); //Test
         	let	url="http://localhost:8080/admin/admin.booksupdate";
         	window.location.href= url+"?id="+ booksid
			},
			reset(){
				window.location.href="http://localhost:8080/admin/admin.books";
			}
	  },
		    data() {
		      return {
		    	//詳細資料
		        details: {},
		      }
		    },
		    mounted:function(){
		    	//console.log(`${isbn}`); //TEST OK
				let _this = this;
				axios({
					method:"GET",
					url:"http://localhost:8080/admin/searchbooks/"+`${id}`,
				}).then( function(response){
				
		        console.log(response.data);

		        let url = response.data.bookimgsurl;
	        	let newUrl = "http://localhost:8080/static/uploads/"+url;
	        	let oldPublishDate = response.data.publishDate
	        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
	        	let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日
	        	
	        	//response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
	        	response.data.publishDate = newPublishDate //換成只有年月日
		        _this.details = response.data;

		        console.log(newPublishDate);
		        booksAPI = response.data.isbn;
				})
		    }
  })
	</script>


</body>
</html>