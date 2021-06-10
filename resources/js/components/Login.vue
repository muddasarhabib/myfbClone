<template>
    <div class="container-fluid bg_login" style="background: #F0F2F5;">
    <vue-ins-progress-bar></vue-ins-progress-bar>
    
      <div class="container">
         <v-snackbar
      v-model="snackbar"
    >
      {{ text }}

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
         <div class="row">
            <div class="col-sm-6 hide_column" style="padding-top: 60px;">
                 <div>

                     <img src="img/facebook_login_logo.svg" style="    width: 58%;"/>
                     <h5 class="face_heading">Facebook helps you connect and share with the people in your life.</h5>
                 </div>
             
            </div>

               <div class="col-lg-5 col-md-6 col-12 set_padding">
                <div class="bg-white color_div">
                <v-form id="login_form"   @submit="authication_user" ref="form" v-model="valid1" >
                  <div class="container pt-4">
                        <div class="row">
                           
                        
                            <div class="col-sm-12 ">
                              <v-text-field   v-model="Login.email"   :rules="EmailRul"  required class="form-control email1  some-style login_email" name="last" placeholder="Email Address or phone number" style="margin-bottom: -7px;  height: calc(2.4em + 0.75rem + 2px);"></v-text-field>
                          
                            </div>

                            <div class="col-sm-12">
                              <v-text-field  type="password" v-model="Login.pass"   :rules="login_passRul"  required class="form-control email1  some-style login_email" name="last" placeholder="Enter Your Password" style="margin-bottom: -7px;  height: calc(2.4em + 0.75rem + 2px);"></v-text-field>

                            </div>

                            <div class="col-sm-12 ">
                                
                                 <button  type="submit" :disabled="!valid1"  id="login_btn" class="btn btn-primary login_btn" style="font-size:20px;">
                                    <div v-if="login_loading" class="lds-dual-ring"></div>
                                   <span v-else>Login</span>
                                 </button>
                            </div>

                            <div class="col-sm-12 text-center" style="    padding: 0;">
                               <a href="#" class="forgot_pass" style="font-weight: 500;">Forgotten password?</a>
                            </div>


                            <div class="col-sm-12 text-center" style="    padding: 0;">
                               <hr>
                            </div>
                              
                            <div class="col-sm-12  text-center mb-2">
                               <div style="width: 67%;margin:auto;">
                                     <button type="button"   class="btn btn-success create_btn" @click="show_popup">Create new Account</button>
                               </div>
                            </div>
                        </div>
                   </div>
                </v-form>
             </div>
             
            </div>

         </div>
      </div>
    <div class="model_main" style="" v-if="model_show">
     <div class="model_inner">
        <div class="sign_up_heading">
          <h1>Sign Up</h1>

          <i class=" cross_icon" @click="hide_click_popup">X</i>
        </div>  
        <p class="quick_easy">It's quick and easy.</p>
        <div class="line_div">
            <hr>
        </div>

        <v-form id="myForm"    ref="form" v-model="valid"  @submit="register_user">
            <div class="container">
               <div class="row">
 
                   <div class="col-sm-6" style="padding-top: 0;">
                
                               
                       
                             <v-text-field  v-model="register.fname" :rules="nameRules"   required class="form-control color_input last some-style" name="last" placeholder="First Name"></v-text-field>
                    </div>

                   <div class="col-sm-6 " style="padding-top: 0;">
                   
                             <v-text-field  v-model="register.sname" :rules="sarRules"   required class="form-control color_input last some-style" name="last" placeholder="Surname"></v-text-field>

                   </div>

                   <div class="col-sm-12 " style="padding-top: 0;">
                    
                             <v-text-field  v-model="register.email" :rules="EmailRules"   required class="form-control color_input last some-style" name="last" placeholder="Email Adddress"></v-text-field>

                              <div style="    font-size: 8px;   padding-top: 5px;  padding-bottom: 0px;margin-bottom: 0px;color: red;display:none;" id="error_e_mail">Please change your E-mail   </div>
                   </div>

                   <div class="col-sm-12" style="padding-top: 0;">
                      
                             <v-text-field type="password" v-model="register.pass" :rules="passRules"   required class="form-control color_input last some-style" name="last" placeholder="New Password"></v-text-field>
                 
                   </div>

                   <div class="col-sm-12 " style="padding-top: 0;">
                       <label for="date" style="font-size: 12px;margin-bottom: 0;">Date of birth</label>
                             <v-text-field type="date" v-model="register.date" :rules="dateRules"   required class="form-control color_input last some-style" name="last" placeholder="New Password"></v-text-field>

                       
                   </div>

                   <div class="col-sm-12 " style="padding-top: 0;">
                       <label for="gender" style="font-size: 12px;margin-bottom: 0;">Gender</label>
                                                  
                        <div class="row">
                            <div class="col-6" >
                            <label for="female" class="gender_styling">
                               <h5> Female</h5>
                                 
                            
                                    
                                    <input type="radio"  v-model="register.gender" :rules="genderRules"    id="female" value="female" name="gender"    required class="gender_input gender some-style" />
                                 
                              </label>
                            </div>
                            <div class="col-6">
                            <label for="gender" class="gender_styling">
                               <h5> Male</h5>
                                 
                           
                                    <input type="radio"  v-model="register.gender" :rules="genderRules" id="gender" value="male" name="gender"   required class="gender_input gender some-style" />
                                   
                            
                              </label>

    
    
                            </div>
                        </div>
                          
                   </div>
                   <div class="col-sm-12 " style="padding-top: 0;">
                      <p style="font-size: 10px;">By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy. You may receive SMS notifications from us and can opt out at any time.</p>
                   </div>

                   <div class="col-sm-12" style="padding-top: 0;">
                      <div class="inner_sign_up_btn">
                         
                               <button type="submit"   :disabled="!valid" value="Sign Up" id="registered_btn" class="btn btn-success sign_btn">
                                  <div v-if="show_loading" class="lds-dual-ring"></div>
                                   <span v-else>Sign Up</span>
                                 </button>

                                 
                      </div> 
            
                   </div>
               </div>
            </div>
        </v-form>
     </div>
