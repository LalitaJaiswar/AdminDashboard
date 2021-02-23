function open_editor(tid){
	//tid=tid.toString(10);
	$('#lbl_tid').text(tid);
	$('#input_tid').val(tid);
	$('.editor').show();
}