<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Sectors;
use App\Procedures;
use Illuminate\Support\Facades\DB;
use App\Setting; 


class SectorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['action_index']=Route('sector.index').'?token='.session('token');
        $data['action_create']=Route('sector.create').'?token='.session('token');

 
        $sector = Sectors::paginate(Setting::where("key","=",'config_showeverypage')->first()->value);

        $data['title']='Lĩnh Vực';

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
            'href' => url("/admin/sector"),
        );
        //'data'=>$data,

        return view('admin.sector.list',['data'=>$data,'sector' =>$sector]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['action_index']=Route('sector.index').'?token='.session('token');
        $data['action_store']=Route('sector.store').'?token='.session('token');


        $data['title']='Thêm Lĩnh Vực';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/sector/create"),
        );
        //'data'=>$data,

        return view('admin.sector.add',['data'=>$data]);
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
        $data['action_index']=Route('sector.index').'?token='.session('token');
        $data['action_create']=Route('sector.create').'?token='.session('token');
        $data['action_store']=Route('sector.store').'?token='.session('token');

        isset($request->sector_4)? $sector_4 = $request->sector_4 : $sector_4 =1;
        isset($request->sector_5)? $sector_5 = $request->sector_5 : $sector_5 =1;
        isset($request->sector_6)? $sector_6 = $request->sector_6 : $sector_6 =1;
        isset($request->sector_7)? $sector_7 = $request->sector_7 : $sector_7 =1;
        isset($request->sector_8)? $sector_8 = $request->sector_8 : $sector_8 =1;
        $sector = new Sectors;

        $sector->sector_name = $request->sector_name;
        $sector->sector_4 = $sector_4;
        $sector->sector_5 = $sector_5;
        $sector->sector_6 = $sector_6;
        $sector->sector_7 = $sector_7;
        $sector->sector_8 = $sector_8;
        $sector->sector_active = $request->sector_active;
        $sector->save();

        return redirect($data['action_index'])->with('messenger', 'Thêm lĩnh vực Thành Công');
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
        $data['action_index']=Route('sector.index').'?token='.session('token');
        $data['action_create']=Route('sector.create').'?token='.session('token');
        $data['action_update']=Route('sector.update',['sector' => $id]).'?token='.session('token');
        
        //
        $sector=Sectors::find($id); 

        $data['title']='Sửa Lĩnh Vực';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/sector/".$id."/edit"),
        );
        //'data'=>$data,

        return view('admin.sector.edit',['data'=>$data,'sector'=>$sector]);
 
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
        $data['action_index']=Route('sector.index').'?token='.session('token');
        $data['action_create']=Route('sector.create').'?token='.session('token');
        $data['action_update']=Route('sector.update',['sector' => $id]).'?token='.session('token');
        //
        isset($request->sector_4)? $sector_4 = $request->sector_4 : $sector_4 =1;
        isset($request->sector_5)? $sector_5 = $request->sector_5 : $sector_5 =1;
        isset($request->sector_6)? $sector_6 = $request->sector_6 : $sector_6 =1;
        isset($request->sector_7)? $sector_7 = $request->sector_7 : $sector_7 =1;
        isset($request->sector_8)? $sector_8 = $request->sector_8 : $sector_8 =1;
        $sector = Sectors::find($id);   

        $sector->sector_name = $request->sector_name;
        $sector->sector_4 = $sector_4;
        $sector->sector_5 = $sector_5;
        $sector->sector_6 = $sector_6;
        $sector->sector_7 = $sector_7;
        $sector->sector_8 = $sector_8;
        $sector->sector_active = $request->sector_active;

        if($sector->save()){
             //return redirect('books/'.$id);
             return redirect($data['action_index'])->with('messenger', 'Cập nhật lĩnh vực Thành Công');
        } 
        else{
            return abort(404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         /*xóa trong menu_role nữa*/     
        $pros=Procedures::where('ID_Sector',$id)->get();

        if(count($pros)>0)
            $json['success']='Không xóa được Lĩnh Vực. Do lĩnh vực này đang được sử dụng bởi một số thủ tục!';   
        else{
            $json['success']= 'Xóa Lĩnh vực thành công';
            $sector = Sectors::where('ID_Sector',$id)->delete();
        }     

        return response()->json($json);
 
    }
 
  
     

}
