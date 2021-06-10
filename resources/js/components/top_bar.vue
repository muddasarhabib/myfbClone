<template>
    <div class="container-fluid bg_top" >
      <div class="row">
          <div class="col-12 col-md-5 col-lg-4 change_width" style="margin-top: 6px;    padding-bottom: 0;">
              <div style="position: relative;"  v-click-outside="hide_search">
             <img src="images/header_icon.ico" class="logo_img">
              <input type="text" class="search_input" placeholder="Search facebook"  @keyup="search_user" @input="search_user" v-model="search">    
              <i class="fa fa-search search_icon" aria-hidden="true"></i> 
                <div v-show="show_box" class="search_result">
                          <router-link v-for="user in users" :key="user.id"    :to="'/user/'+user.id+'/'+user.api_token" class="search_person">
                                   <img :src="'storage/posts/'+user.get_photo.file" class="img-fluid prof_img" style="    object-fit: cover;">
                                <h6 class="active_user_name">{{user.name}}  {{user.sname}}  
                              <br>
             
                              
                                 </h6>
    
                           </router-link>
                           <div v-show="show_loading" class="lds-dual-ring"></div>
                           <h3 v-if="record" class="text-center">No Record Found</h3>
                </div>
              </div>
          </div>
           <div v-if="path === '/Home'" class="col-2 col-lg-1 col-md-1 change_width home_main" style="border-bottom: 2px solid blue; padding-bottom: 0;">
             <div class="house text-center">
                <i class="fa fa-home house_icon" aria-hidden="true" style="font-size: 30px;"></i>
             </div>
           </div>
           <div v-else class="col-2 col-lg-1 col-md-1 video_main change_width" style=" padding-bottom: 0;    margin-top: 15px;">
               <router-link  to="/Home">
                
                   <div class="youtube text-center">
                       <i class="fa fa-home video_icon" aria-hidden="true" style="font-size: 30px;"></i>
                  </div>
               </router-link>
           </div>
           <div class="col-2 col-lg-1 col-md-1 video_main change_width" style=" padding-bottom: 0;    margin-top: 15px;">
               <router-link  to="/watch">
                
                   <div class="youtube text-center">
                       <i class="fa fa-youtube-play video_icon" aria-hidden="true" style="font-size: 30px;"></i>
                  </div>
               </router-link>
           </div>
           <div class="col-8 col-lg-6 col-md-5 text-right change_width" style=" padding-bottom: 0;">
                <div class="" style="display: flex;float: right;">
                    <div class="notfication notif bell-main" style="position: relative;">
                       <i class=" fa fa-bell bell_i msg" aria-hidden="true"></i>
                    </div>  
                    <div class="notfication" style="position: relative;">
                        <i class="fa fa-user-plus req_icon fri" aria-hidden="true"></i>
                    </div>
                    <div class="notfication show_msg hide_click_box" style="position: relative;">
                         <i class="fa fa-envelope message_icon " aria-hidden="true"></i>
                    </div>
                    <div style="position: relative;" >
                        <img src="storage/profiles/male_profile.png"  v-click-outside="hide_toggle_popup"  @click="toggle_popup" class="img-fluid prof_img" style="    object-fit: cover;">
                       <div v-show="toggle_profile" ref="childElement" id="hide__popup" class="profile_content" style="z-index: 5;">
                         <div class="container">
                                <div class="hover_div">
                                     <router-link to="/profile" style="text-decoration:none;">
                                     <div class="row">
                                        <div class="col-3" style="padding-top: 0;">
                                          
                                                <img src="storage/profiles/male_profile.png" class="img-fluid go_profile_img">
                                        </div> 
                                        <div class="col-9 active_name_main" style="padding-bottom: 0;">
                                            <h5 class="active_name">
                                              muddasar  jutt

                                            </h5>
                                            <p class="see_profile">See Your Profile</p>
                                        </div>
                                          
                                     </div>
                                            </router-link>

                                </div>   
                                <div class="row">
                                    <div class="col-sm-12">
                                           <hr>
                                       </div>
                               </div>
                               <div class="hover_div"  @click="logout" style="margin-top: 0;padding-bottom: 6px;">
                                    <div class="row">
                                      <div class="col-sm-12 pt-0">
                                          <div style="display: flex;text-decoration: none;">
                                                     <div class="logout_main">
                                                          <i class="fa fa-sign-out logout " aria-hidden="true"></i>
                                                     </div>
                                                  <h4 class="logout_out">Log Out</h4>
                                          </div>
                                         
                                      </div>
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
import ClickOutside from 'vue-click-outside'

export default {
    name:'top_bar',
    data(){
        return{
         toggle_profile:false,  
         path:'' ,
         search:'',
         show_box:false,
         show_loading:false,
         record:false,
         users:[],
        
        }
    },
    methods:{
        logout(){
            localStorage.removeItem('login_token');
            this.$router.push('/Login');
        },
        toggle_popup(){
            
            this.toggle_profile=!this.toggle_profile;
        },
        hide_toggle_popup(){
            // alert('d');
            this.toggle_profile=false;
        },
       search_user(){
           this.users=[];
                 this.record=false;
        //    alert(this.search);
          if(this.search!=''){
              this.show_loading=true;
              this.show_box=true;

            //   this.show_box=true;
            //  console.log(this.search);
            axios.post('api/search-user',{
                'search':this.search,
                 token:localStorage.getItem('login_token')
            }).then((res)=>{
                if(res.data.status==true){
                          this.record=false;
                     this.show_loading=false;

              
                   
                this.users=res.data.users;
                // console.log(res);

                }else{
                    this.users=[];
                     this.record=true;
                     this.show_loading=false;
                   
                }
                    // this.show_loading=false;
            }).catch((err)=>{
                console.log(err);
            });
          }else{
              this.show_box=false;
          }
           
       },
       hide_search(){
        //    alert('hello world');
             $(".search_input").val('');
              this.show_box=false;

       }
    },
     directives: {
    ClickOutside
  },
  mounted () {
      
   
    this.popupItem =  this.$refs.childElement;
   this.path=this.$route.fullPath;
    // console.log(this.path);

            
  },

}

