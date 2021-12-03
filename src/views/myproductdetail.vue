<template>
  <div class="myproductdetail">
    <navbar></navbar>

    <div class="container" style="max-width: 1200px">
      <div class="row">
        <div class="col-md" style="text-align: center">
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
                    <div class="image-item" v-for="product in currentproduct" :key="product.productColorId">
                      <img style="width: 100%" :src="`https://dorasitkmutt.ddns.net/api/file/${product.imageName}`" :ref="product.imageName" @click="selectImage(product)"/>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-8">
                <div class="product-frame">
                  <vue-magnifier :src="imageLocation" :src-large="imageLocation"/>
                </div>
              </div>

              <div class="col-md-2 row-horizontal">
                <div class="image-item-horizontal">
                  <div class="image-item" v-for="product in currentproduct" :key="product.productColorId">
                    <img style="width: 100%" :src="`https://dorasitkmutt.ddns.net/api/file/${product.imageName}`" :ref="product.imageName" @click="selectImage(product)"/>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-6" style="text-align: center">
            <div class="detailContent">
              <div class="detail-title">{{ product.productName }}</div>
              <div class="detail-productid">ID : {{ product.productId }}</div>

              <div class="detail-price">{{ product.price }} THB</div>
              <div class="detail-amount">Amount {{stock}} pc.</div>

              <div class="detail-description">
                <div class="title">Detail</div>

                <p style="text-indent: 2em; text-align: justify">
                    {{ product.description }}
                </p>

                <div class="title">Size</div>
                <ul>
                  <li>{{ product.size }}</li>
                </ul>
              </div>

              <div class="detail-warranty">
                Warranty : {{ product.warranty }} Days
              </div>

              <div class="detail-color">
                <label for="coloranfimage"><b>Color</b></label
                ><span id="color-selected"></span><br />
                <div class="colornav-wrapper">
                  <div v-for="sw in productColorSwatch" :key="sw.id" @click="onSelectColor(sw.id)">
                    <input type="radio" name="txtColor" :id="sw.formid" :colorName="sw.colorName" :value="sw.id"/>
                    <label class="colornav-link" :for="sw.formid" :colorCode="sw.colorCode">
                      <span v-bind:style="{ background: sw.bgColor }"></span>
                      </label>
                  </div>
                </div>
              </div>

              <div class="detail-submit">
                <router-link :to="{name:'editproduct' , params:{id:this.id}}" class="btn btn-primary"
                  >Edit</router-link>
                <button class="btn btn-danger" @click="confirmDelete(pd)">
                  Delete
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "../components/navbar.vue";
import VueMagnifier from "@/components/vue-magnifier";

