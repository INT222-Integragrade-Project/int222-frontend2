<template>
  <div>
    <!-- <h2 style="margin: 0;">Vue-CropperJS</h2> -->
    <input
      type="file"
      name="image[]"
      accept="image/*"
      style="font-size: 1.2em; padding: 10px 0;"
      @change="setImage"
    >
    <br>
    <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal1">modal</button>
    <div class="modal fade" id="modal1" ref="modal1" tabindex="-1" aria-hidden="true" v-if="showModal" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Crop Image</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align:center">
                <div style="width: 400px; height:300px; border: 1px solid gray; display: inline-block;">
                    <vue-cropper
                        ref="cropper"
                        :guides="true"
                        :view-mode="2"
                        drag-mode="crop"
                        :auto-crop-area="0.5"
                        :min-container-width="250"
                        :min-container-height="180"
                        :background="true"
                        :rotatable="false"
                        :src="imgSrc"
                        alt="Source Image"
                        :img-style="{ 'width': '400px', 'height': '300px' }"
                        :aspect-ratio="1"
                    ></vue-cropper>
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" role="button" class="btn btn-primary" value="Crop" @click.prevent="cropImage"/>
            </div>
            </div>
        </div>
    </div> -->

    <div style="width:100%:text-align:center;" v-if="hidden">
        <div style="width: 400px; height:300px; border: 1px solid gray;">
            <vue-cropper
                ref="cropper"
                :guides="true"
                :view-mode="2"
                drag-mode="crop"
                :auto-crop-area="0.5"
                :min-container-width="250"
                :min-container-height="180"
                :background="true"
                :rotatable="false"
                :src="imgSrc"
                alt="Source Image"
                :img-style="{ 'width': '400px', 'height': '300px' }"
                :aspect-ratio="1"
            ></vue-cropper>
            <!-- <button @click="cropImage" v-if="imgSrc != ''" style="margin-right: 40px;">Crop</button> -->
        </div>
        <input type="button" role="button" class="btn btn-primary" style="margin:20px auto;" value="Crop" v-if="imgSrc != ''" @click="cropImage"/>
    </div>

    <!-- <button @click="rotate" v-if="imgSrc != ''">Rotate</button> -->

    <!-- <div style="width: 400px; height:300px; border: 1px solid gray; display: inline-block;">
      <vue-cropper
        ref="cropper"
        :guides="true"
        :view-mode="2"
        drag-mode="crop"
        :auto-crop-area="0.5"
        :min-container-width="250"
        :min-container-height="180"
        :background="true"
        :rotatable="false"
        :src="imgSrc"
        alt="Source Image"
        :img-style="{ 'width': '400px', 'height': '300px' }"
        :aspect-ratio="1"
      ></vue-cropper>
    </div> -->
    <!-- <img :src="cropImg" alt="Cropped Image"> -->
    <div class="crop-result" v-if="show">
        <img class="cropped-image" v-if="cropImg" :src="cropImg" alt="Cropped Image">
    </div>
    <!-- <img
      :src="cropImg"
      style="width: 200px; height: 150px; border: 1px solid gray"
      alt="Cropped Image"
    >-->
  </div>
</template>

<script>
    import VueCropper from "vue-cropperjs";
    import "cropperjs/dist/cropper.css";
    export default {
        components: {
            VueCropper
        },
        data() {
            return {
                imgSrc: "",
                cropImg: "",
                hidden: false,
                show: true,
            };
        },
        mounted() {
            // for edit page ดึงข้อมูลจาก db 
            // this.cropImg = "http://localhost:8080/img/PD1Red.d96fd641.png"
        },
        methods: {
            setImage(e) {
                const file = e.target.files[0];
                if (!file.type.includes("image/")) {
                    alert("Please select an image file");
                    return;
                }
                if (typeof FileReader === "function") {
                    const reader = new FileReader();
                        reader.onload = event => {
                        this.imgSrc = event.target.result;
                        // rebuild cropperjs with the updated source
                        this.$refs.cropper.replace(event.target.result);
                    };
                    reader.readAsDataURL(file);

                    this.hidden = true
                    this.show = false
                } else {
                    alert("Sorry, FileReader API not supported");
                }
            },
            cropImage() {
                // get image data for post processing, e.g. upload or setting image src
                this.cropImg = this.$refs.cropper.getCroppedCanvas().toDataURL();
                this.hidden = false
                this.show = true
            },
            rotate() {
                // guess what this does :)
                this.$refs.cropper.rotate(90);
            }
        }
    };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
