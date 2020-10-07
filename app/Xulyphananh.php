<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Xulyphananh extends Model
{
	//
    public $timestamps = false;
	
    protected $table = 'gs_xulyphananh';
    protected $primaryKey = 'xulyphananh_id';
    //
     public function tinhtrangxuly()
    {
        return $this->hasOne('App\Tinhtrangxuly', 'tinhtrangxuly_id', 'tinhtrangxuly_id');
    }
    public function nguoixuly()
    {
        return $this->hasOne('App\User',  'id','createdby');
    }
}
