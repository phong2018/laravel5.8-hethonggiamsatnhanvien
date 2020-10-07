<?php
use Illuminate\Support\Facades\DB;
$setting=array(); 
$setting= DB::table('setting') 
            ->where('code','=','config') 
            ->select('setting.*') 
            ->get()->toArray();
$dsetting=array();
if($setting)      
foreach ($setting as $val)  $dsetting[$val->key]=$val->value;
if(!isset($dsetting['config_banner_htks']))$dsetting['config_banner_htks']=''; 
if(!isset($dsetting['config_ks_intro_home_htks']))$dsetting['config_ks_intro_home_htks']=''; 
if(!isset($dsetting['config_time_auto_direct']))$dsetting['config_time_auto_direct']=''; 
if(!isset($dsetting['config_amthanhcamon']))$dsetting['config_amthanhcamon']=''; 
if(!isset($dsetting['config_amthanhxinchao']))$dsetting['config_amthanhxinchao']=''; 
?>
@extends('frontend.layouts.index')
@section('content')
 
<div class="container">
  
</div>
@endsection
