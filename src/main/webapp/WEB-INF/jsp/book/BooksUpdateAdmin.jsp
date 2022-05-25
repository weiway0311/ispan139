<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
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
<h2>{{details.booksName+"->資料修改"}} </h2>
	<el-form :model="details"  ref="details" label-width="120px" class="demo-ruleForm">
  <el-form-item label="書名" prop="booksName">
    <el-input v-model="details.booksName" :placeholder="[[details.booksName]]"></el-input>
  </el-form-item>
  <el-form-item label="種類" prop="booksVarieties">
    <el-input v-model="details.booksVarieties" :placeholder="[[details.booksVarieties]]"></el-input>
  	<!--  
  	<el-checkbox-group v-model="details.booksVarieties">
    <el-checkbox label="Option A"></el-checkbox>
    <el-checkbox label="Option B"></el-checkbox>
    <el-checkbox label="Option C"></el-checkbox>
    <el-checkbox label="disabled" disabled></el-checkbox>
    <el-checkbox label="selected and disabled" disabled></el-checkbox>
  </el-checkbox-group>
  -->
  </el-form-item>
  <el-form-item label="出版社" prop="publisherName">
    <el-input v-model="details.publisherName" :placeholder="[[details.publisherName]]"></el-input>
  </el-form-item>
  <!-- 
  <el-form-item label="書名" prop="booksName">
    <el-input v-model="details.booksName" :placeholder="[[details.booksName]]"></el-input>
  </el-form-item>
   -->
  <el-form-item label="書籍簡介" prop="bookDescribe">
    <el-input  type="textarea" v-model="details.bookDescribe" :placeholder="[[details.bookDescribe]]"></el-input>
  </el-form-item>
  <el-form-item label="ISBN" prop="isbn">
    <el-input v-model="details.isbn" :placeholder="[[details.isbn]]"></el-input>
  </el-form-item>
  <el-form-item label="出版日" prop="publishDate">
    <el-input v-model="details.publishDate" :placeholder="[[details.publishDate]]"></el-input>
    <el-calendar v-model="details.publishDate"></el-calendar>
  </el-form-item>
  <el-form-item label="作者" prop="authorName">
    <el-input v-model="details.authorName" :placeholder="[[details.authorName]]"></el-input>
  </el-form-item>
    <el-form-item label="作者簡介" prop="authorInfo">
    <el-input type="textarea" v-model="details.authorInfo" :placeholder="[[details.authorInfo]]"></el-input>
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
 <el-descriptions title="書籍資料修改" direction="vertical" :column="4" border>
  <el-descriptions-item label="書名">
  <el-input v-model="details.booksName" :placeholder="[[details.booksName]]"></el-input>
  </el-descriptions-item>
  
  <el-descriptions-item label="書籍種類">18100000000</el-descriptions-item>
  
  <el-descriptions-item label="出版社" :span="2">
  <el-input v-model="details.booksName" :placeholder="[[details.publisherName]]"></el-input>
  </el-descriptions-item>
  
  <el-descriptions-item label="Remarks">
    <el-tag size="small">School</el-tag>
  </el-descriptions-item>
  <el-descriptions-item label="Address">No.1188, Wuzhong Avenue, Wuzhong District, Suzhou, Jiangsu Province</el-descriptions-item>
</el-descriptions>
 
	
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
			submitUpdateForm(){

			//alert("TEST!!!");
			let _this = this;
			axios({
					method:"PUT",
					url:"http://localhost:8080/booksplattform/admin/books/"+`${id}`,
					data:_this.details
				}).then( function(response){

						console.log(response.data);
						window.location.href="http://localhost:8080/booksplattform/admin/admin.books";
					})
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

				let _this = this;
				axios({
					method:"GET",
					url:"http://localhost:8080/booksplattform/admin/searchbooks/"+`${id}`,
				}).then( function(response){
				
		        console.log(response.data);

		        //不改url
		        //let url = response.data.bookimgsurl;
	        	//let newUrl = "http://localhost:8080/booksplattform/static/uploads/"+url;
	        	let oldPublishDate = response.data.publishDate
	        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
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