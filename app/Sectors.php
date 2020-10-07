<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sectors extends Model
{
    public $timestamps = false;
	
    protected $table = 'sector';
    protected $primaryKey = 'ID_Sector';

    public function procedure_function()
    {
        return $this->hasMany('App\Procedures', 'ID_Sector','ID_Sector');
    }

    protected $fillable = [
        'ID_Sector', 'sector_name', 'sector_active', 'sector_4', 'sector_5', 'sector_6', 'sector_7', 'sector_8',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
