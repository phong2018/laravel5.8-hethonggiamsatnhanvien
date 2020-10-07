<?php
use App\Position;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
/*tính số hồ sơ quá hạn*/
$dossier_quahan= DB::table('dossier')
            ->join('task_appointed', 'task_appointed.ID_Dossier', '=', 'dossier.ID_Dossier')
            ->join('users', 'users.id', '=', 'task_appointed.ID_Staff')
            ->join('list_step', 'list_step.ID_Step', '=', 'dossier.id_stepcurrent')
            ->select('dossier.*')
            ->where('users.id', '=', Auth::id()) 
            ->where('list_step.out_ofdate', '=', 1)
            ->where('dossier.is_actived', '=',1)
            ->where('dossier.time_return', '<', date("Y-m-d H:i:s"))
            ->count(); 
$pos=Position::find(Auth::user()->ID_Position);
/*tính các menu hiển thị ra được*/
$menu= DB::table('gs_menu_role')
            ->join('gs_menu', 'gs_menu_role.ID_Menu', '=', 'gs_menu.ID_Menu')
            ->select('gs_menu.*')
            ->where('gs_menu_role.ID_Role', '=', Auth::user()->ID_Role)
            ->where('gs_menu.menu_show', '=', 1)
            ->where('gs_menu.menu_active', '=', 1)
            ->orderBy('gs_menu.menu_level', 'asc')
            ->orderBy('gs_menu.menu_order', 'asc')
            ->get()->toArray();
/*Hàm tạo menu*/
$strmenu='';
$checkmenu=array();
for($i=0;$i<count($menu);$i++)
//============================
if(!isset($checkmenu[$menu[$i]->ID_Menu])){
  /*bỏ dấu ; ở cuối đi. dấu chấm phẩy để xét quyền truy cập cho chính xác*/
  $mn=explode(';',$menu[$i]->menu_routename);if(count($mn)==0) $mn[0]='';
  $menu[$i]->menu_routename=$mn[0];

  $checkmenu[$menu[$i]->ID_Menu]=1;  
  if($menu[$i]->menu_routename!=''){
      $strmenu.='<li id="id'.$i.'"><a class=" " href="'.Route($menu[$i]->menu_routename).'?token='.session('token').'">'.$menu[$i]->menu_icon.'<span>'.$menu[$i]->menu_name.'</span></a></li>';
  }
  else{
    $strmenu.='<li id="id'.$i.'"><a class="parent">'.$menu[$i]->menu_icon.'<span>'.$menu[$i]->menu_name.'</span></a>';
    $strmenu.='<ul>';
        for($j=0;$j<count($menu);$j++)
        //============================
        if(!isset($checkmenu[$menu[$j]->ID_Menu])&&($menu[$i]->ID_Menu==$menu[$j]->menu_parent) && $menu[$j]->menu_routename!='')/*Chưa chọn và là cha*/
        {
          /*bỏ dấu ; ở cuối đi. dấu chấm phẩy để xét quyền truy cập cho chính xác*/
          $mn=explode(';',$menu[$j]->menu_routename);if(count($mn)==0) $mn[0]='';
          $menu[$j]->menu_routename=$mn[0];
          /*count số lượng hồ sơ trong quy trình link này nếu có
          vd route dạng: admin/dossier/dossierstep/3
          */
          $arrroutelink=(explode("/",$menu[$j]->menu_routename));
          //print_r($arrroutelink);
          $strcount='';
          /*tính số hồ sơ tại link này*/
          if(  $arrroutelink[2]=='dossierstep'){
               $countdor=DB::table('dossier')
                ->join('task_appointed', 'task_appointed.ID_Dossier', '=', 'dossier.ID_Dossier')
                ->join('users', 'users.id', '=', 'task_appointed.ID_Staff')
                ->where('dossier.id_stepcurrent', '=',$arrroutelink[3])
                ->where('dossier.is_actived', '=',1)
                ->where('users.id', '=', Auth::id()) 
                ->count(); 
              $strcount=' <span class="countdor">('.$countdor.')</span>';
          }
          /*số lượng hồ sơ quá hạn*/
          if( $menu[$j]->menu_routename=='admin/dossier/c/quahan'){
              $strcount=' <span class="countdor">('.$dossier_quahan.')</span>';
          }
          $checkmenu[$menu[$j]->ID_Menu]=1;
          if($menu[$j]->menu_routename==''){
            $strmenu.='<li><a class="parent">'.$menu[$j]->menu_name.'</a>';
            for($e=0;$e<count($menu);$e++)
            //============================
            if(!isset($checkmenu[$menu[$e]->ID_Menu])&&($menu[$j]->ID_Menu==$menu[$e]->menu_parent))/*Chưa chọn và là cha*/
            {
               /*bỏ dấu ; ở cuối đi. dấu chấm phẩy để xét quyền truy cập cho chính xác*/
               $mn=explode(';',$menu[$e]->menu_routename);if(count($mn)==0) $mn[0]='';
               $menu[$e]->menu_routename=$mn[0];

               $checkmenu[$menu[$e]->ID_Menu]=1;
               $strmenu.='<li><a href="'.Route($menu[$e]->menu_routename).'?token='.session('token').'">'.menu[$e]->menu_name.'</a></li>';
            }
            $strmenu.='</li>';    
          }
          else{ 
            $strmenu.='<li><a href="'.Route($menu[$j]->menu_routename).'?token='.session('token').'"  class="">'.$menu[$j]->menu_name. $strcount.'</a>';
            $strmenu.='</li>';    
          }
        }  
    $strmenu.='</ul>';
    $strmenu.='</li>';
  }
}
?>
<nav id="column-left" class="active" style="margin-top: 50px;">
  <!-- Sidebar user panel -->
  <div id="profile"  >
  <div class="user-panel">
      <div class="pull-left image">
        <a href='{{url("admin/user/c/manageinfo")}}'>
        <img src="{{url('/')}}/public/{{ Auth::user()->avatar }}" class="img-circle avatathumb" alt="User Image">
        </a>
      </div>
      <div class="pull-left info" style=' color:black;padding-top: 10px;'>
        <a style=' color:black;' href='{{url("admin/user/c/manageinfo")}}'>
        <span class='nameus' style=" ">{{ Auth::user()->fullname }}</span>
        </a>
        <?php //echo $pos->pos_name;?>
      </div>
    </div>
  </div>
