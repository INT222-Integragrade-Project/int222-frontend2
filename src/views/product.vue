<template>
    <div class="product">
     <navbar></navbar>   
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
                    <p class="brand-name" style="margin-bottom: -0.5rem;">Anllo</p>
                </div>
            </div>
            
            <hr style="border:1px solid #C7BBE2;margin-bottom:5px;">
            
            <div class="row">
                <div class="col-md">
                    <div class="dropdown">
                        <div class="btn-group" style="float:left;">
                            <label class="btn dropdown-toggle" href="#" role="button" id="dropdownBrand" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">BRAND</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownBrand">
                                <a class="dropdown-item">None</a>
                                <a class="dropdown-item">Anello</a>
                                <a class="dropdown-item">Chanel</a>
                                <a class="dropdown-item">Dior</a>
                                <a class="dropdown-item">Guicci</a>
                                <a class="dropdown-item">Lyn</a>
                                <a class="dropdown-item">Ysl</a>
                            </div>
                        </div>

                        <div class="btn-group" style="float:left;">
                            <label class="btn dropdown-toggle" href="#" role="button" id="dropdownColor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">COLOR</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownColor">
                                <a class="dropdown-item">None</a>
                                <a class="dropdown-item">Blue</a>
                                <a class="dropdown-item">Green</a>
                                <a class="dropdown-item">Red</a>
                                <a class="dropdown-item">Brown</a>
                                <a class="dropdown-item">Black</a>
                                <a class="dropdown-item">White</a>
                                <a class="dropdown-item">Yellow</a>
                                <a class="dropdown-item">Orange</a>
                                <a class="dropdown-item">Sky Blue</a>
                                <a class="dropdown-item">Gray</a>
                                <a class="dropdown-item">Pink</a>
                                <a class="dropdown-item">Cream</a>
                                <a class="dropdown-item">Beige</a>
                                <a class="dropdown-item">Purple</a>
                            </div>
                        </div>


                        <div class="btn-group" style="float: right;">
                        <label class="btn dropdown-toggle" href="#" role="button" id="dropdownSortby" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 15px;">SORT BY PRICE</label>
                            <div class="dropdown-menu" aria-labelledby="dropdownSortby">
                                <a class="dropdown-item">None</a>
                                <a class="dropdown-item">Low to high</a>
                                <a class="dropdown-item">High to low</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
                
            <hr style="border:1px solid #C7BBE2;margin-top:0px;">

            <div class="product-content">

                <div class="row" style="margin:0px;">

                    <!-- Loop For Product -->
                    <div class="product-item" v-for="(pd, index) in productlist" :key="index">
                        <router-link to="/productdetail">
                            <div class="div-product">
                                <div class="div-product-img">
                                    <img :src="pd.imageName">
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
                            <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="!pd.is_like" v-on:click="pd.is_like = !pd.is_like">
                                <span class="material-icons-outlined">favorite_border</span>
                            </button>

                            <!-- for liked -->
                            <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="pd.is_like" v-on:click="pd.is_like = !pd.is_like">
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
    data() {
        return {
            displayNone: false,
            displayShow: true,
            isNotLiked: true,
            isLiked: false,

            productlist: [],

            // productData: [
            //     {
            //         product_id: "100001",
            //         product_name: "ANELLO shoulder bag ALTON SIZE REG",
            //         product_location: require('../assets/image/product/Anello/PA1/PA1Pink.png'),
            //         product_price: 3500,
            //         is_like: false,
            //     },
            // ],
        }
    },
    mounted(){
        this.create()
    },
    methods: {
        
        async getproduct() {
            try {
                const res = await fetch('http://13.76.46.188:3000/show');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },

        async create(){
            this.productlist = await this.getproduct();
            console.log(this.productlist)
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
        margin: auto;
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