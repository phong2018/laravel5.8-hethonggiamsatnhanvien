@extends ('admin.layouts.index')

@section ('title')
<title>danh sách Nhân Viên Đơn vị - Xã</title>
@endsection
@section ('style')
<style type="text/css">
	.btn_delObj{
		color: #3490dc;
	}
	.btn_delObj:hover{
		cursor: pointer;
		color: #1D68A7;
	}
</style>
@endsection

@section ('content')
@if(session('messenger'))
  <span class='plgalertsuccess'>
   <div class="alert alert-success"><i class="fa fa-check-circle"></i>    
  {{session('messenger')}}   <button type="button" class="close" data-dismiss="alert">×</button>
    </div>
  </span>
  @endif
  
  
<div class='container'>
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
	<div class="col-md-12 col-lg-12 col-xs-12">
		 
 <form method="GET" action="{{$data['action_index']}}" enctype="multipart/form-data" style="padding-bottom: 10px;">      

           <div class="col-sm-8">
              <div class="form-group">
                <label class="control-label" for="input-org_id">
                  <span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn Đơn vị.">Chọn Đơn vị</span>
                </label>
                <input hidden name='token' value="{{session('token')}}"/>
                
                <select  name="filter_orgid" class="form-control{{ $errors->has('org_id') ? ' is-invalid' : '' }}">
                      <option value="0">Choose...</option>
                    @foreach($org as $orgg)

                      <option 
 					
 					@if ($data['filter_orgid']==$orgg->org_id)
                    selected
                    @endif

                      value="{{$orgg->org_id}}">{{$orgg->org_name}}</option>
                  
                    @endforeach 
 	 
                    
                   
                </select>
              </div>
            </div>
            
            <div class="col-sm-4 text-right">
				<div class="form-group">
					 
					<table class='pull-right bordernone '>
						 
						<tr><td style="padding-top:20px;"> 
						<button type="submit" id="button-filter" class="btn btn-primary"><i class="fa fa-search"></i>  Tìm kiếm</button> 
						</td> 
						<td  style="padding-top:20px;">
							 <a href="{{$data['action_create']}} " class="pull-right btn btn-primary">
		<span class="glyphicon glyphicon-plus-sign"></span>Thêm Mới
		</a>
						</td>
					</tr>
					</table>
					<br><br> 
				</div>
			</div>
           
          </form> 

		<table class="table panel panel-default">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Tên</th>
			<th scope="col">Giới Tính</th>
			<th scope="col">Sđt</th>
			<th scope="col">Email</th>
			<th scope="col">Chức Vụ</th>
			<th scope="col">Vai trò</th>
			<th scope="col">Trạng Thái</th>
			<th scope="col">Hành động </th>
		</tr>
	</thead>
	<tbody>
		<?php $i = 1; ?>
		@foreach ($users as $user)
		<tr>
			<td>{{ $i }}</td>
			<td>{{$user->fullname}}</td>
			<td>{{$user->sex == 1 ? "Male" : "Female" }}</td>
			<td>{{"0".$user->phone}}</td>
			<td>{{$user->email}}</td>
			<td>
			<?php
			if($data['usedb']==0) echo $user->Position->pos_name;
			else echo $user->pos_name;
			?>	
			</td>
			<td>
			<?php
			if($data['usedb']==0) echo $user->Role->role_name;
			else echo $user->role_name;
			?>	
			</td>

			<td><?php
				if ($user->isActived == '1') { ?>
					 
					<img style="cursor:pointer;" id="change" onclick="changeActive({{$user->id}})" src="{{url('/')}}/public/dakichhoat.png"/>
				<?php }else{ ?>
					 
					<img style="cursor:pointer;"   id="change" onclick="changeActive({{$user->id}})" src="{{url('/')}}/public/chuakichhoat.png"/>
				<?php } ?>
			</td>
			<td>

				<table class='iconaction'>


					<td>
					<a data-original-title="Sửa Thông tin người dùng" data-toggle="tooltip" class=' btn btn-success' href="{{Route('user.edit',['user' => $user->id])}}?token={{session('token')}}"><i class="fas fa-edit"></i></a></td>
					<td>&nbsp </td>
					<td>
					<a data-original-title="Sao chép Tài khoản" data-toggle="tooltip" class=" btn btn-success" href="{{Route('user.copy',['user' => $user->id])}}?token={{session('token')}}"><i style="padding-top: 5px;font-size: 16px;" class="fa fa-plus-square-o"></i></a></td>
					<td>
					<span data-original-title="Xóa Chức vụ" data-toggle="tooltip" class=' btn btn-danger' onclick="delObj('{{Route('user.destroy',['user' => $user->id])}}?token={{session('token')}}')" ><i class="fa fa-trash-o " ></i></span></td>
				</table>

 
			</td>
		</tr>
		<?php $i++; ?>
		@endforeach
	</tbody>
</table>
 
<?php  
echo $users->appends($data['addurl'])->render();
?>
 
	</div>
</div>
</div>
@endsection

@section ('script')
<script>
function delObj(urll){
	var r = confirm('Bạn chắc chắn xóa Tài khoản này?');
        if (r) {
        	$.ajaxSetup({headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }});
            $.ajax({
                url: urll,
                type: "DELETE",
                data: {},//'active' : id
                success:function (data) {//alert("YES");//alert(data['success']);
                	alert("Xóa Tài khoản thành công ");
                	window.location="{{$data['action_index']}}";
                },
                error:function () {//alert("NO");
                	alert("Xóa Tài khoản thất bại ");
                    console.log("i cant's run. Please check bug!");
                }
            });
        }
}
</script>

<script>
 

 

function changeActive(id){
    $.ajaxSetup({headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }});

    if (!confirm("Bạn có chắc thay đổi trạng thái của User này?")) {
        //.......
    } else {
     
    $.ajax({
        url: "user/changeactive/"+id,
        type: 'GET', 
        dataType: "JSON",
        data: {
            "id": id
        },
        success: function (response)
        {
            //alert('YES');
            window.location.href = "{{ URL::to('admin/user') }}";
        },
        error: function(xhr) {
            //alert('NO');
            console.log(xhr.responseText);  
       }
    });
    }
}

</script>
@endsection