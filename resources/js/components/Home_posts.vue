<template>
    <div style="padding:0px;width:100%;">
       <div style="    width: 89%;margin: auto;" class="main_story">
         <div class="row">
           <div class="col-3 col-lg-3 col-md-3 col-sm-4" >
              <router-link to="/add-status" style="    text-decoration: none;">
                <div class="bg_status" style="    background: white;border-radius: 6px;height: 155px;">
                  <div class="background_img background_img_1" style="  background: url(img/muddasar.jpg);">
                     
                  </div>
                       <div class="plus_icon">
                         <i class="fa fa-plus"></i>
                       </div>   
                       <div class="create_story">
                         <h6>Create a Story</h6>
                       </div>
                </div>
              </router-link>
           </div>
            <div class="col-3 col-lg-3 col-md-3 col-sm-4" >
              <router-link to="/add-status" style="    text-decoration: none;">
                <div class="bg_status" style="    background: white;border-radius: 6px;height: 155px;">
                  <div class="background_img " style="  height: 100%;  background: url(img/louie.jpg);    border-bottom-left-radius: 6px;border-bottom-right-radius: 6px;">
                  
                    <div>
                      <img src="storage/profiles/male_profile.png" class="profile_photo"/>
                    </div>

                  </div>
                        <div class="create_story">
                          <h6 class="story_user_name" style="       margin-top: -63px; color: white;">Louie Kris</h6>
                       </div>
                </div>
              </router-link>
           </div>

            <div class="col-3 col-lg-3 col-md-3 col-sm-4" >
              <router-link to="/add-status" style="    text-decoration: none;">
                <div class="bg_status" style="    background: white;border-radius: 6px;height: 155px;">
                  <div class="background_img " style="  height: 100%;  background: url(img/Mudd2.jpg);    border-bottom-left-radius: 6px;border-bottom-right-radius: 6px;">
                  
                    <div>
                      <img src="img/Mudd1.jpg" class="profile_photo"/>
                    </div>

                  </div>
                        <div class="create_story">
                          <h6 class="story_user_name" style="       margin-top: -63px; color: white;">Shoaib Jutt</h6>
                       </div>
                </div>
              </router-link>
           </div>


            <div class="col-3 col-lg-3 col-md-3 col-sm-4" >
              <router-link to="/add-status" style="    text-decoration: none;">
                <div class="bg_status" style="    background: white;border-radius: 6px;height: 155px;">
                  <div class="background_img " style="  height: 100%;  background: url(img/Mudd1.jpg);    border-bottom-left-radius: 6px;border-bottom-right-radius: 6px;">
                  
                    <div>
                      <img src="img/Mudd2.jpg" class="profile_photo"/>
                    </div>

                  </div>
                        <div class="create_story">
                          <h6 class="story_user_name" style="       margin-top: -63px; color: white;">Waqas Jutt</h6>
                       </div>
                </div>
              </router-link>
           </div>

           

           
         </div>
       </div>
        
      <div style="width:81%;margin:auto;    margin-top: 32px;" class="main_story">
        <div style="width:100%;background:white;border-radius:5px;padding: 11px;box-shadow: 0px 0px 2px 2px #dcdcdc7d;" >
           <img src="img/Mudd2.jpg" class="user_photo"/>
            <input type="text" readonly  class="post_input" @click="post_model" placeholder="What's on Your Mind,Muddasar ?"/>
            
          <hr>
          <div style="width:95%;margin:auto; display: flex;     justify-content: space-between;" class="main_story">
                <div class="main_posts_box">
                   <i role="img" class="img_video" style=" background-image: url('img/icon.png');">

                  </i>
                   <span class="text_post">Live Video</span>
               </div>

                <div  class="main_posts_box">
                   <i role="img" class="img_video" style=" background-image: url('img/icon.png');background-position: 0 -104px;">

                  </i>
                   <span class="text_post">Photo/Video</span>
               </div>


                <div class="main_posts_box" >
                   <i role="img" class="img_video" style=" background-image: url('img/icon.png');background-position: 0 -26px;">

                  </i>
                   <span class="text_post">Feeling/Activity</span>
               </div>
          </div>
             
        </div>

      </div>
      <!-- post statrt -->
    <div style=" margin-top: 32px;">
      <div  class="main_story main_post">
        <div style="width:100%;padding: 11px;box-shadow: 0px 0px 2px 2px #dcdcdc7d;" >
         <div style="display: flex; justify-content: space-between;">
               <router-link to="/profile/1" style="text-decoration:none;display: flex;align-items: center; ">
                      <img src="img/Mudd2.jpg" class="user_photo"/>
                <div style="    padding-left: 6px;">
                       <span class="user_post_name">Muddasar jutt</span>
                       <br>
                      <div style="    margin-top: -5px;    font-size: 10px;color: black;">9h</div>
                  </div>
            
                </router-link>
              <div class="post__icon" >
                 <i role="image" class="icon_post_drop_down" style="background-image: url('img/icon_2.png');"></i>
              </div>
         </div>
         
           
           
                <p style="font-family: revert;word-break: break-all;padding-top: 9px;">
                   Hamza ko mention karo
                </p>
            
         
             
        </div>
        <div>
          <img src="img/muddasar.jpg" class="img-fluid"/>
        </div>
        <div style="padding-left: 11px;padding-right: 11px;padding-top: 6px;">
            <div style="    display: flex;justify-content: space-between;">
               <div>
                 9 Likes
               </div>
               <div>
                 7 Comments
               </div>
            </div>
            <hr style="    margin-top: 10px;margin-bottom: 5px;">
            <div style="    display: flex; justify-content: space-around;">
              <div class="like_btn">
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                 <span>Like</span>
              </div>
              <div class="like_btn">
                <i class="fa fa-comments-o" aria-hidden="true"></i>
                 <span>Comment</span>
              </div>
            </div>
            <hr style="margin-top: 6px;margin-bottom:0px;">

        </div>

      </div>
      <div  class="main_story main_post">
        <div style="width:100%;padding: 11px;box-shadow: 0px 0px 2px 2px #dcdcdc7d;" >
          <router-link to="/profile/1" style="text-decoration:none;display: flex;align-items: center;">
             <img src="img/Mudd1.jpg" class="user_photo"/>
            <div style="    padding-left: 6px;">
                <span class="user_post_name">Muddasar jutt</span>
              <br>
              <div style="    margin-top: -5px;    font-size: 10px;color: black;">9h</div>
            </div>
            
          </router-link>
           
            
          <p style="font-family: revert;word-break: break-all;padding-top: 9px;">
            Hamza ko mention karo
          </p>
         
             
        </div>
        <div>
          <img src="img/Mudd2.jpg" class="img-fluid"/>
        </div>
        <div style="padding-left: 11px;padding-right: 11px;padding-top: 6px;">
            <div style="    display: flex;justify-content: space-between;">
               <div>
                 9 Likes
               </div>
               <div>
                 7 Comments
               </div>
            </div>
            <hr style="    margin-top: 10px;margin-bottom: 5px;">
            <div style="    display: flex; justify-content: space-around;">
              <div class="like_btn">
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                 <span>Like</span>
              </div>
              <div class="like_btn">
                <i class="fa fa-comments-o" aria-hidden="true"></i>
                 <span>Comment</span>
              </div>
            </div>
            <hr style="margin-top: 6px;margin-bottom:0px;">

        </div>

      </div>

      <div  class="main_story main_post">
        <div style="width:100%;padding: 11px;box-shadow: 0px 0px 2px 2px #dcdcdc7d;" >
          <router-link to="/profile/1" style="text-decoration:none;display: flex;align-items: center;">
             <img src="img/Mudd2.jpg" class="user_photo"/>
            <div style="    padding-left: 6px;">
                <span class="user_post_name">Muddasar jutt</span>
              <br>
              <div style="    margin-top: -5px;    font-size: 10px;color: black;">9h</div>
            </div>
            
          </router-link>
           
            
          <p style="font-family: revert;word-break: break-all;padding-top: 9px;">
            Hamza ko mention karo
          </p>
         
             
        </div>
        <div>
          <img src="img/Mudd2.jpg" class="img-fluid"/>
        </div>
        <div style="padding-left: 11px;padding-right: 11px;padding-top: 6px;">
            <div style="    display: flex;justify-content: space-between;">
               <div>
                 9 Likes
               </div>
               <div>
                 7 Comments
               </div>
            </div>
            <hr style="    margin-top: 10px;margin-bottom: 5px;">
            <div style="    display: flex; justify-content: space-around;">
              <div class="like_btn">
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                 <span>Like</span>
              </div>
              <div class="like_btn">
                <i class="fa fa-comments-o" aria-hidden="true"></i>
                 <span>Comment</span>
              </div>
            </div>
            <hr style="margin-top: 6px;margin-bottom:0px;">

        </div>

      </div>
    </div>

  </div>
