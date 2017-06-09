
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Jutom
  Date: 28.05.2017
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html onload="  Console.log('test');$(document).ready(function() {
        Console.log('test');
        $('#calendar').fullCalendar('gotoDate', ${setTheTermin.javaScriptDate});
        })
        ">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/materialize.min.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>

    <script  src="/resources/fullcalendar/lib/jquery.min.js"></script>
    <script  src="/resources/fullcalendar/lib/jquery-ui.min.js"></script>
    <script  src="/resources/fullcalendar/lib/moment.min.js"></script>
    <script src="/resources/JS/jquery.modal.js"></script>
    <script src="/resources/JS/testF.js"></script>
    <script src="/resources/JS/modalSelection.js"></script>
    <script src="/resources/jquery/jquery.datetimepicker.full.min.js"></script>

    <script type="text/javascript" src="/resources/fullcalendar/lib/moment.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/lib/fullcalendar.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/scheduler.js"></script>
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/lib/fullcalendar.min.css" />
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/scheduler.css" />
    <link rel="stylesheet" href="/resources/css/modal.css"/>
    <link rel="stylesheet" href="/resources/jquery/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <script type="text/javascript" src='/resources/fullcalendar/locale/de-at.js'></script>
    <script src="/resources/JS/dateTimepickerController.js"></script>

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
                dayClick: function(date, jsEvent, view, resourceObj) {
                    selectDate(date);
                    getResourceid(resourceObj.id); // setTerminShow("true");
                    $('#amodal').modal();return false;


                },


                // put your options and callbacks here
                defaultView: 'timelineWeek',
                resourceAreaWidth:'10%',
                resourceColumns:[
                    {
                        labelText:'Mitarbeiter',
                        width:'10%',
                        field:'title'
                    }
                ],
                events: ${resources.ausfallzeiten},
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
<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">Logo</a>
        <ul class="right hide-on-med-and-down">
            <li class="Terminplaner"><a href="/Terminplaner">Terminplaner</a></li>
            <li class="Kursplaner"><a  href="/kursplaner">Kursplaner</a></li>
            <li class="Arbeitszeiten"><a href="/arbeitszeit">Arbeitszeiten</a></li>
            <li class="Ausfallzeiten"><a href="/ausfallzeit">Ausfallzeiten</a></li>
            <li class="Ausfallzeiten"><a href="/kunden">Kunden</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li class="Terminplaner"><a href="/Terminplaner">Terminplaner</a></li>
            <li class="Kursplaner"><a  href="/kursplaner">Kursplaner</a></li>
            <li class="Arbeitszeiten"><a href="/arbeitszeit">Arbeitszeiten</a></li>
            <li class="Ausfallzeiten"><a href="/ausfallzeit">Ausfallzeiten</a></li>
            <li class="Ausfallzeiten"><a href="/kunden">Kunden</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>

<button onclick="$('#calendar').fullCalendar('prev');">zurück</button>
<button onclick="$('#calendar').fullCalendar('next');">weiter</button>
<div id="calendar"></div>
<script src="/resources/JS/materialize.min.js"></script>
<script>
    (function($){
        $(function(){

            $('.button-collapse').sideNav();

        }); // end of document ready
    })(jQuery);
</script>

</body>
</html>
