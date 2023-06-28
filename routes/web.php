<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', '\App\Http\Controllers\AppController@index');
Route::get('/load', '\App\Http\Controllers\AppController@load');

Route::post('/', '\App\Http\Controllers\AppController@create');
Route::get('/{file}', '\App\Http\Controllers\AppController@read');
Route::post('/{file}', '\App\Http\Controllers\AppController@update');
Route::delete('/{file}', '\App\Http\Controllers\AppController@destroy');
