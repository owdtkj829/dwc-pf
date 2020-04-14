$(function() {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function() {
        if ($('#artistcalendar').length) {

            function Calendar() {
                return $('#calendar').fullCalendar({});
            }

            function clearCalendar() {
                $('#calendar').html('');
            }

            $(document).on('turbolinks:load', function() {
                scheduleCalendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);


            $('#calendar').fullCalendar({
                events: '/artists.json',
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: 'today prev,next',
                    center: 'title',
                    right: 'month agendaWeek agendaDay'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                // Drag & Drop & Resize
                editable: true,
                //スケジュールの時間表示を２４時間に
                timeFormat: "HH:mm",
                //スケジュールの色を変える
                eventColor: '#87cefa',
                //スケジュールの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(schedule, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                }
            });
        }
    });
});