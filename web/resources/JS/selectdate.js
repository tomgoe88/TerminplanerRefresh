/**
 * Created by Jutom on 23.01.2017.
 */
function selectDate(event){
$.post("/getCalendarDate", {
    calendarDate:event.format
},function (data) {
    var json = JSON.parse(data);
}).done();

    //dateSelect(event.format());

}
function getResourceid(resourceID) {
    selectResource(resourceID.toString());
}
function setTerminShow(boolwert){
    selectShowTermin(boolwert);
}

//diese Funktion klappt nicht