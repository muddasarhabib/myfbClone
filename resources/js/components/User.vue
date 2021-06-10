<template>
    <div >
         <vue-ins-progress-bar></vue-ins-progress-bar>
       <Topbar/>

       <div class="container-fluid bg__cover" >
        <div class="container">
          <div class="row">
              <div class="cover_img" v-bind:style=" { 'background-image': 'url(storage/posts/'+this.cover + ')' }">
                  
              </div>
          </div>
       </div>
       </div>
     
 
     <div class="container-fluid bg-white" style="box-shadow: 1px 2px 3px -1px #80808040;">
       <div class="container">
           <center style="height: 0;cursor: pointer;">
               <img :src="'storage/posts/'+profile"   class="img-fluid profile_img_show"/>
               
           </center>
           <h3 class="user__name" style="text-align: center;margin-bottom: -43px;text-transform: capitalize; padding-top: 37px; padding-right: 26px;">
           {{fname}}&nbsp;<span>{{lname}}</span></h3><br><br>
           <div class="set_margin" style="    width: 90%;margin: auto;    margin-bottom: -28px;padding-top: 18px;">
           <button  class="btn btn-primary" > Friend Request</button>
           <!-- <button class="btn btn-success" >Sent</button> -->
           <button class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalCenter">Message</button>

           </div>
           <br><br>
            <hr style="    width: 90%;margin: auto; margin-top: 1rem;">
            <div class="set_margin" style="    width: 90%;margin: auto;    margin-bottom: -28px;padding-top: 18px;">
                <ul class="ul_children_profile">
                    <li   v-if="check_path == '/user/'+$route.params.id+'/'+$route.params.token" style="border-bottom: 2px solid blue;">
                       <router-link :to="'/user/'+$route.params.id+'/'+$route.params.token"  class="remove_link_style" style="color:blue;">Posts</router-link> 
                    </li>
                    <li v-else>
                       <router-link :to="'/user/'+$route.params.id+'/'+$route.params.token" class="remove_link_style">Posts</router-link>                         
                    </li>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <li   v-if="check_path == '/user-Photos/'+$route.params.id+'/'+$route.params.token" style="border-bottom: 2px solid blue;">
                       <router-link :to="'/user-Photos/'+$route.params.id+'/'+$route.params.token" class="remove_link_style" style="color:blue;">Photos</router-link> 
                    </li>
                    <li v-else>
                       <router-link :to="'/user-Photos/'+$route.params.id+'/'+$route.params.token" class="remove_link_style">Photos</router-link>                         
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;


                </ul>
            </div>
       </div>
     </div>

     <!----Message popup---->
      <div class="modal fade model_messsage" data-backdrop='static' data-keyboard="false" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered model_large" role="document">
    <div class="modal-content message_model_content">
     
      <div class="modal-header " style="box-shadow: 1px 2px 3px gainsboro;    ">
                  
            
                  
        
          <h5 class="modal-title" id="exampleModalLongTitle" style="display: flex;
          align-items: center;">
            <img :src="'storage/posts/'+profile"  class="img-fluid go_profile_img" > <span style="padding-left: 6px;padding-top: 6px;" class="name_user">{{fname}} {{lname}}<br><div class="user-status">Online</div></span>
            </h5>
        <div style="display: flex;justify-content: flex-end;    padding-top: 11px;">
            <i class="fa fa-phone icon_style" style="    font-size: 26px;"></i>
        
            <i class="fa fa-video-camera icon_style" style="    font-size: 26px;"></i>
                 <button type="button" @click="hide_popup" class="close"  aria-label="Close" style="    padding-right: 9px;color: black;position: absolute;top: 0;">
                     <span aria-hidden="true" style=" color: black;">&times;</span>
                  </button>
        </div>
      </div>
      <div class="modal-body model_content" style="    -webkit-transform: rotateX(180deg);">
         <div style="    -webkit-transform: rotateX(-186deg);">
              

               <div   v-for="msg in message_user" :key="msg.id" v-if="msg.sender_id==active_token" style="display: flex;color:white;justify-content: flex-end;margin-bottom:15px;">
                <img :src="msg.sender_img" class="img-fluid go_profile_img" style="  margin-top: 1px;  width: 38px;height: 38px;">
                 &nbsp;
                  <div style="    width: 65%;">
                 <div v-if="msg.message" class="sender-message-box" style="background: #036ee4c9; width: 100%;">
                   <p>
                   {{msg.message}} 
                     </p>
                  <div class="time-sender">
                   {{msg.date}}     {{timeSince(new Date(msg.count_date))}}
                    </div>
  
                  </div>

                  <div v-if="msg.file">
                    <img v-if="msg.file_type=='image'" :src="msg.file"  class="img-fluid msg__img" >
                    <video v-else-if="msg.file_type=='video'" :src="msg.file"  class="img-fluid msg__img" controls></video>
                  </div>
                  </div>
               </div>
               <div style="display: flex;color:white;margin-bottom:15px;" v-else-if="msg.receiver_id==active_token">
                <img :src="msg.sender_img" class="img-fluid go_profile_img" style="  margin-top: 1px;  width: 38px;height: 38px;">
                 &nbsp;
                 <div style="    width: 65%;">
                <div  v-if="msg.message"  class="sender-message-box" style="    width: 100%;">
                  <p>
                    
                   {{msg.message}} 
                    
                   </p>
                     <div class="time-sender">
                        {{msg.date}}     {{timeSince(new Date(msg.count_date))}}
                     </div>

                </div>
               <div v-if="msg.file">
                    <img v-if="msg.file_type=='image'" :src="msg.file" class="img-fluid msg__img" >
                     <video v-else-if="msg.file_type=='video'" :src="msg.file"  class="img-fluid msg__img" controls></video>
               </div>
               </div>
              </div>

         </div>
      
         
      </div>
      <div class="message-model-footer"  style="    background: #dee2e642;">
        <div>
            <form @submit="message_send" id="message_form">
                  <div style="    display: flex;justify-content: space-around;">
                     <input type="text" name="message" class="message-box" placeholder="Type a message"  v-model="message"  />
                    <label for="file">  <i class="fa fa-upload icon_style" style="    font-size: 26px;"></i></label> 
                   
                       <input type="file" name="file" id="file" style="display:none;" @change="images" />
                     <button class="btn btn-primary send_btn" style="border-radius: 26px;padding-left: 24px;padding-right: 24px;">
                         
                           <div v-if="message_send_loading" class="lds-dual-ring"></div>
                           <span v-else>Send</span>
                                  
                         </button>
                 </div>
                        <v-snackbar
                   v-model="snackbar_bar"
                        >
                       {{ snackbar_text }}

                      <template v-slot:action="{ attrs }">
                   <v-btn
                    color="error"
                     text
                  v-bind="attrs"
                  @click="snackbar_bar = false"
                   >
                      Close
                      </v-btn>
                     </template>
                </v-snackbar>
            </form>
           
        </div>
      </div>
      <div v-if="loading" class="loading_model">
          <div class="loader"></div>
      </div>

         <div v-if="loading_persent" class="loading_model">
        <!-- <span class="persent_tage"></span>
         -->
         <div class="persent_tage persent_style" ></div>
      </div>
    
    </div>
  </div>
