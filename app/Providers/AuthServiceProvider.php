<?php

namespace App\Providers;

use App\Models\Type_of_activity;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Pagination\Paginator;
use App\Models\User;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        //
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();
        Paginator::defaultView('pagination::bootstrap-4');

        Gate::define('destroy-type_of_activity', function (User $user, Type_of_activity $type_of_activity) {
            return $user->is_admin == 1;
        });

        Gate::define('create-type_of_activity', function (User $user) {
            return true; // true;
        });
    }
}
