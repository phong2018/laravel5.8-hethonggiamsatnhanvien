@extends ('admin.layouts.index')

@section ('title')
<title>{{$data['title']}}</title>
@endsection
@section ('style')

@section ('content')
<div class="row justify-content-center">
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
        <div class="col-md-12 col-xs-12 col-lg-12">
            <div class="card">
                
                @if(count($errors) > 0)
                @foreach($errors->all() as $err)
                <div class="alert alert-danger plghidden">{{$err}}</div>
                @endforeach
                @endif

                <div class="card-body">
                    <form  action="{{$data['action_update']}}" accept-charset="UTF-8" method="POST" enctype="multipart/form-data">
                        {{ method_field('PUT') }}{{csrf_field()}}
 
                        <div class="form-group row">
                            <label for="tinhtrangxuly_name" class="col-md-2 col-form-label text-md-right">{{ __('Tên Tình trạng') }}
                            <span class="invalid-feedback" role="alert">*</span>
                            </label>

                            <div class="col-md-10">
                                <input id="tinhtrangxuly_name" type="text" class="form-control{{ $errors->has('tinhtrangxuly_name') ? ' is-invalid' : '' }}" name="tinhtrangxuly_name" value="{{$tinhtrangxuly->tinhtrangxuly_name}}" required>

                                @if ($errors->has('tinhtrangxuly_name'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('tinhtrangxuly_name') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tinhtrangxuly_color" class="col-md-2 col-form-label text-md-right">{{ __('Màu sắc đại diện') }}
                            <span class="invalid-feedback" role="alert">*</span>
                            </label>

                            <div class="col-md-10"> 

                                <input id="tinhtrangxuly_color" type="color" class=" {{ $errors->has('tinhtrangxuly_color') ? ' is-invalid' : '' }}" name="tinhtrangxuly_color" required  value="{{$tinhtrangxuly->tinhtrangxuly_color}}" style="width:50px;padding:0px;">


                                @if ($errors->has('tinhtrangxuly_color'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('tinhtrangxuly_color') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sort_order" class="col-md-2 col-form-label text-md-right">{{ __('Thứ tự hiển thị') }}</label>

                            <div class="col-md-10">
                                <input id="sort_order" type="number" class="form-control{{ $errors->has('sort_order') ? ' is-invalid' : '' }}" name="sort_order" value="{{$tinhtrangxuly->sort_order}}">

                                @if ($errors->has('sort_order'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('sort_order') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                          <div class="form-group row">
                                <label for="status" class="col-md-2 col-form-label text-right">{{ __('Trạng Thái') }}</label>
                                <div class="col-md-10">
                                    <table class='borderchinone'><td>
                                    <label for="active" class="col-form-label text-md-righ">{{ __('Bật') }} &nbsp</label>
                                    </td><td>
                                    <input id="active" type="radio"  name="status" 
                                    <?php if($tinhtrangxuly->status==1) echo "checked";?>
                                     value="1">
                                    </td> <td style="width:20px;">
                                    </td><td>
                                    <label for="inactive" class="col-form-label text-md-righ">{{ __('Tắt') }}  &nbsp</label>
                                    </td><td>
                                    <input id="inactive" type="radio"  name="status" 
                                    <?php if($tinhtrangxuly->status==0) echo "checked";?>
                                    value="0"> 
                                     </td></table>

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
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section ('script')