<ul id="menu">
<!-- Là superuser thì toàn quyền thấy menu -->
@if(Auth::user()->user_level==1)
   <li id="quanlyhoso" class='plghidden'><a class="parent"><i class="fa fa-tags fa-fw"></i> <span>Quản Lý Hồ Sơ</span></a>
      <ul class="collapse"   style="height: 0px;">
        <li><a href="#">Danh Sách Hồ Sơ</a></li>
        <li><a href="#"> Thêm Hồ Sơ Mới</a></li>
      </ul>
    </li>
   <li id="thuoctinhhoso"><a class="parent"><i class="fa fa-puzzle-piece fa-fw"></i> <span>Quản lý Phản ánh</span></a>
      <ul class="collapse" >
        <li><a href="{{Route('phananh.index')}}?token={{session('token')}}">Dữ liệu Phản ánh</a></li>
        <li><a href="{{Route('tinhtrangxuly.index')}}?token={{session('token')}}">Tình trạng xử lý</a></li>
        <li><a href="{{Route('sector.index')}}?token={{session('token')}}">Lĩnh vực Phản ánh</a></li>
      </ul>
    </li>
    <li><a href="{{Route('organization.index')}}?token={{session('token')}}"> <i class="fa fa-cubes"></i> &nbsp Đơn vị / Bộ phận</a></li>
    <li id="taikhoan" ><a class="parent"><i class="fa fa-user fa-fw"></i> <span>Tài Khoản & Vai trò</span></a>
      <ul class="collapse" >
        <li><a href="{{Route('user.index')}}?token={{session('token')}}">Quản lý Tài Khoản</a></li>
        <li><a href="{{Route('position.index')}}?token={{session('token')}}">Quản Lý Chức Vụ</a></li>
        <li><a href="{{Route('role.index')}}?token={{session('token')}}">Quản Lý Vai Trò</a></li>
        
      </ul>   
    </li> 
    <li id="caidathethong"  ><a class="parent"><i class="fa fa-cog fa-fw"></i> <span>Cài Đặt Hệ Thống</span></a>
      <ul class="collapse" >
        <li><a href="{{Route('setting.edit')}}?token={{session('token')}}">Thiết Lập Chung</a></li>
        <li><a href="{{Route('menu.index')}}?token={{session('token')}}"> Menu & Quyền truy cập</a></li>
        <li><a href="{{Route('backup.index')}}?token={{session('token')}}"> Sao Lưu/ Phục Hồi</a></li>
      </ul>
    </li>
{!! $strmenu !!}
@else
{!! $strmenu !!}
@endif
</ul>
</nav>