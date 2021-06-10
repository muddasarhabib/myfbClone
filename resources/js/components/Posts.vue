<template >

  <div style="width: 90%; margin: auto" class="set_wdith_on_mobile" >
  
    <div class="row">
      <div class="col-sm-4 mb-2 none_intro_box">
        <div class="color_intro">
          <h4 class="intro_h">Intro</h4>
          <div style="display: flex" class="mb-2 c">
            <i class="fa fa-address-book" style="padding-left: 12px"></i>
            <p class="address">Toba Tek singh</p>
          </div>

          <div style="display: flex" class="mb-2 c">
            <i class="fa fa-address-book" style="padding-left: 12px"></i>
            <p class="address">Toba Tek singh</p>
          </div>

          <div style="display: flex" class="mb-2 c">
            <i class="fa fa-address-book" style="padding-left: 12px"></i>
            <p class="address">Toba Tek singh</p>
          </div>

          <div style="display: flex" class="mb-2 c">
            <i class="fa fa-address-book" style="padding-left: 12px"></i>
            <p class="address">Toba Tek singh</p>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-md-8 col-lg-8 col-12 mb-2">
        <div style="width: 100%" class="main_story">
          <div
            style="
              width: 100%;
              background: white;
              border-radius: 5px;
              padding: 11px;
              box-shadow: 0px 0px 2px 2px #dcdcdc7d;
            "
          >
            <img :src="'storage/posts/'+profile_pic.get_images_single.file" class="user_photo" />
            <input
              type="text"
              readonly
              data-toggle="modal"
              data-target="#exampleModalCenter"
              class="post_input"
              :placeholder="'What'+'\'s on Your Mind,'+fname+'?'"
            />

            <hr />
            <div
              style="
                width: 95%;
                margin: auto;
                display: flex;
                justify-content: space-between;
              "
              class="main_story"
            >
              <div class="main_posts_box">
                <i
                  role="img"
                  class="img_video"
                  style="background-image: url('img/icon.png')"
                >
                </i>
                <span class="text_post">Live Video</span>
              </div>

              <div class="main_posts_box">
                <i
                  role="img"
                  class="img_video"
                  style="
                    background-image: url('img/icon.png');
                    background-position: 0 -104px;
                  "
                >
                </i>
                <span class="text_post">Photo/Video</span>
              </div>

              <div class="main_posts_box">
                <i
                  role="img"
                  class="img_video"
                  style="
                    background-image: url('img/icon.png');
                    background-position: 0 -26px;
                  "
                >
                </i>
                <span class="text_post">Feeling/Activity</span>
              </div>
            </div>
          </div>
        </div>
        <!-- post show start -->
        <div v-for="data in user_post" :key="data.id" class="main_story main_post">
          <div
            style="
              width: 100%;
              padding: 11px;"
          >
            <div style="display: flex; justify-content: space-between">
              <router-link
                to="/profile"
                style="
                  text-decoration: none;
                  display: flex;
                  align-items: center;
                "
              >
                <img  :src="'storage/posts/'+profile_pic.get_images_single.file" class="user_photo" />
                <div style="padding-left: 6px">
                  <span class="user_post_name" style="    text-transform: capitalize;"> {{data.get_user.name}} {{data.get_user.sname}} </span>
                  <br />
                  <div style="margin-top: -5px; font-size: 10px; color: black">
                  
                  {{timeSince(new Date(data.created_at))}}

                  </div>
                </div>
              </router-link>
              <div class="post__icon">
                <i
                  role="image"
                  class="icon_post_drop_down"
                  style="background-image: url('img/icon_2.png')"
                ></i>
              </div>
            </div>

            <p
              style="
                font-family: revert;
                word-break: break-all;
                padding-top: 9px;
              "
               v-if="data.title!=''">
              {{data.title}}
            </p>
          </div>
          <div v-if="data.get_images.length">
             <div  v-for="Files in data.get_images" :key="Files.id" >
               <img v-if="Files.file_type=='image'" :src="'storage/posts/'+Files.file" class="img-fluid" style="width: 100%;" />
               <video v-else   :id="'video'+Files.id" class="img-fluid video_design" style="width: 100%;" :src="'storage/posts/'+Files.file" controls disablePictureInPicture   controlsList=" nofullscreen ">
                     
 
                  </video>
            </div>
          </div>
         
          <div
            style="padding-left: 11px; padding-right: 11px; padding-top: 6px"
          >
            <div style="display: flex; justify-content: space-between">
              <div ><span :class="'count__likes'+data.id">{{data.count_likes.length}}</span> Likes</div>
              <div>0 Comments</div>
            </div>
            <hr style="margin-top: 10px; margin-bottom: 5px" />
            <div style="display:none;" :class="'comment_list'+data.id+'  '+'box_comment'">
              
                  <div class="d-flex justify-content-center" v-if="spinner" style="margin-bottom:15px;">
                   <div class="spinner-border" role="status">
                   <span class="sr-only">Loading...</span>
                    </div>
                  </div>
                <div class="comment_bg" v-for="comt in commentList" :key="comt.id">
                  <div style="display: flex; justify-content: space-between">
              <router-link
                to="/profile"
                style="
                  text-decoration: none;
                  display: flex;
               
                "
              >
                <img  :src="'storage/posts/'+comt.user_img" class="user_photo" style="width: 40px;height: 40px;"/>
                <div style="padding-left: 6px">
                  <span class="user_post_name" style="    text-transform: capitalize;"> {{comt.user_name}} </span>
                  <br />
                  <div style=" font-family: sans-serif;   margin-top: -5px;font-size: 14px;color: #000000b3;  word-break: break-all;">
                  
                     {{comt.comment}}

                  </div>
                </div>
              </router-link>
            
                </div>
                </div>
                 <form id="comment_form" :data-id="data.id">
                  <img :src="'storage/posts/'+profile_pic.get_images_single.file" class="user_photo" style="width: 40px;height: 40px;" />
                    <input
                      type="text"
                     
                      :class="'coomment_input'+data.id+'  '+'coomment_input'"
                      :placeholder="'Write a Comment '+fname+'?'"
                      style="    padding-left: 20px;width: 69%;cursor: auto;"
                      name="comment_input"
                    
                      />
                      
                       <button type="submit" :class="'comment_btn'+data.id+'  '+'disabled_btn'"  :id="'comment'+data.id" v-on:click.prevent="save_comments(data.id)">
                          <i class="fa fa-send comment_icon" ></i>
                       </button>
                        <input type="hidden" :value="data.id" :class="'post__id'+data.id" name="post_id"/>
                        <input type="hidden" :class="'token'+data.id" :value="token"/>
                        <input type="hidden" :class="'user_image'+data.id" :value="profile_pic.get_images_single.file"/> 
                        <input type="hidden" :class="'user_name'+data.id" :value="data.get_user.name+'   '+data.get_user.sname"/> 


                      <hr>
                  </form>
                   <!-- <button v-on:click="s(data.id)">id check</button> -->

            </div>
            <div style="display: flex; justify-content: space-around">
              <div style="    position: relative;"  >
                 <div :class="'like_emoji'+'  '+'show_emoji'+data.id"   ref="childElement" >
                       <ul class="reactions-box" style="margin-bottom: 0!important;"> <!-- Reaction buttons container-->
                 
                         <li class="reaction reaction-love" data-reaction="Love">
                                                                                               <img src="images/th (4).jfif" class="img-fluid" style="       width: 79%;padding-top: 2px;padding-bottom: 2px;" title="Love"/> 



                         </li>
                           <li class="reaction reaction-haha" data-reaction="HaHa">
                                 <img src="images/th (3).jfif" class="img-fluid" style="       width: 79%;padding-top: 2px;padding-bottom: 2px;" title="HaHa"/> 

                           </li>
                           <li class="reaction reaction-wow" data-reaction="Wow">
                                 <img src="images/th (2).jfif" class="img-fluid" style="       width: 79%;padding-top: 2px;padding-bottom: 2px;" title="Wow"/> 
                           </li>
                           <li class="reaction reaction-sad" data-reaction="Sad">
                              <img src="images/th (1).jfif" class="img-fluid" style="       width: 79%;padding-top: 2px;padding-bottom: 2px;" title="Sad" /> 
                           </li>
                           
                         <li class="reaction reaction-angry" data-reaction="Angry" >
                          <img src="images/th.jfif" class="img-fluid" style="       width: 79%;padding-top: 2px;padding-bottom: 2px;" title="Angry" /> 
                         </li>
                     </ul>
                 </div>
                 <input type="hidden" value="0" :class="'checking_effect'+data.id">
                 <div class="like_btn like_btn_hover noselect"   >
             <div v-if="data.count_likes.length>0" >
                <input type='hidden' :value="condition=2"/>
                <div v-for="likes in data.count_likes" :key="likes.id" v-if="likes.user_id==active_user"  :class="'option'+data.id+'  '+'options'+' '+[likes.like_type =='Angry' ? 'Angry' : ''] +' ' +[likes.like_type =='Haha' ? 'Haha' : ''] +' ' +[likes.like_type =='Sad' ? 'Sad' : ''] +' ' +[likes.like_type =='Wow' ? 'Wow' : ''] +' ' +[likes.like_type =='Thankful' ? 'Thankful' : ''] +' ' +[likes.like_type =='Love' ? 'Love' : ''] +' ' +[likes.like_type =='Like' ? 'Like' : ''] "  :style="likes.like_type =='Angry' ?  'color: rgb(247, 113, 75);'   : '' + likes.like_type =='Haha' ?  'color: rgb(240, 186, 21);'   : '' + likes.like_type =='Sad' ?  '    color: rgb(240, 186, 21);'   : '' + likes.like_type =='Wow' ?  '    color: rgb(240, 186, 21);'   : '' + likes.like_type =='Thankful' ?  '  color: rgb(157, 135, 210);'   : '' + likes.like_type =='Love' ?  '      color: rgb(242, 82, 104);'   : '' + likes.like_type =='Like' ?  '     color: rgb(88, 144, 255);'   : '' " >
                       <input type='hidden' :value="condition=1"/>
                    <span class="reactions" >
                     <div class="icon-container">
                        <span data-popup="Like"  :data-id="data.id"  class="like reaction get_data1" @click="add_emjoy(data.id,1)"></span>
                      </div>
                     <div class="icon-container">
                      <span data-popup="Love" :data-id="data.id" class="love reaction get_data2" @click="add_emjoy(data.id,2)"></span>
                     </div>
                     <div class="icon-container">
                       <span data-popup="Thankful" :data-id="data.id" class="thankful reaction get_data3" @click="add_emjoy(data.id,3)"></span>
                     </div>
                    <div class="icon-container">
                     <span data-popup="Wow" :data-id="data.id" class="haha reaction get_data4" @click="add_emjoy(data.id,4)"></span>
                   </div>
                   <div class="icon-container">
                     <span data-popup="Haha" :data-id="data.id" class="wow reaction get_data5" @click="add_emjoy(data.id,5)"></span>
                   </div>
                   <div class="icon-container">
                    <span data-popup="Sad" :data-id="data.id" class="sad reaction get_data6" @click="add_emjoy(data.id,6)"></span>
                  </div>
                  <div class="icon-container">
                   <span data-popup="Angry" :data-id="data.id" class="angry reaction get_data7" @click="add_emjoy(data.id,7)"></span>
                  </div>
               </span>
              
  
                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-if="likes.like_type =='Like'" >
                     
                      <span class="thum"></span>
                       <span style="    padding-left: 3px;">Like </span>
                 
                </span>

                 <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Angry'" >
                     
                     <span class="angree_emjoy"></span>
                       <span style="    padding-left: 3px;">Angry</span>
                 
                </span>

                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Wow'" >
                    <span class="wow_emjoy"></span>
                       <span style="    padding-left: 3px;">Wow</span>
                     
                 
                </span>


                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Haha'" >
                     
                      <span class="haha_emjoy"></span>
                       <span style="    padding-left: 3px;">Haha</span>
                </span>

                 <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Love'" >
                     
                       <span class="love_emjoy"></span>
                       <span style="    padding-left: 3px;">Love</span>
                 <!-- love_emjoy -->
                </span>

                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Sad'" >
                     
                       <span class="sad_emjoy"></span>
                       <span style="    padding-left: 3px;">Sad</span>
                 
                </span>

                 <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" v-else-if="likes.like_type =='Thankful'" >
                     

                     <span class="thankfull_emjoy"></span>
                       <span style="    padding-left: 3px;">Thankful</span>
                 
                </span>
               
               </div>
                  
               <!-- condition -->
               
             </div>
             
             
             
              <div v-else>
                <div :class="'option'+data.id+'  '+'options'"   >
                  <span class="reactions">
                     <div class="icon-container">
                        <span data-popup="Like"  :data-id="data.id"  class="like reaction get_data1" @click="add_emjoy(data.id,1)"></span>
                      </div>
                     <div class="icon-container">
                      <span data-popup="Love" :data-id="data.id" class="love reaction get_data2" @click="add_emjoy(data.id,2)"></span>
                     </div>
                     <div class="icon-container">
                       <span data-popup="Thankful" :data-id="data.id" class="thankful reaction get_data3" @click="add_emjoy(data.id,3)"></span>
                     </div>
                    <div class="icon-container">
                     <span data-popup="Wow" :data-id="data.id" class="haha reaction get_data4" @click="add_emjoy(data.id,4)"></span>
                   </div>
                   <div class="icon-container">
                     <span data-popup="Haha" :data-id="data.id" class="wow reaction get_data5" @click="add_emjoy(data.id,5)"></span>
                   </div>
                   <div class="icon-container">
                    <span data-popup="Sad" :data-id="data.id" class="sad reaction get_data6" @click="add_emjoy(data.id,6)"></span>
                  </div>
                  <div class="icon-container">
                   <span data-popup="Angry" :data-id="data.id" class="angry reaction get_data7" @click="add_emjoy(data.id,7)"></span>
                  </div>
               </span>
  
                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" >
                    
                     <span ><img src='img/thum_like.png' style='width: 17px;height: 17px;margin-top: -4px;'/></span>
                       <span style="    padding-left: 3px;">Like</span>
                   
                </span>
               </div>
             </div>

               <div v-if="condition==2">
                <div :class="'option'+data.id+'  '+'options'"   >
                  <span class="reactions">
                     <div class="icon-container">
                        <span data-popup="Like"  :data-id="data.id"  class="like reaction get_data1" @click="add_emjoy(data.id,1)"></span>
                      </div>
                     <div class="icon-container">
                      <span data-popup="Love" :data-id="data.id" class="love reaction get_data2" @click="add_emjoy(data.id,2)"></span>
                     </div>
                     <div class="icon-container">
                       <span data-popup="Thankful" :data-id="data.id" class="thankful reaction get_data3" @click="add_emjoy(data.id,3)"></span>
                     </div>
                    <div class="icon-container">
                     <span data-popup="Wow" :data-id="data.id" class="haha reaction get_data4" @click="add_emjoy(data.id,4)"></span>
                   </div>
                   <div class="icon-container">
                     <span data-popup="Haha" :data-id="data.id" class="wow reaction get_data5" @click="add_emjoy(data.id,5)"></span>
                   </div>
                   <div class="icon-container">
                    <span data-popup="Sad" :data-id="data.id" class="sad reaction get_data6" @click="add_emjoy(data.id,6)"></span>
                  </div>
                  <div class="icon-container">
                   <span data-popup="Angry" :data-id="data.id" class="angry reaction get_data7" @click="add_emjoy(data.id,7)"></span>
                  </div>
               </span>
  
                <span :class="'button'+'  '+'like__btn'+'  '+'like_text_btn'+data.id+'   '+'small_size_on_mobile'" :data-id="data.id"  @click="simple_like(data.id)" >
                    
                     <span ><img src='img/thum_like.png' style='width: 17px;height: 17px;margin-top: -4px;'/></span>
                       <span style="    padding-left: 3px;">Like</span>
                   
                </span>
               </div>
             </div>
              
              </div>
              </div>
              
              <div class="like_btn" @click="toggle_comment(data.id)">
                <i class="fa fa-comments-o" aria-hidden="true"></i>
                <span>Comment</span>
              </div>
        
            </div>
            <hr style="margin-top: 6px; margin-bottom: 0px" />
          </div>
        </div>
      </div>
    </div>
    <!-- boostrap model  -->

    <div
      class="modal fade"
      id="exampleModalCenter"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Create Post</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form id="post_form" @submit="post_save">
            <div class="modal-body">
              <div style="display: flex">
                <img :src="'storage/posts/'+profile_pic.get_images_single.file" class="img-fluid prof_img" style="object-fit:cover;"/>
                <h5
                  class="active_name"
                  style="font-size: 13px; padding-top: 18px; padding-left: 7px"
                >
                  {{fname}}&nbsp;<span>{{lname}}</span>
                </h5>
              </div>
              <div style="margin-top: 10px">
                <textarea
                  @keyup="add_validation"
                  @input="add_validation"
                  name="text"
                  v-model="posts.text"
                  class="titlles"
                  id="posts_titless"
                  placeholder="What's on Your Mind "
                  rows="4"
                  style="
                    resize: none;
                    width: 100%;
                    outline: none;
                    border: none;
                    font-size: 22px;
                  "
                ></textarea>
                <div class="add_posts_div">
                  <h6 style="padding-top: 6px; padding-left: 6px">
                    Add to Your post
                  </h6>
                  <label for="imgs">
                    <i class="fa fa-camera phto_icon"></i>
                    <input
                      type="file"
                      @change="images"
                      multiple
                      id="imgs"
                      name="image[]"
                      style="display: none"
                    />
                  </label>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" disabled id="login_btn" class="post_btn">
                <div v-if="show_loading" class="lds-dual-ring"></div>
                <span v-else>Posts</span>
              </button>
            </div>
            <input type="hidden" name="token" :value="token" />
          </form>
        </div>
      </div>
    </div>
       <v-snackbar
                   v-model="snackbar"
                        >
                       {{ comment_text }}

                      <template v-slot:action="{ attrs }">
                   <v-btn
                    color="error"
                     text
                  v-bind="attrs"
                  @click="snackbar = false"
                   >
                      Close
                      </v-btn>
                     </template>
                </v-snackbar>
    <input type=" hidden" id="registered_btn" />
         <div v-if="loading_coomment" class="loading_page">
          <div class="loader"></div>
        </div>
  </div>
