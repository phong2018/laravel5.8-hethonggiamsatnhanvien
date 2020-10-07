<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    //
    public $timestamps = false;
	
    protected $table = 'gs_menu';
    protected $primaryKey = 'ID_Menu';
}
