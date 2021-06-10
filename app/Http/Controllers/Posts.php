<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\postFiles;
use App\Post;
use App\Like;

class Posts extends Controller
{
  public function SavePost(Request $req)
  {

    $user = User::where(['api_token' => $req->token])->first();
    $obj = new Post;
    $obj->user_id = $user->id;
    $obj->title = $req->text;
    $obj->post_type = 'post';
    $obj->save();
    $post_id = $obj->id;
    if ($image = $req->image != '') {
      foreach ($req->image as $img) {
        $name = rand(11111, 999999) . '.' . $img->getClientOriginalExtension();
        $img->storeAs('public/posts', $name);
        $string = $img->getMimeType();
        $type = strtok($string, '/');
        if ($type == "image") {
          $file_type = 'image';
        } else if ($type == "video") {
          $file_type = 'video';
        }
        $img = new postFiles;
        $img->post_id = $post_id;
        $img->user_id = $user->id;
        $img->post_type = 'post';


        $img->file = $name;
        $img->file_type = $file_type;
        $img->save();
      }
    }
    return response()->json(['userid' => $user->id]);
  }
  public function getPost(Request $req)
  {
    $user = User::where(['api_token' => $req->tokens])->first();

    $post = Post::with('get_images')->with('get_user')->with("active_likes")->with('count_likes')->where(['user_id' => $user->id])->orderBy('id', 'DESC')->get();
    // $user->id
    $profile = Post::with('get_images_single')->where(['user_id' => $user->id, 'post_type' => 'profile'])->orderBy('id', 'desc')->first();

    return response()->json(['post' => $post, 'profile' => $profile,'active_user'=> $user->id], 200);
  }
  public function getCover(Request $req)
  {
    $user = User::where(['api_token' => $req->tokens])->first();

    $cover = Post::with('get_images_single')->where(['user_id' => $user->id, 'post_type' => 'cover'])->orderBy('id', 'desc')->first();

    return response()->json(['cover' => $cover], 200);
  }
  public function getProfile(Request $req)
  {
    $user = User::where(['api_token' => $req->tokens])->first();
    $profile = Post::with('get_images_single')->where(['user_id' => $user->id, 'post_type' => 'profile'])->orderBy('id', 'desc')->first();

    return response()->json(['profile' => $profile], 200);
  }
  public function save_profile(Request $req)
  {
    // $req->token;
    $user = User::where(['api_token' => $req->login_token])->first();
    if ($req->profile_img != '') {
      $img = $req->profile_img;
      $post_obj = new Post;
      $post_obj->post_type = 'profile';
      $post_obj->title = '';
      $post_obj->user_id = $user->id;
      $post_obj->save();
      $post_id = $post_obj->id;
      $img_obj = new postFiles;
      $img_obj->post_id = $post_id;
      $img_obj->user_id =  $user->id;
      $img_obj->post_type = 'profile';


      $name = rand(11111, 999999) . '.' . $img->getClientOriginalExtension();
      $img->storeAs('public/posts', $name);
      $img_obj->file = $name;
      $img_obj->file_type = 'image';
      $img_obj->save();
      // // $req->profile_img;
      return response()->json(['status' => true], 200);
    }
  }

