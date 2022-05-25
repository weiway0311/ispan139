<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增書籍</title>

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

<!-- import bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- import CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

	<!-- import JavaScript -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
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

<div id="app">
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
	  <div>
    <!-- 新增書籍內容表單 --> 
    <el-form label-width="120px" class="demo-ruleForm">
      <div v-if="step === 1">
    <!--     <h1>第一部分</h1>  -->
        
 <el-steps :active="1" align-center>
  <el-step title="Step 1" description="書籍基本"></el-step>
  <el-step title="Step 2" description="書籍詳細"></el-step>
  <el-step title="Step 3" description="作者資訊"></el-step>
  <el-step title="Step 4" description="完成!!"></el-step>
</el-steps>          
        
        <div>
          <legend for="booksName">書名:</legend>
          <input
            id="booksName"
            name="booksName"
            v-model="registration.booksName"
          />
        </div>
        <hr />
        <legend for="booksVarieties">書籍類別:</legend>
        <br />
        <div>
          <input
            type="radio"
            id="b10"
            value="10"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b10">商業理財</label>
          <br />
          <input
            type="radio"
            id="b20"
            value="20"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b20">語言學習</label>
          <br />
          <input
            type="radio"
            id="b30"
            value="30"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b30">電腦程式</label>
          <br />
          <input
            type="radio"
            id="b40"
            value="40"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b40">藝術設計</label>
          <br />
          <input
            type="radio"
            id="b50"
            value="50"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b50">現代小說</label>
          <br />
          <input
            type="radio"
            id="b60"
            value="60"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b60">中文古典</label>
          <br />
          <input
            type="radio"
            id="b70"
            value="70"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b70">外文小說</label>
          <br />
          <input
            type="radio"
            id="b80"
            value="80"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b80">親子教育</label>
          <br />
          <input
            type="radio"
            id="b90"
            value="90"
            v-model="registration.booksVarieties"
            name="booksVarieties"
          />
          <label for="b90">生活風格</label>
          <br />
        </div>

        <hr />
        <!-- 圖片上傳 -->
        <div>
          <!-- 圖片上傳 --> 
			<el-form-item>
			<el-upload class="upload-demo" drag :http-request="upload"
				action="http://localhost:8080/booksplattform/admin/BookCoverAddController"
				@change="fileSelected" :auto-upload="true" :on-remove="handleRemove"> 
				<img v-show="imageUrl" :src="imageUrl" width="200" />
				 <i class="el-icon-upload"></i>
			<div class="el-upload__text">
				Drop file here or <em>click to upload</em>
			</div>
			<div class="el-upload__tip" slot="tip">jpg/png files with a
				size less than 500kb</div>
			</el-upload> 
		 </el-form-item> 
		 <hr>
		  <legend for="publisherName">出版社:</legend>
          <input
            id="publisherName"
            name="publisherName"
            v-model="registration.publisherName"
          />
        </div>
        <hr />
      <div>
        <button @click.prevent="next()">Next</button>
      </div>
        </div>
      </div>

      <div v-if="step === 2">
     <!--    <h1>第二部分</h1>  -->
        
 <el-steps :active="2" align-center>
  <el-step title="Step 1" description="書籍基本"></el-step>
  <el-step title="Step 2" description="書籍詳細"></el-step>
  <el-step title="Step 3" description="作者資訊"></el-step>
  <el-step title="Step 4" description="完成!!"></el-step>
</el-steps>        
              
  <el-descriptions title="書籍資訊">
    <el-descriptions-item label="書籍簡介" prop="bookDescribe" label="書籍簡介">
		<el-input type="textarea" id="bookDescribe"  name="bookDescribe" v-model="registration.bookDescribe"/>
	</el-descriptions-item>
    <el-descriptions-item label="ISBN">
	    <input id="isbn"  name="isbne" v-model="registration.isbn"/>
	</el-descriptions-item>
  </el-descriptions>
<hr>
<el-descriptions title="出版日期">
    <el-descriptions-item label="選擇日期">
    	<el-calendar v-model="registration.publishDate"></el-calendar>
    </el-descriptions-item>
  </el-descriptions>
        <br />
		<hr>
        <button @click.prevent="prev()">Previous</button>
        <button @click.prevent="next()">Next</button>
      </div>

      <div v-if="step === 3">
     <!--    <h1>第三部分</h1>  -->
   
 <el-steps :active="3" align-center>
  <el-step title="Step 1" description="書籍基本"></el-step>
  <el-step title="Step 2" description="書籍詳細"></el-step>
  <el-step title="Step 3" description="作者資訊"></el-step>
  <el-step title="Step 4" description="完成!!"></el-step>
