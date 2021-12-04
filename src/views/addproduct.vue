<template>

    <div class="addproduct">

        <navbar></navbar>   

        <div class="row">
            <div class="col-md" style="text-align:center;">
                <p class="topic"><b>ADD PRODUCT</b></p>
            </div>
        </div>

        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <form  @submit.prevent="doAddProduct" style="padding:2em; background-color:#ffffff;text-align:left;">

                    <div class="form-group">
                        <label for="inputProductName"><b>PRODUCT NAME</b></label>
                        <input v-model="inputproductname" type="text" class="form-control" name="inputProductName" placeholder="GG Marmont crossbody bag">
                        <span v-if="invalid_productname" class="validate">Please input product name</span>
                    </div>

                    <div class="form-row" >
                        <div class="form-group col-lg-4">
                            <label for="inputPrice"><b>PRICE</b></label>
                            <input v-model="inputprice" type="number" class="form-control" name="inputPrice" placeholder="999.00">
                            <span v-if="invalid_price" class="validate">Please input price</span>
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputDate"><b>MANUFACTURE DATE</b></label>
                            <input v-model="inputmanufacture" type="date" class="form-control" name="inputDate">
                            <span v-if="invalid_manufacture" class="validate">Please input manufacturer date</span>
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputWarranty"><b>WARRANTY</b></label>
                            <select v-model="inputwarranty" class="form-control" name="inputWarranty">
                                <option value="3">3 Days</option>
                                <option value="5">5 Days</option>
                                <option value="7">7 Days</option>
                                <option value="30">1 Month</option>
                                <option value="0">None</option>
                            </select>
                            <span v-if="invalid_warranty" class="validate">Please select warranty</span>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-lg-6">
                            <label for="inputSize"><b>SIZE</b></label>
                            <input v-model="inputsize" type="text" class="form-control" name="inputSize" placeholder="25 X 17 X 9 CM">
                            <span v-if="invalid_size" class="validate">Please input size</span>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="inputState"><b>BRAND</b></label>
                            <select  v-model="inputbrand" class="form-control" name="inputState">
                                <option value="10001">Anello</option>
                                <option value="10002">Chanel</option>
                                <option value="10003">Dior</option>
                                <option value="10004">Guicci</option>
                                <option value="10005">Lyn</option>
                                <option value="10006">Ysl</option>
                            </select>
                            <span v-if="invalid_brand" class="validate">Please select brand</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-12">
                            <label for="productDescription"><b>PRODUCT DESCRIPTION</b></label>
                            <textarea v-model="inputdescription" class="form-control" name="productDescription" rows="6"></textarea>
                            <span v-if="invalid_description" class="validate">Please input description</span>
                        </div>
                    </div>

                    <div class="formColorContent" v-for="(formColor, counter) in formColor" v-bind:key="counter">

                        <div v-if="formColor.isDisplay">
                            <div class="cancel-form-color" @click="cancelFormColor(formColor)" v-if="formColor.enableCancel">
                                <button type="button" class="btn btn-outline-dark"><span class="material-icons-outlined">close</span></button>
                            </div>

                            <div class="form-group">
                                <label><b>COLOR & IMAGE</b></label>
                                <div class="colornav-wrapper">
                                    <div v-for="sw in colorSwatch[formColor.index]" :key="sw.id">
                                        <input type="radio" :name="'txtColor'+formColor.index" :id="sw.formid" :colorName="sw.colorName" :value="sw.id" @click="addColor(sw,formColor.index-1)">
                                        <label class="colornav-link" :for="sw.formid" :colorCode="sw.colorCode"><span v-bind:style="{background: sw.bgColor}"></span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-image-upload">
                                <div class="form-group col-lg-12">
                                    <cropperjs v-if="formColor.visibleComponent==='cropperjs'" @image="addImage"></cropperjs>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4" style="margin-top: 30px;">
                                    <label for="inputStock"><b>Stock</b></label>
                                    <input v-model="inputstock[formColor.index-1]" type="number" class="form-control" id="inputStock0" name="inputStock[]" min="0">
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
        name : "addproduct",
        components : {Navbar, Cropperjs},
        data() {
            return {
                req1: "" ,
                req2: "" ,
                inputproductname: "",
                inputprice: 0,
                inputmanufacture: "",
                inputwarranty: "",
                inputsize: "",
                inputbrand: "",
                inputdescription: "",
                inputcolor: [],
                inputimage: [],
                inputstock: [],
                invalid_productname: false,
                invalid_price: false,
                invalid_manufacture: false,
                invalid_warranty: false,
                invalid_size: false,
                invalid_brand: false,
                invalid_description: false,

                indexFormColor: 1,
                colorSwatch: [],
                formColor:[
                    {
                        index: 1,
                        enableCancel: false,
                        visibleComponent: "cropperjs",
                        isDisplay: true,
                    },
                ],
                token: '',
                
            }
        },
        mounted() {
            this.createColorSwatch(1)
            this.create();
        },
        methods : {
            create() {
                this.token = localStorage.token;
            },
            addImage(file) {
                this.inputimage.push(file)
            },
            addColor(color,index) {
                if(index == 0) {
                    this.inputcolor[index] = color;
                } else {
                for(let i = 0; i < this.inputcolor.length; i++) {
                    if(this.inputcolor[i].id == color.id) {
                        alert('You have already selected this color.')
                    } else {
                        this.inputcolor[index] = color
                    }
                    }
                }
            },
            validating() {
                this.invalid_productname = this.inputproductname === "" ? true : false;
                this.invalid_price = this.inputprice === 0 ? true : false;
                this.invalid_manufacture = this.inputmanufacture === "" ? true : false;
                this.invalid_warranty = this.inputwarranty === "" ? true : false;
                this.invalid_size = this.inputsize === "" ? true : false;
                this.invalid_brand = this.inputbrand === "" ? true : false;
                this.invalid_description = this.inputdescription === "" ? true : false;
                setTimeout(() => {
                    this.invalid_productname = false;
                }, 5000);
                setTimeout(() => {
                    this.invalid_price = false;
                }, 5000);
                setTimeout(() => {
                this.invalid_manufacture = false;
                }, 5000);
                setTimeout(() => {
                    this.invalid_warranty = false;
                }, 5000);
                setTimeout(() => {
                    this.invalid_size = false;
                }, 5000);
                setTimeout(() => {
                    this.invalid_brand = false;
                }, 5000);
                setTimeout(() => {
                    this.invalid_description = false;
                }, 5000);
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
            addFormColor(){
                if(this.inputcolor.length != this.inputstock.length || this.inputcolor.length != this.inputimage.length || this.inputimage.length != this.inputstock.length || this.inputcolor.length == 0) {
                    alert("Please full fill your form")
                }
                this.indexFormColor++
                this.formColor.push({
                    index: this.indexFormColor,
                    enableCancel: true,
                    visibleComponent: "cropperjs",
                    isDisplay: true,
                })
                this.showCancelForm = true
                this.createColorSwatch(this.indexFormColor)
            },
            cancelFormColor(obj){
                if(confirm("Do you want to delete this form?")){
                    const frmColor = this.formColor.filter((tmp)=>{
					return tmp.index === obj.index;
                    }).pop();
                    frmColor.visibleComponent = ""
                    frmColor.isDisplay = false
                }
            },
            doAddProduct(){
                this.validating();
                if(this.invalid_productname == true || this.invalid_price == true || this.invalid_manufacture == true || this.invalid_warranty == true || this.invalid_size == true || this.invalid_brand == true || this.invalid_description == true) {
                    return
                } else {
                this.req1 = `productname=${this.inputproductname}&price=${this.inputprice}&warranty=${this.inputwarranty}&menufacturrerdate=${this.inputmanufacture}&description=${this.inputdescription}&size=${this.inputsize}&brandId=${this.inputbrand}`;
                fetch( `https://dorasitkmutt.ddns.net/api/add?${this.req1}` , {
                method: "POST",
                headers: { "Authorization" : `Bearer ${this.token}`}
                    })
                .then((response => {
                    const res = response.json();
                    return res;
                }
                ))
                .then(response => {
                    for(let i = 0 ; i < this.inputcolor.length ; i++) {
                    fetch( `https://dorasitkmutt.ddns.net/api/addColorImage?productid=${response}&colorid=${this.inputcolor[i].id}&stock=${this.inputstock[i]}&images=${this.inputimage[i].name}` , {
                    method: "POST",
                    headers: { "Authorization" : `Bearer ${this.token}`}
                    
                    })
                    const formData = new FormData()
                    formData.append('upload',this.inputimage[i])
                    fetch( `https://dorasitkmutt.ddns.net/api/upload` , {
                    method: "POST" , 
                    headers: { "Authorization" : `Bearer ${this.token}`} ,
                    body: formData
                    })
                }
                })
                .catch((error) => console.log(error));
                alert("You have added a product!");
                }
            },
        }
    }
</script>

<style>

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

    .formColorContent{
        position: relative;
    }

    .cancel-form-color {
        position: absolute;
        top: 0px;
        right: 0px;
    }

    .cancel-form-color .btn {
        border-radius: 25px;
        opacity: 0.8;
        padding: 0px 5px;
        width: 30px;
        height: 30px;
    }

    .cancel-form-color .btn .material-icons-outlined{
        position: absolute;
        line-height: 1.5;
        font-size: 20px;
        left: 5px;
        top: 0px
    }

    @media only screen and (max-width: 1060px) {
        .row-image-upload {
            display: block;
            margin-top: 75px;
        }
    }

</style>


<style>

    .crop-result {
		border: 1px solid black;
		width: 300px;
		height: 300px;
        overflow: hidden;
	}

    .cropped-image {
        width:100%;
    }
	
</style>