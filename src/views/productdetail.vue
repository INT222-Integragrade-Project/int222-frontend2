<template>
    <div class="productdetail">
		<navbar></navbar>   

		<!-- <div style="width:200px;height:200px;">
			<img id="zoom_01" style="width:100%;" src='../assets/image/product/Anello/PA1/PA1Green.png' data-zoom-image="src='../assets/image/product/Anello/PA1/PA1Green.png'"/>
		</div>	 -->

		<!-- <ProductZoomer :base-images="images" :base-zoomer-options="zoomerOptions" /> -->
		{{ data }}
		<div class="container" style="max-width: 1200px;">
			<div class="row">
				<div class="col-md" style="text-align:center;">
					<p class="topic"><b>PRODUCT DETAIL</b></p>
				</div>
			</div>
			
			<div class="productDetail">

				<div class="row">

					<div class="col-xl-6" style="margin-bottom: 50px">
						<div class="row">
							<div class="col-md-4 row-vertical">
								<div class="image-item-vertical">
									<div class="row justify-content-center">
										<div class="image-item" v-for="item in productItem" :key="item.refname">
											<img style="width:100%;" :ref="item.refname" :src="item.item_src" @click="selectImage(item.refname)"/>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-md-8">
								<div class="product-frame">
									<!-- <img :src="imageLocation" style="width:100%"> -->
									<vue-magnifier
										:src="imageLocation"
										:src-large="imageLocation"
									/>
								</div>
							</div>	

							<div class="col-md-2 row-horizontal">
								<div class="image-item-horizontal">
									<!-- <div class="row justify-content-center"> -->
										<div class="image-item" v-for="item in productItem" :key="item.refname">
											<img style="width:100%;" :ref="item.refname" :src="item.item_src" @click="selectImage(item.refname)"/>
										</div>
									<!-- </div> -->
								</div>
							</div>
						</div>	
					</div>

					<div class="col-xl-6" style="text-align: center;">
						
						<div class="detailContent">
							<div class="detail-title">Ida Mini Crossbody Bag</div>
							<div class="detail-productid">รหัสสินค้า : LL21FBF071</div>

							<div class="detail-price">1,990 THB</div> 
							<div class="detail-amount">Amount 1000 pc.</div>

							<div class="detail-description">
								<div class="title">รายละเอียด</div>

								<p style="text-indent:2em;text-align:justify;">
									ALTON A collection that brings together Anello's most popular material of all time, PU (synthetic leather) developed using a new material. that when touched, it gives a soft, smooth feeling durable and strong 
									<span v-if="spoilerHide">According to the main properties of PU (synthetic leather), it is also more lightweight. Anello has also selected a bag shape that is chic, chic, but still has a classic aura. Use earth tones, simple but elegant, easy to match with any outfit. Ready to enjoy traveling smoothly. There is a strap that can be rolled up for easy storage. Can be a Shopping Bag, easy to carry and convenient to use.
									</span>

									<a class="spoiler" v-if="spoilerShow" @click="showSpoiler">อ่านต่อ..</a>
								</p>

								<div class="title">ขนาดสินค้า</div>
								<ul>
									<li>กว้าง x ยาว x สูง x ฐาน</li>
								</ul>
							</div>

							<div class="detail-warranty">รับประกัน : 7 วัน</div>

							<div class="detail-color">
								<label for="coloranfimage"><b>Color</b></label><span id="color-selected"></span><br>
								<div class="colornav-wrapper">
									<!-- 
										<input type="radio" name="txtColor[]" id="radio-COLORCODE" colorName="COLORNAME" value="COLORID">
										<label class="colornav-link" for="radio-COLORCODE" colorCode="COLORCODE"><span id="color-COLORCODE" style="background-color: #COLORCODE;"></span></label> 
									-->

									<div v-for="sw in colorSwatch" :key="sw.id" @click="onSelectColor(sw)">
										<input type="radio" name="txtColor" :id="sw.formid" :colorName="sw.colorName" :value="sw.id">
										<label class="colornav-link" :ref="sw.refItemName" :for="sw.formid" :colorCode="sw.colorCode"><span v-bind:style="{background: sw.bgColor}"></span></label>
									</div>
									
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>

    </div>
</template>