</template>
<script>
import ClickOutside from 'vue-click-outside'
import {db,storage} from '../firebase.js';
export default {
  name:'Posts',
  data(){
      return {
          posts:{
              image:[],
              text:'',
          },
          user_post:[],
       

          // disabled_btn:true,
          comment_text:"please add comment",
        snackbar:false,
          comment:'',
          condition:0,
          token:'',
          active_user:'',
          show_loading:false,
           top_photo:{},
            cover:'',
            profile:'',
            loading_coomment:false,
            
            profile_pic:{},
            fname:'',
            lname:'',
            commentList:[],
            id:'',
            spinner:false,
            
      }
  },

  methods:{
    hide_comment_bar(){
      // alert('hello worl');
      this.comment_bar=false;
    },
    // count_comments(id){
    // // console.log(id);

    // },
     comment_List(){
                 this.commentList=[];
     

                db.collection("comments")
                .where('post_id','==','153')
      .orderBy("created_at")
      .onSnapshot(querySnapshot => {
         this.commentList=[];
           querySnapshot.forEach(doc => {
             this.commentList.push(doc.data());
      });
          //  console.log(this.commentList);
      });
  
     },
      post_save(e){
          e.preventDefault();
          var formdata=new FormData($("#post_form")[0]);
             axios.interceptors.request.use( (config)=> {
                                        $('#login_btn').attr('disabled','disabled');

                       this.show_loading=true;
                      this.$insProgress.start();

                    return config;
                },  (error)=> {
                    // Do something with request error

                                            // $('#login_btn').removeAttr('disabled');

                       this.show_loading=false;

                                     this.$insProgress.finish();

                    return Promise.reject(error);
                });

                // Add a response interceptor
                axios.interceptors.response.use( (response)=> {

                // $('#login_btn').removeAttr('disabled');
                       this.show_loading=false;


                                          this.$insProgress.finish()


                    return response;
                },  (error)=> {


                        //  $('#login_btn').removeAttr('disabled');
                           this.show_loading=false;
                                        this.$insProgress.finish()


                    // Any status codes that falls outside the range of 2xx cause this function to trigger
                    // Do something with response error
                    return Promise.reject(error);
                });
                axios.post('api/save_posts',formdata, { headers: { 'Content-Type': 'multipart/form-data' } }).then((resp)=>{
                   console.log(resp);


                     document.getElementById("post_form").reset();

                     this.posts.text='';
                     if(this.posts.text!=''){
                                      $('#login_btn').removeAttr('disabled');



                       }else{
                                                $('#login_btn').attr('disabled','disabled');



                     }
                     $('.modal').modal('hide');
                     this.get_post();


                }).catch((err)=>{
                     console.log(err);
                     if(err.response.status==401){
                        localStorage.removeItem('login_token');
                        this.$router.push('/Login');
                    }
                });
      },
      toggle_comment(id){
        //  this.id=id;
          var num = id;
         var post_id = num.toString();
        // alert(this.id);

        // comment_list
         this.commentList=[];
           this.spinner=true;

                db.collection("comments")
     
                   .where('post_id','==',post_id)
      .orderBy("created_at")

      .onSnapshot(querySnapshot => {
           this.commentList=[];
            $(".coomment_input"+id).val('');
           this.spinner=false;
           querySnapshot.forEach(doc => {
            
             console.log(doc.data());
             this.commentList.push(doc.data());
      });
           console.log(this.commentList);
      });
        $(".box_comment").hide();
        $(".comment_list"+id).show();
      },
      save_comments:function(id){
        // alert(id);
        
  
       var comment=$(".coomment_input"+id).val();
       var post__id=$(".post__id"+id).val();
       var user_id=$(".token"+id).val();
       var user_img=$(".user_image"+id).val();
       var user_name=$(".user_name"+id).val();
         var today = new Date();   
        //  this.loading_coomment=true;
       if(comment==''){
        // this.loading_coomment=false;

         alert('empty');
         this.snackbar=true;
   
       }else{
         $(".comment_btn"+id).attr('disabled',true);
        // this.loading_coomment=true;
        // this.snackbar_bar=false;
             this.snackbar=false;
            //  alert(comment);
            db.collection('comments').add({
              comment:comment,
              post_id:post__id,
              user_id:user_id,
              user_img:user_img,
              created_at:today,
              user_name:user_name,
            }).then(resp=>{
                 document.getElementById("comment_form").reset();
                var comment=$(".coomment_input"+id).val('');
              $(".comment_btn"+id).attr('disabled',false);

                // $("comment_btn"+id).attr('disabled',false);
                //  this.loading_coomment=false;

  
            });



        //  alert(comment);
       }
    // return false;
      },
      simple_like(id){
        var id=id;
        // $(document).ready()
        $(document).ready(function () {
      // alert('hello world');
      // var p=0;
      // event.preventDefault();
      // return false;
      // alert('hello world');
    // if(p==0){
    //        p=1;
    //        console.log('hlo');
    // }
    var children = $(this)
    var parent = $(this).parent();
   
    // var id =$(this).data('id');
    //  console.log('like btn'+id);
    //  var count__likes=$(".count__likes"+id).html();
    
    
    // console.log(count__likes);
        if ($(".option"+id).hasClass("Like") || $(".option"+id).hasClass("Love") || $(".option"+id).hasClass("Thankful") || $(".option"+id).hasClass("Haha") || $(".option"+id).hasClass("Wow") || $(".option"+id).hasClass("Sad") || $(".option"+id).hasClass("Angry")) {
          //  $(".count__likes"+id).html(parseFloat($(".count__likes"+id).html())-parseFloat(1));
          //  console.log('han g');
      $(".option"+id).removeClass("Like");
      // $(".option"+id).removeClass("Like");
      $(".option"+id).removeClass("Love");
      $(".option"+id).removeClass("Thankful");
      $(".option"+id).removeClass("Haha");
      $(".option"+id).removeClass("Wow");
      $(".option"+id).removeClass("Sad");
      $(".option"+id).removeClass("Angry");

      // Love Thankful Haha Wow Sad Angry
      $(".option"+id).addClass("default");
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8  ><img src='img/thum_like.png' style='width: 17px;height: 17px;margin-top: -4px;'/></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Like</span>");
      // $(".option"+id).find(".like_text_btn"+id).text("Like");
      
    // console.log("if");
   axios.post('api/likes',{
         'token':localStorage.getItem('login_token'),
         'post_id':id,
         'like_type':'Like',
         'status':'unlike'
      }).then((resp)=>{
        // console.log(resp);

      $(".count__likes"+id).html(resp.data.like_count);
      }).catch((err)=>{
        console.log(err);
      });
    } else if($(".option"+id).hasClass("default")) {
          //  console.log('true');

      $(".option"+id).removeClass("default");
      $(".option"+id).addClass("Like");

   $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='thum' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Like</span>");
      // $(".count__likes"+id).html(parseFloat($(".count__likes"+id).html())+parseFloat(1));
      axios.post('api/likes',{
         'token':localStorage.getItem('login_token'),
         'post_id':id,
         'like_type':'Like',
         'status':'like'
      }).then((resp)=>{
        // console.log(resp);

             $(".count__likes"+id).html(resp.data.like_count);
      }).catch((err)=>{
        console.log(err);
      });
  

    }else{
          //  console.log('ok krta hu');

       $(".option"+id).addClass("Like");
 $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='thum' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Like</span>");

      // $(".count__likes"+id).html(parseFloat($(".count__likes"+id).html())+parseFloat(1));
      axios.post('api/likes',{
         'token':localStorage.getItem('login_token'),
         'post_id':id,
         'like_type':'Like',
         'status':'like'
      }).then((resp)=>{
        // console.log(resp);
             $(".count__likes"+id).html(resp.data.like_count);
      }).catch((err)=>{
        console.log(err);
      });
      
    }
    
    // if ($(this).parent().hasClass("default")) {
      // parent.removeClass("default");

      // parent.addClass("Like");
    // alert("new if");
    // console.log('new if');

    // }
    // return false;
  });
      },
    
      // stop_event(event){
      //  event.stopPropagation();
      // },
      // Addlike(){
      //   // $("input"+id).val('1');
      //   alert('like');
      // },
      add_emjoy(id,empjoy){
        var id=id;
        var dataPopupOld = null;
  var dataPopupNew = null;
        $(document).ready(function(){

    dataPopupNew = $(".get_data"+empjoy).attr("data-popup");
  // var id = $(this).data("id");
    // alert(id);
    $(".option"+id).removeClass("default");
    // like_text_btn
    // like_text_btn112
     if(dataPopupNew=='Like'){
      //  dataPopupNew
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='thum' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Like</span>");
     }else if(dataPopupNew=='Love'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='love_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Love</span>");

     }else if(dataPopupNew=='Thankful'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='thankfull_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Thankful</span>");

     }
     else if(dataPopupNew=='Haha'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='haha_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Haha</span>");

     }
      else if(dataPopupNew=='Angry'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='angree_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Angry</span>");

     }
      else if(dataPopupNew=='Sad'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='sad_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Sad</span>");

     }
         else if(dataPopupNew=='Wow'){
       $(".like_text_btn"+id).html("<span data-v-4ac4d2f8 class='wow_emjoy' ></span><span data-v-4ac4d2f8 style='padding-left: 3px;'>Wow</span>");

     }
    
    // parseFloat($(".count__likes"+id).html())-parseFloat(1);
    // $(".count__likes"+id).html(parseFloat($(".count__likes"+id).html())+parseFloat(1));
    $('.option'+id+':contains(Like)').css('color', 'rgb(88, 144, 255)');
    $('.option'+id+':contains(Love)').css('color', 'rgb(242, 82, 104)');
    $('.option'+id+':contains(Thankful)').css('color', 'rgb(157, 135, 210)');
    $('.option'+id+':contains(Haha),'+'.option'+id+':contains(Wow),'+'.option'+id+':contains(Sad)').css('color', 'rgb(240, 186, 21)');
    $('.option'+id+':contains(Angry)').css('color', 'rgb(247, 113, 75)');
     if(dataPopupNew!='Like'){
    $(".option"+id).removeClass(dataPopupOld);
          $(".option"+id).removeClass('Like');

    $(".option"+id).addClass(dataPopupNew);
    }else{
    $(".option"+id).removeClass(dataPopupOld);

    $(".option"+id).addClass(dataPopupNew);
    }
     axios.post('api/likes',{
         'token':localStorage.getItem('login_token'),
         'post_id':id,
         'like_type':dataPopupNew,
         'status':'like'
      }).then((resp)=>{
        // console.log(resp);
          $(".count__likes"+id).html(resp.data.like_count);
            //  console.log(resp.data.like_count);
      }).catch((err)=>{
        console.log(err);
      });
    dataPopupOld = dataPopupNew
        });
        // console.log('emojy'+id);
      },
      show_like_box(id){
      //  alert(id);
        var check=$(".checking_effect"+id).val();
     

         
      setTimeout(function(){
      $(".show_emoji"+id).css('display','block');

      },1000);
 
      },
      hide_toggle_popup(){
              $(".like_emoji").css('display','none');
          // alert('hello boss');
          // console.log('hello boss');
      }, 
      hide_like_box(id){
        
      //  alert(id);
          // console.log('hello world');
      //  event.stopPropagation();
      // console.log(id);
          setTimeout(function(){
      $(".show_emoji"+id).css('display','none');
      },1000)
      },
      images(event){
        //   alert('hello world');
        //   console.log(event.target.files.length);

        if(event.target.files.length){
                                      $('#login_btn').removeAttr('disabled');



                       }else{
                                                $('#login_btn').attr('disabled','disabled');



                     }

      },
      add_validation(){
        // alert(this.posts.text);
if(this.posts.text!=''){
                                      $('#login_btn').removeAttr('disabled');



                       }else{
                                                $('#login_btn').attr('disabled','disabled');



                     }
      // alert((this.posts.text);
      },
      get_post(){
        this.user_post=[];
        this.$insProgress.start();
       
     axios.post('api/get-post',{
       'tokens':localStorage.getItem('login_token')
     }).then((resp)=>{
        // console.log(resp.data.post);
        this.active_user=resp.data.active_user;
        this.profile_pic=resp.data.profile;
        this.user_post=resp.data.post;
        
        console.log(resp);
  
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
        // console.log(resp.data);
    
        // this.profile=this.top_photo.profile.get_images_single.file;
        this.$insProgress.finish();
     }).catch((err)=>{
    

    if(err.response.status==401){
        this.$insProgress.finish();

                        localStorage.removeItem('login_token');
                        this.$router.push('/Login');
                    }
     })
        
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
handleScroll (event) {
        var tolerancePixel = 10;

    },
    pauses(v){
          return v.pause();

    },
     plays(v){
          return v.play();

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
      },
     
     

  },

directives: {
    ClickOutside
  },
 mounted () {
    this.$insProgress.finish();
// this.posts.text='';
 
 if(this.posts.text!=''){
    $('#login_btn').removeAttr('disabled');

                       }else{
                        //  alert('dd');
  $('#login_btn').attr('disabled',true);

                     }
     this.token=localStorage.getItem('login_token');
    //  console.log(new Date());
     this.Users();
     this.get_post();
         this.getprofile();
        //  this.comment_List();
    //  console.clear();

  
  
  
 
  
  // document
  // $(document).on("click",".reaction",function () {
  
  // });
  },
     
   created () {
      
    window.addEventListener('scroll', this.handleScroll);


    this.$root.$refs.A = this;
  

  },
  destroyed () {
    window.removeEventListener('scroll', this.handleScroll);
    // window.removeEventListener('resize', this.handleScroll,true);

  },
updated(){
 
  const videoss = document.querySelectorAll("video");

   if(videoss!=null && videoss.length!=0){

var video=document.getElementsByTagName("video");


   let isPaused = false; /* Flag for auto-paused video */
let observer = new IntersectionObserver((entries, observer) => { 
  entries.forEach(entry => {
    if(entry.intersectionRatio!=1  && !video.paused){
      var c=entry.target;
      c.pause(); isPaused = true;
    }
    else if(isPaused) {
      var c=entry.target;

      c.play();
       isPaused=false
      }
  });
        
}, {
    root: null, // relative to document viewport 
  rootMargin: '0px', // margin around root. Values are similar to css property. Unitless values not allowed
  threshold: 1.0 // visible amount of item shown in relation to root
});
video.forEach(vid => {

observer.observe(vid);
});
}
this.popupItem =this.$refs.childElement;
// console.log( this.$refs.childElement);

var animateReactionsOn;
var animateReactionsOut;

$(function () {
  $(".options").mouseenter(function () {
    var parent = $(this)
    
    animateReactionsOn = setTimeout(function () {      
      parent.find(".reaction").each(function (index) {
        var element = $(this)
        setTimeout(function () {
          element.addClass("is-visible");
        }, index * 60);
      });
    }, 500);
    
    clearTimeout(animateReactionsOut);
  });
  
  $(".options").mouseleave(function () {
    var parent = $(this)
    
    animateReactionsOut = setTimeout(function () {
      parent.removeClass("active");
      parent.find(".reaction").removeClass("is-visible");
    }, 500);
    
    clearTimeout(animateReactionsOn);
  });
});
},


}

</script>
<style scoped>
@media (max-width:689px){
  .coomment_input::placeholder{
    font-size: 9px!important;
   
  }
  .coomment_input{
   width: 62%!important;
  }

}
.main_posts_box {
  display: flex;
  padding: 7px;
  border-radius: 6px;
  cursor: pointer;
}
.coomment_input{
  margin-left: 13px;
    border-radius: 24px;
    border: none;
    background: #f0f2f5;
    padding-top: 9px;
    padding-bottom: 9px;
    outline: none !important;
}
.comment_icon{
  
    /* width: 40px; */
    background: rgb(88, 144, 255);
    color: white;
    /* height: 40px; */
    border-radius: 50px;
    padding: 11px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;

}
.haha_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
   background-position: -55px 0;
}
.love_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
       background-position: -19px 0;
}
.thankfull_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
      background-position: -109px 0;
}
.wow_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
        background-position: -38px 0;
}
.sad_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
            background-position: -72px 0;
}
.angree_emjoy{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
       background-position: -91px 0;
}
.thum{
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
    background-repeat: no-repeat;
    background-size: cover;
    transition: transform 0s ease 0.7s, opacity 0s ease 0.7s;
    display: inline-block;
    height: 17px;
    width: 17px;
}
.reactions-box li{
  list-style: none;

  cursor: pointer;
  transition: 0.5s;
 
  }
 .reactions-box li img{
    transition: 0.5s;
  }
  @media (max-width:540px){
    .like_btn{
    font-size: 11px!important;
    }
    .small_size_on_mobile{
    font-size: 11px!important;

    }
body .options .reactions{
  left: 110px!important;
}
  }
  .reactions-box{
 display: flex;
  }
  .reactions-box li:hover > img {
      animation-name: reaction_delay;
  animation-duration: .5s;
  }
