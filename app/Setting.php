<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Http\Request;
/*thư viện dùn để dump db to sql file*/
use Ifsnop\Mysqldump as IMysqldump;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use App\Backup;
use App\Setting; 
use Illuminate\Support\Facades\File;



class Setting extends Model
{
	public $timestamps = false;

	protected $table = 'setting';
	
    //---------mẫu
    public static function passDataToModelMethod($data)
    {
      var_dump($data);
      return $data['appId'];
      // Write your business logic here.
      // $newObj = new self;
      // $newObj->app_id = $data['app_id'];
      // $newObj->language_id = $data['languageId'];
      // $newObj->save();
    }
    //---------
    public static function getconfig($key){
    	if(isset(self::where("key","=",$key)->first()->value))
        return self::where("key","=",$key)->first()->value;
      else return false;
    }

    public static function taofilebackup(){
        $path='storage/backups/';
        $bk= new Backup;
        $dump = new IMysqldump\Mysqldump('mysql:host=localhost;dbname='.env('DB_DATABASE'), env('DB_USERNAME'), env('DB_PASSWORD'));
        $bk->title=date('d-m-Y_H-i-s').'-backup.sql';
        $bk->url=$path.date('d-m-Y_H-i-s').'-'.Str::random(9).'-backup.sql';  

        $bk->created_at=date("Y-m-d H:i:s"); 
        $bk->updated_at=date("Y-m-d H:i:s"); 
        $bk->save();  
        $dump->start($bk->url);

        /*xử lý bỏ bảng backup ra khỏi file dump*/  
        $filename=$bk->url;
        $sql_dump =file_get_contents($filename);
        $v1=stripos($sql_dump,"-- Table structure for table `backup`");
        $v2=stripos($sql_dump,"COMMIT;",$v1)+7;
        $leng=strlen($sql_dump);
        $s1=substr($sql_dump,0,$v1-1);
        $s2=substr($sql_dump,$v2+1,$leng);
        //--------
        $myfile = fopen($filename, "w") or die("Unable to open file!");
        fwrite($myfile, $s1.$s2);
        fclose($myfile);
    }

}