</script>
<style scoped>
.logo_img {
    padding-top: 7px;
    padding-bottom: 9px;
    width: 38px;
}
.see_profile {
    margin-top: -9px;
    font-size: 13px;
    color: gray;
}
.search_person{
    display: flex;
    align-items: center;
    text-decoration: none !important;
   
    padding-bottom: 11px;
    padding-left: 6px;
    border-radius: 9px;
    width: 90%;
    margin: auto;
    margin-top: 4px;
    margin-bottom: 9px;
}
.prof_img {
    width: 39px;
    height: 39px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
}
.search_person:hover{
   background: gainsboro;
}
.search_result{
        position: absolute;
    background: white;
    width: 100%;
    z-index: 3;
    /* height: 100px; */
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%), 0 8px 16px rgb(0 0 0 / 10%);
    border-radius: 8px;
    top: 54px;
}
.logout {
    font-size: 17px;
    padding-right: 10px;
    padding-top: 12px;
    color: black;
    font-weight: 500;
}
.active_name_main {
    text-align: left;
    padding-top: 13px;
    margin-left: -19px;
}
.logout_out {
    padding-top: 20px;
    font-size: 18px;
    /* text-decoration: none; */
    color: black;
    font-weight: 600;
    font-family: sans-serif;
}
.logout_main {
    margin-right: 14px;
    background: #F0F2F5;
    width: 39px;
    height: 39px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
}
.active_name {
    font-size: 1.0625rem;
    font-family: unset;
    font-weight: 600;
    text-transform: capitalize;
    color:black;
}
.bg_top {
    background: white;
    box-shadow: 1px 2px 3px -1px #80808040;
        position: sticky;
    top: 0;
          z-index: 1000;
}
.go_profile_img {
    width: 50px;
    height: 44px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
        object-fit: cover;
}
.hover_div {
    /* background: gray; */
    padding-left: 5px;
    margin-top: 13px;
    border-radius: 9px;
    cursor: pointer;
}
.hover_div:hover {
    background-color: #eaeaea;
}
.profile_content {
    position: absolute;
    background: white;
    height: 337px;
    width: 746%;
    left: -250px;
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%), 0 8px 16px rgb(0 0 0 / 10%);
    border-radius: 8px;
   
}
.change_width{
    position: relative!important;
    width: 100%!important;
    padding-right: 15px!important;
    padding-left: 15px!important;
    margin-left: -2px!important;
}
.search_input {
    margin-left: 13px;
    border-radius: 24px;
    border: none;
    background: #F0F2F5;
    padding-top: 9px;
    padding-bottom: 9px;
    outline: none!important;
    padding-left: 42px;
    width: 68%;
}
.search_icon {
    position: absolute;
     left: 75px;
    top: 16px;
    color: gray;
}
@media (max-width: 580px){
.home_main {
    margin-left: 3px;
}
.house_icon {
    padding-top: 10px!important;
    font-size: 20px!important;
}
}

.active_user_name{
  color: black;
    text-decoration: none!important;
    padding-top: 13px;
    padding-left: 13px;
}
.prof_img {
    width: 39px;
    height: 39px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
}
.house_icon {
    padding-top: 14px;
    color: blue;
}
.search_input::placeholder{
    padding-left:10px;
    font-size:14px;
}
.video_main {
  margin-bottom: 4px;
  
margin-left: 6px;
  
/* margin-top: 3px; */
  
border-radius:8px;
  
cursor: pointer;
}
.video_icon {
    /* padding-top: 14px; */
    color: #00000094;
}
.video_main:hover{
    background: #dcdcdc7a;
}
@media (max-width: 580px){
.video_icon {
    font-size: 20px!important;
    /* padding-top: 10px!important; */
}
.youtube{
        margin-top: -5px;
}
}
.notfication {
    margin-right: 14px;
    background: #F0F2F5;
    width: 39px;
    height: 39px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
}
.notfication i {
    font-size: 17px;
    padding-right: 10px;
    padding-top: 12px;
    color: black;
    font-weight: 500;
}
@media (max-width: 580px){
.notfication {
    margin-top: 0px!important;
}
.prof_img {
    margin-top: 0px!important;
}
}
.lds-dual-ring {
  display: inline-block;
width: 100%;
    height: 100%;
    background: #F0F2F5;
}

.lds-dual-ring:after {
content: " ";
    display: block;
    width: 58px;
    height: 58px;
    margin: 1px;
    border-radius: 65%;
    border: 5px solid #511212;
    border-color: #742323 transparent #8d2b2b transparent;
    -webkit-animation: lds-dual-ring-data-v-2e23ff2e 1.2s linear infinite;
    animation: lds-dual-ring-data-v-2e23ff2e 1.2s linear infinite;
    text-align: center;
    position: relative;
    left: 39%;
    right: 39%;
    margin-top: 8px;
    margin-bottom: 8px;
}

@keyframes lds-dual-ring {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

</style>