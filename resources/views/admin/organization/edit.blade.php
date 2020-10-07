    @extends ('admin.layouts.index')

    @section ('title')
    <title>Sửa Đơn vị</title>
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
                        
                        <form  action="{{$data['action_update']}}"   accept-charset="UTF-8" method="POST" enctype="multipart/form-data">    

                         {{ method_field('PUT') }}{{csrf_field()}}
 

                            <div class="form-group row">
                                <label for="org_name" class="col-md-2 col-form-label text-md-right">{{ __('Tên Đơn Vị') }}</label>

                                <div class="col-md-10">
                                    <input id="org_name" value="{{$org->org_name}}" type="text" class="form-control{{ $errors->has('org_name') ? ' is-invalid' : '' }}" name="org_name" required>

                                    @if ($errors->has('org_name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('org_name') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-org_image">Hình đại diện</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                      <input type="button" id="lfmorg_image" data-input="thumbnailorg_image" data-preview="holderorg_image" value="Upload">
                                      <input type="hidden" id="thumbnailorg_image" class="form-control" value="{{$org->org_image}}" type="text" name="org_image">
                                  </div>
                                  <img id="holderorg_image" src="{{url('/')}}/public{{$org->org_image}}" style="max-height:100px;padding:15px 0px 15px 0px">
                                </div>
                              </div>



                            <div class="form-group row">
                                <label for="role" class="col-md-2 col-form-label text-md-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Có 3 Cấp bậc: 1,2">Cấp Bậc <i class="fa fa-question-circle"></i></span></label>

                                <div class="col-md-10">
                                    <select id="org_level" onchange="Ajax_getAssigned_Parent(this.value)"  name="org_level"  class="form-control"  required>
                                        <option value="">Choose...</option> 
                                        <?php 
                                        $tengoi=array();    
                                        $tengoi[2]='Cấp 2';    
                                        $tengoi[1]='Cấp 1'; 


                                        if($data['lvus']==1 ) {$tu=2;$toi=1;}
                                        else 
                                            if($org->org_level==2)
                                            {$tu=2;$toi=2;}
                                            else {$tu=1;$toi=1;}

                                        for ($x = $tu; $x>=$toi; $x--) { ?>
                                            <option  value="{{$x}}"
                                                @if ($org->org_level==$x)
                                                selected
                                                @endif
                                            > {{$tengoi[$x]}}
                                            </option>
                                        <?php }?>
                                        
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group row plghidden">
                                <label for="assign" class="col-md-2 col-form-label text-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Người Quản lý.">Người Quản lý <i class="fa fa-question-circle"></i></span></label>
                                <div class="col-md-10">
                                <select id="org_idAssigned" name="org_idAssigned" class="form-control" > 
                                    <option value='' >Choose...</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Parent" class="col-md-2 col-form-label text-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Đơn vị cấp trên.">Đơn vị cấp trên <i class="fa fa-question-circle"></i></span></label>
                                <div class="col-md-10">
                                <select id="org_idParent" name="org_idParent" class="form-control">
                                    <option value='' >Choose...</option>
                                </select>
                                </div>
                            </div>
                             
                            @if($data['lvus']==1)
                            <div class="form-group row plghidden">
                                 <label for="org_chudebatbuoc" class="col-md-2 col-form-label text-right">{{ __('Bắt buộc chọn chủ đề này để khảo sát') }}</label>
                                <div class="col-md-10">
                                    <table class='borderchinone'><td>
                                    <label for="active" class="col-form-label text-md-righ">{{ __('Bật') }} &nbsp</label>
                                    </td><td>
                                    <input id="active" type="radio"  name="org_chudebatbuoc" 
                                    <?php if($org->org_chudebatbuoc==1) echo "checked";?>
                                     value="1">
                                    </td> <td style="width:20px;">
                                    </td><td>
                                    <label for="inactive" class="col-form-label text-md-righ">{{ __('Tắt') }}  &nbsp</label>
                                    </td><td>
                                    <input id="inactive" type="radio"  name="org_chudebatbuoc" 
                                    <?php if($org->org_chudebatbuoc==0) echo "checked";?>
                                    value="0"> 
                                     </td></table>

                                </div>
                            </div>
                            @endif

                            <div class="form-group row">
                                <label for="org_address" class="col-md-2 col-form-label text-md-right">{{ __('Địa chỉ') }}</label>

                                <div class="col-md-10">
                                    <input id="org_address" value="{{$org->org_address}}"  type="text" class="form-control{{ $errors->has('org_address') ? ' is-invalid' : '' }}" name="org_address" required>

                                    @if ($errors->has('org_address'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('org_address') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="org_phone" class="col-md-2 col-form-label text-md-right">{{ __('Điện thoại') }}</label>

                                <div class="col-md-10">
                                    <input id="org_phone" value="{{$org->org_phone}}"  type="number" class="form-control{{ $errors->has('org_phone') ? ' is-invalid' : '' }}" name="org_phone" required>

                                    @if ($errors->has('org_phone'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('org_phone') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="org_order" class="col-md-2 col-form-label text-md-right">{{ __('Thứ tự') }}</label>

                                <div class="col-md-10">
                                    <input id="org_order" value="{{$org->org_order}}"  type="number" class="form-control{{ $errors->has('org_order') ? ' is-invalid' : '' }}" name="org_order" required>

                                    @if ($errors->has('org_order'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('org_order') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row plghidden">
                                <label for="org_isSelectEmp" class="col-md-2 col-form-label text-right"><span data-toggle="tooltip" data-container="" title="" data-original-title="Người dân phải chọn nhân viên để tiến hành khảo sát. Dành cho Chủ đề khảo sát đối với cá nhân">{{ __('Người dân phải Chọn nhân viên khảo sát') }} <i class="fa fa-question-circle"></i></span></label>
                                <div class="col-md-10">
                                    <table class='borderchinone'><td>
                                    <label for="active" class="col-form-label text-md-righ">{{ __('Bật') }} &nbsp</label>
                                    </td><td>
                                    <input  id="activeorg_isSelectEmp"  type="radio"  name="org_isSelectEmp" 
                                    <?php if($org->org_isSelectEmp==1) echo "checked";?>
                                     value="1">
                                    </td> <td style="width:20px;">
                                    </td><td>
                                    <label for="inactive" class="col-form-label text-md-righ">{{ __('Tắt') }}  &nbsp</label>
                                    </td><td>
                                    <input  id="inactiveorg_isSelectEmp"  type="radio"  name="org_isSelectEmp" 
                                    <?php if($org->org_isSelectEmp==0) echo "checked";?>
                                    value="0"> 
                                     </td></table>

                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="org_isActived" class="col-md-2 col-form-label text-right">{{ __('Trạng Thái') }}</label>
                                <div class="col-md-10">
                                    <table class='borderchinone'><td>
                                    <label for="active" class="col-form-label text-md-righ">{{ __('Bật') }} &nbsp</label>
                                    </td><td>
                                    <input id="active" type="radio"  name="org_isActived" 
                                    <?php if($org->org_isActived==1) echo "checked";?>
                                     value="1">
                                    </td> <td style="width:20px;">
                                    </td><td>
                                    <label for="inactive" class="col-form-label text-md-righ">{{ __('Tắt') }}  &nbsp</label>
                                    </td><td>
                                    <input id="inactive" type="radio"  name="org_isActived" 
                                    <?php if($org->org_isActived==0) echo "checked";?>
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
 <script src="{{url('/')}}/public/vendor/laravel-filemanager/js/lfm.js"></script>
    <script>
        var options = {prefix:"{{url('/public/')}}"} 
        $('#lfmorg_image').filemanager('image',options); 
    </script> 

    <script>

    /*hàm lấy thủ tục từ lĩnh vực*/
    function Ajax_getAssigned_Parent(level){ 
        /*kiểm tra nếu cấp bậc !=1 thì ko cho chọn chủ đề*/
        if(level>1){
             
            document.getElementById("org_idParent").disabled = false;
        }
        else{
             
            document.getElementById("org_idParent").disabled = true;
        }



        //-----
        if(level>0){
            $.ajaxSetup({headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }});
            var urll="{{ url('admin/ajax/Organization_getAssigned_Parent') }}/"+level+'?token={{session('token')}}';//alert(urll);
            $.ajax({
            url: urll,
            type: 'GET', 
            dataType: "JSON",
            data: {},
            success: function (response){//alert('YES');
                $("#org_idAssigned").empty(); 
                $("#org_idAssigned").append("<option value=''>Choose...</option>");
                var val=response['assigned'];//alert(assigned.length);
                <?php 
                    if(!isset($org->org_idAssigned)) $org->org_idAssigned=0;
                ?>
                if(val.length>0)
                for(i=0;i<val.length;i++){
                if(val[i]['id']=={{$org->org_idAssigned}})
                $("#org_idAssigned").append("<option selected  value="+val[i]['id']+">"+val[i]['fullname']+"</option>");
                else
                $("#org_idAssigned").append("<option value="+val[i]['id']+">"+val[i]['fullname']+"</option>"); 
                }
                //======
                $("#org_idParent").empty(); 
                $("#org_idParent").append("<option value=''>Choose...</option>");
                var val=response['org'];
                for(i=0;i<val.length;i++){
                if(val[i]['org_id']=={{$org->org_idParent}})
                $("#org_idParent").append("<option selected value="+val[i]['org_id']+">"+val[i]['org_name']+"</option>");
                else 
                $("#org_idParent").append("<option value="+val[i]['org_id']+">"+val[i]['org_name']+"</option>");
                }
            },
            error: function(xhr) {
            alert('NO');
            console.log(xhr.responseText);  
            }
            });
        }
        <?php
        if($data['lvus']>1 && $org->org_chudebatbuoc==1)  {
            //echo 'alert(9);';
            echo 'document.getElementById("org_topic_id").disabled = true;';
        }
        ?>
    }
    //---------
    Ajax_getAssigned_Parent({{$org->org_level}});
    </script>

    @endsection

    @section ('script')