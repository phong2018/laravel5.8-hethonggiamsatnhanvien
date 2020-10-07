<?php
use Illuminate\Support\Facades\URL;
?>
@extends ('admin.layouts.index')

@section ('title')
<title>danh sách các menu được quản lý tại website</title>
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
        <a href="{{ $data['action_create']}} " class="pull-right btn btn-primary pull-right">
		<span class="glyphicon glyphicon-plus-sign"></span> Thêm Mới
		</a>
    </div>
  </div>
	<div class="col-md-12 col-lg-12 col-xs-12">
		 
		
 



		<table class="table panel panel-default">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Tên</th>
			<th scope="col">Ghi chú</th>
			<th scope="col">Trạng Thái</th>
			
			<th scope="col">Hiển Thị Ra Menu</th>
			<th scope="col">Thứ Tự</th>
			<th scope="col" class='plghidden'>Tuyến</th>

			<!-- <th scope="col">Status</th>
			<th scope="col">Recived Date</th>
			<th scope="col">Return Date</th> -->
			<th scope="col" class='width1pt'>Hành động </th>
		</tr>
	</thead>
	<tbody>
		<?php $i = 1; ?>
		@foreach ($menu as $menus)
		<tr>
			<td>{{ $i }}</td>
			<td>{{$menus->menu_name}}</td>
			<td>{{$menus->menu_note}}</td>
			<td><?php
				if ($menus->menu_active == '1') { ?>
					<img style="cursor:pointer;"   src="{{url('/')}}/public/dakichhoat.png"/>

				<?php }else{ ?>
					<img style="cursor:pointer;"   src="{{url('/')}}/public/chuakichhoat.png"/>
				<?php } ?>
			</td>
			
			<td><?php
				if ($menus->menu_show == '1') { ?>
					Hiện
				<?php }else{ ?>
					Ẩn
				<?php } ?>
			</td>

			<td>{{$menus->menu_order}}</td>
			<td  class='plghidden'>{{$menus->menu_routename}}</td>
			
			<td>

				<table class='iconaction'><td>
					<a data-original-title="Sửa Chức Vụ" data-toggle="tooltip" class=' btn btn-success' href="{{Route('menu.edit',['menu' => $menus->ID_Menu])}}?token={{session('token')}}"><i class="fas fa-edit"></i></a></td><td>&nbsp&nbsp </td><td>
					<span data-original-title="Xóa Chức vụ" data-toggle="tooltip" class=' btn btn-danger' onclick="delObj('{{Route('menu.destroy',['menu' => $menus->ID_Menu])}}?token={{session('token')}}')" ><i class="fa fa-trash-o " ></i></span></td></table>


 
			</td>
		</tr>
		<?php $i++; ?>
		@endforeach
	</tbody>
</table>
{{ $menu->render() }}
	</div>
</div>
</div>
@endsection

@section ('script')
<script>
/*$(document).ready(function() {
    $('#example').DataTable();
});*/
function delObj(urll){
	var r = confirm('Bạn chắc chắn xóa Menu này?');
        if (r) {
        	$.ajaxSetup({headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }});
            $.ajax({
                url: urll,
                type: "DELETE",
                data: {},//'active' : id
                success:function (data) {//alert("YES");//alert(data['success']);
                	alert("Xóa Menu thành công ");
                	window.location="{{$data['action_index']}}";
                },
                error:function () {//alert("NO");
                	alert("Xóa Menu thất bại ");
                    console.log("i cant's run. Please check bug!");
                }
            });
        }
} 
</script>
@endsection