<script>
	import Navbar from "../components/navbar.vue"
	import VueMagnifier from "@/components/vue-magnifier";

	export default {
		name : "productdetail",
		components : {Navbar, VueMagnifier},
		data() {
			return {
				colorSwatch: [
					{
						id:"20001",
						formid:"radio-B6B0E2",
						colorName:"Purple",
						colorCode:"B6B0E2",
						bgColor:"#B6B0E2",
						refItemName: "imgItem1",
					},
					{
						id:"20002",
						formid:"radio-1B5893",
						colorName:"Blue",
						colorCode:"1B5893",
						bgColor:"#1B5893",
						refItemName: "imgItem2",
					},
					{
						id:"20003",
						formid:"radio-C9EFBD",
						colorName:"Green",
						colorCode:"C9EFBD",
						bgColor:"#C9EFBD",
						refItemName: "imgItem3",
					},
					{
						id:"20004",
						formid:"radio-E95950",
						colorName:"Red",
						colorCode:"E95950",
						bgColor:"#E95950",
						refItemName: "imgItem4",
					},
					{
						id:"20005",
						formid:"radio-B08266",
						colorName:"Brown",
						colorCode:"B08266",
						bgColor:"#B08266",
						refItemName: "imgItem5",
					},
					{
						id:"20006",
						formid:"radio-24212A",
						colorName:"Black",
						colorCode:"24212A",
						bgColor:"#24212A",
						refItemName: "imgItem6",
					},
					{
						id:"20007",
						formid:"radio-FFFFFF",
						colorName:"White",
						colorCode:"FFFFFF",
						bgColor:"#FFFFFF",
						refItemName: "imgItem1",
					},
					{
						id:"20008",
						formid:"radio-FFE383",
						colorName:"Yellow",
						colorCode:"FFE383",
						bgColor:"#FFE383",
						refItemName: "imgItem2",
					},
					{
						id:"20009",
						formid:"radio-FEB877",
						colorName:"Orange",
						colorCode:"FEB877",
						bgColor:"#FEB877",
						refItemName: "imgItem3",
					},
					{
						id:"20010",
						formid:"radio-C7F1FF",
						colorName:"SkyBlue",
						colorCode:"C7F1FF",
						bgColor:"#C7F1FF",
						refItemName: "imgItem4",
					},
					{
						id:"20011",
						formid:"radio-AEAEAD",
						colorName:"Gray",
						colorCode:"AEAEAD",
						bgColor:"#AEAEAD",
						refItemName: "imgItem5",
					},
					{
						id:"20012",
						formid:"radio-FFDAF7",
						colorName:"Pink",
						colorCode:"FFDAF7",
						bgColor:"#FFDAF7",
						refItemName: "imgItem6",
					},
					{
						id:"20013",
						formid:"radio-FFF4E2",
						colorName:"Cream",
						colorCode:"FFF4E2",
						bgColor:"#FFF4E2",
						refItemName: "imgItem1",
					},
					{
						id:"20014",
						formid:"radio-EDD9BB",
						colorName:"Beige",
						colorCode:"EDD9BB",
						bgColor:"#EDD9BB",
						refItemName: "imgItem2",
					},
				],
				
				imageLocation: require("../assets/image/product/Anello/PA1/PA1Green.png"),

				productItem: [
					{
						refname: "imgItem1",
						name: "PA1Green.png",
						item_src: require("../assets/image/product/Anello/PA1/PA1Green.png"),
					},
					{
						refname: "imgItem2",
						name: "PA2Blue.png",
						item_src: require("../assets/image/product/Anello/PA2/PA2Blue.png"),
					},
					{
						refname: "imgItem3",
						name: "PA3Black.png",
						item_src: require("../assets/image/product/Anello/PA3/PA3Black.png"),
					},
					{
						refname: "imgItem4",
						name: "PD1Red.png",
						item_src: require("../assets/image/product/Dior/PD1/PD1Red.png"),
					},
					{
						refname: "imgItem5",
						name: "PD2White.png",
						item_src: require("../assets/image/product/Dior/PD2/PD2White.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
					{
						refname: "imgItem6",
						name: "PD4Green.png",
						item_src: require("../assets/image/product/Dior/PD4/PD4Green.png"),
					},
				],

				spoilerShow: true,
				spoilerHide: false,
			}
		}, 
		methods: {
			showSpoiler: function(){
				this.spoilerShow = false
				this.spoilerHide = true
			},
			onSelectColor: function(obj) {
				var ref_item_name = obj.refItemName
				const pdItem = this.productItem.filter((tmp)=>{
					return tmp.refname === ref_item_name;
				}).pop();
				console.log(pdItem)
				this.imageLocation = pdItem.item_src;
				// console.log("เลือกสี แล้วแสดงรูป")
			},
			selectImage: function(refname){
				console.log(refname)
				const pdItem = this.productItem.filter((tmp)=>{
					return tmp.refname === refname;
				}).pop();
				// console.log(this.$refs[refname].item_src)
				this.imageLocation = pdItem.item_src;
			}
		}
	}

</script>

<style>

	.productDetail {
		background-color: #ffffff;
		min-height: 600px;
		width: 100%;
		padding: 50px;
	}

	.detailContent {
		text-align: left;
		margin: 0% 10%;
	}

	.detail-title {
		font-weight: bold;
		font-size: 30px;
	}

	.detail-productid {
		font-size: 14px;
	}

	.detail-price {
		display: inline-block;
		font-weight: bold;
		font-size: 30px;
	}
	
	.detail-amount {
		display: inline-block;
		font-weight: bold;
		font-size: 12px;
	}

	.detail-description {
		font-size: 15px;
	}

	.detail-description .title {
		font-weight: bold;
		font-size: 15px;
		margin: 18px auto;
	}

	.detail-warranty {
		font-weight: bold;
		font-size: 16px;
	}

	.detail-color {
		text-align: left;
		margin: 25px auto 25px 0px;	
		max-width: 270px;
	}


	/* Color Panel */
	.colornav-wrapper {
		/* height: 104px; */
		margin-top: 20px;
	}

	.colornav-wrapper ul {
		margin-block-start: 0px;
		margin-block-end: 0px;
		margin-inline-start: 0px;
		margin-inline-end: 0px;
		padding-inline-start: 0px;
		margin-bottom: 0px;
	}
	
	.colornav-items {
		padding-top: 0;
	}

	.colornav-item {
		float: none;
		margin: 0 2px;
		display: inline-block;
	}

	.colornav-link {
		border: 1px solid #cccccc;
		/* border-radius: 50%; */
		box-sizing: border-box;
		color: #1d1d1f;
		cursor: pointer;
		float: left;
		margin-bottom: 30px;
		margin-right: 8px;
		padding: 3px;
		position: relative;
		width: 30px;
		height: 30px;
		z-index: 1;
	}

	.colornav-link:hover {
		border: 2px solid #002e66;
	}

	.colornav-link:focus {
		border: 3px solid #0070f9;
	}

	.colornav-swatch {
		background: #f5f5f7 center center;
		border-radius: 50%;
		display: block;
		width: 32px;
		height: 32px;
	}

	.colornav-caption {
		position: relative;
		top: -27px;
		left: -15px;
		font-size: 12px;
		min-width: 50px;
		visibility: hidden;
		opacity: 0;
		transition: visibility 0s, opacity 0.5s linear;
	}

	.product-frame {
		width:100%;
		border:1px solid #000000;
	}

	.row-vertical {
		display: block;
		/* position: relative; */
	}

	.row-horizontal {
		display: none;
		/* position: relative; */
	}

	.image-item-vertical {
		margin: 0px auto;
		max-height: 337px;
		min-width: 175px;
		max-width: 175px;
		overflow-y: scroll;
		overflow-x: hidden;
	}

	/* width */
	.image-item-vertical::-webkit-scrollbar {
		width: 5px;
	}
	/* Track */
	.image-item-vertical::-webkit-scrollbar-track {
		background: #f1f1f1;
        border-radius: 100px;
	}
	/* Handle */
	.image-item-vertical::-webkit-scrollbar-thumb {
		background: #888;
        border-radius: 100px;
	}
	/* Handle on hover */
	.image-item-vertical::-webkit-scrollbar-thumb:hover {
		background: #555;
	}

	.image-item-horizontal {
		margin: 20px auto;
		overflow-x: scroll;
		overflow-y: hidden;
		white-space: nowrap
	}

	/* width */
	.image-item-vertical::-webkit-scrollbar {
		width: 5px;
	}
	/* Track */
	.image-item-vertical::-webkit-scrollbar-track {
		background: #f1f1f1;
        border-radius: 100px;
	}
	/* Handle */
	.image-item-vertical::-webkit-scrollbar-thumb {
		background: #888;
        border-radius: 100px;
	}
	/* Handle on hover */
	.image-item-vertical::-webkit-scrollbar-thumb:hover {
		background: #555;
	}

	/* width */
	.image-item-horizontal::-webkit-scrollbar {
		width: 5px;
	}
	/* Track */
	.image-item-horizontal::-webkit-scrollbar-track {
		background: #f1f1f1;
        border-radius: 100px;
	}
	/* Handle */
	.image-item-horizontal::-webkit-scrollbar-thumb {
		background: #888;
        border-radius: 100px;
	}
	/* Handle on hover */
	.image-item-horizontal::-webkit-scrollbar-thumb:hover {
		background: #555;
	}

	.image-item {
		cursor: pointer;
		width: 80px;
		border: 1px solid #000000;
		margin: 4px
	}

	.image-item:hover {
		border: 2px solid #ef5f5f;
	}

	.spoiler {
		color: inherit;
		cursor: pointer;
		font-weight: bold;
	}

	.spoiler:hover {
		color: inherit;
		text-decoration: none;
	}

	@media only screen and (max-width: 992px) {

		.detail-title {
			font-weight: bold;
			font-size: 25px;
		}

		.detail-price {
			display: inline-block;
			font-weight: bold;
			font-size: 25px;
		}

	}

	@media only screen and (max-width: 768px) {

		.row-vertical {
			display: none;
		}

		.row-horizontal {
			display: block;
		}

		.product-frame {
			width:100%;
			margin: 0px auto;
		}

		.image-item {
			display: inline-block;
		}

	}


</style>