</el-steps>     
               
  <el-descriptions title="作者資訊">
    <el-descriptions-item label="作者">
	    <input id="authorName"  name="authorName" v-model="registration.authorName"/>
	</el-descriptions-item>
    <el-descriptions-item label="作者簡介" prop="authorInfo" label="書籍簡介">
		<el-input type="textarea" id="authorInfo"  name="authorInfo" v-model="registration.authorInfo"/>
	</el-descriptions-item>
  </el-descriptions>
  <hr>
  <el-descriptions title="其他資訊">
    <el-descriptions-item label="價格">
	    <el-input-number v-model="registration.price"  :min="1" :max="999"></el-input-number>
	</el-descriptions-item>
  <el-descriptions-item label="數量">
	     <el-input-number v-model="registration.quantity" @change="handleChange" :min="1" :max="99"></el-input-number>
	</el-descriptions-item>
</el-descriptions>

        <button @click.prevent="prev()">Previous</button>
        <button @click.prevent="next()">Next</button>
      </div>

<!-- 
      <div v-if="step === 4">
        <h1>Step Four</h1>

        You get 2! You skipped 1 step.

        <button @click.prevent="prev()">Previous</button>
        <button @click.prevent="next()">Next</button>
      </div>

      <div v-if="step === 5">
        <h1>Step Three</h1>

        You get 3! You skipped 2 steps.

        <button @click.prevent="prev()">Previous</button>
        <button @click.prevent="next()">Next</button>
      </div>
 -->
      <div v-if="step === 6">
      
 <el-steps :active="4" align-center>
  <el-step title="Step 1" description="書籍基本"></el-step>
  <el-step title="Step 2" description="書籍詳細"></el-step>
  <el-step title="Step 3" description="作者資訊"></el-step>
  <el-step title="Step 4" description="完成!!"></el-step>
</el-steps> 
      
      <!--   <h1>Step Three</h1>   -->

        <h1 align-center>新增完畢!!</h2>
        
        <!-- TEST -->

    
        <button @click.prevent="prev()">Previous</button>
        <button @click.prevent="submit()">Submit</button>
      </div>
    </el-form>
  </div>
</div>
</div>
		
<script>

new Vue ({
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
      url: "",
      imageUrl: "",
      num: 1,
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
      alert("Submit to blah and show blah and etc.");
      console.log(this.registration);
  	_this = this;
	axios({
		method:"POST",
		url:"http://localhost:8080/booksplattform/admin/books",
		data:_this.registration
	}).then( function(response){

		console.log(response.data);
		if(response.data){
			console.log("OK")
			//window.location.href="http://localhost:8080/booksplattform/admin/admin.books";
		}
   })
    },
	  upload(file){
		let fd = new FormData();

		fd.append("file",file.file);
		console.log(file); //test
		console.log(file.file); //test
		_this = this;
		axios({
			method:"POST",
			url:"http://localhost:8080/booksplattform/admin/BookCoverAddController",
			data:fd
		}).then( function(response){

			console.log(response.data);
			
			_this.url = response.data.bookimgsurl.replace(/ \ / ,'/'); //儲存url

			_this.registration.bookimgsurl = _this.url;
			
			_this.imageUrl = "http://localhost:8080/booksplattform/static/uploads/"+response.data.bookimgsurl.replace(/ \ / ,'/');  //for 及時預覽用

			
			//console.log(_this.url);
			console.log(" _this.imageUrl is : ");  //test
			console.log(_this.imageUrl);  //test
	   })
	 },
     //及時預覽作用
     fileSelected(e) {
             const file = e.target.files.item(0);
             const reader = new FileReader();
             reader.addEventListener('load', this.imageLoaded);
             reader.readAsDataURL(file);
             console.log("load~~~~");
           },
	    imageLoaded(e) {
	           this.image = e.target.result;
	           },
	    //取消上傳
	    handleRemove(){
				    console.log(this.url);
				this.url="";
				this.image="";
				console.log(this.url);
			   },
	    handleChange(value){
			    console.log(value)
			},
  },
});
</script>




</body>
</html>