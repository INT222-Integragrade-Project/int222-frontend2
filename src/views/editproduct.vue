<template>

    <div class="editproduct">

        <navbar></navbar>   

        <div class="row">
            <div class="col-md" style="text-align:center;">
                <p class="topic"><b>EDIT PRODUCT</b></p>
            </div>
        </div>

        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <form  @submit.prevent="doEditProduct(pd)"  style="padding:2em; background-color:#ffffff;text-align:left;">

                    <div class="form-group">
                        <label for="inputProductName"><b>PRODUCT NAME</b></label>
                        <input v-model="editproductname" type="text" class="form-control" name="inputProductName" placeholder="GG Marmont crossbody bag">
                    </div>

                    <div class="form-row" >
                        <div class="form-group col-lg-4">
                            <label for="inputPrice"><b>PRICE</b></label>
                            <input v-model="editprice" type="number" class="form-control" name="inputPrice" placeholder="999.00">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputDate"><b>MANUFACTURE DATE</b></label>
                            <input v-model="editmanufacture" type="date" class="form-control" name="inputDate">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputWarranty"><b>WARRANTY</b></label>
                            <select v-model="editwarranty" class="form-control" name="inputWarranty">
                                <option value="3" :selected="editwarranty == 3">3 Days</option>
                                <option value="5" :selected="editwarranty == 5">5 Days</option>
                                <option value="7" :selected="editwarranty == 7">7 Days</option>
                                <option value="30" :selected="editwarranty == 30">1 Month</option>
                                <option value="0" :selected="editwarranty == 0">None</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-lg-6">
                            <label for="inputSize"><b>SIZE</b></label>
                            <input v-model="editsize" type="text" class="form-control" name="inputSize" placeholder="25 X 17 X 9 CM">
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="inputState"><b>BRAND</b></label>
                            <select v-model="editbrand" class="form-control" name="inputState">
                                <option value="10001" :selected="editbrand == 10001">Anello</option>
                                <option value="10002" :selected="editbrand == 10002">Chanel</option>
                                <option value="10003" :selected="editbrand == 10003">Dior</option>
                                <option value="10004" :selected="editbrand == 10004">Guicci</option>
                                <option value="10005" :selected="editbrand == 10005">Lyn</option>
                                <option value="10006" :selected="editbrand == 10006">Ysl</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-12">
                            <label for="productDescription"><b>PRODUCT DESCRIPTION</b></label>
                            <textarea v-model="editdescription" class="form-control" name="productDescription" rows="6"></textarea>
                        </div>
                    </div>

                    <!-- ส่วนของฟอร์ม สี + รูป + Stock //เพิ่มได้โดยการกด Add -->
                    <div class="formColorContent" v-for="(formColor, counter) in formColor" v-bind:key="counter" >
                        <div v-if="formColor.isDisplay">
                            <!-- <label><b>[ Order: {{formColor.index}} ]</b></label> -->

                            <div class="cancel-form-color" @click="cancelFormColor(formColor)" v-if="formColor.enableCancel">
                                <button type="button" class="btn btn-outline-dark"><span class="material-icons-outlined">close</span></button>
                            </div>

                            <div class="form-group">
                                <label><b>COLOR & IMAGE</b></label>
                                <div class="colornav-wrapper">
                                    <div v-for="sw in colorSwatch[formColor.index]" :key="sw.id">
                                        <input type="radio" :name="'txtColor'+formColor.index" :id="sw.formid" :colorName="sw.colorName" :value="sw.id" :checked="false">
                                        <label class="colornav-link" :for="sw.formid" :colorCode="sw.colorCode"><span v-bind:style="{background: sw.bgColor}"></span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-image-upload">
                                <div class="form-group col-lg-12">
                                    <!-- <input type="file" @change="onFileChange"> -->
                                    <cropperjs v-if="visibleComponent==='cropperjs'"></cropperjs>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4" style="margin-top: 30px;">
                                    <label for="inputStock"><b>Stock</b></label>
                                    <input type="number" class="form-control" id="inputStock0" name="inputStock[]" min="0">
                                </div>
                            </div>

                            <hr style="margin: 30px 0px;">

                        </div>

                    </div>
                    
                    <div style="margin-top: 5em;">
                        <button type="button" class="btn btn-secondary btn-lg btn-block btn-add-custom " @click="addFormColor">ADD+</button>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">SAVE</button>
                        <router-link to="/product" class="btn btn-danger btn-lg btn-block">CANCEL</router-link>
                    </div>

                </form>
            </div>
        </div>
    </div>

</template>

