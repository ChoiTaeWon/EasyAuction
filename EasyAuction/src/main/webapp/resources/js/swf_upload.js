var frameHeight	= "";
var frameSrc	= "";

function getCookie(name) { 
	var Found = false 
	var start, end 
	var i = 0 

	while(i <= document.cookie.length) { 
		start = i 
		end = start + name.length 

		if(document.cookie.substring(start, end) == name) { 
			Found = true 
			break 
		} 
		i++ 
	} 
	 
	if(Found == true) { 
		start = end + 1 
		end = document.cookie.indexOf(";", start) 
		if(end < start) 
		end = document.cookie.length 
		return document.cookie.substring(start, end) 
	} 
	return "" 
}

function makeSwfSingleUpload(){
	var flashvars = "flash_width="+flash_width+"&amp;";
	flashvars += "limit_size="+limit_size+"&amp;";
	flashvars += "file_type_name="+file_type_name+"&amp;";
	flashvars += "allow_filetype="+allow_filetype+"&amp;";
	flashvars += "deny_filetype="+deny_filetype+"&amp;";
	flashvars += "upload_exe="+upload_exe+"&amp;";
	flashvars += "upload_id="+movie_id+"&amp;";
	flashvars += "browser_id="+getCookie("PHPSESSID"); // FF���� upload.php���� ������ PHPSESSID�� �ο��ϹǷ� ������ ������ ��.

	var flashStr = "<embed src='single_upload.swf' method='single_upload' width='"+flash_width+"' height='50' quality='high'";
	flashStr += "bgcolor='#ffffff' name='"+movie_id+"' id='"+movie_id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash'";
	flashStr += "pluginspage='http://www.macromedia.com/go/getflashplayer' flashvars='"+flashvars+"' />";
	flashStr += "</embed>";
	document.write(flashStr); 
}

function makeSwfMultiUpload(){
	var flashvars = "flash_width="+flash_width+"&amp;";
	flashvars += "list_rows="+list_rows+"&amp;";
	flashvars += "limit_size="+limit_size+"&amp;";
	flashvars += "file_type_name="+file_type_name+"&amp;";
	flashvars += "allow_filetype="+allow_filetype+"&amp;";
	flashvars += "deny_filetype="+deny_filetype+"&amp;";
	flashvars += "upload_exe="+upload_exe+"&amp;";
	flashvars += "upload_id="+movie_id+"&amp;";
	flashvars += "max_file_count="+max_file_count+"&amp;";
	flashvars += "browser_id="+getCookie("PHPSESSID"); // FF���� upload.php���� ������ PHPSESSID�� �ο��ϹǷ� ������ ������ ��.

	frameHeight	= get_frameHeight;
	frameSrc	= get_frameSrc;

	var flashStr = "<embed src='multi_upload.swf' method='multi_upload' width='"+flash_width+"' height='"+parseInt(list_rows*21+25,10)+"' quality='high'";
	flashStr += "bgcolor='#ffffff' name='"+movie_id+"' id='"+movie_id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash'";
	flashStr += "pluginspage='http://www.macromedia.com/go/getflashplayer' flashvars='"+flashvars+"' />";
	flashStr += "</embed>";
	document.write(flashStr); 
}

function makeDragImg(){
	var flashvars = "get_cntt="+get_cntt+"&amp;";
	flashvars += "get_Width="+get_Width+"&amp;";
	flashvars += "get_Height="+get_Height+"&amp;";
	flashvars += "get_wcount="+get_wcount+"&amp;";
	flashvars += "get_limitimg="+get_limitimg+"&amp;";
	flashvars += "get_Xpoint="+get_Xpoint+"&amp;";
	flashvars += "get_Ypoint="+get_Ypoint+"&amp;";
	flashvars += "get_boxcolor="+get_boxcolor+"&amp;";
	flashvars += "get_overcolor="+get_overcolor+"&amp;";
	flashvars += "get_extla="+get_extla+"&amp;";
	flashvars += "get_images="+get_images+"&amp;";
	flashvars += "get_boxtext="+get_boxtext+"&amp;";
	flashvars += "get_noimage="+get_noimage;

	list_rows	= parseInt(get_cntt / get_wcount,10);
	list_rows	= get_cntt % get_wcount == 0 ? list_rows : list_rows+1;
	list_rows_Width = get_Width+15;
	list_rows_Height = get_Height+25;

	var flashStr = "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'";
	flashStr += "codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0'";
	flashStr += "width='"+parseInt(get_wcount*list_rows_Width+10,10)+"' height='"+parseInt(list_rows*list_rows_Height+35,10)+"' align='middle' id='"+movie_id+"' method='multi_upload'>";
	flashStr += "<param name='allowScriptAccess' value='sameDomain' />";
	flashStr += "<param name='movie' value='dragimg.swf' />";
	flashStr += "<param name='scale' value='noscale' />";
	flashStr += "<param name='quality' value='high' />";
	flashStr += "<param name='bgcolor' value='#ffffff' />";
	flashStr += "<param name='salign' value='lt' />";
	flashStr += "<param name='flashvars' value='"+flashvars+"' />";
	flashStr += "<param name='WMode' value='Transparent' />";
	flashStr += "<embed src='dragimg.swf' scale='noscale' salign='lt' width='"+parseInt(get_wcount*list_rows_Width+10,10)+"' height='"+parseInt(list_rows*list_rows_Height+35,10)+"' quality='high'";
	flashStr += "bgcolor='#ffffff' name='"+movie_id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash'";
	flashStr += "pluginspage='http://www.macromedia.com/go/getflashplayer' flashvars='"+flashvars+"' />";
	flashStr += "</object>";

	document.write(flashStr); 
}




