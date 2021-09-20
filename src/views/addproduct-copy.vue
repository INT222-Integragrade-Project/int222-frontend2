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
                        <input type="text" class="form-control" name="inputProductName" placeholder="GG Marmont crossbody bag">
                    </div>

                    <div class="form-row" >
                        <div class="form-group col-lg-4">
                            <label for="inputPrice"><b>PRICE</b></label>
                            <input type="number" class="form-control" name="inputPrice" placeholder="999.00">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputDate"><b>MANUFACTURE DATE</b></label>
                            <input type="date" class="form-control" name="inputDate">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="inputWarranty"><b>WARRANTY</b></label>
                            <select class="form-control" name="inputWarranty">
                                <option value="3">3 Days</option>
                                <option value="5">5 Days</option>
                                <option value="7">7 Days</option>
                                <option value="30">1 Month</option>
                                <option value="0">None</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-lg-6">
                            <label for="inputSize"><b>SIZE</b></label>
                            <input type="text" class="form-control" name="inputSize" placeholder="25 X 17 X 9 CM">
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="inputState"><b>BRAND</b></label>
                            <select  class="form-control" name="inputState">
                                <option value="10001">Anello</option>
                                <option value="10002">Chanel</option>
                                <option value="10003">Dior</option>
                                <option value="10004">Guicci</option>
                                <option value="10005">Lyn</option>
                                <option value="10006">Ysl</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-12">
                            <label for="productDescription"><b>PRODUCT DESCRIPTION</b></label>
                            <textarea class="form-control" name="productDescription" rows="6"></textarea>
                        </div>
                    </div>

                    <!-- ส่วนของฟอร์ม สี + รูป + Stock //เพิ่มได้โดยการกด Add -->
                    <div class="formColorContent" v-for="(formColor, counter) in formColor" v-bind:key="counter" >
                        <div class="form-group">
                            <label><b>COLOR & IMAGE</b></label>
                            <div class="colornav-wrapper">
                                <div v-for="sw in colorSwatch[formColor.index]" :key="sw.id">
                                    <input type="radio" :name="'txtColor'+formColor.index" :id="sw.formid" :colorName="sw.colorName" :value="sw.id">
                                    <label class="colornav-link" :for="sw.formid" :colorCode="sw.colorCode"><span v-bind:style="{background: sw.bgColor}"></span></label>
                                </div>
                            </div>
                        </div>

                        <div class="row row-image-upload">
                            <div class="form-group col-lg-12">
                                <input type="file" @change="onFileChange">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">

                                <div class="modal fade" id="cropModal0" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            
                                            <canvas id="canvas">
                                                Your browser does not support the HTML canvas tag.
                                            </canvas>
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <!-- <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button> -->
                                            <input type="button" class="btn btn-danger" id="btnRestore" value="Reset" />
                                            <input type="button" class="btn btn-primary" id="btnCrop" value="Crop" />
                                        </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="crop-result">
                                    <img :src="image" class="image-fluid" :style="img_style">
                                </div>
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
    export default {
        name : "addproduct",
        components : {Navbar},
        data() {
            return {
                image: "",
                img_style: "width:100%;",
                indexFormColor: 1,
                colorSwatch: [],
                formColor:[
                    {
                        index: 1,
                    },
                ],
            }
        },
        mounted() {
            this.createColorSwatch(1)
        },
        methods : {
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
                    index: this.indexFormColor
                })

                this.createColorSwatch(this.indexFormColor)
            },
            doAddProduct(){
                console.log("Add Product!")
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