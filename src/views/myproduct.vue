<template>
    <div class="myproduct">
     <navbar @search="searchproduct"></navbar>   
        <div class="container" style="max-width: 1200px;">
            
            <div class="row">
                <div class="col-md" style="text-align: left;">
                    <p class="topic">My Product</p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md" style="text-align: center;">
                    <span style="float:left;">{{selectedBrand}}  |  {{selectedSort}}</span>
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

                <div class="row justify-content-sm-fit" style="margin:0px;">

                    <!-- Loop For Product -->
                    <div class="product-item" v-for="(pd, index) in productlist" :key="index">
                        <router-link :to="{name:'myproductdetail' , params:{id:pd.productId}}">
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
                            <button type="button" class="btn link-custom" style="cursor:pointer;" @click="confirmDelete(pd)">
                                <span class="material-icons-outlined">highlight_off</span>
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
    name : "myproduct",
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
            token: '',

            productlist: [],
            ogProductlist: [],
            brands: [],
            colors:[],
            selectedBrand: 'All Brand',
            selectedSort: 'unsorted',
            filterBrand: 0,
        }
    },
    mounted(){
        this.create()
    },
    methods: {
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
        async create(){
            this.productlist = await this.getproducts();
            this.colors = await this.getcolors();
            this.brands = await this.getbrands();
            this.ogProductlist = this.productlist
            this.token = localStorage.token
        },
        confirmDelete(obj){
            if (confirm("Do you want to delete this product?")) {
                console.log(obj.productId)
                fetch(`https://dorasitkmutt.ddns.net/api/deleteproductid?deleteproductid=${obj.productId}` , {
                method:'DELETE' ,
                headers: { "Authorization" : `Bearer ${this.token}`}
                })
                fetch(`https://dorasitkmutt.ddns.net/api/deletefile?deleteimages=${obj.productId}` , {
                method:'DELETE' ,
                headers: { "Authorization" : `Bearer ${this.token}`}
                })
                alert('You have deleted a product!')
                location.reload()
            }
        },
        selectBrand(brand) {
            this.productlist = this.ogProductlist;
            this.filterBrand = brand.brandId
            this.selectedBrand = brand.brandName
            this.productlist = this.productlist.filter(this.checkBrand)
        },
        selectNone() {
            this.productlist = this.ogProductlist;
            this.selectedBrand = 'All Brand'
        },
        checkBrand(product) {
            return product.brandId == this.filterBrand;
        },
        sortNone() {
            this.selectedSort = ''
            this.productlist.sort(function(a, b){return a.productId-b.productId})
        },
        sortL2H() {
            this.selectedSort = 'Price : Low to high'
            this.productlist.sort(function(a, b){return a.price-b.price})
        },
        sortH2L() {
            this.selectedSort = 'Price : High to low'
            this.productlist.sort(function(a, b){return b.price-a.price}) 
        },
        searchproduct(search) {
            if(search == '') {
                return this.productlist = this.ogProductlist
            }
            this.productlist = this.productlist.filter(list => {
                list = list.productName.toLowerCase()
                return list.indexOf(search.toLowerCase()) > -1
            })
        }
    }
}
</script>