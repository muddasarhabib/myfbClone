<template>
    <div style="padding:0px;">
      <div  class="col-sm-3 unset_postion">
         <router-link to="/profile" class="home_left_side_main">
             <img src="storage/profiles/male_profile.png" class="img-fluid prof_img" style="    object-fit: cover;">
             <h6 class="active_user_name">Muddasar Jutt
              
             </h6>
             
         </router-link>
         <router-link    v-for="result in data" :key="result.name" :to="result.link" class="home_left_side_main">
             <img :src="result.img" class="img-fluid prof_img" style="    object-fit: cover;">
              <h6 class="active_user_name">{{result.name}}
                 <br>
             
             <div class="notfication_counts">
               {{result.notfi}}
             </div>
              </h6>
    
         </router-link>

      
         <hr>
         <h6 class="Your_shortcut">Your Shortcuts</h6>
            <router-link    v-for="result in pages" :key="result.name" :to="result.link" class="home_left_side_main">
             <img :src="result.img" class="img-fluid prof_img" style="    object-fit: cover;">
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
    name:'Home_left',
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
          img:"home_left_images/flag.png",
          name:'Pages',
          link:'/jobs',
          notfi:''
        },
         {
          img:"home_left_images/crona.png",
          name:'COVID-19 Information Center',
          link:'/jobs',
          notfi:''

        },
          {
          img:"home_left_images/friend.png",
          name:'Friends',
          link:'/Friends',
             notfi:''
        },
          {
          img:"home_left_images/job.png",
          name:'Jobs',
          link:'/Photos',
             notfi:'3 new'
        },
          {
          img:"home_left_images/group.png",
          name:'Group',
          link:'/group',
             notfi:'10+ new'
        }
        ,
          {
          img:"home_left_images/watch.png",
          name:'Watch',
          link:'/watch',
             notfi:''
        }
        // watch.png
        ]
      this.pages=[
          {
           img:"home_left_images/al_ain.jpg",
           name:'Al-Ain Public School toba tek singh',
           link:'/Home',
             notfi:''
           },
           {
           img:"home_left_images/sad_poetry.jpg",
           name:'Very sad potery',
           link:'/Home',
             notfi:''
           },

            {
           img:"home_left_images/progremmer.jpg",
           name:'I am Programmer,I have no life.',
           link:'/Home',
             notfi:''
           }
      ];

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
</style>