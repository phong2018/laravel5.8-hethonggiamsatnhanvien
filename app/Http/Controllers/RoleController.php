<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\Menu;
use App\Setting; 
use App\MenuRole;


class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        //cho lay link
        $data['action_index']=Route('role.index').'?token='.session('token');
        $data['action_create']=Route('role.create').'?token='.session('token');
        //---------
        $role = Role::paginate(Setting::where("key","=",'config_showeverypage')->first()->value);


        $data['title']='Vai trò';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/role"),
        );
        //'data'=>$data, 

        return view('admin.role.listrole',['data'=>$data,'roles'=>$role]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        //cho lay link
        $data['action_index']=Route('role.index').'?token='.session('token');
        $data['action_store']=Route('role.store').'?token='.session('token');

         
        $menu = Menu::orderBy('menu_show', 'DESC')->orderBy('menu_level', 'ASC')->orderBy('menu_order', 'ASC')->get();

        $data['title']='Thêm Vai trò';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/role/create"),
        );
        //'data'=>$data, 


        return view('admin.role.add',['data'=>$data, 'menu'=>$menu]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data['action_index']=Route('role.index').'?token='.session('token');
        $data['action_store']=Route('role.store').'?token='.session('token');

  
        $name = Role::all();
        foreach ($name as $value) {
            if (strtolower($value->role_name) == strtolower($request->role_name)) {
                return redirect('admin/role/create')->with('messenger', 'Quyền này đã tồn tại!');
            }
        }
        $role = new Role;
        $role->role_name = $request->role_name;
        $role->role_active = $request->role_active;
        $role->save();
        //-------- 
        $menus = $request->input('menus'); 
        if(count($menus)>0)
        foreach($menus as $menu_id){
            $menu_role=new MenuRole;
            $menu_role->ID_Menu=$menu_id;
            $menu_role->ID_Role=$role->ID_Role;
            $menu_role->menurole_actived=1;
            $menu_role->save();
        }


        return redirect($data['action_index'])->with('messenger', 'Thêm mới Vai trò Thành Công');
         
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
        //cho lay link
        $data['action_index']=Route('role.index').'?token='.session('token');
        $data['action_update']=Route('role.update',['role' => $id]).'?token='.session('token');


        

        //
        $menu_role_tam = MenuRole::where('ID_Role',$id)->get('ID_Menu')->toArray();
        $menu_role=array();
        foreach($menu_role_tam as $val)
        $menu_role[]=$val['ID_Menu'];    
        //print_r($menu_role);
        //==============
        //$menu = Menu::all()->sortBy('menu_order');

        $menu = Menu::orderBy('menu_show', 'DESC')->orderBy('menu_level', 'ASC')->orderBy('menu_order', 'ASC')->get();


        $role=Role::find($id); 

        $data['title']='Sửa Vai trò';

        //tạo breadcumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' =>'Trang chủ',
            'href' => url("/admin")
        );
        $data['breadcrumbs'][] = array(
            'text' => $data['title'],
            'href' => url("/admin/role/".$id."/edit"),
        );
        //'data'=>$data, 


        if( $role)
        return view('admin.role.edit',['data'=>$data, 'role'=>$role,'menu'=>$menu,'menu_role'=>$menu_role]);
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
        $data['action_index']=Route('role.index').'?token='.session('token');
        //
        $roles = Role::all();
        foreach ($roles as $value) {
            if (  strtolower($value->role_name) == strtolower($request->role_name) && $value->ID_Role != $id) {
                return redirect('admin/role/'.$id.'/edit')->with('messenger', 'Quyền này đã tồn tại!' );
            }
        }
        $role = Role::find($id);
        $role->role_name = $request->role_name;
        $role->role_active = 1;
        $role->save();
        //--------
        $res=MenuRole::where('ID_Role',$role->ID_Role)->delete();
        $menus = $request->input('menus'); 
        if(count($menus)>0)
        foreach($menus as $menu_id){
            $menu_role=new MenuRole;
            $menu_role->ID_Menu=$menu_id;
            $menu_role->ID_Role=$role->ID_Role;
            $menu_role->menurole_actived=1;
            $menu_role->save();
        }
        return redirect($data['action_index'])->with('messenger', 'Cập nhật vai trò Thành Công');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
      /*xóa trong menu_role nữa*/     
        $res=MenuRole::where('ID_Role',$id)->delete();
         //--------
        $role = Role::find($id);
        $role->delete();
    
        //
    }
    public function Roledelete($id){
       
    }
    public function RoleAjaxChangeActive($id){
        $role = Role::find($id);

        if ($role->role_active == 1) {
            $role->role_active = 0;
        }else{
            $role->role_active = 1;
        }

        $json=array();

 
        if($role->save()){
             $json['success']='Success';
        } 
        else{
            $json['error']='Error';
        }

        
        $json=array();
        $json['success']='Success';
        return response()->json($json);

    }
}
