<%--
  Created by IntelliJ IDEA.
  User: Jutom
  Date: 27.05.2017
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script  src="/resources/fullcalendar/lib/jquery.min.js"></script>
    <script  src="/resources/fullcalendar/lib/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="/resources/css/materialize.min.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
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
