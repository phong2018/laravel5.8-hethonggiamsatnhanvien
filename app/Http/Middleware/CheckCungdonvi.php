<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Hamchung;


class CheckCungdonvi
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
        //return $next($request);
        if(Auth::user()->user_level==1 || $currentPath=='dontallowaccess')
            return $next($request);
        else{
            // xử lý truy cập organization
            if (strpos($currentPath, 'organization') !== false) {// xu ly organization 
                if($request->organization>0){
                    $hc=new Hamchung(); 
                    $orglv1_us=$hc->getidorglv1_fromdoituong('users','id',Auth::id());
                    $orglv1_ob=$hc->getidorglv1_fromdoituong('ks_organization','org_id',$request->organization);
                    //=========
                    if($orglv1_us==$orglv1_ob) return $next($request);
                    else return redirect('dontallowaccess')->with('status', $currentPath);//.'--'.$orglv1_us.'--'.$orglv1_ob
                }
                else{
                    return $next($request);
                }
            }
            // xử lý truy cập user
            if (strpos($currentPath, 'user') !== false) {// xu ly user
                if($request->user>0){
                    $hc=new Hamchung(); 
                    $orglv1_us=$hc->getidorglv1_fromdoituong('users','id',Auth::id());
                    $orglv1_ob=$hc->getidorglv1_fromdoituong('users','id',$request->user);
                    //=========
                    if($orglv1_us==$orglv1_ob) return $next($request);
                    else return redirect('dontallowaccess')->with('status', $currentPath.'-'.$orglv1_us.'-'.$orglv1_ob);//.'--'.$orglv1_us.'--'.$orglv1_ob
                }
                else{
                    return $next($request);
                }
            }
            // xử lý truy cập phananh
            if (strpos($currentPath, 'phananh') !== false) {// xu ly phananh
                if($request->phananh>0){
                    $hc=new Hamchung(); 
                    $orglv1_us=$hc->getidorglv1_fromdoituong('users','id',Auth::id());
                    $orglv1_ob=$hc->getidorglv1_fromdoituong('gs_phananh','phananh_id',$request->phananh);
                    //=========
                    if($orglv1_us==$orglv1_ob) return $next($request);
                    else return redirect('dontallowaccess')->with('status', $currentPath.'-'.$orglv1_us.'-'.$orglv1_ob);//.'--'.$orglv1_us.'--'.$orglv1_ob
                }
                else{
                    return $next($request);
                }
                //------------kiểm tra xem phản ánh này có thuộc lĩnh vực nhân viên này xử lý không
            }

            return $next($request);
        }
    }
}
 