<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Procedures extends Model
{
    public $timestamps = false;
	
    protected $table = 'procedure';
    protected $primaryKey = 'ID_Procedure';

    public function dossierss()
    {
        return $this ->hasOne('App\Dossiers', 'ID_Procedure', 'ID_Procedure');
    }

    public function sector_function()
    {
        return $this->belongsTo('App\Sectors', 'ID_Sector', 'ID_Sector');
    }

    public function assignment()
    {
        return $this->hasMany('App\Assigns', 'ID_Procedure', 'ID_Procedure');
    }

    protected $fillable = [
        'ID_Procedure', 'procedure_name', 'ID_Sector', 'procedure_active', 'procedure_5', 'procedure_6', 'procedure_7', 'procedure_8', 'procedure_9'
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
