@extends ('frontend.layouts.index')

@section ('title')
<title>{{$data['title']}}</title>
@endsection
@section ('style')

@section ('content')



<div class="col-md-12 col-xs-12 col-lg-12">
<div class="row"> 
    <div class="container" style="padding:0px;">

  @if(session('messenger'))
  <span class='plgalertsuccess'>
   <div class="alert alert-success"><i class="fa fa-check-circle"></i>    
  {{session('messenger')}}   <button type="button" class="close" data-dismiss="alert">×</button>
    </div>
  </span>
  @endif

      @if (isset($data['title']))
      <h1 class='plghidden'>{{$data['title']}}</h1>
      @endif  
      @if(isset($data['breadcrumbs']))
      <ul class="breadcrumb plghidden">
        <?php foreach ($data['breadcrumbs'] as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
        @endif
    </div>
  </div>
  </div>
        <div class="col-md-12 col-xs-12 col-lg-12">
        <div class="row"> 
            <div class="container card">
                
                @if(count($errors) > 0)
                @foreach($errors->all() as $err)
                <div class="alert alert-danger plghidden">{{$err}}</div>
                @endforeach
                @endif

                <div class="card-body">
                    <form  action="{{$data['action_store']}}" accept-charset="UTF-8" method="POST" enctype="multipart/form-data">
                        @csrf

                         <table style="width:100%">

                        <div class="form-group row">
                            <label for="phananh_noidung" class="plghidden hidden-xs hidden-sm  col-md-2 col-form-label text-md-right">Nội dung phản ánh
                            <span class="invalid-feedback" role="alert">*</span>
                            </label>

                            <div style="width:100%">
                                <tr><td><i class="fa fa-pencil-square-o iconinput"></i></td><td>
                                <textarea placeholder='Nội dung phản ánh'  style='height: 120px' id="phananh_noidung" type="text" class="mainLoginInput form-control{{ $errors->has('phananh_noidung') ? ' is-invalid' : '' }}" name="phananh_noidung" required></textarea>

                                @if ($errors->has('phananh_noidung'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('phananh_noidung') }}</strong>
                                </span>
                                @endif
                                </td></tr>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="phananh_hinhanh" class="plghidden  hidden-xs hidden-sm   col-md-2 col-form-label text-md-right">{{ __('Chọn hình ảnh/video') }}
                            <span class="invalid-feedback" role="alert">*</span>
                            </label>

                            <div style="width:100%" id='khungchonanh' > 
                                <tr><td colspan="2">
                                
                                <table style="width:100%;margin-top: 5px;"><td class='tdchonanh'>
                                <input 
                                accept="image/*;capture=camera"
                                id="phananh_hinhanh1" type="file" style="padding-left: 0px" class="plghidden col-md-4 {{ $errors->has('phananh_hinhanh') ? ' is-invalid' : '' }}" name="phananh_hinhanh1" required>
                                <img onclick="chonanh_video('phananh_hinhanh1')" class='hinhanhchon plghidden' src="{{url('/')}}/public/chonanh.png"/>

                                <img onclick="chonanh_video('phananh_hinhanh1')" style=" " src="{{url('/')}}/public/chonanh.gif" id="hinhanh1_show" src="#" alt="your image" class='hinhanhhien' />


                                </td>
                                
                                <td  class='tdchonanh'>
                                <input

                                accept="image/*;capture=camera"
                                 id="phananh_hinhanh2" type="file" style="padding-left: 0px" class="plghidden col-md-4 {{ $errors->has('phananh_hinhanh') ? ' is-invalid' : '' }}" name="phananh_hinhanh2">
                                <img onclick="chonanh_video('phananh_hinhanh2')" class='hinhanhchon  plghidden' src="{{url('/')}}/public/chonanh.png"/>
                                 <img onclick="chonanh_video('phananh_hinhanh2')" style=" "  id="hinhanh2_show"  src="{{url('/')}}/public/chonanh.gif"  alt="your image"  class='hinhanhhien'  />
                                </td>

                                <td  class='tdchonanh'>
                                <input 
                                accept="image/*;capture=camera"
                                id="phananh_hinhanh3" type="file" style="padding-left: 0px" class="plghidden col-md-4 {{ $errors->has('phananh_hinhanh') ? ' is-invalid' : '' }}" name="phananh_hinhanh3">
                                <img onclick="chonanh_video('phananh_hinhanh3')"  class='hinhanhchon  plghidden' src="{{url('/')}}/public/chonanh.png"/>

                                 <img onclick="chonanh_video('phananh_hinhanh3')"  style=" "  id="hinhanh3_show" src="{{url('/')}}/public/chonanh.gif" src="#" alt="your image" class='hinhanhhien'  />

                                </td>

                                <td  class='tdchonanh'>
                                <input 
                                accept="video/*;capture=camcorder"
                                id="phananh_video" type="file" style="padding-left: 0px" class="plghidden col-md-4 {{ $errors->has('phananh_video') ? ' is-invalid' : '' }}" name="phananh_video">

                                <img onclick="chonanh_video('phananh_video')" id='video_imgchon' class='hinhanhhien' src="{{url('/')}}/public/chonvideo.gif"/>

                                <video   id="video_show" style="width:100%" class='hinhanhhienvideo plghidden'  controls>
                                  <source  src="#" type="video/mp4"> 
                                </video>

                                <img onclick="chonanh_video('phananh_video')" id='video_imgchonlai' style="width:100%" class='plghidden' src="{{url('/')}}/public/chonlai.png"/>
                              
                                </td>
                                </table>
                                </td></tr>
                                <script> 

                                    

                                var widthimg=$("#khungchonanh").width()/4-$( window ).width()/80;

                                $('.hinhanhhienvideo').css({"border-radius": "50%","height":widthimg});
                                $('.hinhanhhien').css({"border-radius": "50%","height":widthimg});
                                //===========
                                function chonanh_video(id){
                                    
                                    document.getElementById(id).click();
                                }

               
 

                                //===========
                                function readURL(input,idhienthi,idinput) { 
                                    if (input.files && input.files[0]) {
                                        if( input.files[0].size<={{$data['config_gs_imgsize_allow']*1000000}}){
                                            var reader = new FileReader();
                                            reader.onload = function (e) {
                                                $(idhienthi).attr('src', e.target.result);
                                            }
                                            reader.readAsDataURL(input.files[0]);
                                            $(idinput).val(input.files[0]);
                                        }else{

                                            Swal.fire("File hình ảnh vượt dung lượng {{$data['config_gs_imgsize_allow']}}MB");
                                        }
                                    }
                                }
                                function readURL_video(input,idhienthi,idinput) {
                                    if (input.files && input.files[0]) {
                                        if(input.files[0].size<={{$data['config_gs_videosize_allow']*1000000}}){
                                             
                                             $("#video_imgchon").addClass("plghidden");
                                             $("#video_show").removeClass("plghidden");
                                             //$("#video_imgchonlai").removeClass("plghidden");

                                            var reader = new FileReader();
                                            reader.onload = function (e) {
                                                $(idhienthi).attr('src', e.target.result);
                                            }
                                            reader.readAsDataURL(input.files[0]);
                                            $(idinput).val(input.files[0]);

                                            
                                            

                                        }else{
                                             Swal.fire("File video vượt dung lượng {{$data['config_gs_videosize_allow']}}MB");
 
                                        } 
                                    }
                                }

                                //===========
                                $("#phananh_hinhanh1").change(function(){ 
                                    readURL(this,'#hinhanh1_show','#phananh_hinhanh1');
                                });
                                $("#phananh_hinhanh2").change(function(){ 
                                    readURL(this,'#hinhanh2_show','#phananh_hinhanh2');
                                });
                                $("#phananh_hinhanh3").change(function(){ 
                                    readURL(this,'#hinhanh3_show','#phananh_hinhanh3');
                                });

                                $("#phananh_video").change(function(){ 
                                    readURL_video(this,'#video_show','#phananh_video');
                                });

                                
                                </script>
 
                            </div>
                        </div>
                       
                        <div class="form-group row">
                            <label for="role" class="plghidden  hidden-xs hidden-sm col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Tại phường/xã">Chọn Phường / Xã</span></label>
                            <div style="width:100%">
                                <tr>
                                <td>
                                    <i class="fa fa-cubes iconinput"></i>
                                </td>
                                <td>
                                <select id="orglv1" name="orglv1"  class="mainLoginInput form-control"  required>
                                    <option value=""  ><span class="chuarial">Chọn Phường/xã</span></option> 
                                    <?php foreach($data['orgs'] as $val) { ?>
                                        <option  value="{{$val->org_id}}">{{$val->org_name}}
                                        </option>
                                    <?php }?>
                                    
                                </select>
                                </td></tr>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label for="role" class=" plghidden  hidden-xs hidden-sm col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn lĩnh vực">Chọn lĩnh vực</span></label>

                            <div style="width:100%">
                                <tr><td><i class="fa fa-database iconinput"></i> </td><td>
                                <select id="ID_Sector" name="ID_Sector"  class="mainLoginInput form-control"  required>
                                    <option value="">Chọn lĩnh vực</option> 
                                    <?php foreach($data['secs'] as $val) { ?>
                                        <option  value="{{$val->ID_Sector}}">{{$val->sector_name}}
                                        </option>
                                    <?php }?>
                                    
                                </select>
                                </td></tr>
                            </div>
                        </div>
            

                        

                        <div class="form-group row">
                            <label for="thongtinnguoigui" class="plghidden hidden-xs hidden-sm  col-md-2 col-form-label text-md-right">{{ __('Thông tin người gửi (tùy chọn)') }}
                            <span class="invalid-feedback" role="alert">*</span>
                            </label>

                            <div style="width:100%">
                                <tr><td><i class="fa fa-address-book-o iconinput"></i></td><td>
                                <textarea placeholder="Thông tin người gửi (tùy chọn)" id="thongtinnguoigui" class="mainLoginInput form-control{{ $errors->has('thongtinnguoigui') ? ' is-invalid' : '' }}" name="thongtinnguoigui"></textarea>

                                @if ($errors->has('thongtinnguoigui'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('thongtinnguoigui') }}</strong>
                                </span>
                                @endif
                                </td></tr>
                            </div>
                        </div>

                        </table>
                      

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-2">
                                <button type="submit" class="btn btn-danger">
                                    {{ __('Gửi Đi') }}
                                </button>
                                &nbsp 
               
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
<style>
.btn-danger{
    margin-top: 10px;
}
.tdchonanh{
    width:25%;
    padding:3px;
    padding-top: 0px;
    padding-bottom: 0px;
    vertical-align: top;
}

.hinhanhchon{
    padding-top:0px; 
    max-width: 100px;

}
.hinhanhhien{
    margin-top: 5px;
    width:100%;
}
.card-body{
    padding:10px 0px 10px 0px;
}
.hinhanhhienvideo{
    margin-top: 5px;
    width:100%;
}
.form-group {
    margin-bottom: 0rem;
}
.pt-4, .py-4 {
    padding-top: 0rem!important;
}
.form-control {
    height: 29px; 
    margin-top: 5px;
}
.navbar {
    min-height: 50px;
    margin-bottom: 5px;
}
#thongtinnguoigui{
    height: 70px;
}
@media (min-width: 768px){
    .hinhanhchon{padding-top:15px;}
    
}




.mainLoginInput::-webkit-input-placeholder { 
font-family: Arial;
font-weight: normal;
overflow: visible;
vertical-align: top;
display: inline-block !important; 
}

.mainLoginInput::-moz-placeholder  { 
font-family: Arial; 
overflow: visible;
vertical-align: top;
display: inline-block !important; 
}

.mainLoginInput:-ms-input-placeholder  { 
font-family: Arial; 
overflow: visible;
vertical-align: top;
display: inline-block !important; 
}

.chuarial{
    font-family: Arial;
}
.mainLoginInput{ 
    font-family: Arial;
    border: 3px solid white;
}

</style>
@endsection

@section ('script')