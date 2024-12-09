<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Activity extends Model
{
    use HasFactory;
    protected $table = 'activities';
    protected $fillable = ['user_id', 'types_of_activity_id', 'activity_name', 'date_of_completion', 'actual_score'];
    public function type_of_activity(): BelongsTo
    {
        return $this->belongsTo(Type_of_activity::class);
    }
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
