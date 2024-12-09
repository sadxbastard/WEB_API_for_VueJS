<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use App\Models\Type_of_activity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ActivityControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id();
        $activities = Activity::where('user_id', $userId)->get();
        return response($activities);
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
        $activity = Activity::where('id', $id)->where('user_id', $userId)->first();

        if ($activity) {
            return response($activity);
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
