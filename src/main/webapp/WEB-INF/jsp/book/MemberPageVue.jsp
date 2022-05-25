<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>書籍管理</title>

<!-- import bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


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
 .time {
    font-size: 13px;
    color: #999;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 150px;
    heigh:200px;
    display:block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both
  }
  .line-limit-length {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap; 
}
</style>
<!-- import CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>
<body>


	<div id="main">
		<!-- navbar -->
		<nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg">
			<el-avatar></el-avatar>
			<div class='container'>
				<div class="collapse navbar-collapse"></div>

				<a href="member.jsp" class='navbar-brand'>回上一頁</a> <a href="Logout"
					class='navbar-brand'>登出 ${sessionScope.login}</a>
			</div>
		</nav>

		<!-- 兩邊留白 -->
		<div class='container'>

			<!-- 快速查詢模糊比對 -->
			<el-form :inline="true" :model="formInline" class="demo-form-inline">
			<el-form-item label="輸入書名(關鍵字)"> <el-input
				v-model="formInline.bookKeyWord" placeholder="輸入書名(關鍵字)"></el-input>
			</el-form-item> <el-form-item> <el-button type="primary"
				icon="el-icon-search" @click="onSubmit">查詢</el-button> <el-button
				type="primary" icon="el-icon-refresh" @click="reset"></el-button> </el-form-item> </el-form>
			<!-- 將數據陳列出來 -->
			<span id="showZone"></span>
			<div v-for="searchResult in searchResults">{{searchResult}}</div>
			<hr>
			<!-- add and delete(batch) button -->
			<el-row> <el-button type="primary" plain
				icon="el-icon-upload2" @click="dialogVisible = true">書籍上架</el-button>
			</el-row>

			<!-- add's dialog -->
			<el-dialog title="書籍上架" :visible.sync="dialogVisible" width="30%">

			<!-- 新增書籍內容表單 --> <el-form :model="ruleForm" :rules="rules"
				ref="ruleForm" label-width="120px" class="demo-ruleForm">
			<el-form-item label="書名" prop="booksName"> 
				<el-input v-model="ruleForm.booksName"></el-input> 
			</el-form-item> 
			<el-form-item label="作者" prop="authorName"> 
				<el-input v-model="ruleForm.authorName"></el-input> 
			</el-form-item> 
			<el-form-item label="種類" prop="booksVarieties"> 
				<el-input v-model="ruleForm.booksVarieties"></el-input> 
			</el-form-item> <el-form-item label="出版社" prop="publisherName">
			 	<el-input v-model="ruleForm.publisherName"></el-input> 
			</el-form-item> <el-form-item label="價格" prop="price"> 
				<el-input v-model="ruleForm.price"></el-input> 
			</el-form-item> 
			<el-form-item label="數量" prop="quantity"> 
				<el-input v-model="ruleForm.quantity"></el-input> 
			</el-form-item>
			
			 <el-form-item label="描述" prop="describe">
				 <el-input v-model="ruleForm.describe"></el-input>
			 </el-form-item> 
			 <el-form-item label="國際標準書號" prop="isbn"> 
			 		<el-input v-model="ruleForm.isbn"> </el-input> </el-form-item>
			  <!-- 圖片上傳 --> 
			<el-form-item>
			<el-upload class="upload-demo" drag :http-request="upload"
				action="http://localhost:8080/booksplattform/BookCoverAddController"
				@change="fileSelected" :auto-upload="true" :on-remove="handleRemove"> 
				<img v-if="imageUrl" :src="imageUrl" width="200" />
				 <i class="el-icon-upload"></i>
			<div class="el-upload__text">
				Drop file here or <em>click to upload</em>
			</div>
			<div class="el-upload__tip" slot="tip">jpg/png files with a
				size less than 500kb</div>
			</el-upload> 
		 </el-form-item> 
		<!-- 
 <el-form-item label="出版日期" prop="publishDate">
    <el-input v-model="ruleForm.publishDate"></el-input>
  </el-form-item>
  --> 
  			<el-date-picker v-model="ruleForm.publishDate" type="date"
				placeholder="出版日期 (Pick a day)" :picker-options="pickerOptions">
			</el-date-picker> <el-form-item> <el-button type="primary"
				@click="submitForm">上架</el-button> <el-button
				@click="dialogVisible=false">返回</el-button> </el-form-item> </el-form> </span> </el-dialog>
			<hr>
