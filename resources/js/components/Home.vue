<template>
 <div >
     <Topbar/>
     <div class="container-fluid" style="    margin-top: 20px;">
         <div class="row">
           <div class="col-sm-3 home_left_side" >
             <Homeleft/>
           </div>
         

         <div class="col-lg-6 col-md-12 col-sm-12 col-12">
             <Homepost/>
              
         </div>

         <div class="col-sm-3 home_right_side">
              <Homeright/>
         </div>
         </div>
         
     </div>
 </div>
    
</template>
<script>
import Topbar from './top_bar';
import Homeleft from './Home_left';
import Homepost from './Home_posts';
import Homeright from './Home_right';


 export default {
     name:'Home',
     components:{
         Topbar,
         Homeleft,
         Homepost,
         Homeright
     },
      mounted () {
    this.$insProgress.finish()
  },
  }
</script>
<style  >
body {
    background-color: #dadada78;
    padding:0px!important;
}
.home_left_side{
        padding-left: 0;
    padding-right: 0;
   
}


.home_right_side{
        padding-left: 0;
    padding-right: 0;
   
}
@media (max-width:768px) {
    .home_left_side{
        display: none;
    }
    .home_right_side{
        display: none;
    }
    .static_column{
        display: none;

    }
}
/* width */

</style>