</div>
      
     <!-- main section -->
     <div class="container">
         <router-view></router-view>
     </div>
          <input type="hidden" id="login_btn"/>

        <div v-if="loading_page" class="loading_page">
          <div class="loader"></div>
        </div>
    </div>
</template>
<script>
 
      
import Topbar from './top_bar';
import {db,storage} from '../firebase.js';
export default {
    name:'profile',
    components:{
        Topbar
    },
    data(){
        return{
            check_path:this.$route.fullPath ,
           top_photo:{},
            cover:'',
            profile:'giphy.gif',
            token:localStorage.getItem('login_token'),
            fname:'',
            lname:'',
            request:true,
            message:'',
            sender_profile:'',
            image:'',
            check_image:'',
            loading:false,
            active_token:localStorage.getItem('login_token'),
            snackbar_bar:false,
            loading_page:false,
            snackbar_text:'Please Enter a Message ',
             uploadValue: 0,
               picture: null,
               file_type:'',
               message_send_loading:false,
               message_user:[],
               loading_persent:false,
               messssage:{},
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
          axios.post('api/get-cover-single-user',{
       'user_id':this.$route.params.id
     }).then((resp)=>{
        // console.log(resp.data);
        this.top_photo=resp.data;
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
      
        this.sender_profile=resp.data.profile.get_images_single.file;
        this.$insProgress.finish();
     }).catch((err)=>{
    

    if(err.response.status==401){
        this.$insProgress.finish();

                        localStorage.removeItem('login_token');
                        this.$router.push('/Login');
                    }
     })
        
      },
 senderprofile(){
      
        this.$insProgress.start();
          axios.post('api/get-profile-single-user',{
         'user_id':this.$route.params.id
     }).then((resp)=>{
      
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
  
      Users(){
          axios.post('api/get-single-user',{
           'user_id':this.$route.params.id
          }).then((res)=>{
              
            this.fname=res.data.user.name;
            this.lname=res.data.user.sname;

                //    console.log(res.data.user.name);
          }).catch((err)=>{
              console.log(err);
          });
      },
      images(event){
           this.message_send_loading=true;
           $(".send_btn").attr('disabled',true); 
        if(event.target.files.length){
            $(".send_btn").attr('disabled',true);
                                   this.check_image=event.target.files[0];
         //   file_type
            //    console.log(this.check_image.type);
         var str = this.check_image.type.split("/");
         this.file_type=str[0];
          const storageRef=storage.ref("messageImages/"+`${this.check_image.name}`).put(this.check_image);
           storageRef.on(`state_changed`,snapshot=>{
            this.uploadValue = (snapshot.bytesTransferred/snapshot.totalBytes)*100;
            this.loading_persent=true;
            $(".persent_tage").html(this.uploadValue+'%');
       }, error=>{console.log(error.message)},
         ()=>{this.uploadValue=100;
            storageRef.snapshot.ref.getDownloadURL().then((url)=>{
             this.picture =url;
           this.message_send_loading=false;

            $(".send_btn").attr('disabled',false);
             $(".persent_tage").html('');
            this.loading_persent=false;

              });
                });


                       }else{
                       this.message_send_loading=false;

                             $(".send_btn").attr('disabled',false);
                                               this.check_image='';

                                 this.file_type='';
                                     this.picture ='';

                     }
      },
       timeSince(date) {
    
      //  console.log(date);
    // return false;
  var seconds = Math.floor((new Date() - date) / 1000);

  var interval = seconds / 31536000;

  if (interval > 1) {
    return Math.floor(interval) + "y";
  }
  interval = seconds / 2592000;
  if (interval > 1) {
    return Math.floor(interval) + "months";
  }
  interval = seconds / 86400;
  if (interval > 1) {
    return Math.floor(interval) + "Day";
  }
  interval = seconds / 3600;
  if (interval > 1) {
    return Math.floor(interval) + "h";
  }
  interval = seconds / 60;
  if (interval > 1) {
    return Math.floor(interval) + "min";
  }
  return Math.floor(seconds) + "Sec";
},
      message_send(e){
       e.preventDefault();
         this.loading=true;
      
        if(this.message =='' &&  this.check_image==''){
              this.loading=false;
            this.snackbar_bar=true;
        }else{
            this.loading=true;
          this.snackbar_bar=false;
          console.log(this.check_image);
        

            
                var today = new Date();

   db.collection('messages').add({
              receiver_id:this.$route.params.token,
              sender_id:localStorage.getItem('login_token'),
              type:'text',
              message:this.message,
              status:0,
              created_at:today,
              file:this.picture,
              file_type:this.file_type,
              sender_img:"storage/posts/"+this.sender_profile,
              receiver_img:"storage/posts/"+this.profile
          }).then((resp)=>{
                 this.message='';
                 this.check_image='';
                 this.picture='';
                  this.loading=false;
                document.getElementById("message_form").reset();

               
             
      
          }).catch((err)=>{
            this.loading=false;
            console.log(err);
          })
                 


        
        }

          },
          hide_popup(){
              this.message='';
              this.picture='';
              this.check_image='';
              this.file_type='';
            document.getElementById("message_form").reset();
           $("#exampleModalCenter").modal("hide");

          }
    },
    mounted(){
        this.$insProgress.finish();
           this.getcover();
           this.senderprofile();
            this.getprofile();
            this.Users();
        //  this.loading_page=false;
      
     
        
        
    },
    created(){
        this.message_user=[];
      this.loading=true;

                db.collection("messages")
      .orderBy("created_at")
      .onSnapshot(querySnapshot => {
              this.message_user=[];
                 this.message='';
                 this.check_image='';
                 this.picture='';
               this.loading=false;

        querySnapshot.forEach(doc => {
               
                if(this.$route.params.token==doc.data().receiver_id && localStorage.getItem('login_token')==doc.data().sender_id || this.$route.params.token==doc.data().sender_id && localStorage.getItem('login_token')==doc.data().receiver_id){
             let timestamp = { seconds: doc.data().created_at.seconds, nanoseconds: doc.data().created_at.nanoseconds } // firebase data     
             let myDate = new Date(timestamp.seconds * 1000) ;
          
            var date = myDate.getDate() + "-"
                + (myDate.getMonth()+1)  + "-" 
                + myDate.getFullYear();
            this.messssage={
              'file':doc.data().file,
              'file_type':doc.data().file_type,
              'message':doc.data().message,
              'receiver_id':doc.data().receiver_id,
              'receiver_img':doc.data().receiver_img,
              'sender_id':doc.data().sender_id,
              'sender_img':doc.data().sender_img,
              'status':doc.data().status,
              'type':doc.data().type,
              'date':date,
              'count_date':myDate








            }
             this.message_user.push(this.messssage);
              // date object
  
  // console.log(myDate)
                }

        });
        // $(". this.message_user")
        // console.log( this.message_user);
      });


  
     }


}
</script>
<style scoped>
.lds-dual-ring {
  display: inline-block;
width: 45px;
    height: 21px;
}
.msg__img{
      width: 100%;
    height: 150px;
    object-fit: contain;
    margin-top: 7px;
    box-shadow: 1px 2px 3px #31556e75;
    border-radius: 12px;
}
.lds-dual-ring:after {
  content: " ";
  display: block;
    width: 28px;
    height: 23px;
  margin: 1px;
  border-radius: 50%;
  border: 5px solid #fff;
  border-color: #fff transparent #fff transparent;
  animation: lds-dual-ring 1.2s linear infinite;
}

@keyframes lds-dual-ring {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
.persent_style{
  background: white;
    /* padding-left: 20px; */
    /* padding-right: 20px; */
    padding-top: 20x;
    padding: 60px;
    border-radius: 21px;
    box-shadow: 1px 2px 3px #ff00004f;
    font-size: 30px;
}
.loading_model{
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    width: 100%;
    background: #80808091;
}
.loading_page{
    top: 0;
    position: absolute;
    display: flex;
    /* align-items: center; */
    justify-content: center;
    height: 100%;
    width: 100%;
    background: #80808091;
    padding-top: 303px;
}

.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
.sender-message-box{
    
    word-break: break-all;
    width: 65%;
    background: #414141;
    color: white;
    border-radius: 18px;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 8px;
    padding-bottom: 4px;
}
.time-sender{
    text-align: right;
    font-size: 10px;
    padding-bottom: 5px;
    color: yellow;
}
.user-status{
    font-size: 9px;
    padding-left: 2px;
    color: red;
}
.message-box{
        width: 50%;
            padding: 6px;
    outline: none!important;
}
.message-model-footer{
    padding: 0.75rem;
    border-top: 1px solid #dee2e6;
    border-bottom-right-radius: calc(0.3rem - 1px);
    border-bottom-left-radius: calc(0.3rem - 1px);
}
.model_content::-webkit-scrollbar {
  width: 10px;
}

/* Track */
.model_content::-webkit-scrollbar-track {
    background: #cfcfcf;
    /* box-shadow: 1px 2px 3px 4px grey */
}
.icon_style{
    display: flex;
    align-items: center;
    cursor: pointer;
    height: 50px;
    width: 50px;
    justify-content: center;
    border-radius: 50px;
}
.icon_style:hover {
  background: #dcdcdc59;
}
/* Handle */
.model_content::-webkit-scrollbar-thumb {
      background: #8888888c;
    border-radius: 18px;
}

/* Handle on hover */
.model_content::-webkit-scrollbar-thumb:hover {
  background: #555;
}
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
.model_content{
    max-height: 350px;
    min-height: 251px;
    overflow-y: scroll;
}

@media (min-width: 576px){
.model_large{
    max-width: 626px!important;
}
}
.message_model_header{
        background: #036EE4;
}
.message_model_content{
    border: none!important;
}
.ul_children_profile li{
    list-style: none;
    display: inline-block;
    font-weight: 600;
        padding-left: 12px;
    padding-right: 12px;
    padding-bottom: 6px;
}
.go_profile_img {
    width: 50px;
      height: 50px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
        object-fit: cover;
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
.name_user{
    font-size: 13px;
}
.chnage_profile_phto {
    right: 26px!important;
}
.set_margin{
   margin-bottom: -28px!important;
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