<!-- SearchAll資料 -->
<div v-for="(item, index) in tableData">
<div class="card mb-3" style="max-width: 100%;">
  <div class="row no-gutters">
    <div class="col-md-2">
      <img :src="item.bookimgsurl" class="card-img" alt="..." style="width:150px;heigh:200px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h2 class="card-title">{{item.booksName}}</h2> 
        <p class="card-text line-limit-length" >{{item.describe}}</p><hr>
        <div class="bottom clearfix">
        <p class="card-text"><small class="text-muted">優惠價 {{item.price}} 元</small>
          <el-button type="success" round icon="el-icon-shopping-cart-2" style="float:right" @click="addToOrder" ></el-button>
        </div>     

      	</p>
      </div>
    </div>
  </div>
</div>
</div>


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
			  upload(file){
				let fd = new FormData();

				fd.append("file",file.file);
				console.log(file); //test
				console.log(file.file); //test
				_this = this;
				axios({
					method:"POST",
					url:"http://localhost:8080/booksplattform/BookCoverAddController",
					data:fd
				}).then( function(response){
		
					console.log(response.data);
					_this.url = response.data.bookimgsurl.replace(/ \ / ,'/'); //儲存url
					_this.imageUrl = response.data.bookimgsurl.replace(/ \ / ,'/');  //for 及時預覽用
					//console.log(_this.url);
					console.log(" _this.imageUrl is : ");  //test
					console.log(_this.imageUrl);  //test
							

			   })
				
			 },
		      tableRowClassName({row, rowIndex}) {
		        if (rowIndex === 1) {
		          return 'warning-row';
		        } else if (rowIndex === 3) {
		          return 'success-row';
		        }
		        return '';
		      },
		    //複選做批次刪除
		      handleSelectionChange(val) {
		          this.multipleSelection = val;
		        	  console.log( this.multipleSelection );
		          
		        },
		        //快速查詢用
		        onSubmit() {
		        	var _this = this;
		        	//初步判斷
		        	if(this.formInline.bookKeyWord==""){
		        		_this.searchResults ="";
		        		document.getElementById("showZone").innerHTML = "請輸入查詢關鍵字...";
		        	}else{
		        	//清空
		        	document.getElementById("showZone").innerHTML = "";
		            //console.log('submit!');  //for Test
		            //console.log(this.formInline.user);   //印出查詢字
		            var keyword =  this.formInline.bookKeyWord;
					
					axios({
						method:"GET",
						url:"http://localhost:8080/projectimprovement/BookSearchByName?key="+ encodeURIComponent(keyword),
					}).then( function(response){
					//let tmp =	encodeURIComponent(response);   //後端回傳資料編碼待解決!!!!!!!!!!!!!!!!!!
					//let tmp1 = decodeURIComponent(tmp);
					if( response.data != ""){
							_this.tableData  = response.data;
					}else{
						document.getElementById("showZone").innerHTML = "查無此書!!";
					}
					//_this.searchResults = response.data;
					let num = response.data.length;
					document.getElementById("showZone").innerHTML = "有 " + num + " 筆相符";
					//console.log(_this.searchResults);
					//console.log(response.data); //test
					})
		        	}
		          },
		          //書本上架之提交表單方法
		          submitForm(){
		                  //資料傳向後端, 把this存入var變數
		                  var _this = this;
		                  //console.log(this.ruleForm);  //test
						  axios({
					      method:"POST",
					      url:"http://localhost:8080/booksplattform/BookAddController",
					      //將表單內容以JSON格式傳入後端
					      data:{
						        "authorName":_this.ruleForm.authorName,
					    	   "booksName": _this.ruleForm.booksName ,
								"booksVarieties":_this.ruleForm.booksVarieties ,
								"publisherName":_this.ruleForm.publisherName ,
								"price":_this.ruleForm.price ,
								"quantity": _this.ruleForm.quantity ,
								"describe":_this.ruleForm.describe ,
								"isbn":_this.ruleForm.isbn,
								"bookimgsurl": _this.url, //圖片上傳時已透過ajax傳送取得url
								"publishDate":_this.ruleForm.publishDate
					    	   }
				          }).then( function(response){
							_this.tableData = response.data;	
		                  //確認後提交表單
		                  alert('上架成功!');
						 })
						 //最後重回MainPage
		                 location.replace('http://localhost:8080/booksplattform/Books');
		                  //console.log(this.ruleForm); //test

		            },
		        //  !!!!!!!!!!未完成!!!!!!!!!!
		        optUpdate(index ,row){
		        	  	  //跳出對話視窗
		        	  	  this.dialogVisibleForUpdate=true;
		                  //顯示placeholder
		                  this.updateDataDefault.booksName = row.booksName ;  
		                  this.updateDataDefault.authorName = row.authorName ; 
		                  this.updateDataDefault.publisherName = row.publisherName; 
		                  this.updateDataDefault.price = row.price ; 
		                  this.updateDataDefault.quantity = row.quantity ; 
		                  this.tmpStoreBookId = row.booksId;   //抓取要改之book的ID , 存入tmpStoreBookId 以利submitUpdateForm()辨別要更新哪筆
		                  //console.log("updateDataDefault : " +updateDataDefault);  
		                  
		            },
		         //提交修改表單資料
		         submitUpdateForm(){
		                //console.log("id is : "+ this.tmpStoreBookId);    //test
		                //console.log("books new name : " + this.ruleForm.booksName);  //test
		                //透過ajax傳入後端
		                var _this = this;  //將window之this 轉成 vue之this
						  axios({
						      method:"POST",
						      url:"http://localhost:8080/projectimprovement//BookUpdateById",
						      //將表單內容以JSON格式傳入後端
						      data: {
						    	  "booksId": _this.tmpStoreBookId ,
						    	  "booksName": _this.ruleForm.booksName,
						    	  "authorName": _this.ruleForm.authorName,
						    	  "publisherName": _this.ruleForm.publisherName,
						    	  "price": _this.ruleForm.price,
						    	  "quantity": _this.ruleForm.quantity,
									}
					          }).then( function(response){
								_this.tableData = response.data;	
			                  //確認後提交表單
			                  alert('修改成功!');
							 })
							//最後重回MainPage
			                 location.replace('http://localhost:8080/booksplattform/Books');            	
		            },
		        //刪除資料
		        optDelete(index ,row){
		                  //console.log(this.ruleForm);  //test
		                  //console.log(row.booksId); //test
		                  //console.log(row.booksName); //test
						  axios({
					      method:"POST",
					      url:"http://localhost:8080/projectimprovement//BookDeleteById",
					      //將表單內容以JSON格式傳入後端
					      data: {
					    	  "booksId": row.booksId ,
					    	  "booksName": row.booksName,
								}
				          }).then( function(response){
							_this.tableData = response.data;	
		                  //確認後提交表單
		                  alert('上架成功!');
						 })
						 //最後重回MainPage
		                 location.replace('http://localhost:8080/booksplattform/Books');
		                  //console.log(this.ruleForm); //test
		            },
		         reset(){
		            	 //重回MainPage
		                 location.replace('http://localhost:8080/booksplattform/Books');
		            },
		        //及時預覽作用
		        fileSelected(e) {
		                const file = e.target.files.item(0);
		                const reader = new FileReader();
		                reader.addEventListener('load', this.imageLoaded);
		                reader.readAsDataURL(file);
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
				addToOrder(){

				console.log("加入購物車!!");
			}
		    },
		    data() {
		      return {
		    	//serchall資料
		        tableData: [],
		        //複選做批次刪除
		        multipleSelection:[],
		        //快速關鍵字查詢用
		        formInline: {
		        	bookKeyWord: ''
		          },
		        //快速查詢結果用
		        searchResults:[],
		        //新增書籍視窗狀態
		        dialogVisible: false,
		        //修改資料儲存booksID
		        tmpStoreBookId :"",
		      //新增書籍視窗預設資料
		        updateDataDefault: {
		        	booksName: '',
		            authorName:'',
		            publisherName:'',
		            price:'',
		            quantity:'',
		          },
		      	//修改書籍資料視窗狀態
		        dialogVisibleForUpdate: false,
		        //表格內容
		        ruleForm: {
		        	booksName: '',
		            authorName:'',
		            booksVarieties:'',
		            publisherName:'',
		            price:'',
		            quantity:'',
		            describe:'',
		            isbn:'',
		            bookimgsurl:'',
		            publishDate:'',
		          },
		        //書名不得為空之判斷
				rules: {
				          booksName: [
				            { required: true, message: '請輸入書名', trigger: 'blur' }
				 	   ]},
				 url:"",
				 imageUrl:"",
				 //For新增日期
			        pickerOptions: {
			            disabledDate(time) {
			              return time.getTime() > Date.now();
			            },
			            shortcuts: [{
			              text: 'Today',
			              onClick(picker) {
			                picker.$emit('pick', new Date());
			              }
			            }, {
			              text: 'Yesterday',
			              onClick(picker) {
			                const date = new Date();
			                date.setTime(date.getTime() - 3600 * 1000 * 24);
			                picker.$emit('pick', date);
			              }
			            }, {
			              text: 'A week ago',
			              onClick(picker) {
			                const date = new Date();
			                date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
			                picker.$emit('pick', date);
			              }
			            }]
			          },
		    }
		    },
		    mounted:function(){
				var _this = this;
				axios({
					method:"GET",
					url:"http://localhost:8080/booksplattform/Books"
				}).then( function(response){
				_this.tableData = response.data;	
				console.log(_this.tableData);
				})
		    }
  })
	</script>


</body>
</html>