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
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>





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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <script src="/resources/JS/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/resources/jquery/jquery.datetimepicker.css"/>

    <script type="text/javascript" src='/resources/fullcalendar/locale/de-at.js'></script>
    <script src="/resources/JS/dateTimepickerController.js"></script>
    <link rel="stylesheet" href="/resources/css/prime.css"/>


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
                    $('#currentDate').val(moment(date).format('DD.MM.YYYY HH:mm'));
                    $('#endDate').val(moment(date).format('DD.MM.YYYY HH:mm'));
                    $('#resID').val(resourceObj.id);
                    $('#currentDate2').val(moment(date).format('DD.MM.YYYY HH:mm'));
                    $('#endDate2').val(moment(date).format('DD.MM.YYYY HH:mm'));
                    $('#resID2').val(resourceObj.id);
                    $('#meinModal').modal('show');return false;
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
<body  onload="$(document).ready(function() {
        $('#calendar').fullCalendar('gotoDate', ${setTheTermin.javaScriptDate});
        })
        ">
<header>
    <div class="nav">
        <ul >
            <li ><a  href="/Terminplaner">Terminplaner</a></li>
            <li ><a  href="/kursplaner">Kursplaner</a></li>
            <li ><a  href="/arbeitszeit">Arbeitszeiten</a></li>
            <li><a  href="/ausfallzeit">Ausfallzeiten</a></li>
            <li ><a  href="/kunden">Kunden</a></li>
        </ul>
    </div>
</header>



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
                <form>
                    <select id="terminwahl" class="form-control" onchange="getValueChange(this)">
                        <option value="0">bitte auswählen</option>
                        <option value="1">Termin: Neukunde</option>
                        <option value="2">Termin: Bestandskunde</option>
                        <option value="3">Mitarbeitertermin</option>
                    </select>
                </form>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="neuerKundeTerminModal" tabindex="-1" role="dialog" aria-labelledby="neuerKundeTerminLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="neuerKundeTerminLabel">Neuer Termin</h4>
            </div>
            <div class="modal-body">
                <form class="form-group" id="terminform" action="/getTermin" method="post">
                    <table class="table">
                        <tr>
                            <td>Resource ID</td><td>

                            <input id="resID" type="text" name="resourceID"> </td>
                        </tr>
                        <tr>
                            <td>Terminstart:  </td><td><input id="currentDate" type="text" name="currentDate"> </td>

                        </tr>
                        <tr>
                            <td>Terminende:  </td><td><input id="endDate" type="text" name="endDate"> </td>

                        </tr>
                        <tr>
                            <td>Vorname</td><td>

                            <input id="vorname" type="text" name="vorname"> </td>
                        </tr>
                        <tr>
                            <td>Nachname</td><td>

                            <input id="nachname" type="text" name="nachname"> </td>
                        </tr>
                        <tr>
                            <td>Telefonnummer</td><td>

                            <input id="telefonnummer" type="text" name="telefonnummer"> </td>
                        </tr>
                        <tr>
                            <td>E-Mail</td><td>

                            <input id="email" type="text" name="email"> </td>
                        </tr>
                        <tr>
                            <td>Beschreibung</td><td>

                            <input id="beschreibung" type="text" name="beschreibung"> </td>
                        </tr>
                        <tr>
                            <td></td><td><button class="btn btn-success" type="submit" >OK</button> </td>
                        </tr>
                    </table>
                </form>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="freierTermin" tabindex="-1" role="dialog" aria-labelledby="freierTerminLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="freierTerminLabel">Neuer Termin</h4>
            </div>
            <div class="modal-body">


            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="bestandskunde" tabindex="-1" role="dialog" aria-labelledby="bestandskundeLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="bestandskundeLabel">Neuer Termin</h4>
            </div>
            <div class="modal-body">
                <form id="terminform2" action="/newBestandTermin" method="post">
                    <table class="table">
                        <tr>
                            <td>Resource ID</td><td>

                            <input id="resID2" type="text" name="resourceID"> </td>
                        </tr>
                        <tr>
                            <td>Terminstart:  </td><td><input id="currentDate2" type="text" name="currentDate"> </td>

                        </tr>
                        <tr>
                            <td>Terminende:  </td><td><input id="endDate2" type="text" name="endDate"> </td>

                        </tr>
                        <tr><td>Kunde: </td>
                            <td>  <select id="kundenwahl" class="form-control" onchange="getKundenID(this)">
                                <c:forEach items="${kundenlist}" var="kunde">
                                    <option value="${kunde.kundeID}">${kunde.vorname} ${kunde.nachname}</option>
                                </c:forEach>
                            </select></td></tr>
                        <tr>
                        <tr>
                            <td>Beschreibung</td><td>

                            <input id="beschreibung2" type="text" name="beschreibung"> </td>
                        </tr>
                        <tr>
                            <td></td><td><button class="btn btn-success" type="submit" >OK</button> </td>
                        </tr>
                    </table>



                    <script>

                    </script>
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
            var endDates= $('#endDate').val();
            var vor= $('#vorname').val();
            var nach= $('#nachname').val();
            var emaill= $('#email').val();
            var tele= $('#telefonnummer').val();
            var besch= $('#beschreibung').val();
            var jaNein= $('input[name="kundeJaNein"]:checked').val();
            var thing= {
                'resourceID': id,
                'currentDate': currendDates,
                'endDate': endDates,
                'vorname': vor,
                'nachname': nach,
                'email': emaill,
                'telefonnummer': tele,
                'beschreibung': besch,
                'kundeJaNein':jaNein
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

            $('#neuerKundeTerminModal').modal('hide');
            $(document).ready(function() {
                $('#calendar').fullCalendar('refetchEventSources');


            })
        })
    })
</script>

<script>
    var kundenid2;
    function getKundenID(item) {
        kundenid2=item.value;
        alert(kundenid2);
        //hier muss nun iene variable an die Ajaxfunktion gegeben werden um den Termin anzulegen
    }
    $(document).ready(function () {
        $('#terminform2').submit(function (event) {
            var id= $('#resID2').val();
            var currendDates= $('#currentDate2').val();
            var endDates= $('#endDate2').val();

            var besch= $('#beschreibung2').val();

            var thing= {
                'resourceID': id,
                'currentDate': currendDates,
                'endDate': endDates,
                'kundenID':kundenid2,
                'beschreibung': besch,

            };
            $.ajax({
                type: "POST",
                url: '/newBestandTermin',
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
         testttt();
        })
    })
</script>
<script>
    function testttt() {
        alert("Yeahhhhhh");
        $(document).ready(function() {
            $('#calendar').fullCalendar('refetchEventSources',source);


        })
        $('#bestandskunde').modal('hide');

    }
</script>
<script>
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
        step:15,
        format:'d.m.Y H:i'
    });
</script>
<script>
    $.datetimepicker.setLocale('de');
    $('#currentDate2').datetimepicker({
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
        step:15,
        format:'d.m.Y H:i'
    });
</script>
<script>
    $.datetimepicker.setLocale('de');
    $('#endDate2').datetimepicker({
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
        step:15,
        format:'d.m.Y H:i'
    });
</script>
<script>
    $.datetimepicker.setLocale('de');
    $('#endDate').datetimepicker({
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
        step:15,
        format:'d.m.Y H:i'
    });
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

        </div>
    </div>
</div>




</body>
</html>