/**
 * Created by Jutom on 03.06.2017.
 */
$.datetimepicker.setLocale('de');

$('#currentDate').datetimepicker({
    i18n:{
        de:{
            months:[
                'Januar','Februar','März','April',
                'Mai','Juni','Juli','August',
                'September','Oktober','November','Dezember',
            ],
            dayOfWeek:[
                "Mo", "Di", "Mi",
                "Do", "Fr", "Sa.","So.",
            ]
        }
    },
    timepicker:true,
    opened:true,
    format:'d.m.Y H:i'
});