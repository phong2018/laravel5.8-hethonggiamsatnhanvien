<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Phananh extends Model
{
    //
      public $timestamps = false;
	
    protected $table = 'gs_phananh';
    protected $primaryKey = 'phananh_id';
    //
    public function tinhtrangxuly()
    {
        return $this->hasOne('App\Tinhtrangxuly', 'tinhtrangxuly_id', 'tinhtrangxuly_id');
    }
    public function organization()
    {
        return $this->hasOne('App\Organization', 'org_id', 'orglv1');
    }
    public function sector()
    {
        return $this->hasOne('App\Sectors', 'ID_Sector', 'sector_id');
    }
     public function user()
    {
        return $this->hasOne('App\User', 'id', 'updatedby');
    }
}
