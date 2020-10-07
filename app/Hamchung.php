<?php

namespace App;
use Auth;
use App\User;
use App\Organization;
use App\Setting; 
use Illuminate\Support\Facades\DB;

class Hamchung 
{
    // hàm test
    public   function ham1($data=array()){
      /*-------------config gửi mail*/        
      return 'ham1';
      
    }
    //ham lay bien tren link string
    public function getparameterfromurl($url){
        $url_components = parse_url($url); 
        parse_str($url_components['query'], $params); 
        return $params['signature'];
    }
    //ham lay don vi cap 1 theo phan cong, user giám sát này thuộc phường cấp 1 nào
    public function getorg_theophancap($org){
        $tempus=User::find(Auth::id());
        if($tempus->user_level>1){
           $orgt=$org->where('org_id',$tempus->user_IdOrg)->get()->first();

           if($orgt->org_level==2){
             $org=Organization::orderBy('org_order', 'ASC')->where('org_id',$orgt->org_idParent)->get();
           }
           else{
             $org=Organization::orderBy('org_order', 'ASC')->where('org_id',$tempus->user_IdOrg)->get();
           }
        }
        else
        $org =$org->where('org_level',1)->get();
        //------------
        return $org;
    }

    //ham lay don vi cap 1 theo phan cong, user giám sát này thuộc phường cấp 1 nào, chỉ xet đôi với giam sát thôi
    public function kiemtragiamsat(){ 
          $arr=array();
          $tempus=User::find(Auth::id());
          $arr['user_level'] =$tempus->user_level;
          //-------
          $orgt=Organization::where('org_id',$tempus->user_IdOrg)->get()->first();
          if($orgt->org_level==2)
          $org=Organization::orderBy('org_order', 'ASC')->where('org_id',$orgt->org_idParent)->get()->first();
          else $org=$orgt;

          $arr['orglv1'] =$org['org_id'];
          //print_r($arr);
          return $arr;


    }

    
    //ham lay don vi cap 1 theo phan cong, user giám sát này thuộc phường cấp 1 nào, chỉ xet đôi với giam sát thôi
    public function getidorglv1_fromdoituong($table,$nameid,$id){ 
        
          $ob=DB::table($table)
           ->select('orglv1')
           ->where($nameid,'=',$id)  
           ->first();
 

          if(count($ob)>0) return $ob->orglv1;
          else return 0;
    }
    //ham lay don vi cap 1 của đối tượng vd: đơn vị, user,....
    public function getorglv1_cuaUser($usid){ 
        $org=array();
        $tempus=User::find($usid);
        //----------
        if($tempus->user_level>1){//là giám sát, lãnh đạo, người dùng...
           $orgt=Organization::find('org_id',$tempus->user_IdOrg);
           if($orgt->org_level==2) $org=Organization::find('org_id',$orgt->org_idParent); 
           else $org=$orgt;
        }else{}//là admin thì truy cập hết

        return $org;

    }
    //------lấy org lv1, lv2 từ orgid
    public function getorglv1lv2($orgid){
        $ob=DB::table('ks_organization')
           ->select('orglv1','orglv2')
           ->where('org_id','=',$orgid)  
           ->first(); 
        return $ob;
    }
   
}
