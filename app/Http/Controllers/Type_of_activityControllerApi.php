<?php

namespace App\Http\Controllers;

use App\Models\Type_of_activity;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\validation;
use Illuminate\Support\Facades\Auth;

class Type_of_activityControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user_id = Auth::id();
        $typesOfActivity = Type_of_activity::where('user_id', $user_id)
                                            ->limit($request->perpage ?? 5)
                                            ->offset(($request->perpage ?? 5) * ($request->page ?? 0))
                                            ->get();
        return response($typesOfActivity);
    }

    public function total()
    {
        $user_id = Auth::id();
        $countTypesOfActivityUser = Type_of_activity::where('user_id', $user_id)
                                                    ->get()->count();

        return response($countTypesOfActivityUser);
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