</div>

   
   </div> 
</template>
<script>
export default {
    name:'Login',
    data: () => ({
      valid: true,
      valid1: true,
      snackbar:false,
      text:'',
      check:false,

         loading: true,
         login_loading:false,
         show_loading:false,
            model_show:false,
              userId: '',
            register:{
                  fname:"",
                 sname:"",
                 email:"",
                 pass:"",
                 date:"",
                 gender:""
            },
     isLoadingArray: [],
      nameRules: [
        v => !!v || 'Name is required',
       
      ],
         sarRules: [
        v => !!v || 'Surname is required',
       
      ],
    //   email: '',
      EmailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
    
      passRules: [
        v => !!v || 'Password is required',
        v => v.length >= 6 || 'Min 6 characters',

       
      ],
      dateRules:[
        v => !!v || 'Date of birth is required',

      ],
      genderRules:[
        v => v.length > 0 || 'Gender is required',

      ],
      Login:{
       email:"",
       pass:''
      },
        EmailRul:[
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      login_passRul:[
        v => !!v || 'Password is required',
        v => v.length >= 6 || 'Min 6 characters',

      ],
     
    }),
    methods:{

        show_popup(){
            this.model_show=true;
        },
        hide_click_popup(){
            this.model_show=false;
        },
        register_user(e){
             e.preventDefault();
            axios.interceptors.request.use( (config)=> {
                      this.show_loading=true;
                      $('#registered_btn').attr('disabled','disabled');

                      // document.getElementById("registered_btn").disabled = true;
                      this.$insProgress.start();

                    return config;
                },  (error)=> {
                    // Do something with request error

                      this.show_loading=false;
                      // document.getElementById("registered_btn").disabled = false;
                       $('#registered_btn').removeAttr('disabled');

                                     this.$insProgress.finish();

                    return Promise.reject(error);
                });

                // Add a response interceptor
                axios.interceptors.response.use( (response)=> {
                      this.show_loading=false;
                      // document.getElementById("registered_btn").disabled = false;
                       $('#registered_btn').removeAttr('disabled');
             

                                          this.$insProgress.finish()


                    return response;
                },  (error)=> {
                      this.show_loading=false;
                      // document.getElementById("registered_btn").disabled = false;
                      //  $('#registered_btn').removeAttr('disabled');

                                        this.$insProgress.finish()


                    // Any status codes that falls outside the range of 2xx cause this function to trigger
                    // Do something with response error
                    return Promise.reject(error);
                });
                axios.post('api/save_user',this.register).then((resp)=>{
               
                        // console.log(resp.data.status);
                        if(resp.data.status==true)
                        {
                        // console.log(resp.data.data.api_token);

                      document.getElementById("error_e_mail").style.display = "none";
                             document.getElementById("myForm").reset();
                        
                             localStorage.setItem('login_token',resp.data.data.api_token);
                             this.$router.push('/Home');
                          //  console.log('saved user');
                        }else{
                          // console.log('already have user');
                      document.getElementById("error_e_mail").style.display = "block";
                       $('#registered_btn').removeAttr('disabled');
                        }
               

                 


                   
                }).catch(err=>{
                    console.log(err);
                });
           

        },
         authication_user(e){
             e.preventDefault();
         
             axios.interceptors.request.use( (config)=> {
                      this.login_loading=true;
                      // this.check=true;
                      $('#login_btn').attr('disabled','disabled');

                      // document.getElementById("login_btn").disabled = true;
                      this.$insProgress.start();

                    return config;
                },  (error)=> {
                    // Do something with request error
                    
                      this.login_loading=false;
                      // document.getElementById("login_btn").disabled = false;
                      // this.check=false;
                      //  $('#login_btn').removeAttr('disabled');

                                     this.$insProgress.finish();

                    return Promise.reject(error);
                });

                // Add a response interceptor
                axios.interceptors.response.use( (response)=> {
                      this.login_loading=false;
                      // document.getElementById("login_btn").disabled = false;
                      // this.check=false;
                      //  $('#login_btn').removeAttr('disabled');
             

                                          this.$insProgress.finish()


                    return response;
                },  (error)=> {
                      this.login_loading=false;
                      //  console.log(error.response.status);
                    //  alert('hwllo im error');
                    //  if(error.response.status==401)
              //               Login:{
                 //  email:"",
                  //  pass:''
                      // },
                      // if(this.Login.email!='' && this.Login.pass!=''){
                      //  $('#login_btn').removeAttr('disabled');
                      //  console.log(this.Login);

                      // }else{
                      // $('#login_btn').attr('disabled','disabled');

                      // }
                        // document.getElementById("login_btn").disabled = false;
                      // this.check=false;
                      //  $('#login_btn').removeAttr('disabled');

                                        this.$insProgress.finish()


                    // Any status codes that falls outside the range of 2xx cause this function to trigger
                    // Do something with response error
                    return Promise.reject(error);
                });
                axios.post('api/authication_user',this.Login).then((resp)=>{
                  // console.log(resp.data.token);
                           

                     document.getElementById("login_form").reset();
                        
                             localStorage.setItem('login_token',resp.data.token);
                             this.$router.push('/Home');
                            //  this.Login.email='' ;
                            //   this.Login.pass='';
                          // setTimeout(function(){  this.Login.email="";
                          // this.Login.pass=''; }, 3000);
                }).catch((error)=>{
                       this.snackbar=true;
                       this.text=error.response.data.status;
                      $('#login_btn').removeAttr('disabled');
                  // console.log(err.response.data.status);
                });

    },
    },
   
    mounted () {
    this.$insProgress.finish();
    this.valid1= true;
  },
  
}
</script>
<style scoped>
.bg_login{
        background: rgb(240, 242, 245);
    height: 100vh;
    display: flex;
    align-items: center;
}
.face_heading {
    margin-left: 27px;
    font-size: 24px;
    letter-spacing: 1px;
    font-family: SFProDisplay-Regular, Helvetica, Arial, sans-serif;
    font-weight: normal;
    font-size: 27px;
}
@media (max-width:767px){
.hide_column{
    display: none;
}
.set_padding{
    padding: 0px;
}
}
.color_div {
    border: none;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%), 0 8px 16px rgb(0 0 0 / 10%);
    box-sizing: border-box;
    width: 89%;
    margin: auto;
    
}

