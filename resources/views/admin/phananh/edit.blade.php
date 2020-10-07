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
                            <label for="phananh_noidung" class="col-md-2 col-form-label text-md-right">{{ __('Nội dung phản ánh') }}
                            <span class="invalid-feedback" role="alert"></span>
                            </label>

                            <div class="col-md-10">
                                <p>{{$phananh->phananh_noidung}}</p>
                                <table class='thumbphananh'  >
                                <?php
                                foreach($data['imgs'] as $val)
                                if($val){
                                    echo "<td  style='vertical-align:top;><a target='_blank' href='".url('/')."/public".$val."' ><img   style='height:200px;' src='".url('/')."/public".$val."'/></a></td>";
                                }
                                ?> 
                    
                                <?php
                                foreach($data['vids'] as $val)
                                if($val){
                                    echo "<td><video style='width:100%;height:200px;' controls > <source  src='".url('/')."/public".$val."' type='video/mp4' /></video></td>";
                                }
                                ?>
                                </table>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="role" class="col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Tại phường/xã">Tại Phường / Xã</span></label>

                            <div class="col-md-10">
                                <select id="orglv1" name="orglv1"  class="form-control"  required>
                                    <option value="">Choose...</option> 
                                    <?php foreach($data['orgs'] as $val) { ?>
                                        <option  value="{{$val->org_id}}"
                                        <?php if($phananh->orglv1==$val->org_id) echo "selected";?>
                                        >{{$val->org_name}}
                                        </option>
                                    <?php }?>
                                    
                                </select>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label for="role" class="col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn lĩnh vực">Chọn lĩnh vực</span></label>

                            <div class="col-md-10">
                                <select id="ID_Sector" name="ID_Sector"  class="form-control"  required>
                                    <option value="">Choose...</option> 
                                    <?php foreach($data['secs'] as $val) { ?>
                                        <option  value="{{$val->ID_Sector}}"
                                            <?php if($phananh->sector_id==$val->ID_Sector) echo "selected";?>
                                            >{{$val->sector_name}}
                                        </option>
                                    <?php }?>
                                    
                                </select>
                            </div>
                        </div> 

                         <div class="form-group row">
                            <label for="role" class="col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Có 3 Cấp bậc: 1,2">Tình trạng xử lý  </span></label>

                            <div class="col-md-10">
                                <select id="tinhtrangxuly_id" name="tinhtrangxuly_id"  class="form-control"  required>
                                    <option value="">Choose...</option> 
                                    <?php foreach($ttrang as $val) { ?>
                                        <option  value="{{$val->tinhtrangxuly_id}}">{{$val->tinhtrangxuly_name}}
                                        </option>
                                    <?php }?>
                                    
                                </select>
                            </div>
                        </div> 

                        <div class="form-group row">
                            <label for="xulyphananh_noidung" class="col-md-2 col-form-label text-md-right">{{ __('Nội dung xử lý') }}
                            <span class="invalid-feedback" role="alert"></span>
                            </label>

                            <div class="col-md-10">
                                <textarea  id="xulyphananh_noidung" type="text" class="form-control{{ $errors->has('xulyphananh_noidung') ? ' is-invalid' : '' }}" name="xulyphananh_noidung" required></textarea> 

                                @if ($errors->has('xulyphananh_noidung'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('xulyphananh_noidung') }}</strong>
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
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section ('script')