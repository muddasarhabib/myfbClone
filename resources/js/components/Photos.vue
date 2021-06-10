<template>
    <div  class="set_wdith_on_mobile" >
          <br>
        <div class="row" v-if="photo.length">
           <div class="col-sm-6 col-6 col-lg-3 col-md-4" style="margin-bottom:7px;"  v-for="photos in photo" :key="photos.id"  >
                  <div data-toggle="modal" :data-target="'#model'+photos.id"  >
                       <img :src="'storage/posts/'+photos.file" class="img-fluid image-custom"/>
                  </div>
                 <div class="modal fade" :id="'model'+photos.id" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="    z-index: 5000;">
  <div class="modal-dialog modal-dialog-centered" role="document" style="    max-width: 91%!important;    z-index: 5000;">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <img :src="'storage/posts/'+photos.file" class="img-fluid img-style"/>
      </div>
    
    </div>
  </div>
</div> 
           </div>
        </div>
        <div v-else>
             <h1 class="text-center">No Photo Found</h1>
        </div>
        <br>
    </div>
</template>
<script>


export default {
  name:'Photos',
  mounted(){
    this.$insProgress.finish();
    this.getPhoto();
  },
  data(){
    return{
      photo:[],
    }
  },
  methods:{
    getPhoto(){
            this.photo=[];
          this.$insProgress.start();
          axios.post('api/getPhoto',{
            token:localStorage.getItem('login_token')
          }).then((res)=>{
            // console.log(res.data.photo);
            this.photo=res.data.photo;
             this.$insProgress.finish();

          }).catch((err)=>{
            console.log(err);
          });
    }
  }
}
</script>
<style scoped>
@media (max-width: 560px) {
    .set_wdith_on_mobile {
    width: 99% !important;
  }
}
.set_wdith_on_mobile{
      background: white;
    border-radius: 5px;
    box-shadow: 1px 2px 3px #80808042;
    padding: 7px;
    width: 88%;
     margin: auto
}
.image-custom{
      width: 100%;
    height: 214px;
    object-fit: cover;
        border-radius: 3px;
       box-shadow: 1px 2px 3px 2px #24249933;
    cursor: pointer;
}
.img-style{
  width: 100%;
    height: 500px;
    /* object-fit: none; */
    object-fit: contain;
    background: radial-gradient(#5a1d1d, #3f2d8700);
}
</style>