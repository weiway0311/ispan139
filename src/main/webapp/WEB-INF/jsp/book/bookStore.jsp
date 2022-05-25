<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/vue-masonry-css"></script>

</head>
<body>
<div id="app">
  <v-app>

    <v-container>
      <masonry :gutter="{ default: '30px', 700: '15px' }" :cols="{ default: 3, 1000: 3, 700: 2, 500: 1 }">

        <v-card v-for="item in items" :key="item.id" class="mt-2 mb-2" color="grey lighten-3" flat>
          <v-toolbar flat dense color="transparent" class="font-weight-bold">

            {{item.booksName}}
           
          </v-toolbar>
         <!--  <v-img :src="`static/images/${item.bookimgsurl}`"></v-img> -->
          <v-img :src="item.bookimgsurl"></v-img>
        </v-card>
      </masonry>
    </v-container>

  </v-app>
</div>

  <hr>
  <img src="http://localhost:8080/booksplattform/static/uploads/1647671239938.jpg" />

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
new Vue({
	  el: "#app",
	  vuetify: new Vuetify(),
	  data: () => ({
	    items: [],
	    imgUrl:[],
	  }),
	  mounted:function(){
		  let _this=this;
      axios({
        url:"http://localhost:8080/booksplattform/admin/books",
        method:"get"
      })
        .then(function(res){
        console.log(res.data);
        _this.items = res.data;
        //console.log(_this.items);
        _this.items.forEach((item)=>{
        	console.log(item.bookimgsurl);
        	let url = item.bookimgsurl;
        	let newUrl = "http://localhost:8080/booksplattform/static/uploads/"+url;
        	//_this.imgUrl.push(newUrl);
        	//console.log(_this.imgUrl);
        	item.bookimgsurl = newUrl ;
            })
      })
	  },

	});
</script>
</body>
</html>