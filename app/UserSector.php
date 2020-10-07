<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserSector extends Model
{
    public $timestamps = false;

    protected $table = 'gs_usersector';
    protected $primaryKey = 'ID_UserSector';

    public function User()
    {
        return $this->belongsTo('App\User', 'id', 'ID_User');
    }
    public function Sectors()
    {
        return $this->belongsTo('App\Sectors', 'ID_Sector', 'ID_Sector');
    }

   
 
}