/* .like-btn:hover .reactions-box {
  display: block;
}
.like-btn:hover .reaction {
  opacity: 1;
  animation-name: reaction_delay;
  animation-duration: .5s;
}    */
 
@keyframes reaction_delay {
  0% {
     width: 79%
  }
  48% {
        width: 85%

  }   
  65% {
        width: 65%

  }    
  100% {
 width: 79%
  }
}


.like_emoji{
  background: white;
    position: absolute;
        top: -42px;
        display: none;
    box-shadow: 1px 2px 13px 1px #80808052;
   width: 187%;
    border-radius: 35px;
    padding: 1px;
    padding-left: 12px;
    padding-right: 12px;
}
/* .like_btn_hover:hover{
        background: red;

} */
#login_btn[disabled] {
  opacity: 0.6;
  cursor: not-allowed;
}
.post__icon {
  display: flex;
  align-items: center;
  cursor: pointer;
  height: 40px;
  width: 39px;
  justify-content: center;
  border-radius: 50px;
}
.post__icon:hover {
  background: #dcdcdc59;
}
.post_btn[disabled] {
  opacity: 0.6;
  cursor: not-allowed;
}
@media (max-width:800px){
  .comment_bg{
  width: 63%!important;

  }
}
.comment_bg{
  width: 40%;
    /* background: #958484; */
    color: white;
    background: #f0f2f5;
    border-radius: 10px;
    padding: 7px;
    margin-bottom: 8px;
    margin-top: 7px;
}
.add_posts_div {
  background: white;
  border: 1px solid gainsboro;
  box-shadow: 1px 1px 2px 0px #80808047;
  display: flex;
  justify-content: space-between;
}
.video_design{
  height: 400px;
    width: 100%;
    object-fit: contain;
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
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
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
@media(max-width: 580px){
  .video_design{
    height: 250px!important;
  }
}
.phto_icon {
  margin-top: 11px;
  margin-right: 15px;
  cursor: pointer;
}
.lds-dual-ring {
  display: inline-block;
  width: 45px;
  height: 21px;
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
.active_name {
  font-size: 1.0625rem;
  font-family: unset;
  font-weight: 600;
  text-transform: capitalize;
}
.post_btn {
  border: none;
  padding: 11px;
  background: rgb(52 41 213);
  color: white;
  padding-left: 61px !important;
  padding-right: 61px !important;
  font-size: 14px;
  padding-top: 16px;
  padding-bottom: 16px;
  font-weight: 700;
  width: 100%;
  font-family: sans-serif;
  text-transform: uppercase;
}
.prof_img {
  width: 39px;
  height: 39px;
  margin-top: 12px;
  border-radius: 50%;
  cursor: pointer;
}
.main_posts_box:hover {
  background: #dcdcdc59;
}
.icon_post_drop_down {
  background-position: 0px -534px;
  background-size: 26px 1138px;
  width: 20px;
  height: 20px;
  background-repeat: no-repeat;
  display: inline-block;
}
.like_btn {
  cursor: pointer;
  /* background: gray; */
  padding-left: 36px;
  padding-right: 46px;
  padding-top: 4px;
  padding-bottom: 4px;
  border-radius: 6px;
   font-family: Helvetica;
  font-weight: bold;
  color: #7f7f7f;
  position: relative;
  cursor: pointer;
  text-align: center;
}
.like_btn:hover{
  background: #dcdcdc59;
}
@media (min-width: 576px) {
  .modal-dialog {
    max-width: 563px !important;
    margin: 1.75rem auto !important;
  }
}

.user_post_name {
  color: black;
  font-weight: 500;
  font-family: sans-serif;
}
.user_post_name:hover {
  text-decoration: underline;
}
.post_close_btn {
  border: none;
  padding: 11px;
  background: #363636;
  color: white;
  padding-left: 61px !important;
  padding-right: 61px !important;
  font-size: 14px;
  padding-top: 16px;
  padding-bottom: 16px;
  font-weight: 700;
  font-family: sans-serif;
  text-transform: uppercase;
}
.main_post {
  background: white;
  border-radius: 5px;
  margin-bottom: 2px;
  margin-top: 15px;
}
.intro_h {
  padding-top: 14px;
  padding-left: 8px;
  padding-bottom: 13px;
  color: black;
}
.color_intro {
  background: white;
  color: #00000085;
  border-radius: 5px;
}

.img_video {
  background-position: 0 0;
  background-size: 26px 276px;
  width: 24px;
  height: 24px;
  background-repeat: no-repeat;
  display: inline-block;
}
.address {
  margin-top: -5px;
  margin-left: 14px;
  font-family: inherit;
  text-transform: capitalize;
  font-weight: 400;
}
.post_input {
  margin-left: 13px;
  border-radius: 24px;
  border: none;
  background: #f0f2f5;
  padding-top: 9px;
  padding-bottom: 9px;
  outline: none !important;
  padding-left: 32px;
  width: 83%;
  cursor: pointer;
}
.user_photo {
  width: 50px;
  height: 50px;
  object-fit: cover;
  border-radius: 50px;
}
.post_input::placeholder {
  padding-left: 12px;
  font-size: 14px;
  margin-top: -5px;
}
.text_post {
  padding-left: 5px;
  color: #65676b;
  font-family: sans-serif;
  font-weight: 700;
}
@media (max-width: 560px) {
  .none_intro_box {
    display: none;
  }
  .set_wdith_on_mobile {
    width: 99% !important;
  }
  .post_input::placeholder {
    padding-left: 2px;
    font-size: 10px;
    margin-top: -5px;
  }
  .text_post {
    font-size: 8px;
    padding-top: 4px;
  }
  .img_video {
    background-size: 20px 276px !important;
    width: 18px !important;
    height: 19px !important;
  }
  .post_input {
    width: 70% !important;
  }
}
@media (max-width: 1024px) and (min-width: 800px) {
  .post_input {
    width: 76% !important;
  }
  .img_video {
    background-size: 20px 276px !important;
    width: 18px !important;
    height: 19px !important;
  }
  .text_post {
    font-size: 10px;
    padding-top: 4px;
  }
}
.noselect {
  -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
     -khtml-user-select: none; /* Konqueror HTML */
       -moz-user-select: none; /* Old versions of Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently
                                  supported by Chrome, Edge, Opera and Firefox */
}
body .options {
  /* background: white; */
  /* width: 70px; */
  /* box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.08), 0 2px 2px rgba(0, 0, 0, 0.15); */
  border-radius: 20px;
  /* padding: 10px 13px; */
  font-size: 0;
  font-family: Helvetica;
  font-weight: bold;
  color: #7f7f7f;
  position: relative;
  cursor: pointer;
  text-align: center;
}
body .options .button {
font-size: 15px;
    vertical-align: middle;
    align-items: center;
    justify-content: center;
    display: flex;
    margin-top: -14px;
}
body .options::before {
  content: "";
  display: inline-block;
  vertical-align: middle;
  height: 16px;
  width: 16px;
  margin-right: 4px;
  background-image: url(https://static.xx.fbcdn.net/rsrc.php/v3/y3/r/GLfzuZS5ZZ5.png);
  background-size: auto;
  background-position: 0 -892px;
}
body .options::before .reactions {
  opacity: 1;
  transition: 0.1s 0.5s;
}
body .options .reactions .icon-container:hover {
  transform: scale(1.3, 1.3) translateY(-5px);
}
body .options:hover .reactions {
  opacity: 1;
}
body .options.default {
  color: #7f7f7f !important;
}
body .options.default::before {
  background-position: 0 -893px;
}
body .options.Like {
  color: #5890ff!important;
}
body .options.Like::before {
  background-position: 0 -922px;
}
body .options.Love::before {
  background-position: 0 -710px;
}
body .options.Thankful::before {
  background-position: 0 -642px;
}
body .options.Haha::before {
  background-position: 0 -676px;
}
body .options.Wow::before {
  background-position: 0 -795px;
}
body .options.Sad::before {
  background-position: 0 -744px;
}
body .options.Angry::before {
  background-position: 0 -608px;
}
body .options .reactions {
  position: absolute;
  bottom: 130%;
  left: 50%;
  transform: translateX(-50%);
  border-radius: 50px;
  background: white;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.08), 0 2px 2px rgba(0, 0, 0, 0.15);
  line-height: 0;
  white-space: nowrap;
  opacity: 0;
  padding: 3px;
  pointer-events: none;
  transition: 0.2s 0.5s;
}
body .options .reactions .icon-container {
  display: inline-block;
  transition: transform 0.2s ease;
}
body .options .reactions .reaction {
  display: inline-block;
  height: 48px;
  width: 48px;
  transform: perspective(1px) scale(0.8, 0.8) translate(0, 0);
  transition: transform 0s 0.7s ease, opacity 0s 0.7s ease;
  line-height: initial;
  opacity: 0;
  border-radius: 100%;
  background-image: url(https://assets.medinnna.com/facebook-reactions.gif);
  background-repeat: no-repeat;
  background-size: auto;
}
body .options .reactions .reaction.is-visible {
  transition: opacity 0.3s ease;
  opacity: 1;
  pointer-events: all;
  -webkit-animation: testes 0.6s ease forwards;
          animation: testes 0.6s ease forwards;
}
@-webkit-keyframes testes {
  0% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 70px);
  }
  30% {
    transform: perspective(1px) scale(0.87, 0.87) translate(0, -4px);
  }
  70% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 1px);
  }
  100% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 0);
  }
}
@keyframes testes {
  0% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 70px);
  }
  30% {
    transform: perspective(1px) scale(0.87, 0.87) translate(0, -4px);
  }
  70% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 1px);
  }
  100% {
    transform: perspective(1px) scale(0.8, 0.8) translate(0, 0);
  }
}
body .options .reactions .reaction.is-visible:hover {
  transform: perspective(1px) scale(1, 1) translate(0, -5px);
}
body .options .reactions .reaction.is-visible:hover::after {
  opacity: 1;
}
body .options .reactions .reaction::after {
  content: attr(data-popup);
  position: absolute;
  background: rgba(0, 0, 0, 0.7);
  border-radius: 15px;
  color: white;
  font-family: helvetica;
  font-weight: bold;
  font-size: 13px;
  padding: 2px 7px;
  top: -25px;
  left: 50%;
  transform: translateX(-50%);
  white-space: nowrap;
  opacity: 0;
  transition: opacity 0.07s ease;
}
body .options .reactions .reaction.like {
  background-position: 0 0;
}
body .options .reactions .reaction.love {
  background-position: -52px 0;
}
body .options .reactions .reaction.thankful {
  background-position: -314px 0;
}
body .options .reactions .reaction.haha {
  background-position: -104px 0;
}
body .options .reactions .reaction.wow {
  background-position: -156px 0;
}
body .options .reactions .reaction.sad {
  background-position: -208px 0;
}
body .options .reactions .reaction.angry {
  background-position: -260px 0;
}
.disabled_btn[disabled]{
/* background: red; */
opacity: 0.6;
cursor: wait;
      /* cursor: not-allowed; */
}
</style>
