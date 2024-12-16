<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});
//Route::middleware('auth:sanctum')->get('/logout', [AuthController::class, 'logout']);

//Route::get('/users', [UserControllerApi::class, 'index']);
//Route::get('/users/{id}', [UserControllerApi::class, 'show']);

//Route::get('/type_of_activity', [Type_of_activityControllerApi::class, 'index']);
//Route::get('/type_of_activity/{id}', [Type_of_activityControllerApi::class, 'show']);
//
//Route::get('/activity', [ActivityControllerApi::class, 'index']);
//Route::get('/activity/{id}', [ActivityControllerApi::class, 'show']);

Route::post('/login', [AuthController::class, 'login']);

Route::group(['middleware' => ['auth:sanctum']], function (){
    Route::get('/user', function (Request $request){
       return $request->user();
    });

    Route::get('/type_of_activity', [Type_of_activityControllerApi::class, 'index']);
    Route::get('/type_of_activity/{id}', [Type_of_activityControllerApi::class, 'show']);
    Route::get('/types_of_activity_total', [Type_of_activityControllerApi::class, 'total']);


    Route::get('/activity', [ActivityControllerApi::class, 'index']);
    Route::get('/activity/{id}', [ActivityControllerApi::class, 'show']);
    Route::get('/activities_total', [ActivityControllerApi::class, 'total']);

    Route::get('/logout', [AuthController::class, 'logout']);
});


//Дмитрий
//9|se7Kh45e2Px17LkZTbcEUUWnG7HfsP2sxbD7L66F1d1f39b3
//Данил
//10|uLAVZUry7hCx8SiwiHClroG5rbzcEh5HlX0hFoJl30a8f657
