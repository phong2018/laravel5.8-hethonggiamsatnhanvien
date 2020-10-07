<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tinhtrangxuly;
use App\Setting; 
use App\User; 
use Validator;
use Auth;


class TinhtrangxulyController extends Controller
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
        $data['action_index']=Route('tinhtrangxuly.index').'?token='.session('token');
        $data['action_create']=Route('tinhtrangxuly.create').'?token='.session('token');

        //
        $ttrang = Tinhtrangxuly::orderBy('sort_order', 'ASC')->paginate(Setting::where("key","=",'config_showeverypage')->first()->value);
        $data['title']='Tình trạng xử lý';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
         //--------add url cho pagination
        $data['addurl']=array(
            'token'=>session('token') 
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => $data['action_index'],
        );

        return view('admin.tinhtrangxuly.list',['data'=>$data,'tinhtrangxuly'=>$ttrang]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['action_index']=Route('tinhtrangxuly.index').'?token='.session('token');
        $data['action_create']=Route('tinhtrangxuly.create').'?token='.session('token');
        $data['action_store']=Route('tinhtrangxuly.store').'?token='.session('token');

        //
            $data['title']='Tạo Tình trạng xử lý Phản ánh';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
       
        //--------add breadcumbs
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/tinhtrangxuly/create"),
        );
        //'data'=>$data,   


        return view('admin.tinhtrangxuly.add',['data'=>$data]);
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
        $data['action_index']=Route('tinhtrangxuly.index').'?token='.session('token');
        $data['action_create']=Route('tinhtrangxuly.create').'?token='.session('token');
        $data['action_store']=Route('tinhtrangxuly.store').'?token='.session('token');
        //-----------kiểm tra dữ liệu
        $messages = [
            'required' => 'Bắt buộc nhập.',
        ];
        $validator = Validator::make($request->all(), [
            'tinhtrangxuly_name' => 'required'
        ], $messages);
        if ($validator->fails()) {
            return redirect($data['action_create'])->withErrors($validator)->withInput();
        }
        //----------lưu dữ liệu
        $ttrang = new tinhtrangxuly;
        $ttrang->tinhtrangxuly_name = $request->tinhtrangxuly_name;
        $ttrang->tinhtrangxuly_color = $request->tinhtrangxuly_color;
        if($request->sort_order=='')$request->sort_order=0;
        $ttrang->sort_order = $request->sort_order;
        $ttrang->status = $request->status;
        $ttrang->createdby=Auth::id();
        $ttrang->createdat=date("Y-m-d H:i:s");;
        $ttrang->save();
        //---------
        return redirect($data['action_index'])->with('messenger', 'Thêm mới Tình trạng xử lý phản ánh Thành Công');
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

        $data['action_index']=Route('tinhtrangxuly.index').'?token='.session('token');
        $data['action_create']=Route('tinhtrangxuly.create').'?token='.session('token');
        $data['action_update']=Route('tinhtrangxuly.update',['tinhtrangxuly' => $id]).'?token='.session('token');

        //
        $tinhtrangxuly=tinhtrangxuly::find($id); 

        $data['title']='Sửa Chức vụ';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/tinhtrangxuly/".$id."/edit"),
        );
        //'data'=>$data,   


        if( $tinhtrangxuly)
        return view('admin.tinhtrangxuly.edit',['data'=>$data, 'tinhtrangxuly'=>$tinhtrangxuly]);
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
        $data['action_index']=Route('tinhtrangxuly.index').'?token='.session('token');
        $data['action_create']=Route('tinhtrangxuly.create').'?token='.session('token');
        $data['action_update']=Route('tinhtrangxuly.update',['tinhtrangxuly' => $id]).'?token='.session('token');
        //--------xu lý dữ liệu 
        $messages = [
            'required' => 'Bắt buộc nhập.',
        ];
        $validator = Validator::make($request->all(), [
            'tinhtrangxuly_name' => 'required'
        ], $messages);
        if ($validator->fails()) {
            return redirect($data['action_create'])->withErrors($validator)->withInput();
        }
        //----------lưu dữ liệu
        $ttrang = tinhtrangxuly::find($id);   
        $ttrang->tinhtrangxuly_name = $request->tinhtrangxuly_name;
        $ttrang->tinhtrangxuly_color = $request->tinhtrangxuly_color;
        $ttrang->sort_order = $request->sort_order;
        $ttrang->status = $request->status;
        $ttrang->updatedby=Auth::id();
        $ttrang->updatedat=date("Y-m-d H:i:s");;
        $ttrang->save();
        //---------
        return redirect($data['action_index'])->with('messenger', 'Thêm mới Tình trạng xử lý phản ánh Thành Công');

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

        if($id!=6)// khác tình trạng chưa tiếp nhận mới được xóa
        {
            $ttrang = tinhtrangxuly::find($id);
            $ttrang->delete();
            $json['success']='Xóa Tình trạng thành công!';
        }
        else $json['success']='Không được phép xóa tình trạng này';

        
         
        
        return response()->json($json);
        //
    }
}