<script>

    import Navbar from "../components/navbar.vue"
    import Cropperjs from "../components/Cropperjs.vue";

    export default {
        name : "editproduct",
        components : {Navbar, Cropperjs},
        props: {
            id: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                token: '',
                product: Object,
                editproductname: "",
                editprice: 0,
                editmanufacture: "",
                editwarranty: "",
                editsize: "",
                editbrand: "",
                editdescription: "",
                editpath: "",
                // color and image
                editcolor: [],
                editimage: [],
                editstock: [],
                 //validate
                invalid_productname: false,
                invalid_price: false,
                invalid_manufacture: false,
                invalid_warranty: false,
                invalid_size: false,
                invalid_brand: false,
                invalid_description: false,
                image: "",
                img_style: "width:100%;",
                indexFormColor: 3, // index ของฟอร์มสินค้า // ถ้าข้อมูลมีหลายสี index จะเป็น จำนวนสินค้า id นี้
                colorSwatch: [],
                formColor:[],
                productcolors: [],
                colors: [],
                product_image: [],
                product_stock: [],
                product_color: [],

                visibleComponent: "cropperjs",
            }
        },
        mounted() {
            this.create();
            // loop for รายการสีที่มี
            this.createColorSwatch(1)


            this.formColor = [
                {
                    index: 1,
                    enableCancel: false,
                    visibleComponent: "cropperjs",
                    isDisplay: true,
                    productColorId: "110001",
                    colorId: "20003",
                    stock: "1000",
                    imageName: require("../assets/image/product/Anello/PA1/PA1Green.png"),
                },
            ]

        },
        methods : {
        async getproduct() {
            try {
                const res = await fetch("https://dorasitkmutt.ddns.net/api/show/" + this.id);
                const data = res.json();
                return data;
            } catch (e) {
                console.log(e);
            }
        },
        async getproductcolor() {
            try {
                const res = await fetch("https://dorasitkmutt.ddns.net/api/showproductcolor");
                const data = res.json();
                return data;
            } catch (e) {
                console.log(e);
            }
        },
        async getcolor() {
            try {
                const res = await fetch("https://dorasitkmutt.ddns.net/api/showallcolor");
                const data = res.json();
                return data;
            } catch (e) {
                console.log(e);
            }
        },
        async create() {
            this.token = localStorage.token;
            this.productcolors = await this.getproductcolor();
            this.colors = await this.getcolor();
            this.product = await this.getproduct();
            this.editproductname = this.product.productName;
            this.editprice = this.product.price;
            this.editmanufacture = this.product.menufacturrerdate;
            this.editwarranty = this.product.warranty;
            this.editsize = this.product.size;
            this.editbrand = this.product.brandId;
            this.editdescription = this.product.description;

            // for() {

            // }
        },
        createColorSwatch(index) {
                this.colorSwatch[index] = [
                    {
                        id:"20001",
                        formid:"radio-B6B0E2" + "-" + index,
                        colorName:"Purple",
                        colorCode:"B6B0E2",
                        bgColor:"#B6B0E2",
                    },
                    {
                        id:"20002",
                        formid:"radio-1B5893" + "-" + index,
                        colorName:"Blue",
                        colorCode:"1B5893",
                        bgColor:"#1B5893",
                    },
                    {
                        id:"20003",
                        formid:"radio-C9EFBD" + "-" + index,
                        colorName:"Green",
                        colorCode:"C9EFBD",
                        bgColor:"#C9EFBD",
                    },
                    {
                        id:"20004",
                        formid:"radio-E95950" + "-" + index,
                        colorName:"Red",
                        colorCode:"E95950",
                        bgColor:"#E95950",
                    },
                    {
                        id:"20005",
                        formid:"radio-B08266" + "-" + index,
                        colorName:"Brown",
                        colorCode:"B08266",
                        bgColor:"#B08266",
                    },
                    {
                        id:"20006",
                        formid:"radio-24212A" + "-" + index,
                        colorName:"Black",
                        colorCode:"24212A",
                        bgColor:"#24212A",
                    },
                    {
                        id:"20007",
                        formid:"radio-FFFFFF" + "-" + index,
                        colorName:"White",
                        colorCode:"FFFFFF",
                        bgColor:"#FFFFFF",
                    },
                    {
                        id:"20008",
                        formid:"radio-FFE383" + "-" + index,
                        colorName:"Yellow",
                        colorCode:"FFE383",
                        bgColor:"#FFE383",
                    },
                    {
                        id:"20009",
                        formid:"radio-FEB877" + "-" + index,
                        colorName:"Orange",
                        colorCode:"FEB877",
                        bgColor:"#FEB877",
                    },
                    {
                        id:"20010",
                        formid:"radio-C7F1FF" + "-" + index,
                        colorName:"SkyBlue",
                        colorCode:"C7F1FF",
                        bgColor:"#C7F1FF",
                    },
                    {
                        id:"20011",
                        formid:"radio-AEAEAD" + "-" + index,
                        colorName:"Gray",
                        colorCode:"AEAEAD",
                        bgColor:"#AEAEAD",
                    },
                    {
                        id:"20012",
                        formid:"radio-FFDAF7" + "-" + index,
                        colorName:"Pink",
                        colorCode:"FFDAF7",
                        bgColor:"#FFDAF7",
                    },
                    {
                        id:"20013",
                        formid:"radio-FFF4E2" + "-" + index,
                        colorName:"Cream",
                        colorCode:"FFF4E2",
                        bgColor:"#FFF4E2",
                    },
                    {
                        id:"20014",
                        formid:"radio-EDD9BB" + "-" + index,
                        colorName:"Beige",
                        colorCode:"EDD9BB",
                        bgColor:"#EDD9BB",
                    }
                ]
            },
        onFileChange: function(e){
                var files = e.target.files;
                this.createImage(files[0]);
            },
        createImage(files){
                var reader = new FileReader();
                reader.onload=(e)=> {
                    this.image = e.target.result;
                }
                reader.readAsDataURL(files);
            },
        addFormColor(){
                this.indexFormColor++
                this.formColor.push({
                    index: this.indexFormColor,
                    enableCancel: true,
                    visibleComponent: "cropperjs",
                    isDisplay: true,
                })

                this.createColorSwatch(this.indexFormColor)
            },
        cancelFormColor(obj){
                if(confirm("ต้องการยกเลิกรายการสีและรูปภาพนี้?")){
                    const frmColor = this.formColor.filter((tmp)=>{
                        return tmp.index === obj.index;
                    }).pop();
                    console.log(frmColor)
                    frmColor.visibleComponent = ""
                    frmColor.isDisplay = false
                    // this.formColor.splice(this.formColor.indexOf(frmColor), 1);
                }
            },
        doEditProduct(){
            this.editpath = `productname=${this.editproductname}&price=${this.editprice}&warranty=${this.editwarranty}&menufacturrerdate=${this.editmanufacture}&description=${this.editdescription}&size=${this.editsize}&brandId=${this.editbrand}`;
            fetch( `https://dorasitkmutt.ddns.net/api/edit/100001?${this.editpath}` , {
                method: "PUT", 
                headers: { "Authorization" : `Bearer ${this.token}`}
            })
            alert('You have edited a product!');
            console.log("Edit Product!")
            }
        }
    }
