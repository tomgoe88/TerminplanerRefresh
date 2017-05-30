<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>

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



    <script  src="/resources/fullcalendar/lib/jquery.min.js"></script>
    <script  src="/resources/fullcalendar/lib/jquery-ui.min.js"></script>
    <script src="/resources/JS/jquery.modal.js"></script>
    <script src="/resources/JS/testF.js"></script>



    <script type="text/javascript" src="/resources/fullcalendar/lib/moment.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/lib/fullcalendar.min.js"></script>
    <script type="text/javascript" src="/resources/fullcalendar-scheduler/scheduler.js"></script>
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/lib/fullcalendar.min.css" />
    <link rel="stylesheet" href="/resources/fullcalendar-scheduler/scheduler.css" />
    <link rel="stylesheet" href="/resources/css/modal.css"/>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <script type="text/javascript" src='/resources/fullcalendar/locale/de-at.js'></script>


    <script type="text/javascript">
        $(document).ready(function() {

            // page is now ready, initialize the calendar...



            $('#calendar').fullCalendar({
                schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                header: {
                    left: 'today',
                    center: 'title',
                    right: 'agendaDay,timelineYear,timelineMonth,timelineWeek'
                },
                contentHeight: 'auto',
                minTime: "06:30:00",
                maxTime: "24:00:00",
                views: {
                    agendaDay: {
                        titleFormat: 'dddd   DD.MM.YYYY'
                    },

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


                    $.ajax({
                        type: "POST",
                        url: '/getCalendarDate',
                        data: JSON.stringify(date.format()), //Stringified JSON Object

                        success: function() {
                            $('#currentDate').val(date.format());

                        },
                        error: function(data){
                            26
                            alert('Error: ' + date.format());
                            27
                        },
                        dataType: "json",
                        contentType: "application/json"


                    });
                    $.ajax({
                        type: "POST",
                        url: '/getResourceId',
                        data: JSON.stringify(resourceObj.id), //Stringified JSON Object

                        success: function() {
                            $('#resID').val(resourceObj.id);
                            $('#meinModal').modal('show');return false;
                        },
                        error: function(data){
                            26
                            alert('Error: ' + date.format());
                            27
                        },
                        dataType: "json",
                        contentType: "application/json"


                    });
                   //selectDate(date);
//                    getResourceid(resourceObj.id); // setTerminShow("true");



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
                events: ${resources.events},

                resources:${resources.resources},
                eventClick: function(calEvent, jsEvent, view) {
//                    eventTitle(calEvent.title);
//                    selectDate(calEvent.start);
                    //butter.modal.open('eventContentI');
                    $('#Termininfo').modal('show');return false;



                }

            })

        });
    </script>

</head>
<body>

<button onclick="$('#calendar').fullCalendar('prev');">zurück</button>
<button onclick="$('#calendar').fullCalendar('next');">weiter</button>
<div id="calendar"></div>


<div class="modal fade" id="meinModal" tabindex="-1" role="dialog" aria-labelledby="meinModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="meinModalLabel">Neuer Termin</h4>
            </div>
            <div class="modal-body">
                <form id="terminform" action="/getTermin" method="post">
                    <table>
                        <tr>
                            <td>Resource ID</td><td><input id="resID" type="text" name="resourceID"> </td>
                        </tr>
                        <tr>
                        <td>Current Date</td><td><input id="currentDate" type="text" name="currentDate"> </td>
                        </tr>
                        <tr>
                            <td></td><td><button type="submit" >OK</button> </td>
                        </tr>
                    </table>
                </form>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--that work-->
<script>
$(document).ready(function () {
    $('#terminform').submit(function (event) {
        var id= $('#resID').val();
        var currendDates= $('#currentDate').val();

        var thing= {
            'resourceID': id,
            'currentDate': currendDates
        };
        $.ajax({
            type: "POST",
            url: '/getTermin',
            data: thing, //Stringified JSON Object
            dataType:'json',
            encode:true,
            success: function() {
                alert("Worked fine");
            },
            error: function(data){
                26
                alert('Error: ' + date.format());
                27
            },



        });
        event.preventDefault();
    })
})
</script>

<div class="modal fade" id="Termininfo" tabindex="-1" role="dialog" aria-labelledby="meinModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="meineTerminInfo">Termininfo</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Schließen</button>
                <button onclick="terminSpeichern()" type="button" class="btn btn-primary">Änderungen speichern</button>
            </div>
        </div>
    </div>
</div>
<script src="/resources/JS/bootstrap.min.js"></script>
</body>
</html>
