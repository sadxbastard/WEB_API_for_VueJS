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
        if (! Gate::allows('create-type_of_activity')){
            return response()->json([
                'code' => 1,
                'message' => 'У вас нет прав на добавление категории'
            ]);
        }
        $validated = $request->validate([
            'type_of_activity_name' => 'required|unique:types_of_activity|max:255',
            'user_id' => 'integer',
            'maximum_score' => 'required|integer',
            'image' => 'required|file'
        ]);
        $file = $request->file('image');
        // Генерация уникального имени файла
        $fileName = rand(1, 100000). '_' . $file->getClientOriginalName();
        try{
            $path = Storage::disk('s3')->putFileAs('types_of_activity_pictures', $file, $fileName);
            if (empty($path)) {
                return response()->json([
                    'code' => 3,
                    'message' => 'Ошибка: файл не был загружен в хранилище.',
                ]);
            }
            Storage::disk('s3')->setVisibility($path, 'public');
            $fileUrl = Storage::disk('s3')->url($path);
        } catch (\Exception $e) {
            return response()->json([
                'code' => 2,
                'message' => 'Ошибка загрузки файла в хранилище: ' . $e->getMessage(),
            ]);
        }
        $type_of_activity = new Type_of_activity($validated);
        $type_of_activity->picture_url = $fileUrl;
        $type_of_activity->save();
        return response()->json([
            'code' => 0,
            'message' => 'Вид активности успешно добавлен'
        ]);
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
