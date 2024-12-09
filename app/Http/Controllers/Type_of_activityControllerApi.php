<?php

namespace App\Http\Controllers;

use App\Models\Type_of_activity;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Redirect;
use Illuminate\validation;
use Illuminate\Support\Facades\Auth;

class Type_of_activityControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user_id = Auth::id();
        $typesOfActivity = Type_of_activity::where('user_id', $user_id)->get();
        return response($typesOfActivity);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $userId = Auth::id();
        $typeOfActivity = Type_of_activity::where('id', $id)->where('user_id', $userId)->first();

        if ($typeOfActivity) {
            return response($typeOfActivity);
        }

        return response(['message' => 'Not found'], 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
