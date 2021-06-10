<template>
    <div>
         <vue-ins-progress-bar></vue-ins-progress-bar>
       <Topbar/>

       <div class="container-fluid bg__cover">
        <div class="container">
          <div class="row">
              <div class="cover_img" v-bind:style=" { 'background-image': 'url(storage/posts/'+this.cover + ')' }">
                  <div class="main_change_cover">
                   <label for="change_cover" class="chnage_cover_phto">
                       <i class="fa fa-camera"></i>
                       <span style="font-family: cursive;">Edit Cover Photo</span>
                       <form id="cover_form">
                               <input type="file" name="cover_img" @change="change_cover" id="change_cover" style="display: none;" class="c_img">
                               <input type="hidden" :value="token" name="login_token"/>
                       
                       </form>
                   </label>
                  </div>
              </div>
          </div>
       </div>
       </div>
     
     <div class="container-fluid bg-white" style="box-shadow: 1px 2px 3px -1px #80808040;">
       <div class="container">
           <center style="height: 0;cursor: pointer;">
               <img :src="'storage/posts/'+profile"   class="img-fluid profile_img_show"/>
               <label for="change_profile" class="chnage_profile_phto">
               <i class="fa fa-camera"></i>
               </label>
               <form id="profile_form">
                     <input type="file" @change='upload_profile' class="p_img" name="profile_img" id="change_profile" style="display: none;">
                 <input type="hidden" :value="token" name="login_token"/>
               </form>
           </center>
           <h3 class="user__name" style="text-align: center;margin-bottom: -43px;text-transform: capitalize; padding-top: 37px; padding-right: 26px;">
           {{fname}}&nbsp;<span>{{lname}}</span></h3><br><br>
            <hr style="    width: 90%;margin: auto; margin-top: 1rem;">
            <div class="set_margin" style="    width: 90%;margin: auto;    margin-bottom: -28px;padding-top: 18px;">
                <ul class="ul_children_profile">
                    <li   v-if="check_path === '/profile'" style="border-bottom: 2px solid blue;">
                       <router-link to="/profile" class="remove_link_style" style="color:blue;">Posts</router-link> 
                    </li>
                    <li v-else>
                       <router-link to="/profile" class="remove_link_style">Posts</router-link>                         
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <li   v-if="check_path === '/Friends'" style="border-bottom: 2px solid blue;">
                       <router-link to="/Friends" class="remove_link_style" style="color:blue;">Friends</router-link> 
                    </li>
                    <li v-else>
                       <router-link to="/Friends" class="remove_link_style">Friends</router-link>                         
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <li   v-if="check_path === '/Photos'" style="border-bottom: 2px solid blue;">
                       <router-link to="/Photos" class="remove_link_style" style="color:blue;">Photos</router-link> 
                    </li>
                    <li v-else>
                       <router-link to="/Photos" class="remove_link_style">Photos</router-link>                         
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                </ul>
            </div>
       </div>
     </div>
     <!-- main section -->
     <div class="container">
         <router-view></router-view>
     </div>
          <input type="hidden" id="login_btn"/>
    </div>
</template>
<script>

