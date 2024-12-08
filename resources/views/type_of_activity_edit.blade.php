@extends('layout')
@section('content')
<div class="row justify-content-center">
    <div class="col-4">
        <form method="post" action="{{url('type_of_activity/update/' .$type_of_activity->id)}}">
            @csrf
            <div class="mb-3">
                <label for="type_of_activity_name" class="form-label">Название</label>
                <input type="text" class="form-control @error('type_of_activity_name') is-invalid @enderror"
                    id="type_of_activity_name" name="type_of_activity_name" aria-describedby="type_of_activity_nameHelp"
                    value="@if (old('type_of_activity_name')) {{old('type_of_activity_name')}} @else {{$type_of_activity->type_of_activity_name}} @endif"/>
                <div id="type_of_activity_nameHelp" class="form-text">*Введите новое название вида активности</div>
                @error('type_of_activity_name')
                <div class="invalid-feedback">{{$message}}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="maximum_score" class="form-label">Максимальный балл</label>
                <input type="text" class="form-control @error('maximum_score') is-invalid @enderror"
                       id="maximum_score" name="maximum_score" aria-describedby="maximum_scoreHelp"
                       value="@if (old('maximum_score')) {{old('maximum_score')}} @else {{$type_of_activity->maximum_score}} @endif"/>
                       <div id="maximum_scoreHelp" class="form-text">Введите максимальный балл вида активности</div>
                @error('maximum_score')
                <div class="is-invalid">{{$message}}</div>
                @enderror
            </div>
            <div class="mb-3">
            <label for="user" class="form-label">Персона</label>
                <select class="form-select" id="user" name="user_id" aria-describedby="userHelp" value={{old('user_id')}}>
                    @foreach($users as $user)
                        <option value="{{$user->id}}"
                            @if(old('user_id') == $user->id) selected
                            @endif>{{$user->name}}
                        </option>
                    @endforeach
                </select>
                <div id="userHelp" class="form-text">Выберите персону</div>
                @error('user_id')
                <div class="invalid-feedback">{{$message}}</div>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary">Изменить</button>
        </form>
    </div>
</div>
@endsection