</template>
<script>

export default{
    name:'Home_posts',
    methods:{
      post_model(){
        alert('dd');
      }
    }
  
    
}
</script>
<style scoped>
.main_posts_box{
  display: flex;
    padding: 7px;
    border-radius: 6px;
    cursor: pointer;
}
.post__icon{
  display: flex;
    align-items: center;
    cursor: pointer;
    height: 40px;
    width: 39px;
    justify-content: center;
    border-radius: 50px;
}
.post__icon:hover{
    background: #dcdcdc59;

}
.main_post{
width:81%;margin:auto; background:white;border-radius:5px;    margin-bottom: 20px;  
}
.icon_post_drop_down{
  background-position: 0px -534px;
    background-size: 26px 1138px;
    width: 20px;
    height: 20px;
    background-repeat: no-repeat;
    display: inline-block;
}
.main_posts_box:hover{
    background: #dcdcdc59;

}
.like_btn{
  cursor: pointer;
    /* background: gray; */
    padding-left: 36px;
    padding-right: 46px;
    padding-top: 4px;
    padding-bottom: 4px;
    border-radius: 6px;
}
.like_btn:hover{
    background: #dcdcdc59;

}
.user_post_name{
    color: black;
    font-weight: 500;
    font-family: sans-serif;
}
.user_post_name:hover{
      text-decoration: underline;

}
.background_img{
    box-shadow: 0px 0px 2px 2px #dcdcdc7d;
    background-position: 3% 6%!important;
    height: 95px;
    background-size: cover!important;
    background-repeat: no-repeat!important;
    width: 100%;
}
.bg_status{
    box-shadow: 0px 0px 2px 2px #dcdcdc7d;

}
.text_post{
      padding-left: 5px;
    color: #65676b;
    font-family: sans-serif;
    font-weight: 700;
}
.img_video{
     
    background-position: 0 0;
    background-size: 26px 276px;
    width: 24px;
    height: 24px;
    background-repeat: no-repeat;
    display: inline-block;
}
.post_input{
margin-left: 13px;
    border-radius: 24px;
    border: none;
    background: #F0F2F5;
    padding-top: 9px;
    padding-bottom: 9px;
    outline: none!important;
    padding-left: 32px;
  width: 83%;
  cursor:pointer;
}
.post_input::placeholder{
    padding-left:12px ;
    font-size: 14px;
    margin-top: -5px;
}
.user_photo{
      width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 50px;
}
.story_user_name{
  background: black;
    padding-top: 2px;
    padding-bottom: 4px;
}
.profile_photo{
      width: 37px;
    height: 37px;
    object-fit: cover;
    border-radius: 50px;
    border: 4px solid #156ADA;
    margin-top: 4px;
    margin-left: 7px;
}
.plus_icon{
  background: blue;
    color: white;
    width: 26px;
    height: 26px;
    border-radius: 50%;
    margin: auto;
    margin-top: -12px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding-top: 3px;
    border: 2px solid white;
}
.blur_bg{
      filter: blur(1px);
    -webkit-filter: blur(1px);
}
.create_story{
  text-align: center;
    color: black;
    padding-bottom: 4px;
    padding-top: 5px;
}
@media (max-width:560px){
   .create_story h6{
            font-size: 6px;
            
   }
   .post_input{
         width: 70%!important;
   }
   .img_video{
     background-size: 20px 276px!important;
    width: 18px!important;
    height: 19px!important;
   }
   .text_post{
     font-size: 8px;
         padding-top: 4px;
   }
   .post_input::placeholder{
    padding-left:6px ;
    font-size: 10px;
    margin-top: -5px;
}
   .story_user_name{
margin-top: -28px!important;
   }
   .background_img{
     
height: 53px;
   }
   .plus_icon{
         width: 21px!important;
    height: 21px!important;
   }
   .plus_icon i{
     font-size: 9px;
   }
   .main_story{
     width: 99%!important;
   }
   .bg_status{
     height: 91px!important;
   }
   .profile_photo{
         border: 2px solid #156ADA!important;
    margin-top: 2px!important;
    margin-left: 2px!important;
        width: 24px!important;
    height: 24px!important;
   }
}
@media (min-width:561px){
  .create_story{
padding-bottom: 12px;
    padding-top: 13px;
  }
  

}
@media (max-width:1024px) and (min-width: 800px){
.create_story h6{
    font-size: 11px!important;
}
.bg_status{
      height: 115px!important;
}
.background_img_1{
      height: 60px!important;
}
.story_user_name{
      margin-top: -45px!important;
}
.post_input{
  width: 76%!important;
}
.img_video{
     background-size: 20px 276px!important;
    width: 18px!important;
    height: 19px!important;
   }
   .text_post{
     font-size: 10px;
         padding-top: 4px;
   }
}
/* .story_user_name{
      text-shadow: 59px 19px 20px black;
} */
@media (max-width: 320px)
{
.bg_status{
    height: 79px!important;
}
}

</style>
