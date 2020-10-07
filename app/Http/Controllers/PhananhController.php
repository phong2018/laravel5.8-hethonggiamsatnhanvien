<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use App\Tinhtrangxuly;
use App\Xulyphananh;
use App\Phananh;
use App\Organization;
use App\Setting; 
use App\User; 
use App\Sectors;
use App\UserSector;
use Validator;
use Auth;
use App\Hamchung;
use App\Exports\ExcelExport;
use Maatwebsite\Excel\Facades\Excel; 

class PhananhController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=array( 
            'filter_orgid'=>0,
            'filter_tinhtrangxuly_id'=>0,
            'filter-input-ngay_xlpa'=>0,
            'filter_sector_id'=>0,
            'filter_ngay_xlpa_tungay'=>date("Y-m-d"),
            'filter_ngay_xlpa_denngay'=>date("Y-m-d"),
        );

        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create'); 

        //------
        $p_anh = Phananh::orderBy('phananh_id', 'Desc');
        $data['addurl']=array();
        //---------secsion
        $data['addurl']['token']=session('token');
        //---------orgi_id
        if(isset($_GET['filter_orgid']) && $_GET['filter_orgid']!=0){
            $p_anh=$p_anh->where('orglv1', '=', $_GET['filter_orgid']);
            $data['filter_orgid']=$_GET['filter_orgid'];
            $data['addurl']['filter_orgid']=$_GET['filter_orgid'];
        }
        //---------xử lý neu chi là giam sat
        $hc=new Hamchung(); 
        $kiemtragiamsat=$hc->kiemtragiamsat();
        if($kiemtragiamsat['user_level']>1){//là giám sát thì chỉ xem trong phường của mình
            $p_anh=$p_anh->where('orglv1', '=', $kiemtragiamsat['orglv1']);
        }
        //---------tinhtrangxuly_id
        if(isset($_GET['filter_tinhtrangxuly_id']) && $_GET['filter_tinhtrangxuly_id']!=0){
            $p_anh=$p_anh->where('tinhtrangxuly_id', '=', $_GET['filter_tinhtrangxuly_id']);
            $data['filter_tinhtrangxuly_id']=$_GET['filter_tinhtrangxuly_id'];
            $data['addurl']['filter_tinhtrangxuly_id']=$_GET['filter_tinhtrangxuly_id'];
        }
        
        //---------sector_id
        if(isset($_GET['filter_sector_id']) && $_GET['filter_sector_id']!=0){
            $p_anh=$p_anh->where('sector_id', '=', $_GET['filter_sector_id']);
            $data['filter_sector_id']=$_GET['filter_sector_id'];
            $data['addurl']['filter_sector_id']=$_GET['filter_sector_id'];
        }
        //---------ngay_xuly_phananh
        if(isset($_GET['filter-input-ngay_xlpa']) && $_GET['filter-input-ngay_xlpa']!=''){
            $data['filter-input-ngay_xlpa']=$_GET['filter-input-ngay_xlpa'];
            $data['addurl']['filter-input-ngay_xlpa']=$_GET['filter-input-ngay_xlpa'];
        }
        if($data['filter-input-ngay_xlpa']>0){
            //check   từ ngày
            if(isset($_GET['filter_ngay_xlpa_tungay']) && $_GET['filter_ngay_xlpa_tungay']!=''){
                $p_anh= $p_anh->where('updatedat', '>=', date($_GET['filter_ngay_xlpa_tungay']));
                $data['filter_ngay_xlpa_tungay']=$_GET['filter_ngay_xlpa_tungay'];
                $data['addurl']['filter_ngay_xlpa_tungay']=$_GET['filter_ngay_xlpa_tungay'];
            }
            //check   den ngày
            if(isset($_GET['filter_ngay_xlpa_denngay']) && $_GET['filter_ngay_xlpa_denngay']!=''){
                $p_anh= $p_anh->where('updatedat', '<=', date('Y-m-d', strtotime(date($_GET['filter_ngay_xlpa_denngay']).' +1 day')));
                $data['filter_ngay_xlpa_denngay']=$_GET['filter_ngay_xlpa_denngay'];
                $data['addurl']['filter_ngay_xlpa_denngay']=$_GET['filter_ngay_xlpa_denngay'];
            }
        }
        //-----------xuất kết quả
        if(isset($_GET['xuatexcel'])){
            $sheet_col='H'; 
            $arr_header_excel=array("STT","Nội dung","Ngày tạo","Ngày xử lý ", "Tình trạng","Lĩnh Vực" , "Phường/ xã","Người xử lý");
            $arr_body=array();
            $p_anh=$p_anh->get();
            foreach($p_anh as $no=>$pa){
                if($pa->updatedby>0)
                $nguoixl=$pa->user->fullname; 
                else $nguoixl='';
             
                $arr_body[]=array($no+1,$pa->phananh_noidung,date('d-m-Y', strtotime($pa->createdat)),date('d-m-Y', strtotime($pa->updatedat)),$pa->tinhtrangxuly->tinhtrangxuly_name,$pa->sector->sector_name,$pa->organization->org_name,$nguoixl);  
            }    
            $arr_body[]=array('');        
            //--------chuyển mảng qua collection
            $sheet_data= collect($arr_body);
            if($data['filter-input-ngay_xlpa']>0)
            $sheet_header=[['KẾT QUẢ XỬ LÝ PHẢN ÁNH TỪ '.date('d-m-Y', strtotime($pa->createdat)).' -> '.date('d-m-Y', strtotime($pa->updatedat))],$arr_header_excel];
            else
            $sheet_header=[['KẾT QUẢ XỬ LÝ PHẢN ÁNH'],$arr_header_excel];
            //---------
            $tex=new ExcelExport;
            $tex->sheet_col=$sheet_col;
            $tex->sheet_data=$sheet_data;
            $tex->sheet_header=$sheet_header;
            $filename='Report-Survey-'.date("d-m-Y-H-i-s").'.xlsx';
            return Excel::download($tex, $filename);
        }else
        $p_anh = $p_anh->paginate(Setting::where("key","=",'config_showeverypage')->first()->value);
        //tạo breadcumbs
        $data['title']='Phản ánh';
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => $data['action_index'],
        );
        //lọc lại thwo cấp quản lý nếu ko phải admin
        $orgs = Organization::orderBy('org_order', 'DESC');
        $orgs=$hc->getorg_theophancap($orgs);
        $sectors = Sectors::get();
        $ttrang = Tinhtrangxuly::orderBy('sort_order', 'ASC')->get();
        //-------
        return view('admin.phananh.list',['data'=>$data,'sectors'=>$sectors,'orgs'=>$orgs,'ttrang'=>$ttrang,'phananh'=>$p_anh]);
    }
    //---phản ánh dành cho nhân viên
    public function index_emp()
    {
        $data=array( 
            'filter_orgid'=>0,
            'filter_tinhtrangxuly_id'=>0,
            'filter-input-ngay_xlpa'=>0,
            'filter_sector_id'=>0,
            'filter_ngay_xlpa_tungay'=>date("Y-m-d"),
            'filter_ngay_xlpa_denngay'=>date("Y-m-d"),
        );

        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create'); 

        //------
        $p_anh = Phananh::orderBy('phananh_id', 'Desc');
        $data['addurl']=array();
        //---------secsion
        $data['addurl']['token']=session('token');
        //---------orgi_id
        if(isset($_GET['filter_orgid']) && $_GET['filter_orgid']!=0){
            $p_anh=$p_anh->where('orglv1', '=', $_GET['filter_orgid']);
            $data['filter_orgid']=$_GET['filter_orgid'];
            $data['addurl']['filter_orgid']=$_GET['filter_orgid'];
        }
        //---------xử lý neu chi là giam sat
        $hc=new Hamchung(); 
        $kiemtragiamsat=$hc->kiemtragiamsat();
        if($kiemtragiamsat['user_level']>1){//là giám sát thì chỉ xem trong phường của mình
            $p_anh=$p_anh->where('orglv1', '=', $kiemtragiamsat['orglv1']);
        }
        //---------tinhtrangxuly_id
        if(isset($_GET['filter_tinhtrangxuly_id']) && $_GET['filter_tinhtrangxuly_id']!=0){
            $p_anh=$p_anh->where('tinhtrangxuly_id', '=', $_GET['filter_tinhtrangxuly_id']);
            $data['filter_tinhtrangxuly_id']=$_GET['filter_tinhtrangxuly_id'];
            $data['addurl']['filter_tinhtrangxuly_id']=$_GET['filter_tinhtrangxuly_id'];
        }
        //----là nhân viên nên phải kiểm tra thêm trong lĩnh vực
        $usersector_tam = UserSector::where('ID_User',Auth::id())->get('ID_Sector')->toArray();
        $usersector=array();
        foreach($usersector_tam as $val)
        $usersector[]=$val['ID_Sector'];  
        $p_anh=$p_anh->whereIn('sector_id', $usersector);

        //---------sector_id
        if(isset($_GET['filter_sector_id']) && $_GET['filter_sector_id']!=0){
            $p_anh=$p_anh->where('sector_id', '=', $_GET['filter_sector_id']);
            $data['filter_sector_id']=$_GET['filter_sector_id'];
            $data['addurl']['filter_sector_id']=$_GET['filter_sector_id'];
        }
        //---------ngay_xuly_phananh
        if(isset($_GET['filter-input-ngay_xlpa']) && $_GET['filter-input-ngay_xlpa']!=''){
            $data['filter-input-ngay_xlpa']=$_GET['filter-input-ngay_xlpa'];
            $data['addurl']['filter-input-ngay_xlpa']=$_GET['filter-input-ngay_xlpa'];
        }
        if($data['filter-input-ngay_xlpa']>0){
            //check   từ ngày
            if(isset($_GET['filter_ngay_xlpa_tungay']) && $_GET['filter_ngay_xlpa_tungay']!=''){
                $p_anh= $p_anh->where('updatedat', '>=', date($_GET['filter_ngay_xlpa_tungay']));
                $data['filter_ngay_xlpa_tungay']=$_GET['filter_ngay_xlpa_tungay'];
                $data['addurl']['filter_ngay_xlpa_tungay']=$_GET['filter_ngay_xlpa_tungay'];
            }
            //check   den ngày
            if(isset($_GET['filter_ngay_xlpa_denngay']) && $_GET['filter_ngay_xlpa_denngay']!=''){
                $p_anh= $p_anh->where('updatedat', '<=', date('Y-m-d', strtotime(date($_GET['filter_ngay_xlpa_denngay']).' +1 day')));
                $data['filter_ngay_xlpa_denngay']=$_GET['filter_ngay_xlpa_denngay'];
                $data['addurl']['filter_ngay_xlpa_denngay']=$_GET['filter_ngay_xlpa_denngay'];
            }
        }
        //-----------xuất kết quả
        if(isset($_GET['xuatexcel'])){
            $sheet_col='H'; 
            $arr_header_excel=array("STT","Nội dung","Ngày tạo","Ngày xử lý ", "Tình trạng","Lĩnh Vực" , "Phường/ xã","Người xử lý");
            $arr_body=array();
            $p_anh=$p_anh->get();
            foreach($p_anh as $no=>$pa){
                if($pa->updatedby>0)
                $nguoixl=$pa->user->fullname; 
                else $nguoixl='';
             
                $arr_body[]=array($no+1,$pa->phananh_noidung,date('d-m-Y', strtotime($pa->createdat)),date('d-m-Y', strtotime($pa->updatedat)),$pa->tinhtrangxuly->tinhtrangxuly_name,$pa->sector->sector_name,$pa->organization->org_name,$nguoixl);  
            }    
            $arr_body[]=array('');        
            //--------chuyển mảng qua collection
            $sheet_data= collect($arr_body);
            if($data['filter-input-ngay_xlpa']>0)
            $sheet_header=[['KẾT QUẢ XỬ LÝ PHẢN ÁNH TỪ '.date('d-m-Y', strtotime($pa->createdat)).' -> '.date('d-m-Y', strtotime($pa->updatedat))],$arr_header_excel];
            else
            $sheet_header=[['KẾT QUẢ XỬ LÝ PHẢN ÁNH'],$arr_header_excel];
            //---------
            $tex=new ExcelExport;
            $tex->sheet_col=$sheet_col;
            $tex->sheet_data=$sheet_data;
            $tex->sheet_header=$sheet_header;
            $filename='Report-Survey-'.date("d-m-Y-H-i-s").'.xlsx';
            return Excel::download($tex, $filename);
        }else
        $p_anh = $p_anh->paginate(Setting::where("key","=",'config_showeverypage')->first()->value);
        //tạo breadcumbs
        $data['title']='Phản ánh';
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => $data['action_index'],
        );
        //lọc lại thwo cấp quản lý nếu ko phải admin
        $orgs = Organization::orderBy('org_order', 'DESC');
        $orgs=$hc->getorg_theophancap($orgs);
        $ttrang = Tinhtrangxuly::orderBy('sort_order', 'ASC')->get();
        //-------
        //$sectors = Sectors::get();
        $sectors= DB::table('sector')
            ->join('gs_usersector', 'sector.ID_Sector', '=',  'gs_usersector.ID_Sector' )
            ->select('sector.*')
            ->where( 'gs_usersector.ID_User', '=', Auth::id())
            ->get();
        //-------
        return view('admin.phananh.list',['data'=>$data,'sectors'=>$sectors,'orgs'=>$orgs,'ttrang'=>$ttrang,'phananh'=>$p_anh]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create');
        $data['action_store']=Route('phananh.store');

        //
            $data['title']='Tạo Phản ánh';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("")
        );
       
        //--------add breadcumbs
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("phananh/create"),
        );
        //'data'=>$data,  
        $data['config_gs_imgsize_allow'] = Setting::getconfig('config_gs_imgsize_allow');
        $data['config_gs_videosize_allow'] = Setting::getconfig('config_gs_videosize_allow'); 
        $data['secs']=Sectors::All();
        $data['orgs']=Organization::where('org_idParent',0)->get();

        return view('frontend.phananh.add',['data'=>$data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //-----------đường dẫn chức năng
        $data['action_home']=Route('phananh.create');
        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create');
        $data['action_store']=Route('phananh.store');
        //-----------kiểm tra dữ liệu
        $messages = [
            'required' => 'Bắt buộc nhập.',
        ];
        $validator = Validator::make($request->all(), [
            //'phananh_noidung' => 'required'
        ], $messages);
        if ($validator->fails()) {
            return redirect($data['action_create'])->withErrors($validator)->withInput();
        }
        //----------lưu dữ liệu
        $p_anh = new phananh;
        $p_anh->phananh_noidung = $request->phananh_noidung;
        $p_anh->sort_order = $request->sort_order;
        $p_anh->thongtinnguoigui = $request->thongtinnguoigui;
        $p_anh->tinhtrangxuly_id = 6;//tình trạng chưa tiếp nhận
        
        $p_anh->orglv1 = $request->orglv1;
        $p_anh->sector_id = $request->ID_Sector;
        $p_anh->status =1;
        $p_anh->createdby=Auth::id();
        $p_anh->createdat=date("Y-m-d H:i:s");
        $p_anh->updatedby=Auth::id();
        $p_anh->updatedat=date("Y-m-d H:i:s");

        $p_anh->save();
         //--------tạo xử lý dữ liệu là chưa tiếp nhận
        $xl_phananh = new Xulyphananh;
        $xl_phananh->phananh_id = $p_anh->phananh_id;
        $xl_phananh->xulyphananh_noidung = '';// nội dung
        $xl_phananh->tinhtrangxuly_id = 6;// tình trạng
        $xl_phananh->createdby =0;// người xử lý phản ánh
        $xl_phananh->createdat=date("Y-m-d H:i:s");// ngày xử lý
        $xl_phananh->save();
        //-------------------
        $target_dir=public_path()."/phananh/".date("Y")."/".date("M").'/'.$p_anh->phananh_id.'/';
        $target_dir_save="/phananh/".date("Y")."/".date("M").'/'.$p_anh->phananh_id.'/';
        //----xu lý hình ảnh và video
        $phananh_hinhanh='';
        if (!is_dir($target_dir)) mkdir($target_dir, 0777, true);
        //-------hinhanh1
        if($request->hasFile('phananh_hinhanh1')){
            $target_file = $target_dir . basename($_FILES["phananh_hinhanh1"]["name"]);
            $target_file_save = $target_dir_save . basename($_FILES["phananh_hinhanh1"]["name"]);
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            if(strrpos(strtolower(";".Setting::getconfig('config_gs_imgtype_allow')),strtolower($imageFileType))
            && $_FILES["phananh_hinhanh1"]["size"]<=(Setting::getconfig('config_gs_imgsize_allow')*1000000)){
                move_uploaded_file($_FILES["phananh_hinhanh1"]["tmp_name"], $target_file);//
                $phananh_hinhanh.=$target_file_save.';';
            } 
        }
        //-------hinhanh2
        if($request->hasFile('phananh_hinhanh2')){
            $target_file = $target_dir . basename($_FILES["phananh_hinhanh2"]["name"]);
            $target_file_save = $target_dir_save . basename($_FILES["phananh_hinhanh2"]["name"]);
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            if(strrpos(strtolower(";".Setting::getconfig('config_gs_imgtype_allow')),strtolower($imageFileType))
            && $_FILES["phananh_hinhanh2"]["size"]<=(Setting::getconfig('config_gs_imgsize_allow')*1000000)){
                move_uploaded_file($_FILES["phananh_hinhanh2"]["tmp_name"], $target_file);//
                $phananh_hinhanh.=$target_file_save.';';
            } 
        }
        //-------hinhanh3
        if($request->hasFile('phananh_hinhanh3')){
            $target_file = $target_dir . basename($_FILES["phananh_hinhanh3"]["name"]);
            $target_file_save = $target_dir_save . basename($_FILES["phananh_hinhanh3"]["name"]);
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            if(strrpos(strtolower(";".Setting::getconfig('config_gs_imgtype_allow')),strtolower($imageFileType))
            && $_FILES["phananh_hinhanh3"]["size"]<=(Setting::getconfig('config_gs_imgsize_allow')*1000000)){
                move_uploaded_file($_FILES["phananh_hinhanh3"]["tmp_name"], $target_file);//
                $phananh_hinhanh.=$target_file_save.';';
            } 
        }
        //-------video
        $phananh_video="";
        if($request->hasFile('phananh_video')){
            $target_file = $target_dir . basename($_FILES["phananh_video"]["name"]);
            $target_file_save = $target_dir_save . basename($_FILES["phananh_video"]["name"]);
            $videoFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            if(strrpos(strtolower(";".Setting::getconfig('config_gs_videotype_allow')),strtolower($videoFileType)) 
            && $_FILES["phananh_video"]["size"]<=(Setting::getconfig('config_gs_videosize_allow')*1000000)){
                move_uploaded_file($_FILES["phananh_video"]["tmp_name"], $target_file);//
                $phananh_video.=$target_file_save.';';
            } 
        }

        //---------
        $p_anh->phananh_hinhanh=$phananh_hinhanh;
        $p_anh->phananh_video=$phananh_video;
        $p_anh->update();
        //---------
        return redirect($data['action_home'])->with('messenger', 'Gửi phản ánh phản ánh Thành Công');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create');
        $data['action_update']=Route('phananh.update',['phananh' => $id]);

        //
        $phananh=Phananh::find($id); 
        $data['imgs']=explode(";",$phananh['phananh_hinhanh']);
        $data['vids']=explode(";",$phananh['phananh_video']);

        $data['title']='Xem chi tiết phản ánh';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/phananh/".$id."/show"),
        );

        $data['xl_phananh']=Xulyphananh::orderBy('xulyphananh_id', 'ASC')->where('phananh_id',$id)->get();

        //======
        if( $phananh)
        return view('admin.phananh.show',['data'=>$data, 'phananh'=>$phananh]);
        else  return abort(404);
         
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create').'?token='.session('token');
        $data['action_update']=Route('phananh.update',['phananh' => $id]).'?token='.session('token');

        //
        $phananh=Phananh::find($id); 
        $data['imgs']=explode(";",$phananh['phananh_hinhanh']);
        $data['vids']=explode(";",$phananh['phananh_video']);

        $data['title']='Cập nhật phản ánh';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/phananh/".$id."/edit"),
        );
        //'data'=>$data,   
        $ttrang = Tinhtrangxuly::orderBy('sort_order', 'ASC')->get();//->where('tinhtrangxuly_id','<>',6)
           //'data'=>$data,   
        $data['secs']=Sectors::All();
        $data['orgs']=Organization::where('org_idParent',0)->get();

        if( $phananh)
        return view('admin.phananh.edit',['data'=>$data, 'phananh'=>$phananh,'ttrang'=>$ttrang]);
        else  return abort(404);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
  
    public function update(Request $request, $id){
        //----
        $data['action_index']=Route('phananh.index').'?token='.session('token');
        $data['action_create']=Route('phananh.create');
        $data['action_show']=Route('phananh.show',['phananh' => $id]).'?token='.session('token');
        //--------xu lý dữ liệu 
        $messages = [
            'required' => 'Bắt buộc nhập.',
        ];
        $validator = Validator::make($request->all(), [
            'xulyphananh_noidung' => 'required'
        ], $messages);

        if ($validator->fails()) {
            return redirect($data['action_create'])->withErrors($validator)->withInput();
        }
        //----------lưu dữ liệu
        $p_anh = Phananh::find($id);  
        $p_anh->tinhtrangxuly_id = $request->tinhtrangxuly_id;// tình trạng xử lý mới nhất của phản ánh này
        $p_anh->updatedby=Auth::id();
        $p_anh->updatedat=date("Y-m-d H:i:s");
        $p_anh->orglv1 = $request->orglv1;
        $p_anh->sector_id = $request->ID_Sector;

        $p_anh->save();
        //--------tạo xử lý dữ liệu
        $xl_phananh = new Xulyphananh;
        $xl_phananh->phananh_id = $p_anh->phananh_id;
        $xl_phananh->xulyphananh_noidung = $request->xulyphananh_noidung;// nội dung
        $xl_phananh->tinhtrangxuly_id = $request->tinhtrangxuly_id;// tình trạng
        $xl_phananh->createdby =Auth::id();// người xử lý phản ánh
        $xl_phananh->createdat=date("Y-m-d H:i:s");// ngày xử lý
        $xl_phananh->save();
        //---------
        return redirect($data['action_show'])->with('messenger', 'Thêm mới Phản ánh phản ánh Thành Công');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $json=array();
        
        
        //xoa xu ly phan anh
        DB::table('gs_xulyphananh')->where('phananh_id', '=', $id)->delete();
        // xoa phan anh
        $p_anh = Phananh::find($id);
        $p_anh->delete();
       

        $json['success']='Xóa Phản ánh thành công!';
         
        
        return response()->json($json);
        //
    }
}
