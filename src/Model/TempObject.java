package Model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Jutom on 29.05.2017.
 */
public class TempObject {
    private int resourceID;
    private int kundenID;
    private String kundeJaNein;
    private String currentDate;
    private String endDate;
    private String vorname;
    private String nachname;
    private String telefonnummer;
    private String email;
    private String terminart;
    private String beschreibung;
    private String javaScriptDate;

    public int getResourceID() {
        return resourceID;
    }

    public void setResourceID(int resourceID) {
        this.resourceID = resourceID;
    }

    public String getCurrentDate() {
        return currentDate;
    }

    public void setCurrentDate(String currentDate) {
        this.currentDate = currentDate;
    }

    public int getKundenID() {
        return kundenID;
    }

    public void setKundenID(int kundenID) {
        this.kundenID = kundenID;
    }

    public String getKundeJaNein() {
        return kundeJaNein;
    }

    public void setKundeJaNein(String kundeJaNein) {
        this.kundeJaNein = kundeJaNein;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }

    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    public String getTelefonnummer() {
        return telefonnummer;
    }

    public void setTelefonnummer(String telefonnummer) {
        this.telefonnummer = telefonnummer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTerminart() {
        return terminart;
    }

    public void setTerminart(String terminart) {
        this.terminart = terminart;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public String getJavaScriptDate() {

        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        Calendar calendar= javax.xml.bind.DatatypeConverter.parseDateTime(currentDate);
        Date date= calendar.getTime();
        if(date!=null){
            javaScriptDate = "'"+simpleDateFormat.format(date)+"'"; //currentDate muss noch zu

        }else{
            javaScriptDate = "'"+simpleDateFormat.format(new Date())+"'";

        }


        //  javaScriptDate= buf.toString();
        System.out.println("JavaScriptDate=   "+ javaScriptDate);
        return javaScriptDate;
    }
}