  public function save_cover(Request $req)
  {
    $user = User::where(['api_token' => $req->login_token])->first();
    if ($req->cover_img != '') {
      $img = $req->cover_img;
      $post_obj = new Post;
      $post_obj->post_type = 'cover';
      $post_obj->title = '';
      $post_obj->user_id = $user->id;
      $post_obj->save();
      $post_id = $post_obj->id;
      $img_obj = new postFiles;
      $img_obj->post_id = $post_id;
      $img_obj->user_id = $user->id;
      $img_obj->post_type =  'cover';


      $name = rand(11111, 999999) . '.' . $img->getClientOriginalExtension();
      $img->storeAs('public/posts', $name);
      $img_obj->file = $name;
      $img_obj->file_type = 'image';
      $img_obj->save();
      // // $req->profile_img;
      return response()->json(['status' => true], 200);
    }
  }
  public function getActiveUser(Request $req)
  {
    $user = User::where(['api_token' => $req->tokens])->first();
    $profile = Post::with('get_images_single')->where(['user_id' => $user->id, 'post_type' => 'profile'])->orderBy('id', 'desc')->first();
    return response()->json(['user' => $user,'profile'=>$profile], 200);
  }
  public function likes(Request $req)
  {
    $user = User::where(['api_token' => $req->token])->first();
    // return response()->json(['user'=>$user->id]);
    // exit;
    $post_id = $req->post_id;
    $like_type = $req->like_type;
    $status = $req->status;
    $count = Like::where(['post_id' => $post_id, 'user_id' => $user->id])->count();
    if ($count > 0) {
      Like::where(['post_id' => $post_id, 'user_id' => $user->id])->update([
        'like_type' => $like_type,
        'status' => $status
      ]);

      $like_count = Like::where(['post_id' => $post_id, 'status' => 'like'])->count();
      return response()->json(['status' => true, 'like_count' => $like_count], 200);
      // return response()->json(['user'=>$user->id]);
    } else {
      $count = Like::where(['post_id' => $post_id, 'user_id' => $user->id])->count();
      if ($count > 0) {
        Like::where(['post_id' => $post_id, 'user_id' => $user->id])->update([
          'like_type' => $like_type,
          'status' => $status
        ]);
        $like_count = Like::where(['post_id' => $post_id, 'status' => 'like'])->count();
        return response()->json(['status' => true, 'like_count' => $like_count], 200);
      }
      $obj = new Like;
      $obj->post_id = $post_id;
      $obj->user_id = $user->id;
      $obj->like_type = $like_type;
      $obj->status = $status;
      $obj->save();
      $count = Like::where(['post_id' => $post_id, 'user_id' => $user->id])->count();
      if ($count > 0) {
        Like::where(['post_id' => $post_id, 'user_id' => $user->id])->update([
          'like_type' => $like_type,
          'status' => $status
        ]);
        $like_count = Like::where(['post_id' => $post_id, 'status' => 'like'])->count();
        return response()->json(['status' => true, 'like_count' => $like_count], 200);
      }
      $like_count = Like::where(['post_id' => $post_id, 'status' => 'like'])->count();
      return response()->json(['status' => true, 'like_count' => $like_count], 200);

      // return response()->json(['user1'=>$user->id]);
    }
  }
  public function getPhoto(Request $req){
        //  $req->token;
    $user = User::where(['api_token' => $req->token])->first();
    $photo=postFiles::where(['user_id'=>$user->id,'file_type'=>'image','status'=>1])->orderBy('id','desc')->get();
         return response()->json(['photo'=>$photo],200);
  }
  public function searchUser(Request $req){
    $user = User::where(['api_token' => $req->token])->first();
    $count=User::where('id','!=',$user->id)->where('name', 'like', '%' . $req->search . '%')->orWhere('sname', 'like', '%' . $req->search . '%')->where('id','!=',$user->id)->count();
    if($count>0){
     $users=User::with('GetPhoto')->where('id','!=',$user->id)->where('name', 'like', '%' . $req->search . '%')->orWhere('sname', 'like', '%' . $req->search . '%')->where('id','!=',$user->id)->get();
     return response()->json(['status'=>true,'users'=>$users],200);
    }else{
      return response()->json(['status'=>false],200);
    }
   
  }
  public function getCoverSingleUser(Request $req){
    $cover = Post::with('get_images_single')->where(['user_id' =>$req->user_id, 'post_type' => 'cover'])->orderBy('id', 'desc')->first();

    return response()->json(['cover' => $cover], 200);
  }
  public function getProfileSingleUser(Request $req){
    $profile = Post::with('get_images_single')->where(['user_id' =>$req->user_id, 'post_type' => 'profile'])->orderBy('id', 'desc')->first();

    return response()->json(['profile' => $profile], 200);
  }
  public function getSingleUser(Request $req){
    $user = User::where(['id' =>$req->user_id])->first();
    return response()->json(['user' => $user], 200);
  }
  public function getPostUsers(Request $req){
    $user = User::where(['api_token' => $req->tokens])->first();

    $post = Post::with('get_images')->with('get_user')->with("active_likes")->with('count_likes')->where(['user_id' => $req->user_id])->orderBy('id', 'DESC')->get();
    // $user->id
    $profile = Post::with('get_images_single')->where(['user_id' => $req->user_id, 'post_type' => 'profile'])->orderBy('id', 'desc')->first();

    return response()->json(['post' => $post, 'profile' => $profile,'active_user'=> $user->id], 200);
  }
  public function userGetPhoto(Request $req){
    // $user = User::where(['api_token' => $req->token])->first();
    $photo=postFiles::where(['user_id'=>$req->user_id,'file_type'=>'image','status'=>1])->orderBy('id','desc')->get();
         return response()->json(['photo'=>$photo],200);
  }
}
