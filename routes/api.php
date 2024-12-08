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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Get data from all tables
Route::get('/user', [UserControllerApi::class, 'index']);
Route::get('/user/{id}', [UserControllerApi::class, 'show']);

Route::get('/type_of_activity', [Type_of_activityControllerApi::class, 'index']);
Route::get('/type_of_activity/{id}', [Type_of_activityControllerApi::class, 'show']);


Route::get('/activity', [ActivityControllerApi::class, 'index']);
Route::get('/activity/{id}', [ActivityControllerApi::class, 'show']);
