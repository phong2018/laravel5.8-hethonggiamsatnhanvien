<?php
/*
- Admin có toàn quyền truy cập
- Có các role như:
+ Lãnh đạo có quyền dựa theo middleware
+ Giám sát có quyền dựa theo middleware
+ Nhân vien có quyền theo middleware
+ Khách hàng có quyền theo middleware
*/
//-------------------------chỗ để test dữ liệu
Route::get('test1', 'HomeController@test1');
Route::get('test3', 'HomeController@test3');
Route::get('updatecsdlorglv1lv2', 'HomeController@updatecsdlorglv1lv2');

Route::group(['middleware' => ['signed']] , function(){
	Route::get('test2/{id}', 'HomeController@test2')->name('home.test2');
});
//-------------------------trang bảo trì hệ thống
Route::get('baotri', 'HomeController@baotri');
//middleware kiểm tra chế độ bảo trì
Route::group(['middleware' => ['checkbaotri']] , function(){
	//---------------------các trang ở Frontend
	//Route::get('/', 'HomeController@index'); 
	Route::get('/', 'PhananhController@create')->name('phananh.create');  
	//----------------------các ajax get dữ liệu khi chưa login
	Route::get('ajax/checkdevice/{deviceid}', 'AjaxfrontendController@checkdevice');  
	//---------------------login
	Auth::routes();
	//----------------------sau khi login se nhay vao trang nay
	Route::get('home', 'HomeController@home');
	//----------------------trang để truy cập vào admin
	Route::get('admin', 'HomeController@admin');
	//----------trang thong bao ko duoc phep truy cap
	Route::get('dontallowaccess', 'DashboardController@dontallowaccess')->name('dontallowaccess');
	//---------thêm phản ánh
	Route::get('phananh/create', 'PhananhController@create')->name('phananh.create');  
	Route::post('phananh', 'PhananhController@store')->name('phananh.store');

	//----------------------middleware checklogin kiểm tra đăng nhập để vào trang admin
	Route::group(['middleware' => ['checkLogin','checktoken'],'prefix'=>'admin'] , function(){
		//các ajax sau khi login có quyền xử dụng
		Route::get('ajax/Organization_getAssigned_Parent/{level}', 'AjaxController@Organization_getAssigned_Parent'); //lấy Phân công và cha cho đơn vị
		Route::get('ajax/Organization_gettypetopic/{topic}', 'AjaxController@Organization_gettypetopic'); //lấy type of topic id
		Route::get('ajax/Object_getobject/{type}', 'AjaxController@Object_getobject'); //lấy type object frome type
		//----------------------các ajax get dữ liệu khi đã login 
		Route::get('ajax/checkdevice/{deviceid}', 'AjaxbackendController@checkdevice');  
		//----------------------middleware chi check login và checkaccessmenu
		Route::group(['middleware' => ['checkaccessmenu']] , function(){
		});
		//----------------------kiểm tra xem có cùng đơn vị giữ user và dữ liệu, để user có quyền xử lý dữ liệu
		Route::group(['middleware' => ['checkcungdonvi']] , function(){
		});
		//--------------middleware kiểm tra phân công, quyền truy cập vào các trang admin
		Route::group(['middleware' => ['checkaccessmenu']] , function(){
			//---------------------menu
			Route::resource('menu', 'MenuController');
			//---------------------role
			Route::resource('role', 'RoleController');
			//---------------------position
			Route::resource('position', 'PositionController'); 
			//---------quản lý lĩnh vực
			Route::resource('sector', 'SectorController'); 
			//---------quản lý tình trạng xử lý phản ánh
			Route::resource('tinhtrangxuly', 'TinhtrangxulyController'); 
			//---------------------backup
			Route::group(['prefix' => 'backup'], function (){
				Route::get('/', 'BackupController@index')->name('backup.index'); 
				Route::get('create', 'BackupController@create')->name('backup.create'); 
				Route::get('restore/{backup}', 'BackupController@restore')->name('backup.restore');  	
				Route::get('delete/{backup}', 'BackupController@Backupdelete')->name('backup.delete'); 	
				Route::get('download/{backup}', 'BackupController@Backupdownload')->name('backup.download'); 
				Route::get('backupupload', 'BackupController@Backupupload')->name('backup.upload'); 	
				Route::post('storebackupupload', 'BackupController@storebackupupload')->name('backup.storeupload'); 	
			});
			//---------------------Setting
			Route::group(['prefix' => 'setting'], function (){
				Route::get('edit', 'SettingController@edit')->name('setting.edit');
				Route::post('update', 'SettingController@update')->name('setting.update');    
			    Route::get('nhatky', 'SettingController@nhatky')->name('setting.nhatky');
			});
			//---------------------các trang xử lý vấn đề cho giám sát, phải cùng đơn vị giữa user và dữ liệu 
			Route::group(['middleware' => ['checkcungdonvi']] , function(){
				//---------------------quản lý đơn vị
				Route::resource('organization', 'OrganizationController'); 
				Route::resource('organization/{organization}/copy', 'OrganizationController@copy');//Admin:TSXC:ok; Giamsat:TSXC:ok 
				//---------quản lý user
				Route::resource('user', 'UserController');//Admin:TSXC:ok; Giamsat:TSXC:ok 
				Route::get('user/{user}/copy', 'UserController@copy')->name('user.copy');
				//-=======
				//---------thêm phản ánh
				Route::get('phananh', 'PhananhController@index')->name('phananh.index');     
				Route::get('phananh_emp', 'PhananhController@index_emp')->name('phananh.index_emp'); //dành cho nhân viên  
				Route::get('phananh/{phananh}/edit', 'PhananhController@edit')->name('phananh.edit');  
				Route::get('phananh/{phananh}/show', 'PhananhController@show')->name('phananh.show');    
				Route::delete('phananh/{phananh}', 'PhananhController@destroy')->name('phananh.destroy');   
				Route::put('phananh/{phananh}', 'PhananhController@update')->name('phananh.update');   

				//Route::resource('phananh', 'PhananhController'); 
				//---------quản lý Tình trạng xử lý phản ánh
				Route::resource('tinhtrangxuly', 'TinhtrangxulyController'); 
			});
		});
	});
});

 
 