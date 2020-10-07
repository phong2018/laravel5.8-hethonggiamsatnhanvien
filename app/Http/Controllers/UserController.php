<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use App\User;
use App\Role;
use App\Position;
use App\Sectors;
use App\Organization;
use Auth;
use App\Setting; 
use App\Hamchung;
use App\UserSector;

//Setting::where("key","=",'config_showeverypage')->first()->value
 

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function timkiem(Request $request){
        echo 'vvvv';
    }

    public function index()
    { 
        $data['title']='Tài khoản';
        //cho lay link
        $data['action_index']=Route('user.index').'?token='.session('token');
        $data['action_create']=Route('user.create').'?token='.session('token'); 
        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/user"),
        );
        //---------
        $data['filter_orgid']=0;

        if(isset($_GET['filter_orgid']) && $_GET['filter_orgid']!=0){ 
            $data['filter_orgid']=$_GET['filter_orgid'];
        }  
        //--------add url cho pagination
        $data['addurl']=array(
            'token'=>session('token'),
            'filter_orgid' =>$data['filter_orgid']
        );
        //lọc lại thwo cấp quản lý nếu ko phải admin
        $org = Organization::orderBy('org_order', 'DESC');

        
        //=========
        $tempus=User::find(Auth::id());
        $orgphuongtemp=Organization::find($tempus->user_IdOrg);
        if($orgphuongtemp->org_level>1) $orgphuong=Organization::find($orgphuongtemp->org_idParent);
        else $orgphuong=$orgphuongtemp;

        //=========
         //lọc lại thwo cấp quản lý nếu ko phải admin
        $org = Organization::orderBy('org_order', 'DESC');
        $hc=new Hamchung(); 
        $org=$hc->getorg_theophancap($org);

        //'data'=>$data,   

         //lọc lại thwo cấp quản lý nếu ko phải admin
        $data['usedb']=0;

        $tempus=User::find(Auth::id());
        if($tempus->user_level>1){
           $orgt=Organization::find($tempus->user_IdOrg);
 
           $users=DB::table('users')
           ->join('ks_organization','users.user_IdOrg','=','ks_organization.org_id')
           ->join('position','users.ID_Position','=','position.ID_Pos') 
           ->join('role','users.ID_Role','=','role.ID_Role') 
           ->select('users.*','position.*','role.*')
           ->where('ks_organization.org_id','=',$orgphuong->org_id)
           ->where('users.user_level','>',1)
           ->orwhere('ks_organization.org_idParent','=',$orgphuong->org_id)
           ->paginate(Setting::getconfig('config_showeverypage')); 
         
         // ->paginate(Setting::getconfig('config_showeverypage'));   

          $data['usedb']=1;


        }
        else{
            if(isset($_GET['filter_orgid']) && $_GET['filter_orgid']!=0){
                   $orgphuong=Organization::find($_GET['filter_orgid']);
                   $users=DB::table('users')
                   ->join('ks_organization','users.user_IdOrg','=','ks_organization.org_id')
                   ->join('position','users.ID_Position','=','position.ID_Pos') 
                   ->join('role','users.ID_Role','=','role.ID_Role') 
                   ->select('users.*','position.*','role.*')
                   ->where('ks_organization.org_id','=',$orgphuong->org_id)
                   ->orwhere('ks_organization.org_idParent','=',$orgphuong->org_id)
                   ->paginate(Setting::getconfig('config_showeverypage')); 

                  $data['usedb']=1;
            }  
            else
            $users=User::paginate(Setting::getconfig('config_showeverypage'));
        }


        return view('admin.user.listuser',['data'=>$data, 'users'=>$users, 'org'=>$org]);
        
    }

    // copy topic
    public function copy($id){// id của question cần copy
        $us=User::find($id);
        $data['action_index']=Route('user.index').'?token='.session('token');
        //========
        $user = new user;
        $user->ID_Staff = 'copy-'.$us->ID_Staff; 
        $user->email = time().'-'.$us->email; 
        $user->password = $us->password; 
        $user->fullname = 'copy-'.$us->fullname;
        $user->DoB = $us->DoB;
        $user->sex= $us->sex;
        $user->phone=$us->phone;
        $user->zalo_id= $us->zalo_id;
        $user->address= $us->address;
        $user->avatar= '';
        $user->ID_Position= $us->ID_Position;
        $user->ID_Role=$us->ID_Role;
        $user->user_IdOrg= $us->user_IdOrg;
        $user->isActived= 0;
        $user->user_level= $us->user_level;
        $user->chucdanh=$us->chucdanh;
        $user->chonkhaosat= 0;
        //=======
        $user->orglv1=$us->orglv1;
        $user->orglv2=$us->orglv2;
        $user->createdby=Auth::id();
        $user->createdat=date("Y-m-d H:i:s");
        $user->save(); 

        $usersector_tam = UserSector::where('ID_User',$id)->get('ID_Sector')->toArray();
        $usersector=array();
        foreach($usersector_tam as $val)
        $usersector[]=$val['ID_Sector']; 

        //---------------
        $usersector_tam = UserSector::where('ID_User',$id)->get('ID_Sector')->toArray();
        foreach($usersector_tam as $val){
            $usersector=new UserSector;
            $usersector->ID_sector=$val['ID_Sector'];  
            $usersector->ID_User=$user->id;
            $usersector->actived=1;
            $usersector->save();
        } 
        //------------
        $data['action_edit']=Route('user.edit',['user' => $user->id]).'?token='.session('token'); 
        //=======
        return redirect($data['action_edit'])->with('messenger', 'Copy Tài khoản Thành Công');

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $pos = Position::where("pos_note",">",0)->get();
        $role = Role::where("role_active",">",0)->get(); 
        $data['title']='Thêm Tài khoản';
        //cho lay link
        $data['action_store']=Route('user.store').'?token='.session('token'); 
        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/user"),
        );
        //'data'=>$data,   
        $org = Organization::orderBy('org_order', 'DESC')->where('org_level',1)->where("org_isActived",">",0)->paginate(Setting::getconfig('config_showeverypage'));

        
        //==========lấy user
        $data['uslv1']=1;
        $tempus=User::find(Auth::id());
        if($tempus->user_level==1){}
        else{
           $orgt=Organization::where('org_id',$tempus->user_IdOrg)->get()->first();
           if($orgt->org_level==2){
              $orgp=Organization::orderBy('org_order', 'DESC')->where('org_id',$orgt->org_idParent)->get();
           }
           else{
              $orgp=Organization::orderBy('org_order', 'DESC')->where('org_id',$tempus->user_IdOrg)->get();
           }
           $org=$orgp;
           $data['uslv1']=0;

           $role = Role::where("role_active",">",0)->where("ID_Role","<>",1)->get(); 
 
        }
        //=========

        

        

        $org_child=array();
        foreach($org as $no=>$val){
            $org_child[$no] = Organization::orderBy('org_order', 'DESC')->where('org_idParent',$val->org_id)->where("org_isActived",">",0)->get();
        }
        //---------
         $sectors = Sectors::orderBy('ID_Sector', 'DESC')->get();
   


        return view('admin.user.adduser',['data'=>$data, 'position'=>$pos,'sectors'=>$sectors,'org'=>$org,'org_child'=>$org_child, 'roles' => $role]);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
        //cho lay link
        $data['action_index']=Route('user.index').'?token='.session('token');
        $data['action_create']=Route('user.create').'?token='.session('token'); 
        //
        isset($request->user_15)? $user_15 = $request->user_15 : $user_15 ='';
        isset($request->user_16)? $user_16 = $request->user_16 : $user_16 ='';
        isset($request->user_17)? $user_17 = $request->user_17 : $user_17 ='';
        isset($request->user_18)? $user_18 = $request->user_18 : $user_18 ='';
        isset($request->user_19)? $user_19 = $request->user_19 : $user_19 ='';
        $user = new User;

        $user->ID_Staff = $request->ID_Staff;
        $user->email =$request->email;
        $user->password = bcrypt($request->password);
        $user->DoB = $request->DoB;
        $user->fullname = $request->fullname;
        $user->sex = $request->sex;
        $user->chonkhaosat = $request->chonkhaosat;
        $user->phone = $request->phone;
        $user->zalo_id = $request->zalo;
        $user->chucdanh = $request->chucdanh;
        $user->address = $request->address;
        $user->avatar =$request->avatar;
        $user->ID_Position = $request->position;
        $user->ID_Role = $request->role;
        $user->user_level = $request->user_level;
        $user->user_IdOrg = $request->user_IdOrg;
        
        $user->user_15 = $user_15;
        $user->user_16 = $user_16;
        $user->user_17 = $user_17;
        $user->user_18 = $user_18;
        $user->user_19 = $user_19;

        $this->validate($request, [
            'email' => 'required|email|unique:users'
        ]);
        //---------trường mới thêm//$request->user_IdOrg
        $hc=new Hamchung(); 
        $orglv1lv2=$hc->getorglv1lv2($request->user_IdOrg);
        $user->orglv1=$orglv1lv2->orglv1;
        $user->orglv2=$orglv1lv2->orglv2;
        $user->createdby=Auth::id();
        $user->createdat=date("Y-m-d H:i:s");
        //---------
        $user->save();
        //-------- 
        $sectors = $request->input('sectors'); 
        if(count($sectors)>0)
        foreach($sectors as $sector_id){
            $usersector=new UserSector;
            $usersector->ID_sector=$sector_id;
            $usersector->ID_User=$user->id;
            $usersector->actived=1;
            $usersector->save();
        }

        return redirect($data['action_index'])->with('messenger', 'Thêm tài khoản Thành Công');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $pos = Position::where("pos_note",">",0)->get();
        //cho lay link
        $data['action_index']=Route('user.index').'?token='.session('token');
        $data['action_update']=Route('user.update',['user' => $id]).'?token='.session('token'); 
        //--------


        $role = Role::where("role_active",">",0)->get(); 
        $user=User::find($id); 
        $data['title']='Sửa Tài khoản';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/user/".$id.'/edit'),
        );
        //'data'=>$data,   

        $org = Organization::orderBy('org_order', 'DESC')->where('org_level',1)->where("org_isActived",">",0)->paginate(Setting::getconfig('config_showeverypage'));

        //==========lấy user
        $data['uslv1']=1;
        $tempus=User::find(Auth::id());
        if($tempus->user_level==1){}// kho làm gì hết
        else{
           $orgt=Organization::where('org_id',$tempus->user_IdOrg)->get()->first();
           if($orgt->org_level==2){
              $orgp=Organization::orderBy('org_order', 'DESC')->where('org_id',$orgt->org_idParent)->get();
           }
           else{
              $orgp=Organization::orderBy('org_order', 'DESC')->where('org_id',$tempus->user_IdOrg)->get();
           }
           $org=$orgp;
           $data['uslv1']=0;
           //--------
           $role = Role::where("role_active",">",0)->where("ID_Role","<>",1)->get(); 
 
        }
        //---------
         $sectors = Sectors::orderBy('ID_Sector', 'DESC')->get();

        $usersector_tam = UserSector::where('ID_User',$id)->get('ID_Sector')->toArray();
        $usersector=array();
        foreach($usersector_tam as $val)
        $usersector[]=$val['ID_Sector'];  


        $org_child=array();
        foreach($org as $no=>$val){
            $org_child[$no] = Organization::orderBy('org_order', 'DESC')->where('org_idParent',$val->org_id)->where("org_isActived",">",0)->get();
        }
        
        if( $user)
        return view('admin.user.edituser',['data'=>$data,'position'=>$pos,'org'=>$org,'usersector'=>$usersector,'sectors'=>$sectors,'org_child'=>$org_child, 'roles' => $role, 'user' => $user]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        //cho lay link
        $data['action_index']=Route('user.index').'?token='.session('token');
        $data['action_create']=Route('user.create').'?token='.session('token'); 
         //
        isset($request->user_15)? $user_15 = $request->user_15 : $user_15 ='';
        isset($request->user_16)? $user_16 = $request->user_16 : $user_16 ='';
        isset($request->user_17)? $user_17 = $request->user_17 : $user_17 ='';
        isset($request->user_18)? $user_18 = $request->user_18 : $user_18 ='';
        isset($request->user_19)? $user_19 = $request->user_19 : $user_19 ='';
    
        $user = User::find($id);   

        $user->ID_Staff = $request->ID_Staff;
        $user->email =$request->email;
        if($request->password)
        $user->password = bcrypt($request->password);
        $user->DoB = $request->DoB;
        $user->fullname = $request->fullname;
        $user->sex = $request->sex;
        $user->chonkhaosat = $request->chonkhaosat;
        $user->phone = $request->phone;
        $user->zalo_id = $request->zalo;
        $user->avatar = $request->avatar;
        $user->chucdanh = $request->chucdanh;
        $user->address = $request->address;
        $user->isActived = $request->isActived;
        /*---upload hình*/
        
        $user->ID_Position = $request->position;
        $user->ID_Role = $request->role;
        $user->user_IdOrg = $request->user_IdOrg;
        $user->user_level = $request->user_level;
        

        $user->user_15 = $user_15;
        $user->user_16 = $user_16;
        $user->user_17 = $user_17;
        $user->user_18 = $user_18;
        $user->user_19 = $user_19;
       
        //---------trường mới thêm//$request->user_IdOrg
        $hc=new Hamchung(); 
        $orglv1lv2=$hc->getorglv1lv2($request->user_IdOrg);
        $user->orglv1=$orglv1lv2->orglv1;
        $user->orglv2=$orglv1lv2->orglv2;;
        $user->updatedby=Auth::id();
        $user->updatedat=date("Y-m-d H:i:s");
        //----------

        $user->save();
        //-------- 
        $res=UserSector::where('ID_User',$user->id)->delete();

        $sectors = $request->input('sectors'); 
        if(count($sectors)>0)
        foreach($sectors as $sector_id){
            $usersector=new UserSector;
            $usersector->ID_sector=$sector_id;
            $usersector->ID_User=$user->id;
            $usersector->actived=1;
            $usersector->save();
        }
        //---------
        return redirect($data['action_index'])->with('messenger', 'Cập nhật tài khoản Thành Công');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    

    public function Userdelete($id)
    {
        //
    }

    public function UserAjaxChangeActive($id){
 
 
        $user = User::find($id);

        if ($user->isActived == 1) {
            $user->isActived = 0;
        }else{
            $user->isActived = 1;
        }

        $json=array();

 
        if($user->save()){
             $json['success']='Success';
        } 
        else{
            $json['error']='Error';
        }

        
        $json=array();
        $json['success']='Success';
        return response()->json($json);


    }
    public function manageinfo(){
        $pos = Position::where("pos_note",">",0)->get();
        $role = Role::where("role_active",">",0)->get();
        $user=User::find(Auth::id()); 

        $data['title']='Thông tin tài khoản   ';

        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' =>$data['title'],
            'href' => url("/admin/user/c/manageinfo"),
        );


        if( $user)
        return view('admin.user.manageuser',['data'=>$data,'position'=>$pos, 'roles' => $role, 'user' => $user]);
    }

    public function updateinfo(Request $request)
    {
        //
         //
        isset($request->user_15)? $user_15 = $request->user_15 : $user_15 ='';
        isset($request->user_16)? $user_16 = $request->user_16 : $user_16 ='';
        isset($request->user_17)? $user_17 = $request->user_17 : $user_17 ='';
        isset($request->user_18)? $user_18 = $request->user_18 : $user_18 ='';
        isset($request->user_19)? $user_19 = $request->user_19 : $user_19 ='';
    
        $user=User::find(Auth::id());    

        $user->ID_Staff = $request->ID_Staff;
        $user->email =$request->email;

        if($request->password)
        $user->password = bcrypt($request->password);

        $user->DoB = $request->DoB;
        $user->fullname = $request->fullname;
        $user->sex = $request->sex;
        $user->phone = $request->phone;
        $user->zalo_id = $request->zalo;
        $user->address = $request->address;
   
       $user->avatar =$request->avata;
         

        $user->user_15 = $user_15;
        $user->user_16 = $user_16;
        $user->user_17 = $user_17;
        $user->user_18 = $user_18;
        $user->user_19 = $user_19;
        $user->save();
        return redirect('admin/user/c/manageinfo')->with('messenger', 'Cập nhật Thành Công');;

    }

    public function destroy($id)
    {
        DB::table('assign')->where('ID_Employee', '=', $id)->delete();
        DB::table('dossier_process')->where('ID_Assign', '=', $id)->orwhere('ID_thongbao', '=', $id)->orwhere('id_create', '=', $id)->delete();
        DB::table('task_appointed')->where('ID_Staff', '=', $id)->delete();
 
        
        $user = User::find($id);
        if( $user)  $user->delete();
    }


}