function callSwfUpload(){ //�÷��� ���� ����Ʈ�� �߰��� ������ ����
	arrMovie = new Array()
	var arr_num = 0;
	var objectTags = document.getElementsByTagName('embed');
	var movie;
	for (i = 0; i < objectTags.length; i++ ) {
		if(objectTags[i].getAttribute("method")=="single_upload" || objectTags[i].getAttribute("method")=="multi_upload"){
			if(document.getElementsByName(objectTags[i].getAttribute("id"))[0]) {
				movie = document.getElementsByName(objectTags[i].getAttribute("id"))[0];
			}else{
				movie = document.getElementById(objectTags[i].getAttribute("id"));
			}			
			if(movie.GetVariable("totalSize")>0){				
				arrMovie[arr_num] = movie;
				arr_num++;
			}
		}
	}

	if(arrMovie.length>0){
		if(arrMovie[0].getAttribute("method")=="single_upload" || arrMovie[0].parentNode.getAttribute("method")=="single_upload") arrMovie[0].height = 45;
		if(arrMovie[0].getAttribute("method")=="multi_upload" || arrMovie[0].parentNode.getAttribute("method")=="multi_upload") arrMovie[0].height = parseInt(20*arrMovie[0].GetVariable("listRows")+25+45,10);
		arrMovie[0].SetVariable( "startUpload", "" );
		arr_mov = 0;
	}else{
		//document.forms['regiform'].submit();
		alert('���ε��� ������ �����Ͻ��� ���ε� ��ư�� �����ּ���.');
		//document.getElementById('swf_upload_layer').innerHTML	= "<iframe src='flash_upload_drag.php' width='100%' height='280' frameborder='0'></iframe>";
	}
}

function exRound(val, pos)
{
    var rtn;
    rtn = Math.round(val * Math.pow(10, Math.abs(pos)-1))
    rtn = rtn / Math.pow(10, Math.abs(pos)-1)
    

    return rtn;
}



function swfUploadComplete(){	
	arr_mov++;
	if(arrMovie.length>arr_mov){
		if(arrMovie[arr_mov].getAttribute("method")=="single_upload" || arrMovie[arr_mov].parentNode.getAttribute("method")=="single_upload") arrMovie[arr_mov].height = 45;
		if(arrMovie[arr_mov].getAttribute("method")=="multi_upload" || arrMovie[arr_mov].parentNode.getAttribute("method")=="multi_upload") arrMovie[arr_mov].height = parseInt(20*arrMovie[arr_mov].GetVariable("listRows")+25+45,10);
		arrMovie[arr_mov].SetVariable( "startUpload", "" );
	}else{
		//document.forms['regiform'].submit();
		alert('���ε尡 �Ϸ�Ǿ����ϴ�. �̹����� ��ġ�����ּ���.');
		/*
		document.getElementById('swf_upload_layer').innerHTML	= makeDragImg(
				get_cntt		= "10",
				get_wcount		= "5",
				get_boxcolor	= "CC0000",
				get_overcolor	= "666666",
				get_extla		= "zip,rar,tar,gz,hwp,pdf,xls,ppt",
				get_images		= "upload/2008/02/14/1202996493-4-1.jpg||upload/2008/02/14/1202996544-15-0.jpg||upload/2008/02/14/1202996493-4-1.jpg||upload/2008/02/14/1202996544-44-1.jpg||upload/2008/02/14/1202996544-44-1.jpg||upload/2008/02/14/1202996544-15-0.jpg||upload/2008/02/14/1202996544-44-1.jpg||upload/2008/02/14/1202996493-56-0.jpg",
				movie_id		= "kkk",
				types			= "return"
			);*/
		//alert(frameHeight);
		document.getElementById('swf_upload_layer').innerHTML	= "<iframe src='"+frameSrc+"' width='100%' height='"+frameHeight+"' frameborder='0' scrolling='no'></iframe>";
	}	
}




function swf_img_change( no1 , no2 )
{
	//alert( no1 +" --- "+ no2 );

	val1	= parent.window.document.regiform['img'+no1].value;
	val2	= parent.window.document.regiform['img'+no2].value;

	parent.window.document.regiform['img'+no1].value	= val2;
	parent.window.document.regiform['img'+no2].value	= val1;
}



function fileTypeError( notAllowFileType ){ //������� ���� ������ ������ ��� ���� �޽��� ���
	alert("Ȯ���ڰ� " + notAllowFileType + "�� ���ϵ��� ���ε� �� �� �����ϴ�.");
}

function overSize( limitSize ){ //������� ���� ������ ������ ��� ���� �޽��� ���
	alert("������ ������ ũ�Ⱑ " + limitSize + "�� �ʰ��߽��ϴ�.");
}

function versionError(){ //�÷��� ������ 8 �̸��� ��� ���� �޽��� ���
	alert("�÷��� ������ 8.0 �̻����� Ȯ���ϼ���.\n�̹� ��ġ�Ͻ� ���� �������� ���� �ݰ� �ٽ� �����ϼ���.");
}

function httpError(){ //http ���� �߻��� ��� �޽���
	alert("��Ʈ��ũ ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
}

function ioError(){ //���� ����� ���� �߻��� ��� �޽���
	alert("����� ������ �߻��Ͽ����ϴ�.\n �ٸ� ���α׷����� �� ������ ��������� Ȯ���ϼ���.");
}

function onSecurityError(){ //���� ����� ���� �߻��� ��� �޽���
	alert("���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
}

function max_file_countError(){
	alert("�ִ� ���ϰټ��� �ʰ��Ͽ����ϴ�");
}