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

                        

                        <div class="form-group row">
                            <label for="xulyphananh_noidung" class="col-md-2 col-form-label text-md-right">{{ __('Nội dung xử lý') }}
                            
                            </label>

                            <div class="col-md-10">
                                    <table class="table panel panel-default">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                
                                                <th scope="col">Tình trạng xử lý</th>
                                                <th scope="col">Nội dung</th>
                                                <th scope="col">Người xử lý</th>
                                                <th scope="col">Ngày xử lý</th>
                                                <th scope="col" class=' width1pt' >Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $i = 1; ?>
                                            @foreach ($data['xl_phananh'] as $xlpa)
                                            <tr>
                                                <td>{{ $i }}</td>
                                                <td>
                                                <?php  
                                                  echo $xlpa->tinhtrangxuly->tinhtrangxuly_name;
                                                  echo '&nbsp <i class="fa fa-flag"  style="color:'.$xlpa->tinhtrangxuly->tinhtrangxuly_color.';font-size:23px;"</i>';
                                            
                                                ?>
                                                </td>
                                                <td>{{$xlpa->xulyphananh_noidung}}</td>
                                                <td>
                                                <?php
                                                     if($xlpa->createdby>0)
                                                     echo $xlpa->nguoixuly->fullname;
                                                ?>
                                                </td>
                                                
                                                <td>{{date('d-m-Y  H:i:s', strtotime($xlpa->createdat))}}</td>
                                            
                                                
                                                <td>
                                                <table class='iconaction'>  <td class='plghidden'>
                                                <a data-original-title="Cập nhật" data-toggle="tooltip" class=' btn btn-success' href="{{Route('phananh.edit',['phananh' => $xlpa->phananh_id])}}?token={{session('token')}}"><i class="fas fa-edit"></i></a></td><td>&nbsp&nbsp </td><td>
                                                <span data-original-title="Xóa" data-toggle="tooltip" class=' btn btn-danger' onclick="delObj('{{Route('phananh.destroy',['phananh' => $xlpa->phananh_id])}}?token={{session('token')}}')" ><i class="fa fa-trash-o " ></i></span></td></table>

                             

                                                </td>
                                        </tr>
                                        <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                    </table>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phananh_noidung" class="col-md-2 col-form-label text-md-right">{{ __('Thông tin người gửi') }}
                            <span class="invalid-feedback" role="alert"></span>
                            </label>

                            <div class="col-md-10" style="padding-top: 9px;">
                                <p>{{$phananh->thongtinnguoigui}}</p>
       
                            </div>
                        </div>
 
                        <div class="form-group row">
                            <label for="phananh_noidung" class="col-md-2 col-form-label text-md-right">{{ __('Nội dung phản ánh') }}
                            <span class="invalid-feedback" role="alert"></span>
                            </label>

                            <div class="col-md-10"  style="padding-top: 9px;" id='khungchoanhvideo' >
                                <p>{{$phananh->phananh_noidung}}</p>
                                <table class='thumbphananh'  >
                                <?php
                                foreach($data['imgs'] as $val)
                                if($val){
                                    echo "<td style='vertical-align:top;'><a target='_blank' href='".url('/')."/public".$val."' ><img class='heightchange hinhanhhienimgavideo'  style='height:200px;' src='".url('/')."/public".$val."'/></a></td>";
                                }
                                ?> 
                    
                                <?php
                                foreach($data['vids'] as $val)
                                if($val){
                                    echo "<td><video  class='heightchange hinhanhhienimgavideo' style='width:100%;height:200px;' controls > <source  src='".url('/')."/public".$val."' type='video/mp4' /></video></td>";
                                }
                                ?>
                                </table>
                            </div>
                        </div>

                      

                        

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                               
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
 

<script>
  //$("p").css("background-color");
  //$(".hinhanhhienimgavideo").css({"height":200});

</script>

@section ('script')