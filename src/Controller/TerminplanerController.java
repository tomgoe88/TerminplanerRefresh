package Controller;

import Model.Mitarbeiter;
import Model.ResourceController;
import Model.TempObject;
import Model.SQLHelper;
import Model.Kunde;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Jutom on 28.05.2017.
 */
@Controller
public class TerminplanerController {


    @RequestMapping("Terminplaner")
    public ModelAndView resources (){
        ResourceController resourceController=new ResourceController();
        String resources = resourceController.getResources();
        return new ModelAndView("terminplaner","resources",resourceController);
    }
    @ModelAttribute("kundenlist")
    public String kunden (){
        List<Kunde> kundeList= new ArrayList<Kunde>();
        kundeList.addAll(SQLHelper.getKundeList());
       StringBuilder stringBuilder= new StringBuilder("");
        for (Kunde k:kundeList){
           stringBuilder.append("<option value='"+k.getKundeID()+"'>"+k.getVorname()+" "+k.getNachname()+"</option>");
        }
        return stringBuilder.toString();
    }
    @RequestMapping(value = "/getCalendarDate", method = RequestMethod.POST)

    public ModelAndView calendarDate(
            @ModelAttribute("setDate") String calendardDate

    )
    {
        ModelAndView modeel = new ModelAndView("/terminplaner");
        System.out.println(calendardDate);
        return modeel;
    }
    @RequestMapping(value = "/getResourceId", method = RequestMethod.POST)
    public ModelAndView resourceId(
            @ModelAttribute("setResourceID") String resourceID

    )
    {
        ModelAndView modeel = new ModelAndView("/terminplaner");
        System.out.println(resourceID);
        return modeel;
    }
    @RequestMapping(value = "/getTermin", method = RequestMethod.POST)
    public ModelAndView getTermin(
            @ModelAttribute("setTheTermin") TempObject resourceID

    )
    {
        Date date=null;
        Date endDate=null;
        ResourceController resourceController=new ResourceController();
        ModelAndView modeel = new ModelAndView("/terminplaner","resources",resourceController);
        DateFormat dateFormat=new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.GERMAN);
        try {
            date= dateFormat.parse(resourceID.getCurrentDate());
            endDate= dateFormat.parse(resourceID.getEndDate());
        } catch (Exception e){
            System.out.println(e);
        }


        System.out.println(date.toString()+" "+resourceID.getVorname()+" "+resourceID.getNachname()+" "+resourceID.getTelefonnummer()+" "+endDate.toString()+" "+resourceID.getKundeJaNein());
        return modeel;
    }
    @RequestMapping(value = "/newBestandTermin", method = RequestMethod.POST)
    public String addCurrentCustomer(@ModelAttribute("bestandTermin")TempObject user
                          ) {
            System.out.println(user.getNachname());
        return "terminplaner";
    }








}
