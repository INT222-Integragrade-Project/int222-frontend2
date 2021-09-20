<template>
    <div class="myfavorite">
     <navbar></navbar>   
        <div class="container" style="max-width: 1200px;">
            
            <div class="row">
                <div class="col-md" style="text-align: left;">
                    <p class="topic">My Favorite</p>
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

                <div class="row justify-content-sm-center" style="margin:0px;">

                    <!-- Loop For Product -->
                    <div class="product-item" v-for="(pd, index) in productData" :key="index">
                        <router-link to="/productdetail">
                            <div class="div-product">
                                <div class="div-product-img">
                                    <img :src="pd.product_location">
                                </div>
                                
                                <div class="div-product-title">
                                    {{pd.product_name}}
                                </div>
                                <div class="div-product-price">
                                    THB {{pd.product_price}}
                                </div>
                            </div>
                        </router-link>
                        <div class="div-product-favorite">
                            <!-- for unliked -->
                            <!-- <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="!pd.is_like" v-on:click="pd.is_like = !pd.is_like">
                                <span class="material-icons-outlined">favorite_border</span>
                            </button> -->

                            <!-- for liked -->
                            <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="pd.is_like" @click="confirmCancel(pd)">
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
    name : "myfavorite",
    components : {Navbar},
    data() {
        return {
            displayNone: false,
            displayShow: true,
            isNotLiked: true,
            isLiked: false,

            productData: [
                {
                    product_id: "100001",
                    product_name: "ANELLO shoulder bag ALTON SIZE REG",
                    product_location: require('../assets/image/product/Anello/PA1/PA1Pink.png'),
                    product_price: 3500,
                    is_like: true,
                },
                {
                    product_id: "100002",
                    product_name: "ANELLO tote bag TORESA SIZE REG",
                    product_location: require('../assets/image/product/Anello/PA2/PA2Blue.png'),
                    product_price: 2000,
                    is_like: true,
                },
                {
                    product_id: "100003",
                    product_name: "ANELLO backpack CROSS BOTTLE (R) SIZE SMALL",
                    product_location: require('../assets/image/product/Anello/PA3/PA3Black.png'),
                    product_price: 1800,
                    is_like: true,
                },
                {
                    product_id: "100004",
                    product_name: "ANELLO backpack SUBSIST SIZE REG",
                    product_location: require('../assets/image/product/Anello/PA4/PA4Red.png'),
                    product_price: 3200,
                    is_like: true,
                },
                {
                    product_id: "100005",
                    product_name: "ANELLO backpack PASUTERU 2ND SIZE REG",
                    product_location: require('../assets/image/product/Anello/PA5/PA5Black.png'),
                    product_price: 2400,
                    is_like: true,
                },
            ],
        }
    },
    methods: {
        confirmCancel: function(obj){
            if (confirm("ต้องการยกเลิกการกดไลค์?")) {
                obj.is_like = !obj.is_like
                console.log(obj)
                this.productData.splice(this.productData.indexOf(obj), 1);
                return true;
            }
        }
    }
}
</script>