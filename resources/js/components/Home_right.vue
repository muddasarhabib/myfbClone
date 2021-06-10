<template>
    <div style="padding:0px;">
      <div  class="col-sm-3 unset_postion">
         <h6 class="Your_shortcut">Your Pages</h6>

         <router-link to="/pages" class="home_left_side_main">
             <img src="home_right_images/maddy.jpg" class="img-fluid prof_img" style="    object-fit: cover;">
             <h6 class="active_user_name">Maddy photography
              
             </h6>
             
         </router-link>
          <hr>
          <div style="    display: flex;justify-content: space-between;">
             <h6 class="Your_shortcut">Contact</h6>
             <div style="    color: #575757;    margin-top: 0px;">
                  <i role="image" class="icon_post_drop_down" style="background-image: url('img/icon.png');      background-position: 0 0; background-size: 20px 236px;"></i>
                &nbsp;&nbsp;&nbsp;
                <i role="image" class="icon_post_drop_down" style="background-image: url('img/icon_2.png');    background-position: 0 -902px;"></i>&nbsp;&nbsp;
                                 <i role="image" class="icon_post_drop_down" style="background-image: url('img/icon_2.png');"></i>&nbsp;&nbsp;
             </div>
          </div>
         <router-link    v-for="result in data" :key="result.name" :to="result.link" class="home_left_side_main">
              <div style="    position: relative;">
                 <img :src="result.img" class="img-fluid prof_img" style="    object-fit: cover;">
               <span class="logged-in">●</span>

              </div>
                  
              <h6 class="active_user_name">{{result.name}}
                 <br>
             
             <div class="notfication_counts">
               {{result.notfi}}
             </div>
              </h6>
    
         </router-link>
      </div>
    </div>
</template>
<script>
export default{
    name:'Home_right',
    data(){
      return {
        data:[],
        pages:[],

      }
    },
    mounted() {
      this.data=[];
      this.data=[
        {
          img:"home_right_images/inces.jpg",
          name:'INces Vie',
          link:'/jobs',
          notfi:''
        },
        {
          img:"home_right_images/saim.jpg",
          name:'Saim Rockx',
          link:'/jobs',
          notfi:''
        },
        {
          img:"home_right_images/ahsan.jpg",
          name:'Mahar Ahsan',
          link:'/jobs',
          notfi:''
        },
         {
          img:"home_right_images/baig.jpg",
          name:'As An Baig',
          link:'/jobs',
          notfi:''
        },
          {
          img:"home_right_images/inces.jpg",
          name:'INces Vie',
          link:'/jobs',
          notfi:''
        },
        {
          img:"home_right_images/ahsan.jpg",
          name:'Mahar Ahsan',
          link:'/jobs',
          notfi:''
        },
          {
          img:"home_right_images/saim.jpg",
          name:'Saim Rockx',
          link:'/jobs',
          notfi:''
        },
          {
          img:"home_right_images/inces.jpg",
          name:'INces Vie',
          link:'/jobs',
          notfi:''
        },
        {
          img:"home_right_images/baig.jpg",
          name:'As An Baig',
          link:'/jobs',
          notfi:''
        },
        // watch.png
        ]
    

        // console.log(this.data);
    }
}
</script>
<style scoped>
.prof_img {
    width: 39px;
    height: 39px;
    margin-top: 12px;
    border-radius: 50%;
    cursor: pointer;
}
.unset_postion{
 padding-left: 14px;padding-left: 14px;padding-right: 14px;position: fixed;
 top: 10!important;
    bottom: 0;
    overflow: hidden;
    max-height : 100%;
    top: 63px;
}
.unset_postion:hover{
  overflow-y: scroll;
}
.unset_postion::-webkit-scrollbar {
  width: 10px;
}

/* Track */
.unset_postion::-webkit-scrollbar-track {
    background: #cfcfcf;
    /* box-shadow: 1px 2px 3px 4px grey */
}

/* Handle */
.unset_postion::-webkit-scrollbar-thumb {
      background: #8888888c;
    border-radius: 18px;
}

/* Handle on hover */
.unset_postion::-webkit-scrollbar-thumb:hover {
  background: #555;
}
.notfication_counts{
      font-size: 8px;
    color: blue;
    font-weight: 800;
}
.active_user_name{
  color: black;
    text-decoration: none!important;
    padding-top: 13px;
    padding-left: 13px;
}
.Your_shortcut{
       color: gray;
    text-decoration: none!important;
}
.home_left_side_main{
  display: flex;
    align-items: center;
    text-decoration: none !important;
   
    padding-bottom: 11px;
    padding-left: 6px;
    border-radius: 9px;
}
.home_left_side_main:hover{
   background: gainsboro;
}

.logged-in {
  color: green;
      position: absolute;
    top: 27px;
       text-shadow: 1px 2px 4px grey;
    right: -3px;
}
.icon_post_drop_down{
  background-position: 0px -534px;
    background-size: 26px 1138px;
    width: 20px;
    height: 20px;
    background-repeat: no-repeat;
    display: inline-block;
}
</style>