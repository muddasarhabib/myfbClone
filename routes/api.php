<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('save_user','Users@save_user');
Route::post('authication_user','Users@authication_user');
Route::group(['middleware'=>['auth:api']],function(){
Route::post('save_posts','Posts@SavePost');
 
   Route::get('/verfify', function (Request $request) {
        return $request->user();
    });
Route::post('get-post','Posts@getPost');
Route::post('get-cover','Posts@getCover');
Route::post('get-profile','Posts@getProfile');
Route::post('save_profile','Posts@save_profile');
Route::post('save_cover','Posts@save_cover');
Route::post('get-active-user','Posts@getActiveUser');
Route::post('likes','Posts@likes');
Route::post('getPhoto','Posts@getPhoto');
Route::post('search-user','Posts@searchUser');
Route::post('get-cover-single-user','Posts@getCoverSingleUser');
Route::post('get-profile-single-user','Posts@getProfileSingleUser');
Route::post('get-single-user','Posts@getSingleUser');
Route::post('get-post-users','Posts@getPostUsers');
Route::post('user-getPhoto','Posts@userGetPhoto');
});
