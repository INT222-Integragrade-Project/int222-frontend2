<template>
    <div class="product">
     <navbar @search="searchproduct"></navbar>   
        <div class="container" style="max-width: 1200px;">
            
            <div class="row">
                <div class="col-md" style="text-align: center;">
                    <p class="topic">DORA PRODUCT</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md" style="text-align: center;">
                    <div id="carouselIndicators" class="carousel slide" data-ride="carousel">

                        <ol class="carousel-indicators">
                            <li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselIndicators" data-slide-to="1"></li>
                        </ol>
                        
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../assets/image/imagebrand/product.png" class="d-block w-100" >
                            </div>
                            <div class="carousel-item" >
                                <img src="../assets/image/imagebrand/product1.png" class="d-block w-100">
                            </div>
                        </div>

                        <a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md" style="text-align: center;">
                    <p class="brand-name" style="margin-bottom: -0.5rem;">{{selectedBrand}}</p>
                    <span style="float:left;">{{selectedSort}}</span>
                </div>
            </div>
            
            <hr style="border:1px solid #C7BBE2;margin-bottom:5px;">
            
            <div class="row">
                <div class="col-md">
                    <div class="dropdown">
                        <div class="btn-group" style="float:left;">
                            <label class="btn dropdown-toggle" href="#" role="button" id="dropdownBrand" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">BRAND</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownBrand">
                                <a class="dropdown-item" @click="selectNone">None</a>
                                <a class="dropdown-item" v-for="(brand, index) in brands" :key="index" @click="selectBrand(brand)">{{brand.brandName}}</a>
                            </div>
                        </div>

                        <div class="btn-group" style="float:left;">
                            <label class="btn dropdown-toggle" href="#" role="button" id="dropdownColor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">COLOR</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownColor">
                                <a class="dropdown-item">None</a>
                                <a class="dropdown-item" v-for="(color, index) in colors" :key="index">{{color.colorName}}</a>
                            </div>
                        </div>


                        <div class="btn-group" style="float: right;">
                        <label class="btn dropdown-toggle" href="#" role="button" id="dropdownSortby" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">SORT BY PRICE</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownSortby">
                                <a class="dropdown-item" @click="sortNone">None</a>
                                <a class="dropdown-item" @click="sortL2H">Low to high</a>
                                <a class="dropdown-item" @click="sortH2L">High to low</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <hr style="border:1px solid #C7BBE2;margin-top:0px;">

            <div class="product-content">

                <div class="row" style="margin:0px;">

                    <!-- Loop For Product -->
                    <div class="product-item" v-for="(pd, index) in products" :key="index">
                        <router-link :to="{name:'productdetail' , params:{id:pd.productId}}" >
                            <div class="div-product">
                                <div class="div-product-img">
                                    <img :src="`https://dorasitkmutt.ddns.net/api/getfirstpic/${pd.productId}`">
                                </div>
                                
                                <div class="div-product-title">
                                    {{pd.productName}}
                                </div>
                                <div class="div-product-price">
                                    THB {{pd.price}}
                                </div>
                            </div>
                        </router-link>
                        <div class="div-product-favorite">
                            <!-- for unliked -->
                            <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="!pd.is_like" v-on:click="pd.is_like = !pd.is_like"  @click="addFav(pd)">
                                <span class="material-icons-outlined">favorite_border</span>
                            </button>

                            <!-- for liked -->
                            <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="pd.is_like" v-on:click="pd.is_like = !pd.is_like" @click="delFav(pd)">
                                <span class="material-icons-outlined">favorite</span>
                            </button>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
		
</template>

<script>

import Navbar from "../components/navbar.vue"

