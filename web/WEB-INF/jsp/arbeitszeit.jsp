<%--
  Created by IntelliJ IDEA.
  User: Jutom
  Date: 28.05.2017
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>



    <script  src="/resources/fullcalendar/lib/jquery.min.js"></script>
    <script  src="/resources/fullcalendar/lib/jquery-ui.min.js"></script>
    <script src="/resources/JS/testF.js"></script>



    <script type="text/javascript" src="/resources/fullcalendar/lib/moment.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/lib/fullcalendar.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/scheduler.js"></script>
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/lib/fullcalendar.min.css" />
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/scheduler.css" />
    <script type="text/javascript" src='/resources/fullcalendar/locale/de-at.js'></script>

    <script type="text/javascript">
        $(document).ready(function() {

            // page is now ready, initialize the calendar...

            $('#calendar').fullCalendar({
                schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                header: {
                    left: 'today',
                    center: 'title',
                    right: 'timelineWeek,agendaDay,timelineYear,timelineMonth'
                },
                contentHeight: 'auto',
                minTime: "06:30:00",
                maxTime: "24:00:00",
                views: {
                    agendaDay: {
                        titleFormat: 'dddd   DD.MM.YYYY'
                    },
                    //agendaFiveDays: {
                    //type: 'agenda',
                    //duration: { days: 5 },
                    // views that are more than a day will NOT do this behavior by default
                    // so, we need to explicitly enable it
                    //groupByResource: true
                    //// uncomment this line to group by day FIRST with resources underneath
                    //groupByDateAndResource: true
                    //},
                    // agendaWeek: {
                    // type: 'agenda',
                    // duration: { days: 7 },
                    // // views that are more than a day will NOT do this behavior by default
                    // // so, we need to explicitly enable it
                    // groupByResource: true
                    // //// uncomment this line to group by day FIRST with resources underneath
                    // //groupByDateAndResource: true
                    // }
                },
                editable: true,
                eventDrop: function(event, delta, revertFunc) {
                    if (!confirm("Soll der Termin wirklich verschoben werden?")) {
                        revertFunc();
                    } else {
                        changeEvent(event.start.format(),event.end.format(),event.title, event.resourceId);
                    }



                },
                eventResize: function(event, delta, revertFunc) {
                    if (!confirm("Soll der Termin wirklich verschoben werden?")) {
                        revertFunc();
                    } else {
                        changeEvent(event.start.format(),event.end.format(),event.title, event.resourceId);
                    }


                },


                dayClick: function(date, jsEvent, view, resourceObj) {
                    selectDate(date);
                    getResourceid(resourceObj.id); // setTerminShow("true");
                    $('#amodal').modal();return false;


                },


                // put your options and callbacks here
                defaultView: 'agendaDay',
                resourceAreaWidth:'10%',
                resourceColumns:[
                    {
                        labelText:'Mitarbeiter',
                        width:'10%',
                        field:'title'
                    }
                ],
                events: ${resources.arbeitszeiten},
                resources: ${resources.resources},
                eventClick: function(calEvent, jsEvent, view) {
                    eventTitle(calEvent.title);
                    selectDate(calEvent.start);
                    //butter.modal.open('eventContentI');
                    $('#eventContentI').modal('show');return false;



                }
            })


        });
    </script>

</head>
<body>

<button onclick="$('#calendar').fullCalendar('prev');">zurück</button>
<button onclick="$('#calendar').fullCalendar('next');">weiter</button>
<div id="calendar"></div>


</body>
</html>