.login_btn {
    width: 100%;
    font-weight: 700;
    padding-top: 8px;
    padding-bottom: 8px;
    background-color: #166fe5;
}

.create_btn {
    width: 91%;
    padding-top: 11px;
    padding-bottom: 11px;
    border-radius: 8px;
    background: #12a912!important;
    font-weight: 700;
    font-size: 16px;
}
.forgot_pass{
 color: #166fe5;

}
@media (max-width: 1024px){
.create_btn {
    font-size: 10px!important;
}
}
@media (min-width: 581px) and (max-width: 1000px){
.face_heading {
    font-size: 16px;
    margin-left: 16px;
}
}
.form-control::placeholder{
    color: gray;
        font-size: 16px;
        /* font-weight: 500; */

}
.model_main {
    background-color: rgba(255, 255, 255, .8);
    position: absolute;
    width: 100%;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
}
.model_inner {
    width: 35%;
    background-color: white;
    position: relative;
    top: 50px;
    border-radius: 7px;
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%), 0 8px 16px rgb(0 0 0 / 0%);
    left: 35%;
    right: 30%;
}
.sign_up_heading {
    display: flex;
    justify-content: space-between;
}
.cross_icon {
    padding-top: 17px;
    margin-right: 11px;
    font-weight: 800;
    cursor: pointer;
    font-size: 20px;
    /* color: gray; */
    color: #000000ad;
}
.quick_easy {
    margin-top: -5px;
    color: gray;
    padding-left: 15px;
}
.line_div {
    padding-bottom: 4px;
    padding-left: 14px;
    padding-right: 14px;
}
.color_input {
    background: #f5f6f7;
        padding-top: 2px;
}
@media (max-width: 768px){
.model_inner {
    width: 90%!important;
    left: 5%!important;
    right: 5%!important;
}
}

