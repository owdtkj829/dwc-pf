//updateした内容を差し替え
$('#inputEditForm').html('');
//モーダル背景画面を消す
$('.modal-backdrop').remove('');
// フルカレンダー を一度消しもう一度表示
$('#calendar').fullCalendar('refetchEvents')