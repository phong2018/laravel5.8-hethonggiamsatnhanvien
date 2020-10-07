@extends ('admin.layouts.index')

@section ('title')
<title>Thêm Phản ánh</title>
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

       <input hidden name='token' value="{{session('token')}}"/>     

           <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-org_id">
                  <span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn Đơn vị.">Chọn Đơn vị</span>
                </label>
                <select  name="filter_orgid" class="form-control{{ $errors->has('org_id') ? ' is-invalid' : '' }}">
                      <option value="0">Choose...</option>
                    @foreach($orgs as $orgg)
                    <option 
                    @if ($data['filter_orgid']==$orgg->org_id)
                    selected
                    @endif
                    value="{{$orgg->org_id}}">{{$orgg->org_name}}</option>
                    @endforeach 
                </select>
              </div>
            </div>

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-tinhtrangxuly_id">
                  <span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn Tình Trạng.">Chọn Tình trạng</span>
                </label>
                <select  name="filter_tinhtrangxuly_id" class="form-control">
                      <option value="0">Choose...</option>
                    @foreach($ttrang as $val)
                    <option 
                    @if ($data['filter_tinhtrangxuly_id']==$val->tinhtrangxuly_id)
                    selected
                    @endif
                    value="{{$val->tinhtrangxuly_id}}">{{$val->tinhtrangxuly_name}}</option>
                    @endforeach 
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-sector_id">
                  <span data-toggle="tooltip" data-container="" title="" data-original-title="Chọn Tình Trạng.">Chọn Lĩnh vực</span>
                </label>
                <select  name="filter_sector_id" class="form-control">
                      <option value="0">Choose...</option>
                    @foreach($sectors as $val)
                    <option 
                    @if ($data['filter_sector_id']==$val->ID_Sector)
                    selected
                    @endif
                    value="{{$val->ID_Sector}}">{{$val->sector_name}}</option>
                    @endforeach 
                </select>
              </div>
            </div>

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label "  for="input-ngay_xlpa">
                  <span data-toggle="tooltip" data-container="" title="" data-original-title="Thống kê theo ngày xử lý phản ánh (từ ngày-> đến ngày). Tick chọn để thống kê theo ngày xử lý phản ánh.">Ngày xử lý phản ánh</span>
                  <input type="checkbox" name="filter-input-ngay_xlpa" 
                 @if ( $data['filter-input-ngay_xlpa']==1)
               checked
               @endif
                value="1">    
              
                </label>
                <div class="col-md-12 padding0">
                <div class="col-md-6 col-sm-6 padding0" style='padding-right:10px; '>
        <input style='width:100%;font-size: 10px;' id="filter_ngay_xlpa_tungay" type="date" class="typedate" value="{{$data['filter_ngay_xlpa_tungay']}}" name="filter_ngay_xlpa_tungay" >
              </div>
              <div class="col-md-6  col-sm-6 padding0"  style='padding-right:10px;'>
        <input style='width:100%;font-size: 10px;' id="filter_ngay_xlpa_denngay" type="date" class="typedate" value="{{$data['filter_ngay_xlpa_denngay']}}" name="filter_ngay_xlpa_denngay" >
              </div>
              </div>
              </div>
            </div>
            
            <div class="col-sm-12 text-right">
        <div class="form-group">
           
          <table class='pull-right bordernone '>
             
            <tr><td style="padding-top:20px;"> 
            <button type="submit" id="button-filter" class="btn btn-primary"><i class="fa fa-search"></i>  Tìm kiếm</button> 
            </td> 
            <td style="padding-top:20px;">
            <button type="submit" name="xuatexcel" class="btn btn-primary">  <i style="" class="fa fa-file-excel-o" aria-hidden="true"></i> Xuất Excel</button> 
            </td>
            <td style="padding-top:20px;">
             &nbsp&nbsp &nbsp <a href="{{$data['action_create']}} " class="pull-right btn btn-primary">
            <span class="glyphicon glyphicon-plus-sign"></span> Thêm Mới
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
					<th scope="col">Nội dung</th>
          			<th scope="col">Ngày tạo</th>
                <th scope="col">Ngày xử lý</th>
                <th scope="col">Tình trạng</th>
                <th></th>
                <th scope="col">Lĩnh Vực</th>
                <th scope="col">Phường/ xã</th>
                <th scope="col">Người xử lý</th>
                <th scope="col">Người gửi</th>
					<th scope="col" class=' width1pt' >Hành động</th>
				</tr>
			</thead>
			<tbody>
				<?php $i = 1; ?>
				@foreach ($phananh as $pa)
				<tr>
					<td>{{ $i }}</td>
					<td>{{$pa->phananh_noidung}}</td>
    			<td>{{date('d-m-Y', strtotime($pa->createdat))}}</td>
          <td>{{date('d-m-Y', strtotime($pa->updatedat))}}</td>
          
    			<td>
            <?php 
            if($pa->tinhtrangxuly_id>0){
              echo $pa->tinhtrangxuly->tinhtrangxuly_name;
               
            }
            else echo "Chưa xem";
            ?>
    			</td>
          <td>
            <?php 
            if($pa->tinhtrangxuly_id>0){ 
              echo ' <i class="fa fa-flag"  style="color:'.$pa->tinhtrangxuly->tinhtrangxuly_color.';font-size:23px;"</i>';
            }
            else echo "Chưa xem";
            ?>
          </td>
          <td>
            <?php 
            if($pa->sector_id>0){
              echo $pa->sector->sector_name; 
            } 
            ?>
          </td>
          <td>
            <?php 
            if($pa->orglv1>0){
              echo $pa->organization->org_name; 
            } 
            ?>
          </td>
           <td>
            <?php 
            if($pa->updatedby>0){
              echo $pa->user->fullname; 
            } 
            ?>
          </td>
          <td>{{$pa->thongtinnguoigui}} </td>
					
					<td>
					<table class='iconaction'><td>
					<a data-original-title="Xem chi tiết" data-toggle="tooltip" class=' btn btn-success' href="{{Route('phananh.show',['phananh' => $pa->phananh_id])}}?token={{session('token')}}"><i class="fas fa-eye"></i></a></td><td>&nbsp&nbsp </td><td>
					<a data-original-title="Xử lý" data-toggle="tooltip" class=' btn btn-success' href="{{Route('phananh.edit',['phananh' => $pa->phananh_id])}}?token={{session('token')}}"><i class="fas fa-edit"></i></a></td><td>&nbsp&nbsp </td><td>
					<span data-original-title="Xóa" data-toggle="tooltip" class=' btn btn-danger' onclick="delObj('{{Route('phananh.destroy',['phananh' => $pa->phananh_id])}}?token={{session('token')}}')" ><i class="fa fa-trash-o " ></i></span></td></table>

 

					</td>
			</tr>
			<?php $i++; ?>
			@endforeach
		</tbody>
	</table>
	{{ $phananh->appends($data['addurl'])->render() }}
 

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
	var r = confirm('Bạn chắc chắn xóa phản ánh này?');
        if (r) {
        	$.ajaxSetup({headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }});
            $.ajax({
                url: urll,
                type: "DELETE",
                data: {},//'active' : id
                success:function (data) {//alert("YES");//alert(data['success']);
                	alert(data['success']);
                	window.location="{{$data['action_index']}}";
                },
                error:function () {//alert("NO");
                	  alert("Xóa Phản ánh thất bại ");
                    console.log("i cant's run. Please check bug!");
                }
            });
        }
}

 
</script>
@endsection