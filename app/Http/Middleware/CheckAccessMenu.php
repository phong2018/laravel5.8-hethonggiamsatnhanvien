<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Arr;


class CheckAccessMenu
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
      
        $currentPath= Route::currentRouteName().';';
        

        if(Auth::user()->user_level==1 || $currentPath=='dontallowaccess')
            return $next($request);
        else{
           //check quyền truy cập menu theo role_menu
           $menu= DB::table('gs_menu')
            ->join('gs_menu_role', 'gs_menu.ID_Menu', '=', 'gs_menu_role.ID_Menu')
            ->join('role', 'gs_menu_role.ID_Role', '=', 'role.ID_Role')
            ->join('users', 'role.ID_Role', '=', 'users.ID_Role')
            ->select('gs_menu.*')
            ->where('users.id', '=', Auth::id())
            ->where('gs_menu.menu_routename','like','%'.$currentPath.'%')
            ->count(); 
           /*kết luận access*/ 
           if($menu>0)
                return $next($request);
           else{//nếu vô ko được thì mới thử cho vô trang emp
                if(Route::currentRouteName()=="phananh.index")
                return redirect(Route('phananh.index_emp').'?token='.session('token'));
                else
                return redirect(Route('dontallowaccess'))->with('status', $currentPath);
           }
        }
         
        
        

    }
}
/*
- thêm super_user vào user để quản ko quan tâm cái middleware này-> có quyền truy cập tất cả.
- mặc định ko có quyền truy cập tất cả, cái middleware này chỉ dùng cho suppervisor và user (người dùng thôi)/ hiện ra cái có khả năng truy cập được.
//=============== 
echo URL::current();
echo '---------';
echo Route::getFacadeRoot()->current()->uri();
echo '---------';
*/