export default {
    name : "product",
    components : {Navbar},
    props: {
        product: {
            type: Object,
        },
        id: {
            type: String
        }
    },
    data() {
        return {
            displayNone: false,
            displayShow: true,
            isNotLiked: true,
            isLiked: false,
            ogproducts: [],
            products: [],
            colors: [],
            brands: [],
            userfav: [],
            token: '',
            resId: 0,
            resRole: '',
            users: [],
            user: Object,
            FavProducts: [],
            selectedBrand: 'All Brand',
            selectedSort: '',
            filterBrand: 0,
        }
    },
    mounted(){
        this.create()
    },
    methods: {
        addFav(obj) {
            fetch( `https://dorasitkmutt.ddns.net/api/${this.resId}/AddFav/?productId=${obj.productId}` , {
                method: "POST",
                headers: { "Authorization" : `Bearer ${this.token}`}
                })
        },
        async getproducts() {
            try {
                const res = await fetch('https://dorasitkmutt.ddns.net/api/show');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async getcolors() {
            try {
                const res = await fetch('https://dorasitkmutt.ddns.net/api/showallcolor');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async getbrands() {
            try {
                const res = await fetch('https://dorasitkmutt.ddns.net/api/showbrand');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async getFav() {
            try {
                const res = await fetch(`https://dorasitkmutt.ddns.net/api/${this.resId}/MyFav/` , {
                    method: "GET",
                    headers: { "Authorization" : `Bearer ${this.token}`}
                });
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async create(){
            this.token = localStorage.token;
            this.resId = localStorage.resId;
            this.resRole = localStorage.resRole;
            this.products = await this.getproducts();
            this.colors = await this.getcolors();
            this.brands = await this.getbrands();
            this.userfav = await this.getFav();
            this.users = await this.getUsers();
            for(let i = 0; i < this.users.length; i++) {
                if(this.users[i].userId == this.resId) {
                    this.user = this.users[i];
                }
            }
            localStorage.setItem("username" , this.user.userName)
            for(let i = 0; i < this.userfav.length; i++) {
                for(let j = 0 ; j < this.products.length ; j++) {
                    if(this.userfav[i].prouctId == this.products[j].productId) {
                        return
                    }
                }
            }
            this.ogproducts = this.products;
        },
        async getUsers() {
            try {
                const res = await fetch(`https://dorasitkmutt.ddns.net/api/showalluser` , {
                    method: "GET"  ,
                    headers: { "Authorization" : `Bearer ${this.token}`}
                    })
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        selectBrand(brand) {
            this.products = this.ogproducts;
            this.filterBrand = brand.brandId
            this.selectedBrand = brand.brandName
            this.products = this.products.filter(this.checkBrand)
        },
        selectNone() {
            this.products = this.ogproducts;
            this.selectedBrand = 'All Brand'
        },
        checkBrand(product) {
            return product.brandId == this.filterBrand;
        },
        sortNone() {
            this.selectedSort = ''
            this.products.sort(function(a, b){return a.productId-b.productId})
        },
        sortL2H() {
            this.selectedSort = 'Price : Low to high'
            this.products.sort(function(a, b){return a.price-b.price})
        },
        sortH2L() {
            this.selectedSort = 'Price : High to low'
            this.products.sort(function(a, b){return b.price-a.price})  
        },
        searchproduct(search) {
            if(search == '') {
                return this.products = this.ogproducts
            }
            this.products = this.products.filter(list => {
                list = list.productName.toLowerCase()
                return list.indexOf(search.toLowerCase()) > -1
            })
        }
    }
}
</script>

<style>

    .product-content {
        background-color: #ffffff;
        padding-left: 15px;
        padding-bottom: 30px;
    }

    .product-item {
        width: 17%;
        margin: 0px 15px;
        position: relative;
    }

    .div-product {
        position: relative;
        width: 100%;
        min-height: 300px;
        background-color: #fbfbfb;
        box-shadow: 1px 1px 5px #cccccc;
        border-radius: 6px;
        margin: 30px 0px 0px 0px;
        padding: 0px 0px 0px 0px;
        overflow: hidden;
    }

    .div-product:hover {
        background-color: #e8e8e8;
    }

    .div-product:hover .div-product-img{
        opacity: 0.8;
    }

    .div-product-img {
        max-height: 220px;
        text-align: center;
        overflow: hidden;
    }

    .div-product-img img {
        object-fit: cover; 
        width: 100%; 
        height: 220px;
        /* margin: auto; */
        display: block;
    }


    .div-product .col-md {
        padding-right: 0px;
        padding-left: 0px;
    }

    .div-product img {
        width: 100%;
        box-shadow: 1px 0px 2px #cccccc;
    }

    .div-product-favorite {
        position: absolute;
        top: 40px;
        right: 10px;
    }

    .div-product-title {
        position: absolute;
        top: 215px;
        left: 10px;
        font-size: 15px;
        color: #383838;
        text-align: left;
    }

    .div-product-price {
        position: absolute;
        bottom: 5px;
        right: 10px;
        color: #ff0000;
        font-size: 12px;
    }
    
    .link-custom {
        color: #f4a29d !important;
        padding: 0px;
    }

    .link-custom:hover {
        color: #383838 !important;
        text-decoration: none;
    }

    .link-custom:focus {
        box-shadow: 0 0 0 0.2rem transparent;
    }

    .dropdown-item {
        cursor: pointer;
    }

    @media only screen and (max-width: 1200px) {

        .product-item {
            width: 22%;
        }

    }

    @media only screen and (max-width: 1100px) {

        .product-item {
            width: 28.33%;
        }

    }

    @media only screen and (max-width: 700px) {

        .product-item {
            width: 44%;
        }

    }

    @media only screen and (max-width: 560px) {

        .product-item {
            width: 100%;
        }

    }


</style>