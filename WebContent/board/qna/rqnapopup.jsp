<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
<style>
.ck.ck-editor {
	max-width: 800px;
	min-width: 800px;
}

.ck-editor__editable {
	min-height: 200px;
}

#submit {
	width: 125px;
	height: 35px;
	padding: 5px;
	margin: 30px 0 0 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #1abc9c;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#cancel {
	width: 90px;
	height: 35px;
	padding: 5px;
	margin: 30px 0px 0px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #1abc9c;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	display: inline;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#submit:hover, #submit:active {
	background-color: #1FE0BA;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#cancel:active, #cancel:hover {
	box-shadow: 10px 10px 20px 5px #eeeeee;
}
</style>
</head>
<body style="background-color:#FAFAFA; width:800px;">
	<form id="frm" action="<%=request.getContextPath()%>/rqnaupdate"
		method="post">
		<td><input type="hidden" name="rqno" value="${rqna.rqno }"></td>
		<td><textarea id="editor" name="rqcontent" maxlength="4000">${rqna.rqcontent }</textarea></td>
		<td><button type="submit" id="submit">수정</button></td> 
		<input type="button" value="취소" id="cancel" onclick="close();">
		</div>
	</form>

	<script>
	function close() {
	}
						    ClassicEditor
						        .create( document.querySelector( '#editor' ), {
						            cloudServices: {
						                tokenUrl: 'https://80479.cke-cs.com/token/dev/7ac95c09e51707fa1d95f2ea91d9a83fcb6e5bc7fc5a60c689f1f30dfb21',
						                uploadUrl: 'https://80479.cke-cs.com/easyimage/upload/'
						            }
						        } )
						        .catch( error => {
						            console.error( error );
						        } );
						</script>

</body>
</html>