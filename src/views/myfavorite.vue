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
                    <div class="product-item" v-for="(pd, index) in myFavProducts" :key="index">
                        <router-link to="/productdetail">
                            <div class="div-product">
                                <div class="div-product-img">
                                    <img :src="`http://13.76.46.188:3000/getfirstpic/${pd.productId}`">
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
                            <!-- <button type="button" class="btn link-custom" style="cursor:pointer;" v-if="!pd.is_like" v-on:click="pd.is_like = !pd.is_like">
                                <span class="material-icons-outlined">favorite_border</span>
                            </button> -->

                            <!-- for liked -->
                            <button type="button" class="btn link-custom" style="cursor:pointer;" @click="delFav(pd)">
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
            // displayNone: false,
            // displayShow: true,
            // isNotLiked: true,
            // isLiked: false,
            sessId: 0,
            myFav: [
                // {
                //     product_id: "100001",
                //     product_name: "ANELLO shoulder bag ALTON SIZE REG",
                //     product_location: require('../assets/image/product/Anello/PA1/PA1Pink.png'),
                //     product_price: 3500,
                //     is_like: true,
                // },
            ],
            products: [],
            myFavProducts: [],
            favIdForDel: 0,
        }
    },
    methods: {
        // confirmCancel: function(obj){
        //     if (confirm("ต้องการยกเลิกการกดไลค์?")) {
        //         obj.is_like = !obj.is_like
        //         console.log(obj)
        //         this.productData.splice(this.productData.indexOf(obj), 1);
        //         console.log(this.productData);
        //         return true;
        //     }
        // },
        delFav(obj) {
            if (confirm("Do you want to cancel this liked product?")) {
            for(let i = 0 ; i < this.myFav.length ; i++) {
                if(obj.productId === this.myFav[i].productId) {
                    this.favIdForDel = this.myFav[i].favoriteId;
                    console.log(this.favIdForDel)
                    break;
                }
            }
            fetch( `http://13.76.46.188:3000/${this.sessId}/DeleteFav/?favoriteId=${this.favIdForDel}` , {
                method: "DELETE",
                })
                .then(() => location.reload())
                console.log(obj.productId);
            }
        },
        async getFav() {
            this.sessId = localStorage.sessId;
            try {
                const res = await fetch(`http://13.76.46.188:3000/${this.sessId}/MyFav/`);
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async getproducts() {
            try {
                const res = await fetch('http://13.76.46.188:3000/show');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
        },
        async create() {
            this.myFav = await this.getFav();
            this.products = await this.getproducts();
            for(let i = 0 ; i < this.myFav.length ; i++) {
                for(let j = 0 ; j < this.products.length ; j++) {
                    if(this.myFav[i].productId === this.products[j].productId) {
                        this.myFavProducts[i] = this.products[j]
                    }
                }
                // console.log(this.myFavProducts[i])
            }
            // console.log(this.myFavProducts)
            // console.log(this.myFav);
        },
    },
    mounted() {
        this.create()
    }
}
</script>