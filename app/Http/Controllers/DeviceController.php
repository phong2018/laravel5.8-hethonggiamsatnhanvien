<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use App\Device;
use App\Setting; 
use App\Organization; 
use App\User;
use Illuminate\Support\Facades\DB;

class DeviceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
         $data['title']='Thiết bị';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/device"),
        );
        ///=====
         $data=array(
            'filter_device_orgid'=>0 ,
            'filter_device_isActived'=>0 
        );
        // 
        //======
        $devices = Device::orderBy('device_id', 'DESC');
        
       
        if(isset($_GET['filter_device_orgid']) && $_GET['filter_device_orgid']!=0){
            $devices= $devices->where('device_orgid',$_GET['filter_device_orgid']);
            $data['filter_device_orgid']=$_GET['filter_device_orgid'];
        } 

        if(isset($_GET['filter_device_isActived'])){
            $devices= $devices->where('device_isActived',$_GET['filter_device_isActived']);
            $data['filter_device_isActived']=$_GET['filter_device_isActived'];
        } 

         //'data'=>$data,   
        $data['orgs'] = Organization::orderBy('org_order', 'DESC')->where("org_isActived",">",0)->where("org_level","=",1)->get();

        $devices=$devices->paginate(Setting::getconfig('config_showeverypage'));

        return view('admin.device.listdevice',['data'=>$data, 'devices'=>$devices]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //

        $data['title']='Thêm Thiết bị';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/device"),
        );

        //=========
        $org = Organization::orderBy('org_order', 'ASC')->where('org_level',1)->where("org_isActived",">",0)->paginate(Setting::getconfig('config_showeverypage'));

        $org_user=array();
        foreach($org as $no=>$val){

        $org_user[$no]=DB::table('users')
           ->join('ks_organization','users.user_IdOrg','=','ks_organization.org_id')
           ->select('users.*')
           ->where(function($q)use ($val) {
                        $q->where([
                            ['ks_organization.org_id','=',$val->org_id] 
                        ])
                        ->orWhere([
                            ['ks_organization.org_idParent','=',$val->org_id] 
                        ]);
 
            })
           ->where('users.user_level','>',1)
           ->get(); 
        }
        //'data'=>$data,   
        $data['orgs'] = Organization::orderBy('org_order', 'DESC')->where("org_isActived",">",0)->where("org_level","=",1)->get();

        return view('admin.device.adddevice',['data'=>$data,'org'=>$org,'org_user'=>$org_user]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $device = new Device;
        $device->device_name = $request->device_name;
        $device->device_uid = $request->device_uid;
        $device->device_orgid= $request->device_orgid;
        $device->device_assign_userid= $request->device_assign_userid;
        $device->device_giaodien = $request->device_giaodien;
        $device->device_registerDate = $request->device_registerDate;
        $device->device_isActived = $request->device_isActived;

        $device->save();
        return redirect('admin/device')->with('messenger', 'Thêm mới Thiết bị thành công');
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

        $device=device::find($id); 
        
        $data['title']='Sửa Thiết bị';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/device/".$id.'/edit'),
        );
        //'data'=>$data,   

        $data['orgs'] = Organization::orderBy('org_order', 'DESC')->where("org_isActived",">",0)->where("org_level","=",1)->get();

        //=========
        $org = Organization::orderBy('org_order', 'ASC')->where('org_level',1)->where("org_isActived",">",0)->paginate(Setting::getconfig('config_showeverypage'));

        $org_user=array();
        foreach($org as $no=>$val){

        $org_user[$no]=DB::table('users')
           ->join('ks_organization','users.user_IdOrg','=','ks_organization.org_id')
           ->select('users.*')
           ->where(function($q)use ($val) {
                        $q->where([
                            ['ks_organization.org_id','=',$val->org_id] 
                        ])
                        ->orWhere([
                            ['ks_organization.org_idParent','=',$val->org_id] 
                        ]);
 
            })
           ->where('users.user_level','>',1)
           ->get(); 
        }

        if( $device)
        return view('admin.device.editdevice',['data'=>$data ,  'device' => $device,'org'=>$org,'org_user'=>$org_user]);
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
        $device=device::find($id); 
        $device->device_name = $request->device_name;
        $device->device_uid = $request->device_uid;
        $device->device_assign_userid= $request->device_assign_userid;
        $device->device_orgid= $request->device_orgid;
        $device->device_giaodien = $request->device_giaodien;
        $device->device_registerDate = $request->device_registerDate;
        $device->device_isActived = $request->device_isActived;

        $device->save();
        return redirect('admin/device')->with('messenger', 'Thêm mới Thiết bị thành công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $dev = Device::find($id);
        if($dev)  $dev->delete();

       
    }
}
