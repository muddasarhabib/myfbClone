<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table='posts';
    public function get_images(){
        return $this->hasMany('App\postFiles','post_id');
    }
    public function get_user(){
        return $this->belongsTo('App\User','user_id');

    }
    public function get_images_single(){
        return $this->hasOne('App\postFiles','post_id');
    }
     public function count_likes(){
        return $this->hasMany('App\Like','post_id')->where('status','=', 'like');
    }
      public function active_likes(){
        // ->where('status','=', 'like')
        // ->where('user_id','=', $id)
        return $this->hasOne('App\Like','user_id','post_id')->where('status','=', 'like');
    }
}
// $url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=card+shops+in+" . $search . "&key=a2b0ed604c4802cc9c0c62edc76876ade1a1df21039ceb065b4eb7762b091871";