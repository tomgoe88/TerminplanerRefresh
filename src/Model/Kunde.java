package Model;


import java.util.*;

/**
 * Created by Jutom on 27.01.2017.
 */
public class Kunde {
   private int KundeID;
    private String vorname;
    private String nachname;
    private String telefonnummer;
    private String email;
    private String strasse;
    private String plz;
    private String ort;
    private Date staticStart=null;
    private Date staticEnd=null;

    private List<Termine> termineList;


    public int getKundeID() {
        return KundeID;
    }

    public void setKundeID(int kundeID) {
        KundeID = kundeID;
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

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public String getPlz() {
        return plz;
    }

    public void setPlz(String plz) {
        this.plz = plz;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public List<Termine> getTermineList() {
        termineList = new ArrayList<Termine>();
        termineList.addAll(SQLHelper.getKundeTermine(KundeID));
        List<Termine> tempList= new ArrayList<Termine>();

            if(staticStart!=null) {
                if (staticEnd == null) {
                    staticEnd = new Date();
                }

                for (Termine a : termineList) {
                    if (!a.getTerminstart().before(staticStart) && !a.getTerminstart().after(staticEnd)) {
                        tempList.add(a);
                    }
                }
                termineList = new ArrayList<Termine>();
                termineList.addAll(tempList);
                tempList = null;
            }


        Collections.sort(termineList, new Comparator<Termine>() {
            public int compare(Termine o1, Termine o2) {
                return o2.getTerminstart().compareTo(o1.getTerminstart());
            }
        });

        return termineList;
    }



    public void setTermineList(List<Termine> termineList) {
        this.termineList = termineList;
    }

    public Date getStaticStart() {
        return staticStart;
    }

    public void setStaticStart(Date staticStart) {
        this.staticStart = staticStart;
    }

    public Date getStaticEnd() {
        return staticEnd;
    }

    public void setStaticEnd(Date staticEnd) {
        this.staticEnd = staticEnd;
    }


    @Override
    public String toString(){
return this.getEmail()+" "+this.getOrt();    }

}
