package Controller;

import Model.Mitarbeiter;
import Model.ResourceController;
import Model.TempObject;
import Model.SQLHelper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    @RequestMapping(value = "/getCalendarDate", method = RequestMethod.POST)
    @ResponseBody
    public String calendarDate(
            @RequestBody String calendardDate

    )
    {

        System.out.println(calendardDate);
        return calendardDate;
    }
    @RequestMapping(value = "/getResourceId", method = RequestMethod.POST)
    @ResponseBody
    public String resourceId(
            @RequestBody String resourceID

    )
    {

        System.out.println(resourceID);
        return resourceID;
    }
    @RequestMapping(value = "/getTermin", method = RequestMethod.POST)
    public ModelAndView getTermin(
            @ModelAttribute("setTheTermin") TempObject resourceID

    )
    {
        ResourceController resourceController=new ResourceController();
        ModelAndView modeel = new ModelAndView("/terminplaner","resources",resourceController);
        System.out.println(resourceID.getCurrentDate().toString()+" Entstammt aus dem Objekt");
        return modeel;
    }








}
