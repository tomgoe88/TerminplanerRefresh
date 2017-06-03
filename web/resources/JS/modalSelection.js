/**
 * Created by Jutom on 03.06.2017.
 */
function getValueChange(item) {
    var selectTermin= item.value;

    if(selectTermin==1){
        $('#meinModal').modal('hide');
        $('#neuerKundeTerminModal').modal('show');return false;
    }
    if(selectTermin==2){
        $('#meinModal').modal('hide');
        $('#bestandskunde').modal('show');return false;
    }
    else if(selectTermin==3){
        $('#meinModal').modal('hide');
        $('#freierTermin').modal('show');return false;
    }
}

