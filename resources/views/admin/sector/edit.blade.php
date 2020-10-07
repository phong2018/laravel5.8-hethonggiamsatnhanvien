@extends ('admin.layouts.index')

@section ('title')
<title>Sửa Thông tin Lĩnh Vực</title>
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
                <div class="alert alert-danger">{{$err}}</div>
                @endforeach
                @endif
                <div class="card-body">

                    <form  action="{{$data['action_update']}}"    accept-charset="UTF-8" method="POST" enctype="multipart/form-data">    

                        {{ method_field('PUT') }}{{csrf_field()}}
                        

                        <div class="form-group row">
                            <label for="sector_name" class="col-md-2 col-form-label text-md-right">{{ __('Tên Lĩnh Vực') }}</label>

                            <div class="col-md-10">
                                <input id="sector_name" type="text" class="form-control{{ $errors->has('sector_name') ? ' is-invalid' : '' }}" name="sector_name" required value="{{$sector->sector_name}}" >

                                @if ($errors->has('sector_name'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('sector_name') }}</strong>
                                </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                                <label for="sector_active" class="col-md-2 col-form-label text-right">{{ __('Trạng Thái') }}</label>
                                <div class="col-md-10">
                                    <table class='borderchinone'><td>
                                    <label for="active" class="col-form-label text-md-righ">{{ __('Bật') }} &nbsp</label>
                                    </td><td>
                                    <input id="active" type="radio"  name="sector_active" checked="checked" 
                                    <?php if($sector->sector_active==1) echo "checked";?>
                                    value="1">
                                    </td> <td style="width:20px;">
                                    </td><td>
                                    <label for="inactive" class="col-form-label text-md-righ">{{ __('Tắt') }}  &nbsp</label>
                                    </td><td>
                                    <input id="inactive" type="radio"  name="sector_active"
                                     <?php if($sector->sector_active==0) echo "checked";?>
                                     value="0"> 
                                     </td></table>

                                </div>
                            </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Lưu Lại') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section ('script')