</script>

<style>

	/* Color Panel */
	input[type="radio"] {
		display: none;
	}

	input[type="radio"]:checked + .colornav-link span { 
		transform: scale(1.25);
		border: 3px solid #0070f9;
	}

	.colornav-link {
		display: inline-block;
		cursor: pointer;
		border: 3px solid #cccccc;
		border-radius: 50%;
		color: #1d1d1f;
		margin-bottom: 30px;
		margin-right: 25px;
		padding: 2px;
		width: 42px;
		height: 42px;
	}

	.colornav-link:hover span {
		transform: scale(1.25); 
	}

	.colornav-link span {
		display: block;
		width: 100%;
		height: 100%;
		border-radius: 50%;
		transition: transform .2s ease-in-out;
	}

	.colornav-wrapper {
        height: 45px;
		margin-top: 10px !important;
	}

	.colornav-wrapper ul {
		margin-block-start: 0px;
		margin-block-end: 0px;
		margin-inline-start: 0px;
		margin-inline-end: 0px;
		padding-inline-start: 0px;
		margin-bottom: 0px;
	}
	
	.colornav-caption {
		position: relative;
		top: 35px;
		left: -10px;
		font-size: 12px;
		min-width: 50px;
		visibility: hidden;
		opacity: 0;
		transition: visibility 0s, opacity 0.5s linear;
		
	}

	.btn-add-custom {
		background-color: #888f97;
	}

	.btn-add-custom:hover {
		background-color: #666f77;
	}

    .row-image-upload {
        display: flex;
    }

    @media only screen and (max-width: 1060px) {
        .row-image-upload {
            display: block;
            margin-top: 75px;
        }
    }

</style>


<style>

	/* Image Preview & Crop */
	.image-crop {
		max-width: 100%; /* This rule is very important, please do not ignore this! */
	}

	#canvas {
		height: 100%;
		width: 100%;
		background-color: #ffffff;
		cursor: default;
		border: 1px solid black;
	}

	#crop-result {
		border: 1px solid black;
		width: 300px;
		height: 300px;
        overflow: hidden;
	}
	
</style>