.inner_sign_up_btn {
    width: 50%;
    margin: auto;
}

.sign_btn {
    width: 81%;
    margin-bottom: 18px;
    font-weight: 700;
    font-size: 17px;
}
.sign_btn[disabled]{
      opacity: 0.6;
      cursor: not-allowed;
}
.login_btn[disabled]{
    opacity: 0.6;
      cursor: not-allowed;
}
.sign_up_heading h1 {
    font-size: 27px;
    padding-left: 15px;
    padding-top: 7px;
    font-weight: 700;
    font-size: 34px;
}

.gender_styling {
    display: flex;
    justify-content: space-between;
    border: 1px solid #ced4da;
    border-radius: 6px;
    padding-top: 9px;
    padding-bottom: 2px;
}
.gender_styling h5 {
    padding-left: 5px;
    font-weight: 400;
    font-size: 17px;
}
.gender_input {
    margin-top: 6px;
    margin-right: 5px;
}
.some-style >>> .v-input__slot::before {
  border-style: none !important;
}
.some-style >>> .v-input__slot::after {
  border-style: none !important;
}
.some-style >>> .v-text-field__details {
    margin-top: -6px;
   margin-left: -10px;
}
.some-style >>> .v-messages__message{
font-size: 8px;
    color: red;
    font-weight: 400;
}
.login_email >>> .v-messages{
    margin-top: 13px;
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
/* .v-snack__wrapper.theme--dark{
      background: red!important;
    color: white!important;
} */
/* .gender_input{
    margin-top: -9px;
    margin-bottom: -13px;
    text-align: right;
    padding-top: 14px;
    padding-left: 0px;
} */
/* .some-style >>> .v-text-field__details{
        margin-left: -10px;
} */
/* .some-style > .v-input__control > .v-input__slot:before {
  border-style: none; 
} */
</style>
