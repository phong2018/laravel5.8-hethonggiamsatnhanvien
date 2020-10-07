<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Auth;
use App\Organization;
use App\User;
use App\Topic;
use App\Setting; 
use App\Schedule;
use App\Hamchung;


class OrganizationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //cho lay text
        $data['title']='Đơn vị';
        //cho lay link
        $data['action_index']=Route('organization.index').'?token='.session('token');
        $data['action_create']=Route('organization.create').'?token='.session('token');
        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/organization"),
        );


        
        $org = Organization::orderBy('org_order', 'ASC');
        $orgdeloc=Organization::orderBy('org_order', 'ASC');
        //lọc lại thwo cấp quản lý nếu ko phải admin 
        $tempus=User::find(Auth::id());
        if($tempus->user_level>1){
           //-------- 
           $orgt=$org->where('org_id',$tempus->user_IdOrg)->get()->first();
           if($orgt->org_level==2){
             $org=Organization::orderBy('org_order', 'ASC')->where('org_id',$orgt->org_idParent);
           }
           else{
             $org=Organization::orderBy('org_order', 'ASC')->where('org_id',$tempus->user_IdOrg);
           }
            //org để lọc tìm kiếm
            $orgdeloc=$org->get();
        }
        else{
            $org =$org->where('org_level',1);
            //org để lọc tìm kiếm
            $orgdeloc=$org->get();
        }
        //==========
        $data['filter_orgid']=0;
        if(isset($_GET['filter_orgid']) && $_GET['filter_orgid']!=0){
            //$devices= $devices->where('device_orgid',$_GET['filter_device_orgid']);
            $org =$org->where('org_id',$_GET['filter_orgid']);
            $data['filter_orgid']=$_GET['filter_orgid'];
        }  

        //--------add url cho pagination
        $data['addurl']=array(
            'token'=>session('token'),
            'filter_orgid' =>$data['filter_orgid']
        );
        //----------

        $org=$org->paginate(Setting::getconfig('config_showeverypage')); 

        //---------lay danh sach org chirld
        $org_child=array();
        foreach($org as $no=>$val){
            $org_child[$no] = Organization::orderBy('org_order', 'ASC')->where('org_idParent',$val->org_id)->get();
        }
        return view('admin.organization.list',['data'=>$data,'org'=>$org,'orgs'=>$orgdeloc, 'org_child'=>$org_child]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //cho lay text
        $data['title']='Thêm mới đơn vị';
        //cho lay link
        $data['action_store']=Route('organization.store').'?token='.session('token');
        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/organization/create"),
        );
        //'data'=>$data,   
        $topic=DB::table('ks_topic')
           ->select('ks_topic.*')
           ->where('ks_topic.topic_idCreated','=',Auth::id()) 
           ->orwhere('ks_topic.topic_idCreated','=',1) 
           ->get();

        $tempus=User::find(Auth::id());
        $data['lvus']=$tempus->user_level;
        return view('admin.organization.add',['data'=>$data,'topic'=>$topic]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data['action_index']=Route('organization.index').'?token='.session('token');

        $org = new Organization;
        $org->org_name = $request->org_name;
        $org->org_image= $request->org_image;
        $org->org_level = $request->org_level;
        $org->org_idCreated =Auth::id();
        $org->org_idAssigned = $request->org_idAssigned;
        $org->org_topic_id = $request->org_topic_id;
        if($request->org_idParent=="") $org->org_idParent=0;
        else $org->org_idParent= $request->org_idParent;
        $org->org_address= $request->org_address;
        $org->org_phone= $request->org_phone;
        $org->org_order= $request->org_order;
        $org->org_isSelectEmp= $request->org_isSelectEmp;
        $org->org_isActived= $request->org_isActived;
        $org->org_chudebatbuoc= $request->org_chudebatbuoc;
        //---------trường mới thêm
        if($org->org_level==1){
            $org->orglv1=$org->org_id;
            $org->orglv2=0;
        }else{
            $org->orglv1=$request->org_idParent;
            $org->orglv2=$org->org_id; 
        }
        $org->createdby=Auth::id();
        $org->createdat=date("Y-m-d H:i:s");
        //----------------------
        $org->save();
        return redirect($data['action_index'])->with('messenger', 'Thêm mới Đơn vị Thành Công');
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
        $organization=Organization::find($id); 

        $data['title']='Sửa Đơn Vị';
        //cho lay link
        $data['action_update']=Route('organization.update',['organization' => $id]).'?token='.session('token');
        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/organization/".$id."/edit"),
        );

        $tempus=User::find(Auth::id());
        $data['lvus']=$tempus->user_level; 
    
        if( $organization)
        return view('admin.organization.edit',['data'=>$data, 'org'=>$organization ]);
        else  return abort(404);
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
        $data['action_index']=Route('organization.index').'?token='.session('token');

        $org  = Organization::find($id);   
        $org->org_name = $request->org_name;
        $org->org_image= $request->org_image;
        $org->org_level = $request->org_level;
        $org->org_idCreated =Auth::id();
        $org->org_idAssigned = $request->org_idAssigned;
         
        if($request->org_idParent=="") $org->org_idParent=0;
        else $org->org_idParent= $request->org_idParent;
        $org->org_address= $request->org_address;
        $org->org_phone= $request->org_phone;
        $org->org_order= $request->org_order;
        $org->org_isSelectEmp= $request->org_isSelectEmp;
        $org->org_isActived= $request->org_isActived;
        $org->org_chudebatbuoc= $request->org_chudebatbuoc;
         //---------trường mới thêm
        if($org->org_level==1){
            $org->orglv1=$org->org_id;
            $org->orglv2=0;
        }else{
            $org->orglv1=$request->org_idParent;
            $org->orglv2=$org->org_id; 
        }
        $org->updatedby=Auth::id();
        $org->updatedat=date("Y-m-d H:i:s");;
        //----------------------
        $org->save();
        return redirect($data['action_index'])->with('messenger', 'Cập nhật Đơn vị Thành Công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($org_id)
    {
        // cập nhật lại tổ chức có đơn vị cấp trên có id=org_id 
        Organization::where('org_idParent', $org_id)
          ->delete();
        Schedule::where('schedule_idOrg', $org_id)
          ->delete();
        $org = Organization::find($org_id);
        if($org) $org->delete();
    }

    
}

