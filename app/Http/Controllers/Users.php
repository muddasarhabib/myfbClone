<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Profile;
use App\Cover;
use App\postFiles;
use App\Post;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
class Users extends Controller
{
    public function save_user(Request $req){
        
        $count=User::where(['email'=>$req->email])->count();
        if($count){
            return response()->json(['data'=> $req->all(),'status'=>false]);
        }else{
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i <10; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            $user_obj=new User;
            $user_obj->name=  $req->fname;
            $user_obj->sname=  $req->sname;
            $user_obj->date_birth=  $req->date;
            $user_obj->email=  $req->email;
            $user_obj->gender=  $req->gender;
            $user_obj->password=  Hash::make($req->pass);
            $user_obj->api_token=  $randomString;
            $user_obj->save();
            $user_id= $user_obj->id;
            if($req->gender=='male'){
                $post_obj= new Post;   
                $post_obj->post_type='profile';
                $post_obj->title='';
                $post_obj->user_id= $user_id;
                $post_obj->save();
                $post_id=$post_obj->id;
                $img_obj=new postFiles;
                $img_obj->post_id= $post_id;
                $img_obj->user_id= $user_id;
                $img_obj->post_type= 'profile';

                $img_obj->status= 0;


                $img_obj->file= 'male_profile.png';
                $img_obj->file_type= 'image';
                $img_obj->save();

                $post_obj= new Post;   
                $post_obj->post_type='cover';
                $post_obj->title='';
                $post_obj->user_id= $user_id;
                $post_obj->save();
                $post_id=$post_obj->id;
                $img_obj=new postFiles;
                $img_obj->post_id= $post_id;
                $img_obj->user_id= $user_id;
                $img_obj->post_type= 'cover';

                $img_obj->status= 0;

                $img_obj->file= 'male_cover.jpg';
                $img_obj->file_type= 'image';
                $img_obj->save();


            

            }else{
               

                $post_obj= new Post;   
                $post_obj->post_type='profile';
                $post_obj->title='';
                $post_obj->user_id= $user_id;
                $post_obj->save();
                $post_id=$post_obj->id;
                $img_obj=new postFiles;
                $img_obj->post_id= $post_id;
                $img_obj->user_id= $user_id;
                $img_obj->post_type= 'profile';

                $img_obj->status= 0;

                $img_obj->file= 'female_profile.jpg';
                $img_obj->file_type= 'image';
                $img_obj->save();

                $post_obj= new Post;   
                $post_obj->post_type='cover';
                $post_obj->title='';
                $post_obj->user_id= $user_id;
                $post_obj->save();
                $post_id=$post_obj->id;
                $img_obj=new postFiles;
                $img_obj->post_id= $post_id;
                $img_obj->user_id= $user_id;
                $img_obj->post_type= 'cover';

                $img_obj->status= 0;

                $img_obj->file= 'female_cover.jpg';
                $img_obj->file_type= 'image';
                $img_obj->save();

            }
            return response()->json(['data'=> $user_obj,'status'=>true]);

        }
    }
    public function authication_user(Request $req){
        $email = $req->email;

        $password = $req->pass;
        if (Auth::attempt(['email' => $email, 'password' => $password])) {
             $id=Auth::user()->id;
            $token=Auth::user()->api_token;
            // User::where(['id'=>$id])->update(['api_token'=> $token]);
            return response()->json(['token'=>$token],200);
        }else{
            return response()->json(['status' => 'Your password or email not match'], 403);

        }
    }
}