export default {
  name: "myproductdetail",
  components: { Navbar, VueMagnifier },
  props: {
    id: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      colorSwatch: [
        {
          id: "20001",
          formid: "radio-B6B0E2",
          colorName: "Purple",
          colorCode: "B6B0E2",
          bgColor: "#B6B0E2",
        },
        {
          id: "20002",
          formid: "radio-1B5893",
          colorName: "Blue",
          colorCode: "1B5893",
          bgColor: "#1B5893",
        },
        {
          id: "20003",
          formid: "radio-C9EFBD",
          colorName: "Green",
          colorCode: "C9EFBD",
          bgColor: "#C9EFBD",
        },
        {
          id: "20004",
          formid: "radio-E95950",
          colorName: "Red",
          colorCode: "E95950",
          bgColor: "#E95950",
        },
        {
          id: "20005",
          formid: "radio-B08266",
          colorName: "Brown",
          colorCode: "B08266",
          bgColor: "#B08266",
        },
        {
          id: "20006",
          formid: "radio-24212A",
          colorName: "Black",
          colorCode: "24212A",
          bgColor: "#24212A",
        },
        {
          id: "20007",
          formid: "radio-FFFFFF",
          colorName: "White",
          colorCode: "FFFFFF",
          bgColor: "#FFFFFF",
        },
        {
          id: "20008",
          formid: "radio-FFE383",
          colorName: "Yellow",
          colorCode: "FFE383",
          bgColor: "#FFE383",
        },
        {
          id: "20009",
          formid: "radio-FEB877",
          colorName: "Orange",
          colorCode: "FEB877",
          bgColor: "#FEB877",
        },
        {
          id: "20010",
          formid: "radio-C7F1FF",
          colorName: "SkyBlue",
          colorCode: "C7F1FF",
          bgColor: "#C7F1FF",
        },
        {
          id: "20011",
          formid: "radio-AEAEAD",
          colorName: "Gray",
          colorCode: "AEAEAD",
          bgColor: "#AEAEAD",
        },
        {
          id: "20012",
          formid: "radio-FFDAF7",
          colorName: "Pink",
          colorCode: "FFDAF7",
          bgColor: "#FFDAF7",
        },
        {
          id: "20013",
          formid: "radio-FFF4E2",
          colorName: "Cream",
          colorCode: "FFF4E2",
          bgColor: "#FFF4E2",
        },
        {
          id: "20014",
          formid: "radio-EDD9BB",
          colorName: "Beige",
          colorCode: "EDD9BB",
          bgColor: "#EDD9BB",
        },
      ],
      
      productColorSwatch: [],
      spoilerShow: true,
      spoilerHide: false,

      product: Object,
      productcolorlist: [],
      currentproduct: [],
      currentcolor: [],
      imageLocation: '',
      stock: 0,
    };
  },
  mounted() {
    this.create();
  },
  methods: {
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
    onSelectColor(colorId) {
      for(let i of this.currentproduct) {
        if(colorId == i.colorId) {
          this.imageLocation = `https://dorasitkmutt.ddns.net/api/file/${i.imageName}`
          this.stock = i.stock
        }
      }
    },
    selectImage(refname) {
      this.imageLocation = `https://dorasitkmutt.ddns.net/api/file/${refname.imageName}`
      this.stock = refname.stock
    },
    async create() {
      this.product = await this.getproduct();
      this.productcolorlist = await this.getproductcolor();
      let j = 0;
      for (let i = 0; i < this.productcolorlist.length; i++) {
        if (this.productcolorlist[i].productId != this.id) {
          continue;
        } else if (this.productcolorlist[i].productId == this.id) {
          this.currentproduct[j] = this.productcolorlist[i];
        }
        j++;
      }
      this.color = await this.getcolor();
      for (let b = 0; b < this.color.length; b++) {
        for(let c = 0; c < this.currentproduct.length ; c++) {
          if(this.color[b].colorId == this.currentproduct[c].colorId) {
            this.currentcolor.push(this.color[b]);
          }
        }
      }
      for (let d = 0; d < this.colorSwatch.length; d++) {
        for(let e = 0; e < this.currentcolor.length ; e++) {
          if(this.colorSwatch[d].id == this.currentcolor[e].colorId) {
            this.productColorSwatch.push(this.colorSwatch[d]);
          }
        }
      }

      this.imageLocation = `https://dorasitkmutt.ddns.net/api/file/${this.currentproduct[0].imageName}`
      this.stock = this.currentproduct[0].stock
    },
        confirmDelete(obj){
            if (confirm("Do you want to delete this product?")) {

                console.log(`https://www.dora.company/api/deleteproductid?deleteproductid=${obj.productId}`)
                fetch(`https://www.dora.company/api/deleteproductid?deleteproductid=${obj.productId}` , {
                method:'DELETE'
                })
                fetch(`https://dorasitkmutt.ddns.net/api/deletefile?deleteimages=${obj.productId}` , {
                method:'DELETE' ,
                headers: { "Authorization" : `Bearer ${this.token}`}
                })
                alert('You have deleted a product!')
                location.reload()
                
            }
        }
  },
};
</script>

<style>
.productDetail {
  background-color: #ffffff;
  min-height: 900px;
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
  min-height: 140px;
}

.detail-submit {
  display: flex;
  margin-top: 30px;
}

.detail-submit .btn {
  margin-right: 80px;
  padding: 5px 30px;
  font-size: 18px;
}

/* Color Panel */
.colornav-wrapper {
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
  width: 100%;
  border: 1px solid #000000;
}

.row-vertical {
  display: block;
  /* position: relative; */
}

.row-horizontal {
  display: none;
  /* position: relative; */
}

/* .image-item-vertical {
		margin: 0px auto;
	} */

.image-item-horizontal {
  margin: 20px auto;
}

.image-item {
  cursor: pointer;
  width: 80px;
  border: 1px solid #000000;
  margin: 4px;
}

.image-item:hover {
  border: 2px solid #ef5f5f;
}

@media only screen and (max-width: 970px) {
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

.image-zoom {
  width: 100%;
  border: 1px solid #000000;
}

.zoom-item {
  width: 80px;
  border: 1px solid #000000;
}

/*set a border on the images to prevent shifting*/
#gallerySelector img {
  border: 2px solid white;
}
</style>