export default {
    name:'profile',
    
    data(){
        return{
            check_path:this.$route.fullPath ,
           top_photo:{},
            cover:'',
            profile:'giphy.gif',
            token:localStorage.getItem('login_token'),
            fname:'',
            lname:'',

        }
    },
   updated() {
           this.check_path=this.$route.fullPath;
    // this.$insProgress.start();

       
    },
    methods:{
        getcover(){
        //   this.user_cover=[];
        this.top_photo={};
        this.$insProgress.start();
          axios.post('api/get-cover',{
       'tokens':localStorage.getItem('login_token')
     }).then((resp)=>{
        // console.log(resp.data);
        this.top_photo=resp.data;
        console.log(this.top_photo.cover.get_images_single.file);
        // this.user_post=resp.data.post;
        this.cover=this.top_photo.cover.get_images_single.file;
    
        this.$insProgress.finish();
     }).catch((err)=>{
    

    if(err.response.status==401){
        this.$insProgress.finish();

                        localStorage.removeItem('login_token');
                        this.$router.push('/Login');
                    }
     })
        
      },

      getprofile(){
      
        this.$insProgress.start();
          axios.post('api/get-profile',{
       'tokens':localStorage.getItem('login_token')
     }).then((resp)=>{
        console.log(resp.data.profile);
    
        this.profile=resp.data.profile.get_images_single.file;
        this.$insProgress.finish();
     }).catch((err)=>{
    

    if(err.response.status==401){
        this.$insProgress.finish();

                        localStorage.removeItem('login_token');
                        this.$router.push('/Login');
                    }
     })
        
      },
      upload_profile(){
        //   $('#profile_form')
        //   var formdata=new FormData($("#post_form")[0]);
       var formdata= new FormData($('#profile_form')[0]);
                //  alert('hello world');
                
                if($("#change_profile").val()!=''){
                       this.profile='giphy.gif';
                  axios.post('api/save_profile',formdata, { headers: { 'Content-Type': 'multipart/form-data' } }).then((resp)=>{
         
                                 this.$root.$refs.A.get_post();

                    this.getprofile();
                  }).catch((err)=>{
                      console.log(err);
                  });

                }
      },
      change_cover(){
       var formdata= new FormData($('#cover_form')[0]);
    if($("#change_cover").val()!=''){
                       this.cover='';
                  axios.post('api/save_cover',formdata, { headers: { 'Content-Type': 'multipart/form-data' } }).then((resp)=>{
                    
                                 this.$root.$refs.A.get_post();

                   this.getcover();
                  }).catch((err)=>{
                      console.log(err);
                  });

                }
      },
      Users(){
          axios.post('api/get-active-user',{
           'tokens':localStorage.getItem('login_token')   
          }).then((res)=>{
              
            this.fname=res.data.user.name;
            this.lname=res.data.user.sname;

                //    console.log(res.data.user.name);
          }).catch((err)=>{
              console.log(err);
          });
      }
    },
    mounted(){
        this.$insProgress.finish();
           this.getcover();
            this.getprofile();
            this.Users();

    }

}
</script>
<style scoped>
.cover_img {
    width: 90%;
    margin: auto;
    height: 350px;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 60% 26%;
    /* border-radius: 13px; */
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
}
.ul_children_profile li{
    list-style: none;
    display: inline-block;
    font-weight: 600;
        padding-left: 12px;
    padding-right: 12px;
    padding-bottom: 6px;
}
.ul_children_profile li a{
    color:black;
}
.remove_link_style{
    text-decoration: none !important;;
}
.bg__cover{
    background-image: linear-gradient(
301deg
, white, #431c1c9e,#ff000063,white);
}
@media (max-width: 580px){
.profile_img_show {
    width: 100px!important;
    top: -81px!important;
    height: 100px!important;
}
.chnage_profile_phto {
    right: 26px!important;
}
.set_margin{
    margin-bottom: -52px!important;
}
.user__name{
        padding-top: 26px!important;
}
}

.profile_img_show {
    object-fit: cover;
    width: 158px;
    top: -124px;
    position: relative;
    height: 158px;
    border-radius: 50%;
    border: 2px solid white;
}
.chnage_profile_phto {
    position: relative;
    top: -80px;
    right: 38px;
    background: white;
    padding-left: 9px;
    padding-right: 9px;
    border-radius: 50%;
    height: 33px;
    width: 33px;
    padding-top: 5px;
    cursor: pointer;
}
@media (max-width: 580px){
.cover_img {
    height: 150px!important;
}

.main_change_cover {
        top: 36px!important;
    /* right: 26px; */
    font-size: 9px;
    left: 4px;
    float: left!important;
}
}
.main_change_cover {
    position: relative;
    top: 259px;
    float: right;
    /* right: 26px; */
    right: 16px;
}
.chnage_cover_phto {
    background: white;
    padding-top: 5px;
    padding-bottom: 6px;
    padding-left: 13px;
    padding-right: 13px;
    border-radius: 6px;
    cursor: pointer;
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%), 0 8px 16px rgb(0 0 0 / 10%);
}
</style>