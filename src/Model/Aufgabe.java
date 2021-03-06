package Model;


import java.util.Date;

/**
 * Created by Jutom on 06.02.2017.
 */

public class Aufgabe
{
    private int aufgabeID;
    private String beschreibung;
    private boolean erledig;
    private Date aufgabendatum;
    private int mitarbeiterID;

    public int getAufgabeID() {
        return aufgabeID;
    }

    public void setAufgabeID(int aufgabeID) {
        this.aufgabeID = aufgabeID;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public boolean isErledig() {
        return erledig;
    }

    public void setErledig(boolean erledig) {
        this.erledig = erledig;
    }

    public Date getAufgabendatum() {
        return aufgabendatum;
    }

    public void setAufgabendatum(Date aufgabendatum) {
        this.aufgabendatum = aufgabendatum;
    }

    public int getMitarbeiterID() {
        return mitarbeiterID;
    }

    public void setMitarbeiterID(int mitarbeiterID) {
        this.mitarbeiterID = mitarbeiterID;
    }
}
