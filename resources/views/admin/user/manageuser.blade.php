@extends ('admin.layouts.index')

@section ('title')
<title>thêm hồ sơ mới</title>
@endsection
@section ('style')

@endsection

@section ('content')
@if(session('messenger'))
  <span class='plgalertsuccess'>
   <div class="alert alert-success"><i class="fa fa-check-circle"></i>    
  {{session('messenger')}}   <button type="button" class="close" data-dismiss="alert">×</button>
    </div>
  </span>
  @endif
  
<div class="row">

   <div class="page-header">
    <div class="container-fluid">
      @if (isset($data['title']))
      <h1>{{$data['title']}}</h1>
      @endif  
      @if(isset($data['breadcrumbs']))
      <ul class="breadcrumb">
        <?php foreach ($data['breadcrumbs'] as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
        @endif
    </div>
  </div>

  

    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class=" ">
                 
                @if(count($errors) > 0)
                @foreach($errors->all() as $err)
                <div class="alert alert-danger">{{$err}}</div>
                @endforeach
                @endif
             
                    <div class="container-fluid1">
                    <form  action="{{url('admin/user/c/updateinfo')}}"   accept-charset="UTF-8" method="POST" enctype="multipart/form-data">    
                        {{csrf_field()}}

                        <div class="form-group row">
                            <label for="email" class="col-md-2 col-form-label text-md-right">{{ __('E-Mail') }}</label>

                            <div class="col-md-10">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{$user->email}}"  required>

                                @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="ID_Staff" class="col-md-2 col-form-label text-md-right">{{ __('Mã Nhân Viên') }}</label>

                            <div class="col-md-10">
                                <input id="ID_Staff" type="text" class="form-control{{ $errors->has('ID_Staff') ? ' is-invalid' : '' }}" name="ID_Staff" value="{{$user->ID_Staff}}" required >

                                @if ($errors->has('ID_Staff'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('ID_Staff') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fullname" class="col-md-2 col-form-label text-md-right">{{ __('Tên Nhân Viên') }}</label>

                            <div class="col-md-10">
                                <input id="fullname" type="text" class="form-control{{ $errors->has('fullname') ? ' is-invalid' : '' }}" name="fullname" value="{{$user->fullname}}"  required >

                                @if ($errors->has('fullname'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('fullname') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="DoB" class="col-md-2 col-form-label text-md-right">{{ __('Ngày Sinh') }}</label>

                            <div class="col-md-10">
                                <input id="DoB" type="date" class="form-control{{ $errors->has('DoB') ? ' is-invalid' : '' }}" name="DoB" value="{{date('Y-m-d', strtotime($user->DoB))}}" required >

                                @if ($errors->has('DoB'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('DoB') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sex" class="col-md-2 col-form-label text-md-right">{{ __('Giới Tính') }} </label>



                            <div class="col-md-10">
                                <table class='borderchinone'><td>
                                <label for="male" class="  col-form-label text-md-right">{{ __('Nam ') }} &nbsp </label>
                                </td><td>
                                <input id="male" type="radio" class='inputsex' name="sex" 
                                 @if ($user->sex==1)
		                                   checked 
		                         @endif 
                                 value="1">
                               
                                </td> <td style="width:20px;">

                                </td><td>
                                <label for="female" class=" col-form-label text-md-right">{{ __('Nữ') }} &nbsp </label>
                                </td><td>
                                <input id="female" type="radio" class='inputsex' name="sex" 
                                @if ($user->sex==0)
		                                   checked 
		                         @endif 
                                value="0"> 
                                </td></table>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="address" class="col-md-2 col-form-label text-md-right">{{ __('Địa Chỉ') }}</label>

                            <div class="col-md-10">
                                <input id="address" type="text" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" name="address"  value="{{$user->address}}" required>

                                @if ($errors->has('address'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('address') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="phone" class="col-md-2 col-form-label text-md-right">{{ __('Số Điện Thoại') }}</label>

                            <div class="col-md-10">
                                <input id="phone" type="text" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{$user->phone}}" required>

                                @if ($errors->has('phone'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('phone') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="zalo" class="col-md-2 col-form-label text-md-right">{{ __('Zalo') }}</label>

                            <div class="col-md-10">
                                <input id="zalo" type="text" class="form-control{{ $errors->has('zalo') ? ' is-invalid' : '' }}" name="zalo" value="{{$user->zalo_id}}" required>

                                @if ($errors->has('zalo'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('zalo') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                     <div class="form-group row">
                            <label for="avatar" class="col-md-2 col-form-label text-md-right">{{ __('Avatar') }}</label>

                            <div class="col-md-10">

                                 <div class="input-group">
                                      <input type="button" id="lfm" data-input="thumbnail" data-preview="holder" value="Upload">
                                      <input type="hidden" id="thumbnail" class="form-control" value="{{$user->avatar}}" type="text" name="avatar">
                                  </div>
                                  <img id="holder" src='{{url("/")}}/public/{{$user->avatar}}' style="margin-top:15px;max-height:100px;">
                                 
                            </div>
                        </div>   

                         


                        <div class="form-group row">
                            <label for="password" class="col-md-2 col-form-label text-md-right">{{ __('Mật Khẩu') }}</label>

                            <div class="col-md-10">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" >

                                @if ($errors->has('password'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Lưu Lại') }}
                                </button>
                                &nbsp 
                <a onclick="document.getElementById('nutquaylai').click();" type="submit" class="btn btn-primary">
                                Quay Lại
                </a>
                            </div>
                        </div>
                    </form></div>
                
            </div>
        </div>
    </div>
  </div>
  <script src="{{url('/')}}/public/vendor/laravel-filemanager/js/lfm.js"></script>
    <script>
        var options = {prefix:"{{url('/public/')}}"}
        $('#lfm').filemanager('image',options); 
    </script> 
@endsection

@section ('script')