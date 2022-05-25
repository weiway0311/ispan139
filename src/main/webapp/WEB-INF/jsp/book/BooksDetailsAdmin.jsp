<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<title>書籍管理</title>

<!-- import bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


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
        viewer.load('ISBN:1524712174');
      }

      google.books.setOnLoadCallback(initialize);
    </script>

</head>
<body>

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
 

<div id="main">
		<!-- navbar -->
	<nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg">
		<el-avatar><%=role%></el-avatar> 	
		<div class='container'>		
			<div class="collapse navbar-collapse">
				
			</div>
				
				<a href="http://localhost:8080/booksplattform/admin/admin.books" class='navbar-brand'>回上一頁</a>
				<a href="Logout" class='navbar-brand'>登出 ${sessionScope.login}</a>
		</div>
	</nav>

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
                            <span class="text-decoration-line-through">{{"$"+ Math.floor(details.price)}}</span>
                            <span>{{"$"+details.price * 0.8}}</span>
                        </div>
                        <p>ISBN : {{details.isbn}}</p>
                        <p>出版社 : {{details.publisherName}}</p>
                        <p>出版日 : {{details.publishDate}}</p>
                        <p>目前庫存 : {{details.quantity}}</p>
                        <p class="lead">{{details.bookdescribe}}</p>
                        <p>作者 : {{details.authorName}}</p>
                        <p class="lead">{{details.authorInfo}}</p>
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
	<div id="viewerCanvas" style="width: 600px; height: 500px"></div>
	</div>
</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

	<!-- import JavaScript -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	


	<script>
	
	new Vue ({
		el:"#main",
		methods: {
			goToUptate(){
			
			alert("TEST!!!"); //Test
			let booksid = this.details.booksId;
         	console.log(booksid); //Test
         	let	url="http://localhost:8080/booksplattform/admin/admin.booksupdate";
         	window.location.href= url+"?id="+ booksid
			},
			reset(){
				window.location.href="http://localhost:8080/booksplattform/admin/admin.books";
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
					url:"http://localhost:8080/booksplattform/admin/searchbooks/"+`${id}`,
				}).then( function(response){
				
		        console.log(response.data);

		        let url = response.data.bookimgsurl;
	        	let newUrl = "http://localhost:8080/booksplattform/static/uploads/"+url;
	        	let oldPublishDate = response.data.publishDate
	        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
	        	let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日
	        	
	        	response.data.bookimgsurl = newUrl;  //換成完整路徑
	        	response.data.publishDate = newPublishDate //換成只有年月日
		        _this.details = response.data;

		        console.log(newPublishDate);
				})
		    }
  })
	</script>


</body>
</html>