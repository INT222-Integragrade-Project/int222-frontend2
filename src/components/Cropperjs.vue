<template>
  <div>
    <input type="file" name="image[]" accept="image/*" style="font-size: 1.2em; padding: 10px 0;" @change="setImage">
    <br>

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
        </div>
        <input type="button" role="button" class="btn btn-primary" style="margin:20px auto;" value="Crop" v-if="imgSrc != ''" @click="cropImage"/>
    </div>

    <div class="crop-result" v-if="show">
        <img class="cropped-image" v-if="cropImg" :src="cropImg" alt="Cropped Image">
    </div>
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
                ogname: "",
                ogtype: "",
                imgSrc: "",
                cropImg: "",
                hidden: false,
                show: true,
            };
        },
        emits:['image'],
        methods: {            
            setImage(e) {
                const file = e.target.files[0];
                console.log(file)
                if (!file.type.includes("image/")) {
                    alert("Please select an image file");
                    return;
                }
                if (typeof FileReader === "function") {
                    const reader = new FileReader();
                        reader.onload = event => {
                        this.imgSrc = event.target.result;
                        this.$refs.cropper.replace(event.target.result);
                    };
                    reader.readAsDataURL(file);
                    this.ogname = file.name;
                    this.ogtype = file.type;
                    this.hidden = true
                    this.show = false
                } else {
                    alert("Sorry, FileReader API not supported");
                }
            },
            cropImage() {
                this.$refs.cropper.getCroppedCanvas().toBlob((x) => {
                    const y = new File([x],this.randomString()+this.ogname.slice(this.ogname.lastIndexOf('.'),this.ogname.length),{type:this.ogtype})
                    this.$emit('image',y)});
                this.cropImg = this.$refs.cropper.getCroppedCanvas().toDataURL();
                this.hidden = false
                this.show = true
            },
            randomString() {
            var length = 5,
            charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789*@!?",
            retVal = "";
            for (var i = 0, n = charset.length; i < length; ++i) {
                retVal += charset.charAt(Math.floor(Math.random() * n));
            }
            return retVal;
            },
            rotate() {
                this.$refs.cropper.rotate(90);
            }
        }
    };
</script>

<style scoped>
</style>
